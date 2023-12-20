CLASS zcl_rap_matrix_005 DEFINITION PUBLIC FINAL CREATE PUBLIC.

    PUBLIC SECTION.

        CLASS-DATA i_url         TYPE string. " VALUE 'https://my404930.s4hana.cloud.sap'.
        CLASS-DATA i_username    TYPE string. " VALUE 'INBOUND_USER'.
        CLASS-DATA i_password    TYPE string. " VALUE 'rtrVDDgelabtTjUiybRX}tVD3JksqqfvPpBdJRaL'.

        CLASS-METHODS adjust_matrix_items IMPORTING VALUE(i_salesdocument)         TYPE tds_bd_sls_head
                                                    VALUE(i_salesdocumentitems)    TYPE tdt_bd_sls_item.

*       Remote (External) Service
        CLASS-METHODS read_matrix_item_list.

        CLASS-METHODS create_matrix_item IMPORTING VALUE(i_item) TYPE zc_item_005.

        CLASS-METHODS read_matrix_item   IMPORTING VALUE(i_item) TYPE zc_item_005.

        CLASS-METHODS update_matrix_item IMPORTING VALUE(i_item) TYPE zc_item_005.

        CLASS-METHODS delete_matrix_item IMPORTING VALUE(i_item) TYPE zc_item_005.

*       Clear Model/Color
        CLASS-METHODS update_matrix IMPORTING VALUE(i_matrix) TYPE zc_matrix_005.

*       Update Header Fields
        CLASS-METHODS update_matrix2 IMPORTING VALUE(i_matrix) TYPE zc_matrix_005.

ENDCLASS. " zcl_rap_matrix_005

CLASS zcl_rap_matrix_005 IMPLEMENTATION.

  METHOD adjust_matrix_items.

    DATA tabix TYPE sy-tabix.

*   Get Matrix
    SELECT SINGLE * FROM zc_matrix_005 WHERE ( SalesOrderID = @i_salesdocument-salesdocument ) INTO @DATA(wa_matrix).
    IF ( sy-subrc = 0 ).
        SELECT * FROM zc_item_005 WHERE ( MatrixUUID = @wa_matrix-MatrixUUID ) INTO TABLE @DATA(it_matrix_item).
    ENDIF.

*   Check (Compare) Items
    DATA(differ) = abap_false.
    IF ( wa_matrix IS NOT INITIAL ).
        IF ( LINES( i_salesdocumentitems[] ) <> LINES( it_matrix_item[] ) ).
            differ = abap_true.
        ELSE.
            SORT i_salesdocumentitems   STABLE BY material requestedquantity.
            SORT it_matrix_item         STABLE BY Product Quantity.
            LOOP AT i_salesdocumentitems INTO DATA(wa_salesdocumentitem).
                READ TABLE it_matrix_item INTO DATA(wa_matrix_item) INDEX sy-tabix.
                IF ( ( wa_salesdocumentitem-material <> wa_matrix_item-Product ) OR ( wa_salesdocumentitem-requestedquantity <> wa_matrix_item-Quantity ) ).
                      differ = abap_true.
                      EXIT.
                ENDIF.
            ENDLOOP.
        ENDIF.
    ENDIF.

*    differ = abap_true. " for testing only

*   Update [Matrix] Items
    IF ( differ = abap_true ).

*       Delete [Old] Matrix Items
        LOOP AT it_matrix_item INTO wa_matrix_item.
            delete_matrix_item( wa_matrix_item ).
        ENDLOOP.

*       Create [New] Matrix Items
        "#EC CI_VALPAR
        SORT i_salesdocumentitems STABLE BY salesdocumentitem.
        LOOP AT i_salesdocumentitems INTO wa_salesdocumentitem.

            tabix = sy-tabix.

            CLEAR wa_matrix_item.
            DATA(product) = wa_salesdocumentitem-material.
            SPLIT product AT '-' INTO DATA(model) DATA(color) DATA(cupsize) DATA(backsize).
            DATA(quantity) = CONV string( round( val  = wa_salesdocumentitem-RequestedQuantity dec  = 0 ) ).
            CONDENSE quantity NO-GAPS.

            wa_matrix_item-MatrixUUID   = wa_matrix-MatrixUUID.
            wa_matrix_item-ItemID       = tabix.
            wa_matrix_item-ItemID2      = tabix.
            wa_matrix_item-Model        = model.
            wa_matrix_item-Color        = color.
            wa_matrix_item-Cupsize      = cupsize.
            wa_matrix_item-Backsize     = backsize.
            wa_matrix_item-Product      = product.
            wa_matrix_item-Quantity     = quantity.
            create_matrix_item( wa_matrix_item ).

        ENDLOOP.

