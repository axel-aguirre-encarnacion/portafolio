

/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= TRIGGERS DELETES =============



*/


use db_indumentaria;




drop trigger if exists SP_TRIGGER_after_delete_articulos;

drop trigger if exists SP_TRIGGER_after_delete_articulos_accesorios_detalles;

drop trigger if exists SP_TRIGGER_after_delete_articulos_calzados_detalles;

drop trigger if exists SP_TRIGGER_after_delete_articulos_ropa_detalles;

drop trigger if exists SP_TRIGGER_after_delete_clientes;

drop trigger if exists SP_TRIGGER_after_delete_facturas;

drop trigger if exists SP_TRIGGER_after_delete_facturas_detalles;




-- ============== PROCEDIMIENTO TRIGGER LOGS_DELETE ARTICULOS ACCESORIOS DETALLES===============

DELIMITER $$

create trigger SP_TRIGGER_after_delete_articulos_accesorios_detalles
	
	after delete on articulos_accesorios_detalles for each row

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
		
			 OLD.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS_ACCESORIOS_DETALLES'
			 ,'DELETE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;


-- Llamamos al procedimiento
call SP_delete_articulos_accesorios_detalles(5);




-- ============== PROCEDIMIENTO TRIGGER LOGS_DELETES ARTICULOS===============

DELIMITER $$

create trigger SP_TRIGGER_after_delete_articulos
	
	after delete on articulos for each row

	begin 
		
		insert into logs_deletes( 
		
				idRegistroTabla
				,UuidRegistroTabla
				,nombreTabla
				,campoTabla
				,accion
				,fechaHora
				,usuario
				,rolNivel
				,motorDB
				)
				
				
		values(
		
			 OLD.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS'
			 ,'DELETE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;







-- ============== PROCEDIMIENTO TRIGGER LOGS_DELETE ARTICULOS CALZADOS DETALLES===============

DELIMITER $$

create trigger SP_TRIGGER_after_delete_articulos_calzados_detalles
	
	after delete on articulos_calzados_detalles for each row

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
		
			 old.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS_CALZADO_DETALLES'
			 ,'DELETE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;


-- Llamamos al procedimiento
call SP_delete_articulos_calzados_detalles(5);



-- ============== PROCEDIMIENTO TRIGGER LOGS_DELETE CLIENTES ===============

DELIMITER $$

create trigger SP_TRIGGER_after_delete_clientes
	
	after delete on clientes for each row

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
		
			 old.id -- id del articulo
			 ,uuid() -- id unico
			 ,'CLIENTES'
			 ,'DELETE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_delete_clientes(9);



-- ============== PROCEDIMIENTO TRIGGER LOGS_DELETE FACTURAS DETALLES ===============

DELIMITER $$

create trigger SP_TRIGGER_after_delete_facturas_detalles
	
	after delete on facturas_detalles for each row

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
		
			 old.id -- id del articulo
			 ,uuid() -- id unico
			 ,'FACTURAS_DETALLES'
			 ,'DELETE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_delete_facturas_detalles(6);







