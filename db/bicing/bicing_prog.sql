-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2

-- ---------- BICING FUNCIONES AVANZADAS --------------
-- ------------- JOSE LUIS ESTEVEZ --------------
-------------------------------------------------------

-- Trigger1 - La bici no está disponible detectando que está en servicio.
-- -----------------------------------------------------------------------

use bicing;

SET GLOBAL event_scheduler=on;

drop trigger if exists bici_nodisponible;
delimiter //
create trigger bici_nodisponible after insert
on registro_alquiler for each row
begin
		update bicicleta set disponible = 0 where cod_bici = new.cod_bici;
end //

delimiter ;
-- comprobación
insert into registro_alquiler values (null,"47789568z",1,"2020/10/02 10:00:00",null,0,2,null);
select cod_bici, disponible from bicicleta;


-- Trigger2. Bici disponible detectando que no está en servicio
-- --------------------------------------------------------------

drop trigger if exists bici_disponible;
delimiter //
create trigger bici_disponible after update
on registro_alquiler for each row
begin
		if new.fecha_devolucion then
		update bicicleta set disponible = 1 where cod_bici = new.cod_bici;
        end if;
end //

delimiter ;

-- comprobación
update registro_alquiler set fecha_devolucion = "2020/10/02 10:35:00" where id_alquiler = 8;
select cod_bici, disponible from bicicleta;

-- Triger3. Descontar en saldo del usuario automáticamente después de alquilar la bici.
-- ------------------------------------------------------------------------------------

drop trigger if exists cobro_alquiler;
delimiter //
create trigger cobro_alquiler after update
on registro_alquiler for each row
begin
		set @minutos := (select TIMESTAMPDIFF(MINUTE,fecha_recogida,fecha_devolucion) as minutos from registro_alquiler where fecha_devolucion = new.fecha_devolucion);
		set @dni := (select dni from registro_alquiler where fecha_devolucion = new.fecha_devolucion);
		set @preciotarifa := (select t.precio from tarifa t inner join usuario u on t.id_tarifa = u.id_tarifa where dni = @dni);

		if new.fecha_devolucion then
		update usuario set saldo = saldo - (@minutos * @preciotarifa) where dni = @dni;
        end if;


end //

delimiter ;

-- comprobación
update registro_alquiler set fecha_devolucion = "2020/10/02 10:35:00" where id_alquiler = 8;
select saldo from usuario where dni = @dni;


-- Evento! Copia de seguridad de todas las tablas con su información una vez al día. --
----------------------------------------------------------------------------------------

-- Primero hacemos procedure con las sentencias de las copias de las tablas y la ejecutamos.

drop procedure if exists copiar_db;
delimiter $$
create procedure copiar_db()
begin
	drop table if exists usuario_copia;
	CREATE TABLE usuario_copia LIKE usuario;
	INSERT usuario_copia SELECT * FROM usuario;

    drop table if exists bicicleta_copia;
    CREATE TABLE bicicleta_copia LIKE bicicleta;
	INSERT bicicleta_copia SELECT * FROM bicicleta;

    drop table if exists registro_alquiler_copia;
    CREATE TABLE registro_alquiler_copia LIKE registro_alquiler;
	INSERT registro_alquiler_copia SELECT * FROM registro_alquiler;

    drop table if exists estacion_copia;
    CREATE TABLE estacion_copia LIKE estacion;
	INSERT estacion_copia SELECT * FROM estacion;

    drop table if exists tarifa_copia;
	CREATE TABLE tarifa_copia LIKE tarifa;
	INSERT tarifa_copia SELECT * FROM tarifa;
end $$


-- Creamos el evento y llamamos al procedure creado, se ejecutará cada día a la hora establecida.

drop event if exists copiar_db;
create event copiar_db
on schedule every 1 day starts "2020-02-14 16:45"
do

	call copiar_db();


-- PROCEDURE CON CURSOR
-- Calcular el tiempo total que se ha utilizado el bicing introduciendo el DNI del usuario.

drop procedure if exists tiempo_total;
delimiter $$
create procedure tiempo_total(in dnienviado varchar(9))
begin

    -- declaramos las variables
    declare done boolean default false;
    declare id int;
    declare fecha_ini, fecha_dev datetime;
    declare minutos float default 0;

    declare cursor_ids cursor for  -- declaramos el cursor para la consulta que nos indica el enunciado
    select id_alquiler, fecha_recogida, fecha_devolucion from registro_alquiler where dni = dnienviado;  -- Seleccionamos todos los ids de alquiler del usuario enviado

      -- declaramos el manejador de error tipo "NOT FOUND"
    declare continue handler for not found set done = true;

    -- abrimos el cursor
    open cursor_ids;

    -- lectura de las columnas con un bucle
    loop_lectura: loop
		-- lectura de la primera fila
        fetch cursor_ids into id, fecha_ini, fecha_dev;
        -- si el cursor detecta que no hay fila para leer,
        -- salimos del bucle
        if done then
			leave loop_lectura;
		end if;
		-- Vamos introduciendo los minutos calculados de cada registro en la variable @minutos.
		set minutos = minutos + (select timestampdiff(minute, fecha_ini, fecha_dev));

    end loop;
    -- cerramos el cursor
    close cursor_ids;

    -- consultamos las variables temporales
    select minutos as Minutos_disfrutados;

end $$

-- Llamamos al Procedure y le enviamos el parámetro dni del usuario.
delimiter ;
call tiempo_total("49578956x")




-- Final TODO Challenge 2
