

/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= PROCEDURES DELETES =============


*/


use db_indumentaria;


drop table if exists logs_deletes;

drop procedure if exists SP_delete_log;

drop procedure if exists SP_delete_articulos;

drop procedure if exists SP_delete_articulos_accesorios_detalles;

drop procedure if exists SP_delete_articulos_calzados_detalles;

drop procedure if exists SP_delete_articulos_ropa_detalles;

drop procedure if exists SP_delete_clientes;

drop procedure if exists SP_delete_facturas;

drop procedure if exists SP_delete_facturas_detalles;

drop procedure if exists SP_procedures;







-- ==============  TABLA DE LOGS DELETES ===============


create table logs_deletes(

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





-- ==============  DELETE LOG ===============

DELIMITER $$

create procedure SP_delete_log(
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
		
		insert into logs_deletes( 
		
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






-- ============== ELIMINAR ARTICULOS ACCESORIOS DETALLES POR ID ===============

DELIMITER $$

create procedure SP_delete_articulos_accesorios_detalles(
	param_sp_id int
	
	)

begin
	
		delete from articulos_accesorios_detalles  where id = param_sp_id;

end

$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_delete_articulos_accesorios_detalles(4);



-- ========== LOG ARTICULO ACCESORIO DETALLES ELIMINADO POR PROCEDIMIENTO 01 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = null ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS_ACCESORIOS_DETALLES';
set @param_sp_accion = 'DELETE';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_delete_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);





-- ============== ELIMINAR ARTICULO POR ID ===============

DELIMITER $$

create procedure SP_delete_articulos(
	param_sp_id int

)


begin 
	
	delete from articulos  where id = param_sp_id;

end

$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_delete_articulos(11);




-- ========== LOG ARTICULO ELIMINADO POR PROCEDIMIENTO 01 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = null ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS';
set @param_sp_accion = 'DELETE';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_delete_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);










-- ============== ELIMINAR ARTICULOS CALZADOS DETALLES POR ID ===============

DELIMITER $$

create procedure SP_delete_articulos_calzados_detalles(
	param_sp_id int
	)


begin 
	
	delete from articulos_calzados_detalles  where id = param_sp_id;

end

$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_delete_articulos_calzados_detalles(4);



-- ========== LOG ARTICULO CALZADO DETALLES ELIMINADO POR PROCEDIMIENTO 01 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = null ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'ARTICULOS_CALZADOS_DETALLES';
set @param_sp_accion = 'DELETE';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_delete_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);






-- ============== ELIMINAR CLIENTES POR ID ===============

DELIMITER $$

create procedure SP_delete_clientes(
	param_sp_id int
	)


begin 
	
	delete from clientes  where id = param_sp_id;

end

$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_delete_clientes(8);




-- ========== LOG CLIENTE ELIMINADO POR PROCEDIMIENTO 01 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = null ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'CLIENTES';
set @param_sp_accion = 'DELETE';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_delete_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);






-- ============== ELIMINAR FACTURAS DETALLES POR ID ===============

DELIMITER $$

create procedure SP_delete_facturas_detalles(
	param_sp_id				int

	)



begin 
	
	delete from facturas_detalles  where id = param_sp_id;

end

$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_delete_facturas_detalles(5);

-- Llamamos al procedimiento
call SP_delete_facturas_detalles(7);



-- ========== LOG FACTURAS DETALLES ELIMINADO POR PROCEDIMIENTO 01 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = null ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'FACTURAS_DETALLES';
set @param_sp_accion = 'DELETE';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_delete_log(
	 @param_sp_idRegistroTabla
	 ,@param_sp_UuidRegistroTabla
	 ,@param_sp_nombreTabla
	 ,@param_sp_accion
	 ,@param_sp_fechaHora
	 ,@param_sp_usuario
	 ,@param_sp_rolNivel
	 ,@param_sp_motorDB
	);





-- ============== ELIMINAR FACTURAS POR ID===============


DELIMITER $$

create procedure SP_delete_facturas(
	param_sp_id	 int
	)

begin 
	
	delete from facturas  where id = param_sp_id;

end

$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_delete_facturas(5);



-- ========== LOG FACTURA ELIMINADA POR PROCEDIMIENTO 01 ==========

-- Seteamos los parametros a Ingresar
set @param_sp_idRegistroTabla = null ;-- id del articulo
set @param_sp_UuidRegistroTabla = uuid() ;-- id del articulo unico
set @param_sp_nombreTabla = 'FACTURAS';
set @param_sp_accion = 'DELETE';
set @param_sp_fechaHora = now();
set @param_sp_usuario = current_user() ;
set @param_sp_rolNivel = current_role(); 
set @param_sp_motorDB = version() ; 


-- Llamamos al procedimiento
call SP_delete_log(
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






