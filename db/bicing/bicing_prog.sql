-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 1
use bicing;

-- TRIGGER 1 - Creamos un trigger que asigna al atribuyo cant_disp el mismo valor que tiene capacidad

drop trigger if exists asignar_disponibilidad;
delimiter $$
create trigger asignar_disponibilidad before insert
on estaciones for each row
begin
    set new.cant_disp = new.capacidad;
end $$
delimiter ;

insert into estaciones values
(null, "Parada Espacial", "Carrer lunática", 21, null );

select * from estaciones;

-- TRIGGER 2 - -Creamos un trigger para formater los datos que entran en la BD a la hora de insertarlos en la tabla de usuarios

drop trigger if exists formatear_datos;
delimiter $$

create trigger formatear_datos before insert
on usuarios for each row
begin
	set new.nombre = concat(ucase(left(new.nombre, 1)), lcase(substring(new.nombre, 2)));
    set new.apellidos = concat(ucase(left(new.apellidos, 1)), lcase(substring(new.apellidos, 2)));
    set new.email = lower(new.email);
	  set new.dni = upper(new.dni);
    set new.direccion = concat(ucase(left(new.direccion, 1)), lcase(substring(new.direccion, 2)));
    set new.ciudad = concat(ucase(left(new.ciudad, 1)), lcase(substring(new.ciudad, 2)));
end $$
delimiter ;

insert into usuarios values (null, "SEBASTIAN", "FERNANDEZ CORO", "SEBASTIANFERNANDEZ@HOTMAIL.COM", md5(456781332),"67945679s", '2020-01-01', "+34895564710", "CARRER SECRETARY", "BARCELONA", "08405", true, false);

select * from usuarios;


-- TRIGGER 3 - Creamos un trigger para calcular el precio del alquiler de la misma en base a su contrato,su duración y tarifa contratada

drop trigger if exists calcular_precio_viaje;
delimiter $$
create trigger calcular_precio_viaje before update
on alquileres for each row
begin
	set @treinta :=  (select round(treinta,2) from tarifas T
						join usuarios_tarifas UT on T.id_tarifa=UT.id_tarifa
                        join usuarios U on UT.id_usuario=U.id_usuario
                        where U.id_usuario=old.id_usuario);
    set @hastados := (select round(hastados,2) from tarifas T
						join usuarios_tarifas UT on T.id_tarifa=UT.id_tarifa
						join usuarios U on UT.id_usuario=U.id_usuario
                        where U.id_usuario=old.id_usuario);
    set @masdedos := (select round(masdedos,2) from tarifas T
						join usuarios_tarifas UT on T.id_tarifa=UT.id_tarifa
                        join usuarios U on UT.id_usuario=U.id_usuario
						where U.id_usuario=old.id_usuario);

	set @f_alta := (select fecha_salida from alquileres where id_alquiler = old.id_alquiler);
	set @f_fin := (select fecha_llegada from alquileres where id_alquiler = old.id_alquiler);

    set @tiempo := (select timestampdiff(minute, @f_alta, @f_fin));


	case
	when @tiempo <= 30 then
		set new.precio = (@tiempo * @treinta);
    when @tiempo <= 120 then
		set new.precio = (@tiempo * @hastados);
    else
		set new.precio = (@tiempo * @masdedos);
	end case;
end $$
delimiter ;

update alquileres set fecha_llegada = default, estacion_llegada=5 where id_alquiler=1;
update alquileres set fecha_llegada = default, estacion_llegada=13 where id_alquiler=2;
update alquileres set fecha_llegada = default, estacion_llegada=10 where id_alquiler=3;
update alquileres set fecha_llegada = default, estacion_llegada=12 where id_alquiler=4;
update alquileres set fecha_llegada = default, estacion_llegada=10 where id_alquiler=5;
update alquileres set fecha_llegada = default, estacion_llegada=1 where id_alquiler=6;
update alquileres set fecha_llegada = default, estacion_llegada=3 where id_alquiler=7;
update alquileres set fecha_llegada = default, estacion_llegada=5 where id_alquiler=8;
update alquileres set fecha_llegada = default, estacion_llegada=13 where id_alquiler=9;
update alquileres set fecha_llegada = default, estacion_llegada=7 where id_alquiler=11;
-- --

-- EVENTO - Creamos un evento que nos sirve para rellenar las bibicletas en las estaciones y dejarlas completas de nuevo
-- asignando el campo de cant_disponible a la de capacidad. Para ello hemos creado una procedimiento que es llamado
-- por el evento cada día.

drop procedure if exists resetear_estacion;
delimiter $$
create procedure resetear_estacion()
begin

	-- para saber cuando se detendrá la consulta
	declare done int default false;
    declare aux_id_estacion int;
    declare aux_capacidad int;
    declare recorre cursor for
		select id_estacion, capacidad from estaciones
		where (cant_disp != capacidad or cant_disp is null);
    declare continue handler for not found set done = true;
    open recorre;
		loop_recorre: loop
			fetch recorre into aux_id_estacion, aux_capacidad;
			update estaciones set cant_disp = aux_capacidad where id_estacion=aux_id_estacion;
            if done then
				leave loop_recorre;
			end if;
		end loop;
	close recorre;
end $$
delimiter ;

set SQL_SAFE_UPDATES = 0;

select * from estaciones;

-- creamos el evento llamando al procedimeinto (debería de ejecutarse cada media noche)
set global event_scheduler = on;
drop event if exists control_estaciones;
create event control_estaciones
on schedule every 1 day starts now()
do
        call resetear_estacion();





-- procedimiento de mantenimiento de bicicletas y estaciones que se ejecute todos las noches y realice un recuento de uso de cada bicicleta
-- para que en caso necesario se retire de circulación para su mantenimiento.
-- y se registre en una nueva tabla los dias que ha estado sin uso.

--
-- Final TODO Challenge 2
