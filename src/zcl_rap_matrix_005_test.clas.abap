CLASS zcl_rap_matrix_005_test DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA i_url         TYPE string. " VALUE 'https://my404930.s4hana.cloud.sap'.
    DATA i_username    TYPE string. " VALUE 'INBOUND_USER'.
    DATA i_password    TYPE string. " VALUE 'rtrVDDgelabtTjUiybRX}tVD3JksqqfvPpBdJRaL'.

    METHODS create_item.
    METHODS create_matrix.

    METHODS read_item.
    METHODS read_list1.
    METHODS read_list2.
    METHODS read_matrix.

    METHODS delete_item.
    METHODS delete_matrix.

    METHODS update_item.
    METHODS update_matrix.
    METHODS update_matrix2.

    METHODS create_sales_order_in_dev importing out type ref to if_oo_adt_classrun_out.
    METHODS create_sales_order_in_cust importing out type ref to if_oo_adt_classrun_out.

ENDCLASS.

CLASS ZCL_RAP_MATRIX_005_TEST IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TRY.

        i_url       = 'https://' && cl_abap_context_info=>get_system_url( ).
        i_username  = 'INBOUND_USER'.
        i_password  = 'rtrVDDgelabtTjUiybRX}tVD3JksqqfvPpBdJRaL'.

*        create_item( ).
*        create_matrix( ).

*        delete_item( ).
*        delete_matrix( ).

*        read_item( ).
*        read_list1( ).
*        read_list2( ).
*        read_matrix( ).

*        update_item( ).
*        update_matrix( ).
        update_matrix2( ).

*        create_sales_order_in_dev( out ).
*        create_sales_order_in_cust( out ).

    CATCH cx_abap_context_info_error INTO DATA(lx_abap_context_info_error).
        "handle exception
    ENDTRY.

  ENDMETHOD. " if_oo_adt_classrun~main

  METHOD create_item. " Create Item

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
                iv_relative_service_root    = '/sap/opu/odata/sap/ZSB_MATRIX_005_ODATA/'
        ).

*       Prepare key data (matrix)
        ls_key_data = VALUE #(
            MatrixUUID                      = '87ED5F17FA6A1EEE94807C16CC430947'
            IsActiveEntity                  = abap_true
        ).

         " Navigate to the resource and create a request for the create operation
*        lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZC_ITEM_005' )->create_request_for_create( ).

*       For Testing
*        DATA(lo_root_resource)      = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' ).
*        DATA(lo_resource_matrix)    = lo_root_resource->navigate_with_key( ls_entity_key ).
*        DATA(lo_child_resource)     = lo_resource_matrix->navigate_to_many( '_ITEM' ).
*        lo_request                  = lo_child_resource->create_request_for_create( ).

        lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->navigate_with_key( ls_key_data )->navigate_to_many( '_ITEM' )->create_request_for_create( ).

*       Calculate a New Item ID
*       Read Actual Item Table
        SELECT MAX( ItemID ) FROM zi_item_005 WHERE ( MatrixUUID = @ls_key_data-MatrixUUID ) INTO @DATA(maxitemid).
        maxitemid = maxitemid + 1.

*       Prepare business data (item)
        ls_business_data = VALUE #(
*           MatrixUUID                     = '87ED5F17FA6A1EEE94807C16CC430947'
            ItemID                         = maxitemid " '3'
            IsActiveEntity                 = abap_true
            model                          = 'Model'
            color                          = 'Color'
            cupsize                        = 'Cupsize'
            backsize                       = 'Backsize'
            product                        = 'Product'
            quantity                       = '10'
            createdby                      = 'Createdby'
            createdat                      = 20170101123000
            lastchangedby                  = 'Lastchangedby'
            lastchangedat                  = 20170101123000
            locallastchangedat             = 20170101123000
        ).

        " Set the business data for the created entity
        lo_request->set_business_data( ls_business_data ).

        " Execute the request
        lo_response = lo_request->execute( ).

        " Get the after image
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

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

  ENDMETHOD. " create_item

  METHOD create_matrix. " Create Matrix

    DATA ls_business_data TYPE zrap_zc_matrix_005.
    DATA lo_http_client   TYPE REF TO if_web_http_client.
    DATA lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA lo_request       TYPE REF TO /iwbep/if_cp_request_create.
    DATA lo_response      TYPE REF TO /iwbep/if_cp_response_create.

    TRY.

        DATA(http_destination) = cl_http_destination_provider=>create_by_url( i_url = i_url ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = http_destination ).

        lo_http_client->accept_cookies( i_allow = abap_true ).

        lo_http_client->get_http_request( )->set_authorization_basic( i_username = i_username i_password = i_password ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
             EXPORTING
*                iv_do_fetch_csrf_token      = abap_true
                iv_service_definition_name  = 'ZSC_MATRIX_005'
                io_http_client              = lo_http_client
                iv_relative_service_root    = '/sap/opu/odata/sap/ZSB_MATRIX_005_ODATA/' ).

