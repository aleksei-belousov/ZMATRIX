CLASS lhc_model DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR model RESULT result.

    METHODS activate FOR MODIFY
      IMPORTING keys FOR ACTION model~activate.

    METHODS edit FOR MODIFY
      IMPORTING keys FOR ACTION model~edit.

    METHODS resume FOR MODIFY
      IMPORTING keys FOR ACTION model~resume.

ENDCLASS.

CLASS lhc_model IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD Activate.
  ENDMETHOD.

  METHOD Edit.
  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

ENDCLASS.
