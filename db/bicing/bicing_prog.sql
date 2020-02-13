-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2

-- ---------- BICING FUNCIONES AVANZADAS --------------
-- ------------- JOSE LUIS ESTEVEZ --------------
-------------------------------------------------------

-- Triger1 - La bici no está disponible detectando que está en servicio.

use bicing;

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


-- Trigger2. Bici disponible detectando que ya no está en servicio

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













-- Final TODO Challenge 2
