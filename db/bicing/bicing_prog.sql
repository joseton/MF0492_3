-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2
use bicing;

-- Trigger 1: cada vegada que es finalitzi un trajecte (camp alquiler.fin_uso actualitzat),
-- actualitzarà la data de modificació de l'usuari en qüestió
drop trigger if exists actualitzaData;
delimiter $$
create trigger actualitzaData after update
on alquiler for each row
begin
	update usuarios set fecha_modif = new.fin_uso
    where id_usuario = new.usuario;
end $$
delimiter ;
-- comprovació
update alquiler set fin_uso = now()
where usuario = 1
and id_alquiler = 1;
select * from alquiler;
select * from usuarios;

-- Trigger 2: quan s'introdueix una nova bicicleta, també la introdueix a mantenimiento
drop trigger if exists noDefectuosa;
delimiter $$
create trigger noDefectuosa after insert
on bicicletas for each row
begin
	insert into mantenimiento values (null, new.id_bicicleta, false);
end $$
delimiter ;
-- comprovació
insert into bicicletas values (null, 302, false);
select * from bicicletas;
select * from mantenimiento;

-- Trigger 3: si un usuari es passa en el temps d'un trajecte, pagado = false
-- (no ha pagat la quota que hauria d'haver abonat)
drop trigger if exists massaTemps;
delimiter $$
create trigger massaTemps after update
on alquiler for each row
begin
	if timestampdiff(minute, new.inicio_uso, new.fin_uso) >
    (select tiempo_uso from usuarios where id_usuario = new.usuario) then
		update usuarios set pagado = false where id_usuario = new.usuario;
	end if;
end $$
delimiter ;
-- comprovació
-- per l'inici del trajecte
insert into alquiler values (null, 1, "2020-02-13 18:44:00", "");
-- pel final del trajecte (46 minuts d'ús i l'usuari té 45)
update alquiler
set fin_uso = "2020-02-13 19:30:00"
where id_alquiler = (select max(id_alquiler) from alquiler);
select * from usuarios;
select * from alquiler;





-- Cursor: mostrarà l'usuari més actiu (suma de més minuts per tots els trajectes)
drop procedure if exists usuariMesActiu;
delimiter $$
create procedure usuariMesActiu()
begin
    declare done boolean default false;
    declare nomUsuari varchar(125);
    declare minuts int;
    declare temp_nomUsuari varchar(125);
    declare temp_minuts int default 0;

	declare cursor_usuariMesActiu cursor for
        -- per mostrar el nom complet
		select concat(U.nombre, " ", U.apellidos),
		-- suma els minuts com diferència entre inicio_uso i fin_uso
		sum(timestampdiff(minute, A.inicio_uso, A.fin_uso))
		from usuarios U join alquiler A
		on U.id_usuario = A.usuario
		-- agrupant per cada usuari pel sum()
		group by U.id_usuario;

    declare continue handler for not found set done = true;
    open cursor_usuariMesActiu;

    loop_lectura: loop
		fetch cursor_usuariMesActiu into nomUsuari, minuts;
        if done then
			leave loop_lectura;
		end if;
		if minuts >= temp_minuts then
			set temp_minuts = minuts;
			set temp_nomUsuari = nomUsuari;
		end if;
	end loop;

	close cursor_usuariMesActiu;

	select temp_nomUsuari as Nom, temp_minuts as Minuts;

end $$
delimiter ;
call usuariMesActiu();
-- comprovació de la consulta associada al cursor
select concat(U.nombre, " ", U.apellidos),
sum(timestampdiff(minute, A.inicio_uso, A.fin_uso))
	from usuarios U join alquiler A
	on U.id_usuario = A.usuario
	group by U.id_usuario;





-- Esdeveniment: cada cert temps copiarà a una altra taula les bicicletes
-- que estan defectuoses.
set global event_scheduler = on;

drop procedure if exists copia;
delimiter $$
create procedure copia()
begin
    create table if not exists defectuoses(
		id_bicicleta int,
		electrica boolean,
		marcaDeTemps datetime default current_timestamp,
		constraint FK3 foreign key (id_bicicleta)
		references mantenimiento(bicicleta)
		on delete cascade on update cascade
	);
	insert defectuoses
    select bicicleta,
    (select electrica from bicicletas where id_bicicleta = bicicleta),
    now()
    from mantenimiento
    where defectuosa = true;
end $$

delimiter ;
drop event if exists respaldo;
create event respaldo
on schedule every 10 second starts now()
do
        call copia();

-- comprovació
select * from mantenimiento;
select * from defectuoses;
-- Final TODO Challenge 2
