CLASS zcl_sd_sls_check_before_save DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_badi_interface .
    INTERFACES if_sd_sls_check_before_save .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS ZCL_SD_SLS_CHECK_BEFORE_SAVE IMPLEMENTATION.

  METHOD if_sd_sls_check_before_save~check_document.

    SELECT SINGLE * FROM zc_matrix_005 WHERE ( SalesOrderID = @salesdocument-salesdocument ) INTO @DATA(wa_matrix).

*   Check and Update Matrix [Items] if necessary
    IF ( sy-subrc = 0 ).

        TRY.

            zcl_rap_matrix_005=>i_url       = 'https://' && cl_abap_context_info=>get_system_url( ).
            zcl_rap_matrix_005=>i_username  = 'INBOUND_USER'.
            zcl_rap_matrix_005=>i_password  = 'rtrVDDgelabtTjUiybRX}tVD3JksqqfvPpBdJRaL'.

            zcl_rap_matrix_005=>adjust_matrix_items(
                i_salesdocument         = salesdocument
                i_salesdocumentitems    = salesdocumentitems
            ).

        CATCH cx_abap_context_info_error INTO DATA(lx_abap_context_info_error).
            "handle exception

        ENDTRY.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
