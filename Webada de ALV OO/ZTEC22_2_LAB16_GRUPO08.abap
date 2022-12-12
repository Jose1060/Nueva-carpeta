*&---------------------------------------------------------------------*
*& Report ZTEC22_2_LAB16_GRUPO08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
* PROGRAMA HECHO CON AMOR

REPORT ZTEC22_2_LAB16_GRUPO08.

INCLUDE ztec22_2_lab16_grupo08_TOP.
INCLUDE ztec22_2_lab16_grupo08_pbo.
INCLUDE ztec22_2_lab16_grupo08_pai.
INCLUDE ztec22_2_lab16_grupo08_clsl.

START-OF-SELECTION.
CREATE OBJECT G8_obj_alv_oo.

CALL METHOD G8_obj_alv_oo->get_data.
CALL METHOD G8_obj_alv_oo->show_alv.

CALL SCREEN 0008.
