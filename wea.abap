clear wa_fieldcat.
wa_fieldcat-fieldname = 'CUSTID'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'Codigo'.

append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'LASTNAME'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'nombre'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'FIRSTNAME'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'apellido'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'ADDRESS'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'Direccion'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'PESO'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'Peso'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'DEPARTAMENTO'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'Departamento'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'UNIDADPESO'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'Unidad de peso'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'ZTIENDA'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'Tienda'.
append wa_fieldcat to ti_fieldcat.



CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    it_fieldcat = ti_fieldcat[]
  TABLES
    t_outtab = it_spfli
  Exceptions
       program_error = 1
       others        = 2.

    if sy-subrc ne 0.
    message i398(00) with 'fallo de la funcion'.
    endif.