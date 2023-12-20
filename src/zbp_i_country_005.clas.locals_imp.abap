CLASS lhc_color DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR color RESULT result.

    METHODS activate FOR MODIFY
      IMPORTING keys FOR ACTION color~activate.

    METHODS edit FOR MODIFY
      IMPORTING keys FOR ACTION color~edit.

    METHODS resume FOR MODIFY
      IMPORTING keys FOR ACTION color~resume.

ENDCLASS.

CLASS lhc_color IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD activate.
  ENDMETHOD.

  METHOD edit.
  ENDMETHOD.

  METHOD resume.
  ENDMETHOD.

ENDCLASS.