*       Clear Model/Color
        update_matrix( wa_matrix ).

    ENDIF.

*   Update Header Fields
    IF ( ( wa_matrix-PurchaseOrderByCustomer <> i_salesdocument-purchaseorderbycustomer ) OR ( wa_matrix-RequestedDeliveryDate <> i_salesdocument-requesteddeliverydate ) ).
        wa_matrix-PurchaseOrderByCustomer   = i_salesdocument-purchaseorderbycustomer.
        wa_matrix-RequestedDeliveryDate     = i_salesdocument-requesteddeliverydate.
        update_matrix2( wa_matrix ).
    ENDIF.

  ENDMETHOD. " adjust_matrix_items

  METHOD create_matrix_item.

    DATA ls_key_data        TYPE zrap_zc_matrix_005.
    DATA ls_business_data   TYPE zrap_zc_item_005.
    DATA lo_client_proxy    TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA lo_request         TYPE REF TO /iwbep/if_cp_request_create.
    DATA lo_response        TYPE REF TO /iwbep/if_cp_response_create.
    DATA lo_http_client     TYPE REF TO if_web_http_client.

    TRY.

        DATA(http_destination) = cl_http_destination_provider=>create_by_url( i_url = i_url ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = http_destination ).

        lo_http_client->accept_cookies( i_allow = abap_true ).

        lo_http_client->get_http_request( )->set_authorization_basic( i_username = i_username i_password = i_password ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*                iv_do_fetch_csrf_token      = abap_true
                iv_service_definition_name  = 'ZSC_MATRIX_005'
                io_http_client              = lo_http_client
                iv_relative_service_root    = '/sap/opu/odata/sap/ZSB_MATRIX_005_ODATA/' ).

*       Prepare key data (matrix)
        ls_key_data = VALUE #(
            MatrixUUID                      = i_item-MatrixUUID " '87ED5F17FA6A1EEE94807C16CC430947'
            IsActiveEntity                  = abap_true
        ).

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->navigate_with_key( ls_key_data )->navigate_to_many( '_ITEM' )->create_request_for_create( ).

*       Calculate a New Item ID
*       Read Actual Item Table
*        SELECT MAX( ItemID ) FROM zi_item_005 WHERE ( MatrixUUID = @ls_key_data-MatrixUUID ) INTO @DATA(maxitemid).
*        maxitemid = maxitemid + 1.

*       Prepare business data (Item)
        ls_business_data = VALUE #(
*            MatrixUUID                     = i_item-MatrixUUID            " '87ED5F17FA6A1EEE94807C16CC430947'
            ItemID                         = i_item-ItemID                " '1'
            IsActiveEntity                 = abap_true
            ItemID2                        = i_item-ItemID                " '1'
            Model                          = i_item-Model                 " 'Model'
            Color                          = i_item-Color                 "'Color'
            Cupsize                        = i_item-Cupsize               "'Cupsize'
            Backsize                       = i_item-Backsize              "'Backsize'
            Product                        = i_item-Product               "'Product'
            Quantity                       = i_item-Quantity              "'Quantity'
            CreatedBy                      = i_item-Createdby             "'Createdby'
            CreatedAt                      = i_item-Createdat             "20170101123000
            LastChangedBy                  = i_item-LastChangedBy         "'Lastchangedby'
            LastChangedAt                  = i_item-LastChangedAt         "20170101123000
            LocalLastChangedAt             = i_item-LocalLastChangedAt    "20170101123000
        ).

        " Set the business data for the created entity
        lo_request->set_business_data( ls_business_data ).

        " Execute the request
        lo_response = lo_request->execute( ).

        " Get the after image
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

    CATCH /iwbep/cx_cp_remote INTO DATA(lx_cp_remote).
      " Handle remote Exception
*      RAISE SHORTDUMP lx_cp_remote.

    CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
      " Handle Exception
*      RAISE SHORTDUMP lx_gateway.

    CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
      " Handle Exception
*      RAISE SHORTDUMP lx_web_http_client_error.

    CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        "handle exception