*     Prepare business data
    ls_business_data = VALUE #(
          matrixuuid                     = '11112222333344445555666677778888'
          isactiveentity                 = abap_true
          matrixid                       = '1'
          salesordertype                 = 'Salesordertype'
          salesorganization              = 'Salesorganization'
          distributionchannel            = 'Distributionchannel'
          organizationdivision           = 'Organizationdivision'
          soldtoparty                    = 'Soldtoparty'
          model                          = 'Model'
          color                          = 'Color'
          matrixtypeid                   = 'Matrixtypeid'
          country                        = 'Country'
          purchaseorderbycustomer        = 'Purchaseorderbycustomer'
          creationdate                   = 20170101123000
          creationtime                   = 123000
          salesorderid                   = 'Salesorderid'
          salesorderurl                  = 'Salesorderurl'
          customerurl                    = 'Customerurl'
          modelref                       = 'Modelref'
          modelrefurl                    = 'Modelrefurl'
          hidden00                       = abap_true
          hidden01                       = abap_true
          hidden02                       = abap_true
          hidden03                       = abap_true
          hidden04                       = abap_true
          hidden05                       = abap_true
          hidden06                       = abap_true
          hidden07                       = abap_true
          hidden08                       = abap_true
          hidden09                       = abap_true
          hidden10                       = abap_true
          hidden11                       = abap_true
          hidden12                       = abap_true
          hidden13                       = abap_true
          hidden14                       = abap_true
          hidden15                       = abap_true
          hidden16                       = abap_true
          hidden17                       = abap_true
          hidden18                       = abap_true
          hidden19                       = abap_true
          hidden20                       = abap_true
          hidden21                       = abap_true
          hidden22                       = abap_true
          criticality01                  = 'Criticality01'
          createdby                      = 'Createdby'
          createdat                      = 20170101123000
          lastchangedby                  = 'Lastchangedby'
          lastchangedat                  = 20170101123000
          locallastchangedat             = 20170101123000
          hasdraftentity                 = abap_true
          draftentitycreationdatetime    = 20170101123000
          draftentitylastchangedatetime  = 20170101123000
          hasactiveentity                = abap_true
    ).

    " Navigate to the resource and create a request for the create operation
    lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->create_request_for_create( ).

    " Set the business data for the created entity
    lo_request->set_business_data( ls_business_data ).

    " Execute the request
    lo_response = lo_request->execute( ).

    " Get the after image
    lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

    CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
    " Handle remote Exception
        RAISE SHORTDUMP lx_remote.

    CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        RAISE SHORTDUMP lx_gateway.
        " Handle Exception

    CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        " Handle Exception
        RAISE SHORTDUMP lx_web_http_client_error.

    CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        "handle exception
        RAISE SHORTDUMP lx_http_dest_provider_error.

    ENDTRY.

  ENDMETHOD. " create_matrix

  METHOD delete_item. " Delete Item

    DATA ls_key_data        TYPE zrap_zc_item_005.
    DATA lo_http_client     TYPE REF TO if_web_http_client.
    DATA lo_resource        TYPE REF TO /iwbep/if_cp_resource_entity.
    DATA lo_client_proxy    TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA lo_request         TYPE REF TO /iwbep/if_cp_request_delete.

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
            MatrixUUID      = '29C487C9B9D21EDE94ADDD7B50989CC8' " SO 344
            ItemID          = '1'
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

  ENDMETHOD. " delete_item

  METHOD delete_matrix.
  ENDMETHOD. " delete_matrix

  METHOD read_item.
  ENDMETHOD. " read_item

  METHOD read_list1. " Read List of Matrix

    DATA lt_business_data TYPE TABLE OF zrap_zc_matrix_005.
    DATA lo_http_client   TYPE REF TO if_web_http_client.
    DATA lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA lo_request       TYPE REF TO /iwbep/if_cp_request_read_list.
    DATA lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    TRY.

        DATA(http_destination) = cl_http_destination_provider=>create_by_url( i_url = i_url ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = http_destination ).

        lo_http_client->accept_cookies( i_allow = abap_true ).

        lo_http_client->get_http_request( )->set_authorization_basic( i_username = i_username i_password = i_password ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
             EXPORTING
*                iv_do_fetch_csrf_token      = abap_true
                iv_service_definition_name  = 'ZSC_MATRIX_005'
                io_http_client              = lo_http_client
                iv_relative_service_root    = '/sap/opu/odata/sap/ZSB_MATRIX_005_ODATA/' ).

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->create_request_for_read( ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).

        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

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

  ENDMETHOD. " read_list1

  METHOD read_list2.
  ENDMETHOD. " read_list2

  METHOD read_matrix. " Read Matrix

    DATA ls_entity_key    TYPE zrap_zc_matrix_005.
    DATA ls_business_data TYPE zrap_zc_matrix_005.
    DATA lo_http_client   TYPE REF TO if_web_http_client.
    DATA lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity.
    DATA lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy.
    DATA lo_request       TYPE REF TO /iwbep/if_cp_request_read.
    DATA lo_response      TYPE REF TO /iwbep/if_cp_response_read.

    TRY.

        DATA(http_destination) = cl_http_destination_provider=>create_by_url( i_url = i_url ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = http_destination ).

        lo_http_client->accept_cookies( i_allow = abap_true ).

        lo_http_client->get_http_request( )->set_authorization_basic( i_username = i_username i_password = i_password ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
             EXPORTING
*                iv_do_fetch_csrf_token      = abap_true
                iv_service_definition_name  = 'ZSC_MATRIX_005'
                io_http_client              = lo_http_client
                iv_relative_service_root    = '/sap/opu/odata/sap/ZSB_MATRIX_005_ODATA/' ).


        " Set entity key
        ls_entity_key = VALUE #(
            MatrixUUID = '87ED5F17FA6A1EEE94807C16CC430947'
            IsActiveEntity = abap_true
        ).

        " Navigate to the resource
        lo_resource = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->navigate_with_key( ls_entity_key ).

        " Execute the request and retrieve the business data
        lo_response = lo_resource->create_request_for_read( )->execute( ).

        " Get the after image
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

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

  ENDMETHOD. "read_matrix

  METHOD update_item.
  ENDMETHOD. " update_item

  METHOD update_matrix. " Update Matrix

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
            MatrixUUID                      = '87ED5F17FA6A1EEE94807C16CC430947'
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

  METHOD update_matrix2. " Update Matrix (update Customer Reference)

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
*            MatrixUUID                      = '87ED5F17FA6A1EEE94807C16CC430947'
            MatrixUUID                      = '3116BC7A905A1EEE85987F2A0B760592' " (1) in DEV
            IsActiveEntity                  = abap_true
        ).

        " Navigate to the resource
        lo_request1 = lo_client_proxy->create_resource_for_entity_set( 'ZC_MATRIX_005' )->navigate_with_key( ls_key_data )->create_request_for_read( ).

        " Execute the request and retrieve the business data
        lo_response1 = lo_request1->execute( ).

        " Get business data
        lo_response1->get_business_data( IMPORTING es_business_data = ls_business_data ).

        ls_business_data-PurchaseOrderByCustomer   = 'Test3'.
