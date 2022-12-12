*&---------------------------------------------------------------------*
*& Report Z_TEC_22_2_LAB15_1_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_TEC_22_2_LAB15_1_02 message-ID Z_TEC_22_2_LAB15_1.

tables: ZEMPLOYEES.

types: begin of linea01_tipo,
        employee like zemployees-employee,
        surname  like zemployees-surname,
        forename like zemployees-forename,
        title    like zemployees-title,
        dob      like zemployees-dob,
       end of linea01_tipo.
types: ti01_tipo type table of linea01_tipo.

data: ti_consulta00 type ti01_tipo,
      ti_wa        type line of ti01_tipo.

data: wa_layout type slis_layout_alv.

data ti_fieldcat type standard table of slis_fieldcat_alv.
data wa_fieldcat type slis_fieldcat_alv.

free: ti_fieldcat.

selection-screen begin of block bl with frame title text-001.

select-options: s_nomb for zemployees-employee.
select-options: s_apel for zemployees-surname.
select-options: s_edad for zemployees-forename.

parameters: grid radiobutton group grp2,
            list radiobutton group grp2.
selection-screen end of block bl.

at selection-screen.
   IF SY-SUBRC <> 0.
    message S001.
   ELSE.
    message S000.
    message S002.
   endif.
start-of-selection.