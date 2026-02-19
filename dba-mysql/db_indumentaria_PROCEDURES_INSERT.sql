
/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= PROCEDURES INSERTS=============



*/



use db_indumentaria;

drop table if exists logs_inserts;

drop procedure if exists SP_insert_log;

drop procedure if exists SP_insert_articulos;

drop procedure if exists SP_insert_articulos_accesorios_detalles;

drop procedure if exists SP_insert_articulos_ropa_detalles;

drop procedure if exists SP_insert_articulos_calzados_detalles;

drop procedure if exists SP_insert_clientes;

drop procedure if exists SP_insert_facturas;

drop procedure if exists SP_insert_facturas_detalles;

drop procedure if exists SP_procedures;








-- ==============  TABLA DE LOGS INSERTS ===============


create table logs_inserts(

	id int auto_increment primary key,
	idRegistroTabla int,
	UuidRegistroTabla    varchar(60),
	nombreTabla varchar(40) not null,
	accion varchar(30) not null,
	fechaHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	usuario varchar(40),
	rolNivel 	varchar(40),
	motorDB 	varchar(40)
);





-- ==============  INSERTAR LOG ===============

DELIMITER $$

create procedure SP_insert_log(
			 param_sp_idRegistroTabla int
			,param_sp_UuidRegistroTabla varchar(60)
			,param_sp_nombreTabla varchar(60)
			,param_sp_accion varchar(30)
			,param_sp_fechaHora TIMESTAMP 
			,param_sp_usuario varchar(40)
			,param_sp_rolNivel	  varchar(40)
			,param_sp_motorDB	varchar(40)


)

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
		
			param_sp_idRegistroTabla 
			,param_sp_UuidRegistroTabla 
			,param_sp_nombreTabla
			,param_sp_accion 
			,param_sp_fechaHora  
			,param_sp_usuario 
			,param_sp_rolNivel
			,param_sp_motorDB
		
		);
	
	end




$$

DELIMITER ;




-- ============== INSERTAR ARTICULOS ===============

DELIMITER $$

create procedure SP_insert_articulos(
	 param_sp_categoria 		enum('CALZADO','ROPA','ACCESORIOS')
	,param_sp_descripcion	varchar(35)
	,param_sp_precio			double
	,param_sp_stock			int
	,param_sp_stockMinimo	int
	,param_sp_stockMaximo	int
	,param_sp_costo			double
)

begin 
	
	insert into articulos (
		categoria
		,descripcion
		,precio
		,stock
		,stockMinimo
		,stockMaximo
		,costo
		)
	values
		(
		param_sp_categoria
		,param_sp_descripcion
		,param_sp_precio
		,param_sp_stock
		,param_sp_stockMinimo
		,param_sp_stockMaximo
		,param_sp_costo
		);

end

$$

DELIMITER ;

-- === ARTICULO INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_categoria='ROPA';
set @param_sp_descripcion='Sweater Negro';
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




-- ========== LOG ARTICULOS INSERTADOS POR PROCEDIMIENTO 01 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);



-- === ARTICULO ACCESORIO  INSERTADO POR PROCEDIMIENTO 02 ===

-- Seteamos los parametros a Ingresar
set @param_sp_categoria='ACCESORIOS';
set @param_sp_descripcion='Reloj kuji';
set @param_sp_precio=5500.00;
set @param_sp_stock=20;
set @param_sp_stockMinimo=5;
set @param_sp_stockMaximo=30;
set @param_sp_costo=3100.00;


-- Llamamos al procedimiento
call SP_insert_articulos(
	@param_sp_categoria
	,@param_sp_descripcion
	,@param_sp_precio
	,@param_sp_stock
	,@param_sp_stockMinimo
	,@param_sp_stockMaximo
	,@param_sp_costo);




-- ========== LOG ARTICULOS ACCESORIO INSERTADOS POR PROCEDIMIENTO 02 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);





-- ============== INSERTAR ARTICULOS ACCESORIOS DETALLES ===============

DELIMITER $$

create procedure SP_insert_articulos_accesorios_detalles(
	 param_sp_idArticulo 		int
	,param_sp_tipo				varchar(25)
	,param_sp_color				varchar(25)
)

begin 
	
	insert into articulos_accesorios_detalles(
		idArticulo
		,tipo 
		,color 
		)
	values
		(
		param_sp_idArticulo
		,param_sp_tipo
		,param_sp_color
		);

end

$$

