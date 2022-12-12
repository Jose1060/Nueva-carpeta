*&---------------------------------------------------------------------*
*& Report Z_TEC_22_2_LAB13_JMAMANI_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_TEC_22_2_LAB13_JMAMANI_02.

*--------------------------------------------------------------*
*Data Types
*--------------------------------------------------------------*
TYPES: BEGIN OF ty_product,
       id(5)    TYPE n,
       name(10) TYPE c,
       description(35) TYPE c,
       price(5) TYPE n,
       END OF ty_product.

*--------------------------------------------------------------*
*Data Declaration
*--------------------------------------------------------------*
DATA: gwa_prod TYPE ty_product.
DATA: it TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id.

gwa_prod-id  = 0.
gwa_prod-name  = 'LOGITECH G203'.
gwa_prod-description  = 'MOUSE INHABLAMBRICO CON PILAS'.
gwa_prod-price = 200.
INSERT gwa_prod INTO TABLE it.

gwa_prod-id  = 1.
gwa_prod-name  = 'LOGITECH G305'.
gwa_prod-description  = 'MOUSE INHABLAMBRICO'.
gwa_prod-price = 300.
INSERT gwa_prod INTO TABLE it.

gwa_prod-id  = 3.
gwa_prod-name  = 'LOGITECH G502'.
gwa_prod-description  = 'MOUSE INHABLAMBRICO CON PAD CARGABLE'.
gwa_prod-price = 600.
INSERT gwa_prod INTO TABLE it.

WRITE:/ 'ID' COLOR 5,7 'Name' COLOR 5 ,18 'description' COLOR 2, 54 'price' COLOR 2.
LOOP AT it INTO gwa_prod.
  WRITE:/ gwa_prod-id, gwa_prod-name, gwa_prod-description, gwa_prod-price.
ENDLOOP.

SKIP.
WRITE:/ 'Despues de añadir un nuevo elemento con indice' COLOR 4.

gwa_prod-id  = 2.
gwa_prod-name  = 'G508'.
gwa_prod-description  = 'Audifonos'.
gwa_prod-price = 600.
INSERT gwa_prod INTO TABLE it .

WRITE:/ 'ID' COLOR 5,7 'Name' COLOR 5 ,18 'description' COLOR 2, 54 'price' COLOR 2.
LOOP AT it INTO gwa_prod.
  WRITE:/ gwa_prod-id, gwa_prod-name, gwa_prod-description, gwa_prod-price.
ENDLOOP.

SKIP.
WRITE:/ 'Editando campos' COLOR 4.

clear gwa_prod.
gwa_prod-id  = 2.
gwa_prod-name  = 'Editado'.
gwa_prod-description  = 'Editado'.
gwa_prod-price = 900.

MODIFY it FROM gwa_prod INDEX 2 TRANSPORTING: name, description, price.



WRITE:/ 'ID' COLOR 5,7 'Name' COLOR 5 ,18 'description' COLOR 2, 54 'price' COLOR 2.
LOOP AT it INTO gwa_prod.
  WRITE:/ gwa_prod-id, gwa_prod-name, gwa_prod-description, gwa_prod-price.
ENDLOOP.