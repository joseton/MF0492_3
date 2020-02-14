-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 1
use bicing;

-- -- creamos un trigger para tener un contador total de usuarios que tenemos en la tabla usuarios (deberia ir en la creacion de la BBDD :) )
-- drop trigger if exists contador_usuarios;

-- create trigger contador_usuarios after insert on usuarios for each row SET @cont_usu = @cont_usu + 1;

-- insert into usuarios values
-- (null, "Pepe", "Gomez", "luisgomez@homtail.com", md5(456781332),"345686Z", '2020-01-01', "+34895564710", "Carrer Villamayor", "Bcn", "08405", true, false),
-- (null, "Pepe2", "Gomez", "luisgomez@homtail.com", md5(456781332),"345686Z", '2020-01-01', "+34895564710", "Carrer Villamayor", "Bcn", "08405", true, false);

-- -- consultamos el valor de la variable global
-- select @cont_usu as total_usuarios


-- Creamos un trigger para calcular el precio del alquiler de la misma en base a su contrato



-- drop trigger if exists calcular_precio_viaje;
-- delimiter $$
-- create trigger calcular_precio_viaje before update
-- on alquileres for each row
-- begin
-- 	set @treinta :=  (select treinta from tarifas T
-- 						join usuarios_tarifas UT on T.id_tarifa=UT.id_tarifa
--                         join usuarios U on UT.id_usuario=U.id_usuario
--                         where U.id_usuario=old.id_usuario);
--     set @hastados := (select hastados from tarifas T
-- 						join usuarios_tarifas UT on T.id_tarifa=UT.id_tarifa
-- 						join usuarios U on UT.id_usuario=U.id_usuario
--                         where U.id_usuario=old.id_usuario);
--     set @masdedos := (select masdedos from tarifas T
-- 						join usuarios_tarifas UT on T.id_tarifa=UT.id_tarifa
--                         join usuarios U on UT.id_usuario=U.id_usuario
-- 						where U.id_usuario=old.id_usuario);
--
-- 	set @f_alta := (select fecha_salida from alquileres where id_alquiler = old.id_alquiler);
-- 	set @f_fin := (select fecha_llegada from alquileres where id_alquiler = old.id_alquiler);

--     set @tiempo := (select timestampdiff(minute, @f_alta, @f_fin));
--

-- 	case
-- 	when @tiempo <= 30 then
-- 		set new.precio = (@tiempo * @treinta);
--     when @tiempo <= 120 then
-- 		set new.precio = (@tiempo * @hastados);
--     when @tiempo > 120 then
-- 		set new.precio = (@tiempo * @masdedos);
-- 	end case;
-- end $$
-- delimiter ;



-- -- simulamos la entrega de las bicicletas alquiladas para poder hacer el calcula del precio a la hora de la recepción
-- update alquileres set fecha_llegada = "2020-02-14 19:36:25", estacion_llegada=5 where id_alquiler=1;
-- -- update alquileres set fecha_llegada = "2020-02-14 19:36:25", estacion_llegada=10 where id_alquiler=3;
-- update alquileres set fecha_llegada = "2020-02-14 17:06:25", estacion_llegada=12 where id_alquiler=4;
-- update alquileres set fecha_llegada = "2020-02-14 20:36:25", estacion_llegada=10 where id_alquiler=5;
-- update alquileres set fecha_llegada = "2020-02-15 02:36:25", estacion_llegada=1 where id_alquiler=6;
-- update alquileres set fecha_llegada = "2020-02-14 15:51:05", estacion_llegada=3 where id_alquiler=7;
-- update alquileres set fecha_llegada = "2020-02-14 16:06:20", estacion_llegada=5 where id_alquiler=8;
-- update alquileres set fecha_llegada = "2020-02-14 15:21:25", estacion_llegada=13 where id_alquiler=9;
-- update alquileres set fecha_llegada = "2020-02-14 17:09:54", estacion_llegada=7 where id_alquiler=10;
-- --


-- procedimiento de mantenimiento de bicicletas y estaciones que se ejecute todos las noches y realice un recuento de uso de cada bicicleta
-- para que en caso necesario se retire de circulación para su mantenimiento.
-- y se registre en una nueva tabla los dias que ha estado sin uso.

--
-- Final TODO Challenge 2