DELIMITER ;

-- === ARTICULO ACCESORIO DETALLE INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idArticulo=11;
set @param_sp_tipo='Reloj Kujiol';
set @param_sp_color='morado';


-- Llamamos al procedimiento
call SP_insert_articulos_accesorios_detalles(
	@param_sp_idArticulo
	,@param_sp_tipo
	,@param_sp_color);




-- ========== LOG ARTICULOS ACCESORIO DETALLE INSERTADOS POR PROCEDIMIENTO 01 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS_ACCESORIOS_DETALLES';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);







-- ============== INSERTAR ROPA DETALLES ===============

DELIMITER $$

create procedure SP_insert_articulos_ropa_detalles(
	 param_sp_idArticulo	int	
	,param_sp_tipo 			varchar(20)
	,param_sp_usabilidad	varchar(20)
	,param_sp_talle			varchar(4)
	,param_sp_temporada		enum('VERANO','INVIERNO')
	,param_sp_color			varchar(20)
)

begin 
	
	insert into articulos_ropa_detalles (
		idArticulo
		,tipo 
		,usabilidad 
		,talle 
		,temporada 
		,color 
		)
	values
		(
		 param_sp_idArticulo		
		,param_sp_tipo 			
		,param_sp_usabilidad	
		,param_sp_talle
		,param_sp_temporada
		,param_sp_color			
		);

end

$$

DELIMITER ;




-- === ARTICULO ACCESORIOS DETALLES INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idArticulo= 7 ;
set @param_sp_tipo='Abrigo';
set @param_sp_usabilidad='Formal';
set @param_sp_talle='S';
set @param_sp_temporada= 'INVIERNO';
set @param_sp_color= 'Negro';


-- Llamamos al procedimiento
call SP_insert_articulos_ropa_detalles(
	@param_sp_idArticulo
	,@param_sp_tipo
	,@param_sp_usabilidad
	,@param_sp_talle
	,@param_sp_temporada
	,@param_sp_color);



-- === LOG ARTICULO ROPA DETALLE INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla =last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS_ROPA_DETALLES';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);






-- === ARTICULO INSERTADO POR PROCEDIMIENTO 02 ===

-- Seteamos los parametros a Ingresar
set @param_sp_categoria='CALZADO';
set @param_sp_descripcion='Botas jukiock';
set @param_sp_precio=7500.00;
set @param_sp_stock=10;
set @param_sp_stockMinimo=2;
set @param_sp_stockMaximo=30;
set @param_sp_costo=3200.00;


-- Llamamos al procedimiento
call SP_insert_articulos(
	@param_sp_categoria
	,@param_sp_descripcion
	,@param_sp_precio
	,@param_sp_stock
	,@param_sp_stockMinimo
	,@param_sp_stockMaximo
	,@param_sp_costo);



-- === LOG ARTICULO INSERTADO POR PROCEDIMIENTO 02 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);





-- ============== INSERTAR ARTICULOS CALZADOS DETALLES ===============

DELIMITER $$

create procedure SP_insert_articulos_calzados_detalles(
	 param_sp_idArticulo	int	
	,param_sp_tipo 			varchar(20)
	,param_sp_usabilidad	varchar(20)
	,param_sp_numero		char(3)
	,param_sp_color			varchar(20)
)

begin 
	
	insert into articulos_calzados_detalles (
		idArticulo
		,tipo 
		,usabilidad 
		,numero 
		,color 
		)
	values
		(
		 param_sp_idArticulo		
		,param_sp_tipo 			
		,param_sp_usabilidad	
		,param_sp_numero
		,param_sp_color			
		);

end

$$

DELIMITER ;

-- === ARTICULO CALZADOS DETALLES INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idArticulo= 7 ;
set @param_sp_tipo='Zapatos';
set @param_sp_usabilidad='Formal';
set @param_sp_numero= 43;
set @param_sp_color= 'Negro';


-- Llamamos al procedimiento
call SP_insert_articulos_calzados_detalles(
	@param_sp_idArticulo
	,@param_sp_tipo
	,@param_sp_usabilidad
	,@param_sp_numero
	,@param_sp_color);



-- === LOG ARTICULO CALZADOS DETALLE INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla =last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS_CALZADOS_DETALLES';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);











-- ============== INSERTAR CLIENTES ===============

DELIMITER $$

