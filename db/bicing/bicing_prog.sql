-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2
use bicing;
-- valida cuantas bicicletas electricas hay  hay en cada estacion  (true=1/false=0)
-- Si el campo es negativo, se aplica un NULL
drop trigger if exists bicicletas_bu;
delimiter //
create trigger bicicletas_bu after update
on bicicletas for each row
begin
	if new.electrica = 0 then
		update bicicletas set new.electrica = false;
	end if;
end //

delimiter ;
-- comprobación

insert into bicicletas values (null,"061",true);
select * from bicicletas;

-- aqui evento
set global event_scheduler = ON;
insert into bicicletas values
(null,"061",true);

drop event if exists actualizaestacion;
create event actualizaestacion
on schedule every 1 day starts "2020-02-13 16:14"
do
 update bicicletas  set estacion=061   where electrica = 1;

select * from bicicletas;


-- Final TODO Challenge 2