*      RAISE SHORTDUMP lx_http_dest_provider_error.

    ENDTRY.

  ENDMETHOD. " create_matrix_item.

  METHOD delete_matrix_item. " Delete Matrix Item

    DATA ls_key_data        TYPE zrap_zc_item_005.
    DATA lo_resource        TYPE REF TO /iwbep/if_cp_resource_entity.
    DATA lo_client_proxy    TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA lo_request         TYPE REF TO /iwbep/if_cp_request_delete.
    DATA lo_http_client     TYPE REF TO if_web_http_client.

    TRY.

        DATA(http_destination) = cl_http_destination_provider=>create_by_url( i_url = i_url ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = http_destination ).

        lo_http_client->accept_cookies( i_allow = abap_true ).

        lo_http_client->get_http_request( )->set_authorization_basic( i_username = i_username i_password = i_password ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
             iv_service_definition_name = 'ZSC_MATRIX_005'
             io_http_client             = lo_http_client
             iv_relative_service_root   = 'sap/opu/odata/sap/ZSB_MATRIX_005_ODATA'
        ).

        "Set entity key
        ls_key_data = VALUE #(
            MatrixUUID      = i_item-MatrixUUID " '11112222333344445555666677778888'
            ItemID          = i_item-ItemID     " '1'
            IsActiveEntity  = abap_true
        ).

        "Navigate to the resource and create a request for the delete operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZC_ITEM_005' )->navigate_with_key( ls_key_data )->create_request_for_delete( ).

        " ETag is needed
        " You need to retrieve it and then set it here
*        lo_request->set_if_match( ls_business_data-etag__etag ).

        " Execute the request
        lo_request->execute( ).

    CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
      " Handle remote Exception
*      RAISE SHORTDUMP lx_remote.

    CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
      " Handle Exception
*      RAISE SHORTDUMP lx_gateway.

    CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
      " Handle Exception
*      RAISE SHORTDUMP lx_web_http_client_error.

    CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        "handle exception
*      RAISE SHORTDUMP lx_http_dest_provider_error.

    ENDTRY.

  ENDMETHOD. " delete_matrix_item_remote

  METHOD read_matrix_item_list.
  ENDMETHOD. " read_matrix_item_list

  METHOD read_matrix_item.
  ENDMETHOD. " read_matrix_item

  METHOD update_matrix_item.
  ENDMETHOD. " update_matrix_item

  METHOD update_matrix. " Clear Model/Color

    DATA ls_key_data        TYPE zrap_zc_matrix_005.
    DATA ls_business_data   TYPE zrap_zc_matrix_005.
    DATA lo_client_proxy    TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA lo_request1        TYPE REF TO /iwbep/if_cp_request_read.
    DATA lo_response1       TYPE REF TO /iwbep/if_cp_response_read.
    DATA lo_request2        TYPE REF TO /iwbep/if_cp_request_update.
    DATA lo_response2       TYPE REF TO /iwbep/if_cp_response_update.
    DATA lo_http_client     TYPE REF TO if_web_http_client.

    TRY.

        DATA(http_destination) = cl_http_destination_provider=>create_by_url( i_url = i_url ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = http_destination ).

        lo_http_client->accept_cookies( i_allow = abap_true ).

        lo_http_client->get_http_request( )->set_authorization_basic( i_username = i_username i_password = i_password ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*                iv_do_fetch_csrf_token      = abap_true
                iv_service_definition_name  = 'ZSC_MATRIX_005'
                io_http_client              = lo_http_client
                iv_relative_service_root    = '/sap/opu/odata/sap/ZSB_MATRIX_005_ODATA/'
        ).

*       Prepare key data (matrix)
        ls_key_data = VALUE #(
            MatrixUUID                      = i_matrix-MatrixUUID " '87ED5F17FA6A1EEE94807C16CC430947'
            IsActiveEntity                  = abap_true
        ).

        " Navigate to the resource
        lo_request1 = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->navigate_with_key( ls_key_data )->create_request_for_read( ).

        " Execute the request and retrieve the business data
        lo_response1 = lo_request1->execute( ).

        " Get business data
        lo_response1->get_business_data( IMPORTING es_business_data = ls_business_data ).

        ls_business_data-Model          = space. " 'TG000231'.
        ls_business_data-Color          = space. " '048'.
