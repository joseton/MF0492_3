-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2
use bicing;
SET FOREIGN_KEY_CHECKS = 0;  -- eliminar error 1451
SET SQL_SAFE_UPDATES = 0;  -- eliminar error 1175

-- TRIGGER 1. Si una bici está averiada, la enviamos al taller.
-- El triguer detecta un UPDATE de alguna bici como averiada
drop trigger if exists bici_averiada_AU;
delimiter //
create trigger bici_averiada_AU after update
on bicicletas for each row
begin
	if new.averiado = true then -- si se detecta una bici como "averiada"
		delete from salida_bici where id_bici = old.id_bici; -- sacamos la bici averiada del punto bicing en el que se encuentre
        insert into entrada_bici values (null,"V111",1,default,4,true); -- ingresamos la bici averiada al taller
        update puntos set bici_actual = bici_actual + 1 where taller = true; -- actualizamos el registro de bicicletas del taller
	end if;
end //

delimiter ;
-- comprobación. Hacemos el update de estado averiado de la bicicleta con id 1
update bicicletas set averiado = true where id_bici = 1;

select * from bicicletas; -- comprobamos en la tabla de bicicletas el estado averiado de la bici con id 1
select * from salida_bici; -- comprobamos que la bicicleta con id_bici 1 se elimina
select * from entrada_bici; -- comprobamos el registro de entrada de la id_bici 1 al taller. Un furgón (id_furgon hace el ingreso de la bici)
select * from puntos; -- comprobamos que en el taller (punto Sants, con id_punto 4), donde no habían bicicletas, se ha ingresado una bici

-- TRIGGER 2. Si un Punto Bicing alcanza su capacidad máxima, se envía un camión a retirar 3 bicicletas.
-- El triguer detecta un UPDATE del campo "bici_actual"
drop trigger if exists punto_full_AU;
delimiter //
create trigger punto_full_AU after update
on puntos for each row
begin
	if new.bici_actual = 10 then -- se detecta que un Punto Bicing tiene 10 bicicletas (su capacidad máxima)
		insert into salida_bici values (null,"V111",null,default,5,false); -- enviamos un camión de la empresa para que retire 3 bicis del punto, quedando 7 bicis, que es el promedio de stock en cada punto
        insert into salida_bici values (null,"V111",null,default,5,false);
        insert into salida_bici values (null,"V111",null,default,5,false);
    end if;
end //

delimiter ;
-- comprobación. Hacemos el update de la cantidad de bicicletas en un punto Bicing de Gracia, sumando 1 bici, con lo cual se alcanza su capacidad máxima
update puntos set bici_actual = bici_actual + 1 where id_punto = 5;

-- Puesto que como acción del Trigger se retiraron 3 bicis, actualizamos el registro de bicis actuales del Punto:
update puntos set bici_actual = bici_actual - 3 where id_punto = 5;
-- Esta última acción podría ser parte del Trigger (aplicándose sobre "old.bici_actual", para que automáticamente
-- se actualizara el número de bicis después del retiro de 3), pero fue rechazada porque, al constituir otro update
-- en la misma tabla, se generaba un bucle infinito

select * from salida_bici; -- comprobamos que se haya hecho el retiro de tres bicicletas por parte del camión
select * from puntos; -- comprobamos la cantidad de bicis del Punto


-- TRIGGER 3. Si un Punto Bicing se vacía (el #1 de Gracia en este caso), sacamos 7 bicicletas del Almacén y las enviamos al Punto
-- El triguer detecta un UPDATE del campo "bici_actual" en la tabla Puntos
drop trigger if exists punto_vacío_AU;
delimiter //
create trigger punto_vacío_AU after update
on puntos for each row
begin
	if new.bici_actual = 0 then -- si se detecta que un Punto Bicing no tiene bicicletas
		insert into salida_bici values (null,"V222",null,default,6,false); -- Un camión retira 7 bicis del Almacén
        insert into salida_bici values (null,"V222",null,default,6,false);
        insert into salida_bici values (null,"V222",null,default,6,false);
        insert into salida_bici values (null,"V222",null,default,6,false);
        insert into salida_bici values (null,"V222",null,default,6,false);
        insert into salida_bici values (null,"V222",null,default,6,false);
        insert into salida_bici values (null,"V222",null,default,6,false);
        insert into entrada_bici values (null,"V222",null,default,1,false); -- El camión ingresa las 7 bicis en el Punto
        insert into entrada_bici values (null,"V222",null,default,1,false);
        insert into entrada_bici values (null,"V222",null,default,1,false);
        insert into entrada_bici values (null,"V222",null,default,1,false);
        insert into entrada_bici values (null,"V222",null,default,1,false);
        insert into entrada_bici values (null,"V222",null,default,1,false);
        insert into entrada_bici values (null,"V222",null,default,1,false);
    end if;
end //

delimiter ;
-- comprobación. Update del número de bicis en un punto Bicing, restando las últimas dos bicis que quedaban
update puntos set bici_actual = bici_actual - 2 where id_punto = 1;

-- Actualizamos el registro de bicis del Punto y del Almacén:
update puntos set bici_actual = bici_actual - 7 where id_punto = 6;
update puntos set bici_actual = bici_actual + 7 where id_punto = 1;

select * from puntos; -- comprobamos la cantidad de bicis del Punto
select * from salida_bici; -- comprobamos que se haya hecho el retiro de bicis del Almacén por parte del camión
select * from entrada_bici; -- comprobamos el ingreso de bicis al Punto que estaba vacío



-- Final TODO Challenge 2
