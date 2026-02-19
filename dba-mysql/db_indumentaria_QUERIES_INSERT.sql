
/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= QUERIES INSERT =============
*/





use db_indumentaria;



-- ==============INSERT CLIENTES===============

insert into clientes (nombre,apellido,edad,direccion,email,telefono,tipoDocumento,numeroDocumento) values 

	('Rondilli','Montes',28,'San Sarasa 339','asdasddasd@gmail.com',null,null,null),
	('asdasdad','asdads',33,'asasas 344','asdadada@hotmail.com',null,null,null);



-- ==============INSERT ARTICULOS===============

insert into articulos (categoria,descripcion,precio,stock,stockMinimo,stockMaximo,costo) values
	('CALZADO','ASAAS',1500.00, 21, 20, 20, 2100.00),
	('ROPA','ASASAS',3800.00, 19, 55, 40, 3100.00),
	('ACCESORIOS','DFGDGDG',5300.00, 24, 20, 400, 5800.00);


-- ==============INSERT ARTICULOS ROPA===============

insert into articulos_ropa_detalles (idArticulo,tipo,usabilidad,talle,color,temporada) values 
	(8, 'Abrigo', 'Vestir/Formal', 'M', 'Blanco', 'INVIERNO');


-- ==============INSERT ARTICULOS CALZADOS===============

insert into articulos_calzados_detalles (idArticulo,tipo,usabilidad,numero,color) values 
	(7, 'Zapatos', 'Vestir/Formal', 43,'Negro Mate');


-- ==============INSERT ARTICULOS DETALLES===============

insert into articulos_accesorios_detalles (idArticulo,tipo,color) values 
	(9, 'Sombrero', 'Blanco/Morado');




-- ==============INSERT FACTURAS===============

insert into facturas (idCliente, idArticulo, precio, cantidad) values 
	
	(6, 9, 5000.0, 1),
	(5, 8, 7600.0, 2);



-- ==============INSERT FACTURAS DETALLES===============

insert into facturas_detalles (idFactura, tipo, numero, fechaEmision, medioDePago, descripcion) values 
	(3,'B',6763028302,now(),'TARJETA','Crédito'),
	(4,'B',76764999033,now(),'EFECTIVO','En un Solo Pago');




