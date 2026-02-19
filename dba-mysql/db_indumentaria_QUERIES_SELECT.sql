
/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= QUERIES SELECT =============
*/





use db_indumentaria;



-- tablas de la db
show tables;


-- descripcion d c/u de las tablas
describe articulos ;
describe articulos_accesorios_detalles ;
describe articulos_calzados_detalles ;
describe articulos_ropa_detalles ;
describe clientes ;
describe facturas ;
describe facturas_detalles ;


-- todos los campos de tablas
select * from articulos ;
select * from articulos_accesorios_detalles ;
select * from articulos_calzados_detalles ;
select * from articulos_ropa_detalles ;
select * from clientes ;
select * from facturas ;
select * from facturas_detalles ;

-- ids de c/tabla
select id from articulos ;
select id from articulos_accesorios_detalles ;
select id from articulos_calzados_detalles ;
select id from articulos_ropa_detalles ;
select id from clientes ;
select id from facturas ;
select id from facturas_detalles ;


-- numero de registros por tabla
select count(*) from articulos ;
select count(*) from articulos_accesorios_detalles ;
select count(*) from articulos_calzados_detalles ;
select count(*) from articulos_ropa_detalles ;
select count(*) from clientes ;
select count(*) from facturas ;
select count(*) from facturas_detalles ;


-- ordenaciones por tabla
select id, precio from articulos group by precio;
select id, tipo from articulos_accesorios_detalles   group by tipo ;
select id, numero from articulos_calzados_detalles  group by numero ;
select id, tipo from articulos_ropa_detalles  group by tipo;


-- relaciones de tablas
-- Articulos de Categoría Ropa
select articulos.id, articulos_ropa_detalles.* from articulos
join articulos_ropa_detalles 
on articulos.id = articulos_ropa_detalles.idArticulo;




-- relaciones de tablas
-- Articulos de Categoría Accesorios
select articulos.id, articulos_accesorios_detalles.* from articulos
join articulos_accesorios_detalles 
on articulos.id = articulos_accesorios_detalles.idArticulo;


-- relaciones de tablas
-- Articulos de Categoría Calzados
select articulos.id, articulos_calzados_detalles.* from articulos
join articulos_calzados_detalles 
on articulos.id = articulos_calzados_detalles.idArticulo;




