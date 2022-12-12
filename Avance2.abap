*&---------------------------------------------------------------------*
*& Report Z_TEC_22_2_LAB15_G05_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_TEC_22_2_LAB15_G05_01.

INCLUDE Z_TEC_22_2_LAB14_09_DEF_MODULE.




SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE TEXT-001.
SELECTION-SCREEN COMMENT /1(30) titulo1.
PARAMETERS: name LIKE wa_itab02-firstname OBLIGATORY,
  lname LIKE wa_itab02-lastname OBLIGATORY,
  weight LIKE wa_itab02-peso OBLIGATORY,
  wUnit LIKE wa_itab02-unidadpeso OBLIGATORY.
SELECTION-SCREEN ULINE.
SELECTION-SCREEN COMMENT /1(30) titulo2.
PARAMETERS: addr LIKE wa_itab02-address OBLIGATORY,
  dep LIKE wa_itab02-departamento OBLIGATORY,
  store LIKE wa_itab02-ztienda OBLIGATORY.
SELECTION-SCREEN ULINE.
SELECTION-SCREEN END OF BLOCK block1.
SELECTION-SCREEN BEGIN OF BLOCK block2 WITH FRAME TITLE TEXT-f02.
  SELECTION-SCREEN COMMENT /40(50) data.
PARAMETERS: List RADIOBUTTON GROUP b1 DEFAULT 'X',
            Grid RADIOBUTTON GROUP b1.
SELECTION-SCREEN END OF BLOCK block2.

START-OF-SELECTION.
 MESSAGE s000(Z_MESSAGE_LAB_14_G9) WITH name.
END-OF-SELECTION.

START-OF-SELECTION.

DATA ANS VALUE 2.
DATA: gwa_layout   TYPE slis_layout_alv.
data ti_fieldcat type standard table of slis_fieldcat_alv.
data wa_fieldcat type slis_fieldcat_alv.
data gi_catalogo  TYPE slis_t_fieldcat_alv.
data: gr_table type ref to cl_salv_table.

 gwa_layout-zebra      = 'X'.
    gwa_layout-colwidth_optimize = 'X'.

FREE: ti_fieldcat.



CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      TITLEBAR              = 'Cofirmar registro de'
      TEXT_QUESTION         = '¿Desea registrar el cliente?'
      TEXT_BUTTON_1         = 'Aceptar'
      ICON_BUTTON_1         = 'ICON_CHECKED'
      TEXT_BUTTON_2         = 'Cancelar'
      ICON_BUTTON_2         = 'ICON_CANCEL'
      DISPLAY_CANCEL_BUTTON = ' '
      POPUP_TYPE            = 'ICON_MESSAGE_ERROR'
    IMPORTING
      ANSWER                = ANS.
  IF ANS = 2.
    LEAVE PROGRAM.
  ENDIF.

  IF ANS = 1.

    wa_itab02-firstname = name.
wa_itab02-lastname = lname.
wa_itab02-peso = weight.
wa_itab02-unidadpeso = wUnit.
wa_itab02-address = addr.
wa_itab02-departamento = dep.
wa_itab02-ztienda = store.

INSERT ZTC_TCUSTOMER_CO FROM wa_itab02.
*insert ZTC_TCUSTOMER_CO from wa_itab02.

SELECT * FROM ZTC_TCUSTOMER_CO
    INTO TABLE it_spfli.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'LASTNAME'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'Nombre'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'FIRSTNAME'.
wa_fieldcat-tabname = 'it_spfli'.
wa_fieldcat-seltext_l = 'Apellido'.
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





WRITE:/ 'POP_UP', ANS COLOR 5.
WRITE:/ 'LIST', List,'GRID', Grid COLOR 5.

ULINE.

WRITE:/ 'CLIENTE AGREGADO', wa_itab02-firstname COLOR 5.

ULINE.



  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
   EXPORTING
     IT_FIELDCAT                    = ti_fieldcat[]
   TABLES
      T_OUTTAB                      = it_spfli
  Exceptions
       program_error = 1
       others        = 2.

    if sy-subrc ne 0.
    message i398(00) with 'fallo de la funcion'.
    endif.



ENDIF.




END-OF-SELECTION.
SELECTION-SCREEN SKIP 1.



INITIALIZATION.
 Titulo1 = 'Datos personales'.
 Titulo2 = 'Datos de la tienda'.