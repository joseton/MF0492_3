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
