
/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= QUERIES UPDATE =============
*/





use db_indumentaria;



-- ============== UPDATE CLIENTES ===============

update clientes set 
	nombre = 'Carmen'
	, apellido = 'Juskick'
	, edad = 34
	, direccion = 'De los Marmines 334'
	,email = 'Carmenuyj8@hotmail.com'

	where id = 7;




-- ==============UPDATE ARTICULOS===============

update articulos set
	descripcion = 'Zapatillas Kiuplo'
	
	where id = 7;



-- ==============UPDATE FACTURA DETALLES===============

update facturas_detalles set
	tipo = 'A'
	
	where id = 4;




