*&---------------------------------------------------------------------*
*& Report Z_TEC_22_2_LAB15_1_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_TEC_22_2_LAB15_1_01.

tables: zemployees.

types: begin of linea01_tipo,
       employee like zemployees-employee,
       surname  like zemployees-surname,
       forename like zemployees-forename,
       title    like zemployees-title,
       dob      like zemployees-dob,
     end of linea01_tipo.

types: ti01_tipo type table of linea01_tipo.
data: ti_consulta00 type ti01_tipo,
      ti_wa      type line of ti01_tipo.
data: wa_layout type slis_layout_alv.
data ti_fieldcat type standard table of slis_fieldcat_alv.
data wa_fieldcat type slis_fieldcat_alv.


FREE: ti_fieldcat.

selection-screen begin of block b1 with frame title text-001.

select-options: s_nomb for zemployees-employee.
select-options: s_apel for zemployees-surname.
select-options: s_edad for zemployees-forename.

selection-screen end of block b1.
start-of-selection.
   perform carga.
   perform armadosalida.
   perform salida.
form carga.

select employee surname forename title dob into table ti_consulta00
from zemployees
where employee in s_nomb
      and surname in s_apel
      and forename in s_edad
order by employee.

endform.

form armadosalida.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'EMPLOYEE'.
wa_fieldcat-tabname = 'ti_consulta00'.
wa_fieldcat-seltext_l = 'Codigo'.

append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'surname'.
wa_fieldcat-tabname = 'ti_consulta00'.
wa_fieldcat-seltext_l = 'nombre'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'forename'.
wa_fieldcat-tabname = 'ti_consulta00'.
wa_fieldcat-seltext_l = 'apellido'.
append wa_fieldcat to ti_fieldcat.

clear wa_fieldcat.
wa_fieldcat-fieldname = 'dob'.
wa_fieldcat-tabname = 'ti_consulta00'.
wa_fieldcat-seltext_l = 'fecha de nacimiento'.
append wa_fieldcat to ti_fieldcat.

endform.

form salida.

   call function 'REUSE_ALV_GRID_DISPLAY'
    exporting
      it_fieldcat = ti_fieldcat[]
    tables
      t_outtab    = ti_consulta00
    exceptions
       program_error = 1
       others        = 2.

    if sy-subrc ne 0.
    message i398(00) with 'fallo de la funcion'.
    endif.
ENDFORM.