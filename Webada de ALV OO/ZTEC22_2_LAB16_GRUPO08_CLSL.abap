*&---------------------------------------------------------------------*
*& Include          ZTEC22_2_LAB16_GRUPO08_CLSL
*&---------------------------------------------------------------------*

CLASS G8_cls_alv_oo DEFINITION.

    PUBLIC SECTION.
  
      METHODS: get_data,
      show_alv,
      set_fieldcat.
  
  ENDCLASS.
  
  
  CLASS G8_cls_alv_oo IMPLEMENTATION.
      METHOD: get_data.
        SELECT * FROM ZTC_TCUSTOMER_CO
            INTO TABLE it_tcustomer
            WHERE lastname IN s_custnr AND peso IN s_pesonr AND unidadpeso IN s_unidnr AND firstname IN s_natnr AND address IN s_adtnr AND departamento IN s_deptnr AND ztienda IN s_zttnr.
      ENDMETHOD.
  
      METHOD: set_fieldcat.
          DATA wa_fcat TYPE lvc_s_fcat.
  
          clear wa_fcat.
          wa_fcat-fieldname = 'CUSTID'.
          wa_fcat-ref_field = 'CUSTID'.
          wa_fcat-coltext = 'CUSTID'.
          wa_fcat-ref_table = 'ZTC_TCUSTOMER_CO'.
          append wa_fcat to it_fcat.
  
          clear wa_fcat.
          wa_fcat-fieldname = 'LASTNAME'.
          wa_fcat-ref_field = 'LASTNAME'.
          wa_fcat-coltext = 'Apellidos'.
          wa_fcat-ref_table = 'ZTC_TCUSTOMER_CO'.
          append wa_fcat to it_fcat.
  
          clear wa_fcat.
          wa_fcat-fieldname = 'FIRSTNAME'.
          wa_fcat-ref_field = 'FIRSTNAME'.
          wa_fcat-coltext = 'Nombre'.
          wa_fcat-ref_table = 'ZTC_TCUSTOMER_CO'.
          append wa_fcat to it_fcat.
  
          clear wa_fcat.
          wa_fcat-fieldname = 'ADDRESS'.
          wa_fcat-ref_field = 'ADDRESS'.
          wa_fcat-coltext = 'Direccion'.
          wa_fcat-ref_table = 'ZTC_TCUSTOMER_CO'.
          append wa_fcat to it_fcat.
  
          clear wa_fcat.
          wa_fcat-fieldname = 'PESO'.
          wa_fcat-ref_field = 'PESO'.
          wa_fcat-coltext = 'Peso'.
          wa_fcat-ref_table = 'ZTC_TCUSTOMER_CO'.
          append wa_fcat to it_fcat.
  
          clear wa_fcat.
          wa_fcat-fieldname = 'DEPARTAMENTO'.
          wa_fcat-ref_field = 'DEPARTAMENTO'.
          wa_fcat-coltext = 'Departamento'.
          wa_fcat-ref_table = 'ZTC_TCUSTOMER_CO'.
          append wa_fcat to it_fcat.
  
          clear wa_fcat.
          wa_fcat-fieldname = 'UNIDADPESO'.
          wa_fcat-ref_field = 'UNIDADPESO'.
          wa_fcat-coltext = 'Unidad de peso'.
          wa_fcat-ref_table = 'ZTC_TCUSTOMER_CO'.
          append wa_fcat to it_fcat.
  
          clear wa_fcat.
          wa_fcat-fieldname = 'ZTIENDA'.
          wa_fcat-ref_field = 'ZTIENDA'.
          wa_fcat-coltext = 'Tienda'.
          wa_fcat-ref_table = 'ZTC_TCUSTOMER_CO'.
          append wa_fcat to it_fcat.
      ENDMETHOD.
  
      METHOD: show_alv.
          IF vg_container IS NOT BOUND.
              CREATE OBJECT vg_container
                  EXPORTING
                      container_name = 'Z_22_2_LAB16_CC_ALV_G08'.
              CREATE OBJECT obj_alv_grid
                  EXPORTING
                      i_parent = vg_container.
              CALL METHOD set_fieldcat.
  
              CALL METHOD obj_alv_grid->set_table_for_first_display
                  CHANGING
                      it_fieldcatalog = it_fcat
                      it_outtab       = it_tcustomer.
          ELSE.
              CALL METHOD obj_alv_grid->refresh_table_display.
          ENDIF.
  
      ENDMETHOD.
  ENDCLASS.