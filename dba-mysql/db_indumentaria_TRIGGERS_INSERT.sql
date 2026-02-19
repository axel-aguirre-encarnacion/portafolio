

/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= TRIGGERS INSERTS =============



*/


use db_indumentaria;




drop trigger if exists SP_TRIGGER_after_insert_articulos;

drop trigger if exists SP_TRIGGER_after_insert_articulos_accesorios_detalles;

drop trigger if exists SP_TRIGGER_after_insert_articulos_calzados_detalles;

drop trigger if exists SP_TRIGGER_after_insert_articulos_ropa_detalles;

drop trigger if exists SP_TRIGGER_after_insert_clientes;

drop trigger if exists SP_TRIGGER_after_insert_facturas;

drop trigger if exists SP_TRIGGER_after_insert_facturas_detalles;






-- ============== PROCEDIMIENTO TRIGGER LOGS_INSERTS ARTICULOS===============

DELIMITER $$

create trigger SP_TRIGGER_after_insert_articulos
	
	after insert on articulos for each row

	begin 
		
		insert into logs_inserts( 
		
				idRegistroTabla
				,UuidRegistroTabla
				,nombreTabla
				,accion
				,fechaHora
				,usuario
				,rolNivel
				,motorDB
				)
				
				
		values(
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS'
			 ,'INSERT'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;







-- === ARTICULO INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_categoria='ACCESORIOS';
set @param_sp_descripcion='SOMBRERO KICLO';
set @param_sp_precio=3500.00;
set @param_sp_stock=10;
set @param_sp_stockMinimo=4;
set @param_sp_stockMaximo=10;
set @param_sp_costo=2100.00;


-- Llamamos al procedimiento
call SP_insert_articulos(
	@param_sp_categoria
	,@param_sp_descripcion
	,@param_sp_precio
	,@param_sp_stock
	,@param_sp_stockMinimo
	,@param_sp_stockMaximo
	,@param_sp_costo);




-- ============== PROCEDIMIENTO TRIGGER LOGS_INSERTS ARTICULOS ACCESORIOS DETALLES===============

DELIMITER $$

create trigger SP_TRIGGER_after_insert_articulos_accesorios_detalles
	
	after insert on articulos_accesorios_detalles for each row

	begin 
		
		insert into logs_inserts( 
		
				idRegistroTabla
				,UuidRegistroTabla
				,nombreTabla
				,accion
				,fechaHora
				,usuario
				,rolNivel
				,motorDB
				)
				
				
		values(
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS_ACCESORIOS_DETALLES'
			 ,'INSERT'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;








-- === ARTICULO ACCESORIO DETALLE INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idArticulo=13;
set @param_sp_tipo='Sombrero';
set @param_sp_color='Azul/Verde';


-- Llamamos al procedimiento
call SP_insert_articulos_accesorios_detalles(
	@param_sp_idArticulo
	,@param_sp_tipo
	,@param_sp_color);







-- ============== PROCEDIMIENTO TRIGGER LOGS_INSERTS ARTICULOS ROPA DETALLES===============

DELIMITER $$

create trigger SP_TRIGGER_after_insert_articulos_ropa_detalles
	
	after insert on articulos_ropa_detalles for each row

	begin 
		
		insert into logs_inserts( 
		
				idRegistroTabla
				,UuidRegistroTabla
				,nombreTabla
				,accion
				,fechaHora
				,usuario
				,rolNivel
				,motorDB
				)
				
				
		values(
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS_ROPA_DETALLES'
			 ,'INSERT'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;



-- === ARTICULO INSERTADO POR PROCEDIMIENTO 02 ===

-- Seteamos los parametros a Ingresar
set @param_sp_categoria='ROPA';
set @param_sp_descripcion='Musculosa Verano';
set @param_sp_precio=2300.00;
set @param_sp_stock=10;
set @param_sp_stockMinimo=10;
set @param_sp_stockMaximo=30;
set @param_sp_costo=100.00;


-- Llamamos al procedimiento
call SP_insert_articulos(
	@param_sp_categoria
	,@param_sp_descripcion
	,@param_sp_precio
	,@param_sp_stock
	,@param_sp_stockMinimo
	,@param_sp_stockMaximo
	,@param_sp_costo);





-- === ARTICULO ROPA DETALLES INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idArticulo= 14 ;
set @param_sp_tipo='Camiseta';
set @param_sp_usabilidad='Informal';
set @param_sp_talle='M';
set @param_sp_temporada= 'VERANO';
set @param_sp_color= 'Celeste';


-- Llamamos al procedimiento
call SP_insert_articulos_ropa_detalles(
	@param_sp_idArticulo
	,@param_sp_tipo
	,@param_sp_usabilidad
	,@param_sp_talle
	,@param_sp_temporada
	,@param_sp_color);





-- ============== PROCEDIMIENTO TRIGGER LOGS_INSERTS ARTICULOS CALZADO DETALLES===============

DELIMITER $$

create trigger SP_TRIGGER_after_insert_articulos_calzados_detalles
	
	after insert on articulos_calzados_detalles for each row

	begin 
		
		insert into logs_inserts( 
		
				idRegistroTabla
				,UuidRegistroTabla
				,nombreTabla
				,accion
				,fechaHora
				,usuario
				,rolNivel
				,motorDB
				)
				
				
		values(
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS_CALZADOS_DETALLES'
			 ,'INSERT'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;



-- === ARTICULO INSERTADO POR PROCEDIMIENTO 03 ===

-- Seteamos los parametros a Ingresar
set @param_sp_categoria='CALZADO';
set @param_sp_descripcion='Sandalias Strabick';
set @param_sp_precio=3200.00;
set @param_sp_stock=10;
set @param_sp_stockMinimo=20;
set @param_sp_stockMaximo=50;
set @param_sp_costo=1100.00;


-- Llamamos al procedimiento
call SP_insert_articulos(
	@param_sp_categoria
	,@param_sp_descripcion
	,@param_sp_precio
	,@param_sp_stock
	,@param_sp_stockMinimo
	,@param_sp_stockMaximo
	,@param_sp_costo);





-- === ARTICULO CALZADOS DETALLES INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idArticulo= 15 ;
set @param_sp_tipo='Calzado Ligero';
set @param_sp_usabilidad='Informal';
set @param_sp_numero=49;
set @param_sp_color= 'Gris';


-- Llamamos al procedimiento
call SP_insert_articulos_calzados_detalles(
	@param_sp_idArticulo
	,@param_sp_tipo
	,@param_sp_usabilidad
	,@param_sp_numero
	,@param_sp_color);




-- ============== PROCEDIMIENTO TRIGGER LOGS_INSERTS CLIENTES ===============

DELIMITER $$

create trigger SP_TRIGGER_after_insert_clientes
	
	after insert on clientes for each row

	begin 
		
		insert into logs_inserts( 
		
				idRegistroTabla
				,UuidRegistroTabla
				,nombreTabla
				,accion
				,fechaHora
				,usuario
				,rolNivel
				,motorDB
				)
				
				
		values(
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'CLIENTES'
			 ,'INSERT'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;



-- === CLIENTE INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_nombre= 'Macarena' ;
set @param_sp_apellido='Bustos';
set @param_sp_edad= 45;
set @param_sp_direccion= 'Las Carmelias 70';
set @param_sp_email= 'macarenaBustos@gmail.com';
set @param_sp_telefono= null ;
set @param_sp_tipoDocumento= null ;
set @param_sp_numeroDocumento= null ;


-- Llamamos al procedimiento
call SP_insert_clientes(
	@param_sp_nombre
	,@param_sp_apellido
	,@param_sp_edad
	,@param_sp_direccion
	,@param_sp_email
	,@param_sp_telefono
	,@param_sp_tipoDocumento
	,@param_sp_numeroDocumento);



-- ============== PROCEDIMIENTO TRIGGER LOGS_INSERTS FACTURAS ===============

DELIMITER $$

create trigger SP_TRIGGER_after_facturas
	
	after insert on facturas for each row

	begin 
		
		insert into logs_inserts( 
		
				idRegistroTabla
				,UuidRegistroTabla
				,nombreTabla
				,accion
				,fechaHora
				,usuario
				,rolNivel
				,motorDB
				)
				
				
		values(
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'FACTURAS'
			 ,'INSERT'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;




-- === FACTURA INSERTADA POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idCliente= 6 ;
set @param_sp_idArticulo= 7;
set @param_sp_precio= 3000;
set @param_sp_cantidad= 2;


-- Llamamos al procedimiento
call SP_insert_facturas(
	@param_sp_idCliente
	,@param_sp_idArticulo
	,@param_sp_precio
	,@param_sp_cantidad

	);



-- ============== PROCEDIMIENTO TRIGGER LOGS_INSERTS FACTURAS_DETALLES ===============

DELIMITER $$

create trigger SP_TRIGGER_after_facturas_detalles
	
	after insert on facturas_detalles for each row

	begin 
		
		insert into logs_inserts( 
		
				idRegistroTabla
				,UuidRegistroTabla
				,nombreTabla
				,accion
				,fechaHora
				,usuario
				,rolNivel
				,motorDB
				)
				
				
		values(
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'FACTURAS_DETALLES'
			 ,'INSERT'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;
 

-- === FACTURA DETALLES INSERTADA POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idFactura= 6 ;
set @param_sp_tipo= 'B';
set @param_sp_numero= 74749930392;
set @param_sp_fechaEmision= now();
set @param_sp_medioDePago= 'EFECTIVO';
set @param_sp_descripcion= 'En 2 pagos';


-- Llamamos al procedimiento
call SP_insert_facturas_detalles(
	@param_sp_idFactura
	,@param_sp_tipo
	,@param_sp_numero
	,@param_sp_fechaEmision
	,@param_sp_medioDePago
	,@param_sp_descripcion
	);