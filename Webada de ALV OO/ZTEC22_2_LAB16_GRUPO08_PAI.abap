*----------------------------------------------------------------------*
***INCLUDE ZTEC22_2_LAB16_GRUPO08_PAI.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0008  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0008 INPUT.
CASE OK_CODE.
  WHEN 'BACK'.
    LEAVE TO SCREEN 0.
  WHEN 'EXIT'.
    LEAVE PROGRAM.
  WHEN 'CANCEL'.
    LEAVE TO SCREEN 0.
  WHEN OTHERS.
ENDCASE.

ENDMODULE.