use bicing;
--   (true=1/false=0) si update bici en bbdd se comprueba si es electrica y no esta defectuosa
drop trigger if exists bicicletas_bu;
delimiter $$
create trigger bicicletas_bu after update
on bicicletas for each row
begin
	insert into  cambios_bicicletas values (null,old.id_bicicleta,concat("se ha cambiado el campo estacion ", old.estacion," por ",new.estacion ),default);
end $$
delimiter;
-- comprobación
select * from cambios_bicicletas;
select * from bicicletas;
update bicicletas set estacion="061" where id_bicicleta = 3;

-- trigger 2  cuando insertas una bicicleta se vea en la tabla de mantenimiento
-- inserta en cada estacion una bici cuando la bicicleta sea electrica
drop trigger if exists bicicletas_cu;
delimiter //
create trigger bicicletas_cu after insert
on bicicletas for each row
begin
	insert into mantenimiento values (null,new.id_bicicleta,false);

end //
-- comprobación
insert into bicicletas values (null,"061",true);
select * from mantenimiento;
select * from bicicletas;

-- trigger 3
-- elimina una bicicleta y se vea en la tabla de bicicletas  baja  el nº de la vez que se elimina si es la 1º vez la segunda etc ... y el codigo de la bicicleta con su fecha  de baja
drop trigger if exists bicicletas_du;
delimiter //
create trigger bicicletas_du after delete
on bicicletas  for each row
begin
	insert into  bicicletas_bajas values(null, old.id_bicicleta ,default);

end //

delimiter ;
-- comprobación
SET FOREIGN_KEY_CHECKS = 0;
delete from bicicletas where id_bicicleta =1;
select *from bicicletas_bajas;
select * from bicicletas;

-- aqui evento
set global event_scheduler = ON;
insert into bicicletas values
(null,"061",true);

drop event if exists actualizaestacion;
create event actualizaestacion
on schedule every 1 day starts "2020-02-13 18:49"
do
 update bicicletas  set estacion="061"   where electrica = 1;

select * from bicicletas;
-- aqui cursor
-  CURSOR
--
-- Se llama a un procedimiento


drop table if exists tiempo_max;
create table tiempo_max(
	id int primary key auto_increment,
    nombre varchar(25),
    tiempo_uso int
);

drop procedure if exists mayor_uso;
delimiter $$
create procedure mayor_uso()
begin
	-- declaramos las variables

    declare done boolean default false;
    declare nombre, temp_nombre varchar(25);
    declare tiempo_uso int;
    declare temp_tiempo_uso int default (select max(tiempo_uso) from usuarios);

    -- declaramos el cursor para la consulta que nos indica el enunciado

     declare cursor_tiempo_uso cursor for select nombre, tiempo_uso from usuarios;

     declare continue handler for not found set done = true;
       -- abrimos el cursor
    open cursor_tiempo_uso;
    -- lectura de las columnas con un bucle
    loop_lectura: loop
		-- lectura de la primera fila
        fetch cursor_tiempo_uso into nombre, tiempo_uso;
        -- si el cursor detecta que no hay fila para leer,
        -- salimos del bucle

        if done then
			leave loop_lectura;
		end if ;

        if tiempo_uso >= temp_tiempo_uso then
		       set temp_tiempo_uso= tiempo_uso;
                set temp_nombre= nombre;
               insert into tiempo_max values (null, temp_nombre, temp_tiempo_uso);
		end if;

    end loop;
    -- cerramos el cursor
    close cursor_tiempo_uso;
     -- consultamos las variables temporales
    select * from tiempo_max;

end $$

delimiter ;
call mayor_uso();

select * from usuarios;
