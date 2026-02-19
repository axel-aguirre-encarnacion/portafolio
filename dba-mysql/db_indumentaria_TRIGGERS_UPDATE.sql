

/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= TRIGGERS UPDATES =============



*/


use db_indumentaria;




drop trigger if exists SP_TRIGGER_after_update_articulos;

drop trigger if exists SP_TRIGGER_after_update_articulos_accesorios_detalles;

drop trigger if exists SP_TRIGGER_after_update_articulos_calzados_detalles;

drop trigger if exists SP_TRIGGER_after_update_articulos_ropa_detalles;

drop trigger if exists SP_TRIGGER_after_update_clientes;

drop trigger if exists SP_TRIGGER_after_update_facturas;

drop trigger if exists SP_TRIGGER_after_update_facturas_detalles;





-- ============== PROCEDIMIENTO TRIGGER LOGS_UPDATES ARTICULOS===============

DELIMITER $$

create trigger SP_TRIGGER_after_update_articulos
	
	after update on articulos for each row

	begin 
		
		insert into logs_updates( 
		
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
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS'
			 ,'A ELECCION'
			 ,'UPDATE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;




call SP_update_articulos(9,'ACCESORIOS','Cartera Dackej', 6095, 24, 20, 400, 5800);



-- ============== PROCEDIMIENTO TRIGGER LOGS_UPDATES ARTICULOS ACCESORIOS DETALLES===============

DELIMITER $$

create trigger SP_TRIGGER_after_update_articulos_accesorios_detalles
	
	after update on articulos_accesorios_detalles for each row

	begin 
		
		insert into logs_updates( 
		
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
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS_ACCESORIOS_DETALLES'
			 ,'A ELECCION'
			 ,'UPDATE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;


-- Llamamos al procedimiento
call SP_update_articulos_accesorios_detalles(5, 13, 'Sombrero','Verde');




-- ============== PROCEDIMIENTO TRIGGER LOGS_UPDATES ARTICULOS ROPA DETALLES===============

DELIMITER $$

create trigger SP_TRIGGER_after_update_articulos_ropa_detalles
	
	after update on articulos_ropa_detalles for each row

	begin 
		
		insert into logs_updates( 
		
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
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'ARTICULOS_ROPA_DETALLES'
			 ,'A ELECCION'
			 ,'UPDATE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;


-- Llamamos al procedimiento
call SP_update_articulos_ropa_detalles(5, 14, 'Camiseta','Informa','M','VERANO','Azul');





-- ============== PROCEDIMIENTO TRIGGER LOGS_UPDATES CLIENTES ===============

DELIMITER $$

create trigger SP_TRIGGER_after_update_clientes
	
	after update on clientes for each row

	begin 
		
		insert into logs_updates( 
		
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
		
			 NEW.id -- id del articulo
			 ,uuid() -- id unico
			 ,'CLIENTES'
			 ,'A ELECCION'
			 ,'UPDATE'
			 ,now()
		 	 ,current_user()
			 ,current_role()
			 ,version()
		
		);
	
	end


$$

DELIMITER ;

-- Llamamos al procedimiento
call SP_update_clientes(7, 'Carmen', 'Kijuliok', 36, 'De Los Marmines 334'
		, 'Carmenuyj@hotmail.com', null, null, null);







