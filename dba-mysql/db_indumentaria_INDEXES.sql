
/*
----------------------------
-- Tienda de Indumentaria---
----------------------------

========= INDEXES =============
*/



use db_indumentaria;



-- ============== INDICES CLIENTES ==============


-- Indice Clientes
create index INDEX_clientesApellidoNombre on clientes(apellido,nombre);


-- Consulta Indice Clientes
show index from clientes;


-- Eliminacion Indice Clientes
-- drop index INDEX_clientesApellidoNombre on clientes;