*        ls_business_data-MatrixTypeID   = ''.
        ls_business_data-Hidden00       = abap_true.
        ls_business_data-Hidden01       = abap_true.
        ls_business_data-Hidden02       = abap_true.
        ls_business_data-Hidden03       = abap_true.
        ls_business_data-Hidden04       = abap_true.
        ls_business_data-Hidden05       = abap_true.
        ls_business_data-Hidden06       = abap_true.
        ls_business_data-Hidden07       = abap_true.
        ls_business_data-Hidden08       = abap_true.
        ls_business_data-Hidden09       = abap_true.
        ls_business_data-Hidden10       = abap_true.
        ls_business_data-Hidden11       = abap_true.
        ls_business_data-Hidden12       = abap_true.
        ls_business_data-Hidden13       = abap_true.
        ls_business_data-Hidden14       = abap_true.
        ls_business_data-Hidden15       = abap_true.
        ls_business_data-Hidden16       = abap_true.
        ls_business_data-Hidden17       = abap_true.
        ls_business_data-Hidden18       = abap_true.
        ls_business_data-Hidden19       = abap_true.
        ls_business_data-Hidden20       = abap_true.
        ls_business_data-Hidden21       = abap_true.
        ls_business_data-Hidden22       = abap_true.

        " Navigate to the resource
        lo_request2 = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->navigate_with_key( ls_key_data )->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-put ).

        " Set the business data for the created entity
        lo_request2->set_business_data( ls_business_data ).

        " Execute the request (Update)
        lo_response2 = lo_request2->execute( ).

        " Get the after image
*        lo_response2->get_business_data( IMPORTING es_business_data = ls_business_data ).

    CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
      " Handle remote Exception
*      RAISE SHORTDUMP lx_remote.

    CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
      " Handle Exception
*      RAISE SHORTDUMP lx_gateway.

    CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
      " Handle Exception
*      RAISE SHORTDUMP lx_web_http_client_error.

    CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        "handle exception
*      RAISE SHORTDUMP lx_http_dest_provider_error.

    ENDTRY.

  ENDMETHOD. " update_matrix

  METHOD update_matrix2. " Update Header Fields

    DATA ls_key_data        TYPE zrap_zc_matrix_005.
    DATA ls_business_data   TYPE zrap_zc_matrix_005.
    DATA lo_client_proxy    TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA lo_request1        TYPE REF TO /iwbep/if_cp_request_read.
    DATA lo_response1       TYPE REF TO /iwbep/if_cp_response_read.
    DATA lo_request2        TYPE REF TO /iwbep/if_cp_request_update.
    DATA lo_response2       TYPE REF TO /iwbep/if_cp_response_update.
    DATA lo_http_client     TYPE REF TO if_web_http_client.

    TRY.

        DATA(http_destination) = cl_http_destination_provider=>create_by_url( i_url = i_url ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = http_destination ).

        lo_http_client->accept_cookies( i_allow = abap_true ).

        lo_http_client->get_http_request( )->set_authorization_basic( i_username = i_username i_password = i_password ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*                iv_do_fetch_csrf_token      = abap_true
                iv_service_definition_name  = 'ZSC_MATRIX_005'
                io_http_client              = lo_http_client
                iv_relative_service_root    = '/sap/opu/odata/sap/ZSB_MATRIX_005_ODATA/'
        ).

*       Prepare key data (matrix)
        ls_key_data = VALUE #(
            MatrixUUID                      = i_matrix-MatrixUUID " '87ED5F17FA6A1EEE94807C16CC430947'
            IsActiveEntity                  = abap_true
        ).

        " Navigate to the resource
        lo_request1 = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->navigate_with_key( ls_key_data )->create_request_for_read( ).

        " Execute the request and retrieve the business data
        lo_response1 = lo_request1->execute( ).

        " Get business data
        lo_response1->get_business_data( IMPORTING es_business_data = ls_business_data ).

        ls_business_data-PurchaseOrderByCustomer          = i_matrix-PurchaseOrderByCustomer .
        ls_business_data-RequestedDeliveryDate            = i_matrix-RequestedDeliveryDate.

        " Navigate to the resource
        lo_request2 = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->navigate_with_key( ls_key_data )->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-put ).

        " Set the business data for the created entity
        lo_request2->set_business_data( ls_business_data ).

        " Execute the request (Update)
        lo_response2 = lo_request2->execute( ).

        " Get the after image
*        lo_response2->get_business_data( IMPORTING es_business_data = ls_business_data ).

    CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
      " Handle remote Exception
*      RAISE SHORTDUMP lx_remote.

    CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
      " Handle Exception
*      RAISE SHORTDUMP lx_gateway.

    CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
      " Handle Exception
*      RAISE SHORTDUMP lx_web_http_client_error.

    CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        "handle exception
*      RAISE SHORTDUMP lx_http_dest_provider_error.

    ENDTRY.

  ENDMETHOD. " update_matrix2

ENDCLASS. " zcl_rap_matrix_005