*        ls_business_data-PurchaseOrderByCustomer_vc    = 'X'. " - actually not necessary
        ls_business_data-RequestedDeliveryDate     = '20240402'.
*        ls_business_data-RequestedDeliveryDate_vc      = 'X'. " - actually not necessary

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


  METHOD create_sales_order_in_dev.

    out->write( 'Create Sales Order.' ).

    MODIFY ENTITIES OF
        i_salesordertp
    ENTITY
        salesorder
    CREATE FIELDS (
        salesordertype
        salesorganization
        distributionchannel
        organizationdivision
        soldtoparty )
    WITH VALUE #( ( %cid = '3'  %data = VALUE #(    salesordertype = 'TA'
                                                    salesorganization = '1010'
                                                    distributionchannel = '10'
                                                    organizationdivision = '00'
                                                    soldtoparty = '0010100014' ) ) )
    CREATE BY
        \_item
    FIELDS
        ( product requestedquantity )
    WITH VALUE #( ( %cid_ref = '3' salesorder = space  %target = VALUE #(
            ( %cid = '13' product = 'TG20'      requestedquantity = '1' )
            ( %cid = '14' product = 'TG0012'    requestedquantity = '2' )
            ( %cid = '15' product = 'TG10'      requestedquantity = '3' ) ) ) )
    MAPPED DATA(ls_mapped)
    FAILED DATA(ls_failed)
    REPORTED DATA(ls_reported).

    COMMIT ENTITIES
      RESPONSE OF i_salesordertp
          FAILED DATA(failed_commit)
          REPORTED DATA(reported_commit).

    DATA wa_salesorder  LIKE LINE OF reported_commit-salesorder.
    DATA salesOrder     LIKE wa_salesorder-SalesOrder.

    LOOP AT reported_commit-salesorder INTO wa_salesorder.
        IF ( wa_salesorder-SalesOrder IS NOT INITIAL ).
            salesOrder = wa_salesorder-SalesOrder.
            EXIT.
        ENDIF.
    ENDLOOP.

    IF ( salesOrder IS INITIAL ).
        out->write( 'Failed.' ). " output to console
    ELSE.
        DATA text TYPE string.
        text = CONV #( salesOrder ).
        CONCATENATE 'A New Sales Order' text 'Has Been Created.' INTO text SEPARATED BY space.
        out->write( text ). " output to console
     ENDIF.

  ENDMETHOD. " create_sales_order_in_dev

  METHOD create_sales_order_in_cust.

    DATA wa_matrix_005  TYPE zi_matrix_005.
    DATA wa_item_005    TYPE zi_item_005.
    DATA it_salesorder_create       TYPE TABLE FOR CREATE i_salesordertp. " Sales Order (root)
    DATA it_salesorder_item_create  TYPE TABLE FOR CREATE i_salesordertp\_Item.  " Item
    DATA cid TYPE string.

    CLEAR wa_matrix_005.
    wa_matrix_005-SalesOrderType            = 'TA'.
    wa_matrix_005-SalesOrganization         = '1000'.
    wa_matrix_005-DistributionChannel       = '10'.
    wa_matrix_005-OrganizationDivision      = '00'.
    wa_matrix_005-SoldToParty               = '10001084'.
