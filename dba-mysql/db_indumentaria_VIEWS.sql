

/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= VIEWS =============


*/

 use db_indumentaria;

 

 drop view if exists VIEW_clientes;

 drop view if exists VIEW_articulos;

 drop view if exists VIEW_articulos_detalles; 

drop view if exists VIEW_articulos_reposicion; 

 drop view if exists VIEW_articulos_accesorios_detalles;

 drop view if exists VIEW_articulos_calzados_detalles;
 
 drop view if exists VIEW_articulos_accesorios_almacen;
 
 drop view if exists VIEW_articulos_calzados_almacen;
 
 drop view if exists VIEW_articulos_ropa_detalles;

 drop view if exists VIEW_articulos_ropa_almacen;

 drop view if exists VIEW_facturas;

 drop view if exists VIEW_facturas_detalles;






-- ============== VISTAS CLIENTES ===============


--  Vista Clientes
create view VIEW_clientes 
	as select id,nombre,apellido,email,telefono 
	from clientes;


-- Consulta Vistas
-- select * from information_schema.VIEWS where TABLE_SCHEMA='db_indumentaria';



-- Borrar Vista Clientes
-- drop view VIEW_clientes;





-- ============== VISTAS ARTICULOS ===============


--  Vista Articulos
create view VIEW_articulos 

	as select id,categoria,descripcion,precio 

	from articulos;
	


-- Vista Articulos Detalles
create view VIEW_articulos_detalles 

	as select articulos.id, articulos.categoria,  articulos.descripcion
	, articulos.precio, articulos.stock, articulos.stockMinimo
	, articulos.stockMaximo, articulos.costo  
	
	from articulos;


-- Vista Articulos Reposición
create view VIEW_articulos_reposicion 

	as select id, descripcion from articulos where stockMinimo < 0;



-- Consulta Vistas
-- select * from information_schema.VIEWS where TABLE_SCHEMA='db_indumentaria';



-- Borrar Vista Articulos
-- drop view VIEW_articulos;

-- Borrar Vista Articulos Detalles
-- drop view VIEW_articulos_detalles;

-- Borrar Vista Articulos Reposicion
-- drop view VIEW_articulos_reposicion;




-- ============== VISTAS ACCESORIOS ===============


--  Vista Articulos Accesorios Detalles
create view VIEW_articulos_accesorios_detalles 

	as select articulos.id, articulos.descripcion, articulos.precio
	, articulos_accesorios_detalles.tipo, articulos_accesorios_detalles.color  
	
	from articulos
	
	inner join articulos_accesorios_detalles
	
	on articulos.id = articulos_accesorios_detalles.idArticulo;



--  Vista Articulos Accesorios Almacen
create view VIEW_articulos_accesorios_almacen 

	as select articulos.id, articulos.descripcion, articulos.precio
	, articulos.stock, articulos.stockMinimo, articulos.stockMaximo, articulos.costo 
	, articulos_accesorios_detalles.tipo
	
	from articulos
	
	inner join articulos_accesorios_detalles
	
	on articulos.id = articulos_accesorios_detalles.idArticulo;


-- Consulta Vistas
-- select * from information_schema.VIEWS where TABLE_SCHEMA='db_indumentaria';



-- Borrar Vista Articulos Accesorios Detalles
-- drop view VIEW_articulos_accesorios_detalles;

-- Borrar Vista Articulos Accesorios Almacen
-- drop view VIEW_articulos_accesorios_almacen;





-- ============== VISTAS CALZADOS  ===============


--  Vista Articulos Calzados Detalles
create view VIEW_articulos_calzados_detalles 

	as select articulos.id, articulos.descripcion, articulos.precio
	, articulos_calzados_detalles.tipo, articulos_calzados_detalles.usabilidad
	, articulos_calzados_detalles.numero , articulos_calzados_detalles.color 
	
	from articulos
	
	inner join articulos_calzados_detalles
	
	on articulos.id = articulos_calzados_detalles.idArticulo;



--  Vista Articulos Calzados Almacen
create view VIEW_articulos_calzados_almacen 

	as select articulos.id, articulos.descripcion, articulos.precio
	, articulos.stock, articulos.stockMinimo, articulos.stockMaximo, articulos.costo 
	, articulos_calzados_detalles.tipo, articulos_calzados_detalles.numero 
	
	from articulos
	
	inner join articulos_calzados_detalles
	
	on articulos.id = articulos_calzados_detalles.idArticulo;



-- Consulta Vistas
-- select * from information_schema.VIEWS where TABLE_SCHEMA='db_indumentaria';



-- Borrar Vista Articulos Calzados Detalles
-- drop view VIEW_articulos_calzados_detalles;

-- Borrar Vista Articulos Calzados Detalles
-- drop view VIEW_articulos_calzados_almacen;





-- ============== VISTAS ROPA  ===============


--  Vista Articulos Ropa Detalles
create view VIEW_articulos_ropa_detalles 

	as select articulos.id, articulos.descripcion, articulos.precio
	, articulos_ropa_detalles.tipo, articulos_ropa_detalles.usabilidad
	, articulos_ropa_detalles.talle , articulos_ropa_detalles.temporada 
	, articulos_ropa_detalles.color 
	
	from articulos
	
	inner join articulos_ropa_detalles
	
	on articulos.id = articulos_ropa_detalles.idArticulo;



--  Vista Articulos Ropa Almacen
create view VIEW_articulos_ropa_almacen 

	as select articulos.id, articulos.descripcion, articulos.precio
	, articulos.stock, articulos.stockMinimo, articulos.stockMaximo, articulos.costo 
	, articulos_ropa_detalles.tipo, articulos_ropa_detalles.talle 
	
	from articulos
	
	inner join articulos_ropa_detalles
	
	on articulos.id = articulos_ropa_detalles.idArticulo;



-- Consulta Vistas
-- select * from information_schema.VIEWS where TABLE_SCHEMA='db_indumentaria';



-- Borrar Vista Articulos Ropa Detalles
-- drop view VIEW_articulos_ropa_detalles;

-- Borrar Vista Articulos Ropa Detalles
-- drop view VIEW_articulos_ropa_almacen;





-- ============== VISTAS FACTURAS  ===============


--  Vista Facturas
create view VIEW_facturas 

	as select facturas.id, facturas.precio, facturas.cantidad 
	, clientes.nombre , clientes.apellido, clientes.email, clientes.telefono 
	, articulos.categoria , articulos.descripcion
	
	from facturas
	
	inner join clientes on facturas.idCliente = clientes.id
	
	inner join articulos on facturas.idArticulo = articulos.id;


--  Vista Facturas Detalles
create view VIEW_facturas_detalles 

	as select facturas.id, facturas.precio, facturas.cantidad 
	, clientes.nombre , clientes.apellido, clientes.email, clientes.telefono 
	, articulos.categoria, articulos.descripcion descripcionArticulo
	, facturas_detalles.tipo tipoFactura, facturas_detalles.numero numeroFactura
	, facturas_detalles.fechaEmision , facturas_detalles.medioDePago
	, facturas_detalles.descripcion descripcionFactura 
	
	from facturas
	
	inner join clientes on facturas.idCliente = clientes.id
	
	inner join articulos on facturas.idArticulo = articulos.id

	inner join facturas_detalles on facturas.id = facturas_detalles.idFactura ;



-- Consulta Vistas
-- select * from information_schema.VIEWS where TABLE_SCHEMA='db_indumentaria';




-- Borrar Vista Facturas
-- drop view VIEW_facturas;

-- Borrar Vista Facturas Detalles
-- drop view VIEW_facturas_detalles;


