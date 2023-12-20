CLASS lhc_matrixtype DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR matrixtype RESULT result.

    METHODS activate FOR MODIFY
      IMPORTING keys FOR ACTION matrixtype~activate.

    METHODS edit FOR MODIFY
      IMPORTING keys FOR ACTION matrixtype~edit.

    METHODS resume FOR MODIFY
      IMPORTING keys FOR ACTION matrixtype~resume.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR matrixtype RESULT result.

ENDCLASS.

CLASS lhc_matrixtype IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD activate.

    LOOP AT keys INTO DATA(key).

*       Read Actual Matrix Type
        SELECT SINGLE * FROM zmatrixtype_005  WHERE ( matrixtypeuuid = @key-MatrixTypeUUID ) INTO @DATA(wa_matrixtype).

*       Read Matrix Type Draft
        SELECT SINGLE * FROM zmatrixtype_005d WHERE ( matrixtypeuuid = @key-MatrixTypeUUID ) INTO @DATA(wa_matrixtype_draft).

*       Read Actual Matrix Type Size
        SELECT * FROM ztypesize_005 WHERE ( matrixtypeuuid = @key-MatrixTypeUUID ) INTO TABLE @DATA(it_typesize).

*       Read Matrix Type Size Draft
        SELECT * FROM ztypesize_005d WHERE ( matrixtypeuuid = @key-MatrixTypeUUID ) INTO TABLE @DATA(it_typesize_draft).

    ENDLOOP.

  ENDMETHOD. " activate

  METHOD edit.

  ENDMETHOD. " edit

  METHOD resume.
  ENDMETHOD.

  METHOD get_instance_features.

    LOOP AT keys INTO DATA(key).

        IF ( key-%is_draft = '00' ). " Saved
        ENDIF.

        IF ( key-%is_draft = '01' ). " Draft
        ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