*    wa_matrix_005-PurchaseOrderByCustomer   =
*    wa_matrix_005-RequestedDeliveryDate     =

    CLEAR wa_item_005.
    wa_item_005-Product     = '0005076-085-B-085'.
    wa_item_005-Quantity    = 1.

*   Conversion of sales document type from external to internal format (conversion exits are not permitted, therefore - we have to use hard code)
    CASE wa_matrix_005-SalesOrderType.
        WHEN 'OR'. wa_matrix_005-SalesOrderType = 'TA'.
    ENDCASE.

*   Make Sales Order (Root)
    APPEND VALUE #(
        %cid = 'root'
        %data = VALUE #(
            SalesOrderType          = |{ wa_matrix_005-SalesOrderType ALPHA = IN }|         " 'TA'
            SalesOrganization       = |{ wa_matrix_005-SalesOrganization ALPHA = IN }|      " '1010'
            DistributionChannel     = |{ wa_matrix_005-DistributionChannel ALPHA = IN }|    " '10'
            OrganizationDivision    = |{ wa_matrix_005-OrganizationDivision ALPHA = IN }|   " '00'
            SoldToParty             = |{ wa_matrix_005-SoldToParty ALPHA = IN }|            " '0010100014'
*            PurchaseOrderByCustomer = wa_matrix_005-PurchaseOrderByCustomer
*            RequestedDeliveryDate   = wa_matrix_005-RequestedDeliveryDate
        )
    )
    TO it_salesorder_create.

*   Make Sales Order (Item)
    APPEND VALUE #(
        %cid_ref = 'root'
        SalesOrder = space
        %target = VALUE #( (
            %cid                = '1'
            Product             = wa_item_005-Product   " '0005076-085-B-085'
            RequestedQuantity   = wa_item_005-Quantity  " 1.
        ) )
    )
    TO it_salesorder_item_create.

*   Create Sales Order
    MODIFY ENTITIES OF i_salesordertp
        ENTITY salesorder
        CREATE FIELDS (
            SalesOrderType
            SalesOrganization
            DistributionChannel
            OrganizationDivision
            SoldToParty
*            PurchaseOrderByCustomer
*            RequestedDeliveryDate
        )
        WITH it_salesorder_create
        CREATE BY \_item
        FIELDS (
            Product
            RequestedQuantity
        )
        WITH it_salesorder_item_create
        MAPPED DATA(mapped)
        FAILED DATA(failed)
        REPORTED DATA(reported).

    "retrieve the created sale order
*    zbp_i_matrix_005=>mapped_sales_order-salesorder = ls_mapped-salesorder.

*   Read Sales Order
*    READ ENTITIES OF i_salesordertp
*        ENTITY salesorder
*        FROM VALUE #( ( salesorder = space ) )
*        RESULT DATA(lt_salesorder)
*        REPORTED DATA(reported2).

    COMMIT ENTITIES
      RESPONSE OF i_salesordertp
          FAILED DATA(failed_commit)
          REPORTED DATA(reported_commit).

    DATA wa_salesorder  LIKE LINE OF reported_commit-salesorder.
    DATA salesOrder     LIKE wa_salesorder-SalesOrder.

    LOOP AT reported_commit-salesorder INTO wa_salesorder.
        IF ( wa_salesorder-SalesOrder IS NOT INITIAL ).
            salesOrder = wa_salesorder-SalesOrder.
            EXIT.
        ENDIF.
    ENDLOOP.

    IF ( salesOrder IS INITIAL ).
        out->write( 'Failed.' ). " output to console
    ELSE.
        DATA text TYPE string.
        text = CONV #( salesOrder ).
        CONCATENATE 'A New Sales Order' text 'Has Been Created.' INTO text SEPARATED BY space.
        out->write( text ). " output to console
     ENDIF.



  ENDMETHOD. " create_sales_order_in_cust

ENDCLASS.
