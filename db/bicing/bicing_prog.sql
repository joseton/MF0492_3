-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2


    -- TRIGGERS:
    -- Añadir 3 TRIGGERS en las tablas de la base de datos explicando con
--comentarios el funcionamiento de los mismos.
use bicing;

SET FOREIGN_KEY_CHECKS = 0;  -- quita error 1451
SET SQL_SAFE_UPDATES = 0;  -- quita error 1175

-- Triger #1  Si borramos un usuario, tambíen tendremos que borrar el historial de facturas relacionadas.
drop trigger if exists delete_factura;
delimiter $$
create trigger delete_factura after delete
on usuarios for each row
begin
	delete from facturas where usuario = old.dni;

end $$
delimiter ;

-- comprobación
select * from usuarios;
select * from facturas;
delete from usuarios where dni = "53118274P";

                        -- ********** --



    -- Añadir 1 CURSOR en un "procedure" en la base de datos explicando
--con comentarios el funcionamiento del mismo.



    -- Añadir 1 EVENTO en la base de datos explicando con comentarios el
--funcionamiento del mismo.





-- Final TODO Challenge 2
