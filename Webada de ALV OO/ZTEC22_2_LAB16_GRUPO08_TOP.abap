*&---------------------------------------------------------------------*
*& Include          ZTEC22_2_LAB16_GRUPO08_TOP
*&---------------------------------------------------------------------*

TABLES: ZTC_TCUSTOMER_CO.

*PANTALLA DE SELECCION
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECTION-SCREEN COMMENT /1(79) titulo1.
  SELECT-OPTIONS s_custnr FOR ZTC_TCUSTOMER_CO-lastname.
  SELECT-OPTIONS s_natnr FOR ZTC_TCUSTOMER_CO-firstname.
  SELECT-OPTIONS s_adtnr FOR ZTC_TCUSTOMER_CO-address.
  SELECT-OPTIONS s_pesonr FOR ZTC_TCUSTOMER_CO-peso.
  SELECT-OPTIONS s_unidnr FOR ZTC_TCUSTOMER_CO-unidadpeso.
  SELECT-OPTIONS s_deptnr FOR ZTC_TCUSTOMER_CO-departamento.
  SELECT-OPTIONS s_zttnr FOR ZTC_TCUSTOMER_CO-ztienda.
SELECTION-SCREEN END OF BLOCK b1.

INITIALIZATION.
  Titulo1 = 'Busque los datos que desea ver, si no llena un campo se listara todo'.

*Variables de la Dynpro 0008.
DATA: ok_code TYPE sy-ucomm.

*VARIABLES PARA EL ALV.
DATA: it_tcustomer  TYPE TABLE OF ZTC_TCUSTOMER_CO,
      it_fcat       TYPE STANDARD TABLE OF lvc_s_fcat,
      vg_container  TYPE REF TO cl_gui_custom_container,
      obj_alv_grid  TYPE REF TO cl_gui_alv_grid.


*CLASE INTERNA
CLASS G8_cls_alv_oo DEFINITION DEFERRED.
DATA: G8_obj_alv_oo TYPE REF TO G8_cls_alv_oo.