create procedure SP_insert_clientes(
	 param_sp_nombre		varchar(20) 	
	,param_sp_apellido 		varchar(20)
	,param_sp_edad			int
	,param_sp_direccion		varchar(50)
	,param_sp_email			varchar(40)
	,param_sp_telefono		varchar(25)
	,param_sp_tipoDocumento enum('DNI','LIBRETA_CIVICA','LIBRETA_ENROLAMIENTO','PASAPORTE')
	,param_sp_numeroDocumento varchar(10)
)

begin 
	
	insert into clientes (
		nombre 
		,apellido 
		,edad 
		,direccion 
		,email 
		,telefono 
		,tipoDocumento 
		,numeroDocumento 
		)
	values
		(
		 param_sp_nombre		
		,param_sp_apellido
		,param_sp_edad
		,param_sp_direccion
		,param_sp_email
		,param_sp_telefono	
		,param_sp_tipoDocumento	
		,param_sp_numeroDocumento	
		);

end

$$

DELIMITER ;

-- === CLIENTE INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_nombre= 'Rafael' ;
set @param_sp_apellido='Galarza';
set @param_sp_edad= 35;
set @param_sp_direccion= 'San Vicente 30';
set @param_sp_email= 'rafaelGalarza2020@gmail.com';
set @param_sp_telefono= '56479878';
set @param_sp_tipoDocumento= 'DNI';
set @param_sp_numeroDocumento= '64789084';


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



-- === LOG CLIENTES INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'CLIENTES';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);




-- ============== INSERTAR FACTURAS ===============

DELIMITER $$

create procedure SP_insert_facturas(
	 param_sp_idCliente		int 	
	,param_sp_idArticulo	int
	,param_sp_precio		double
	,param_sp_cantidad		int
	
	)

begin 
	
	insert into facturas (
		idCliente 
		,idArticulo 
		,precio
		,cantidad 
		
		)
	values
		(
		 param_sp_idCliente		
		,param_sp_idArticulo
		,param_sp_precio
		,param_sp_cantidad	
		);

end

$$

DELIMITER ;




-- === FACTURA INSERTADA POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idCliente= 3 ;
set @param_sp_idArticulo= 3;
set @param_sp_precio= 4444;
set @param_sp_cantidad= 2;


-- Llamamos al procedimiento
call SP_insert_facturas(
	@param_sp_idCliente
	,@param_sp_idArticulo
	,@param_sp_precio
	,@param_sp_cantidad

	);


-- === LOG FACTURAS INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'FACTURAS';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);





-- ============== INSERTAR FACTURAS DETALLES ===============

DELIMITER $$

create procedure SP_insert_facturas_detalles(
	 param_sp_idFactura		int 	
	,param_sp_tipo			enum('A','B','C','E')
	,param_sp_numero		bigint
	,param_sp_fechaEmision	TIMESTAMP
	,param_sp_medioDePago	enum('EFECTIVO','CHEQUE','TARJETA')
	,param_sp_descripcion 	varchar(25)
	)

begin 
	
	insert into facturas_detalles (
		idFactura
		,tipo 
		,numero 
		,fechaEmision 
		,medioDePago 
		,descripcion 
		)
	values
		(
		 param_sp_idFactura		
		,param_sp_tipo
		,param_sp_numero
		,param_sp_fechaEmision
		,param_sp_medioDePago
		,param_sp_descripcion
		);

end

$$

DELIMITER ;

-- === FACTURA DETALLES INSERTADA POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idFactura= 5 ;
set @param_sp_tipo= 'C';
set @param_sp_numero= 8585749930392;
set @param_sp_fechaEmision= now();
set @param_sp_medioDePago= 'TARJETA';
set @param_sp_descripcion= 'Crédito';


-- Llamamos al procedimiento
call SP_insert_facturas_detalles(
	@param_sp_idFactura
	,@param_sp_tipo
	,@param_sp_numero
	,@param_sp_fechaEmision
	,@param_sp_medioDePago
	,@param_sp_descripcion
	);

-- === LOG FACTURAS DETALLES INSERTADO POR PROCEDIMIENTO 01 ===

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = last_insert_id() ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'FACTURAS_DETALLES';
set @param_sp_accion = 'INSERT';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_insert_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);




-- ============== PROCEDIMIENTOS SCHEMA ===============

DELIMITER $$

	create procedure SP_procedures()
	
	
    begin
	
	    SELECT * FROM INFORMATION_SCHEMA.routines where routine_schema='db_indumentaria';
    
    end

$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_procedures();







