-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2
use bicing;
set foreign_key_checks = 0; -- quitar el error 1451

-- *****************************************************************************
-- Añadir 3 TRIGGERS en las tablas de la base de datos explicando con
-- comentarios el funcionamiento de los mismos.

-- PRIMER TRIGGER : Cuando se registra un nuevo alquiler, se genera una factura nueva:

drop trigger if exists new_rent_AI;
delimiter $$
create trigger new_rent_AI after insert
on alquileres for each row
begin
	insert into facturas values (null,default,new.usuario);
end $$ 
delimiter ;

insert into alquileres values (null,"2020-02-05 19:00:54","2020-02-05 19:40:44",11,"63315174C");
select * from facturas;


-- SEGUNDO TRIGGER : Al eliminar una estación, re-ubicar las bicis en otra estación:

drop trigger if exists borrar_est_AD;
delimiter $$
create trigger borrar_est_AD after delete
on estaciones for each row
begin
  update bicicletas set parking = parking - 1 where parking = old.id_est; 
end $$
delimiter ;

delete from estaciones where id_est = 2;
select * from bicicletas;

-- TERCER TRIGGER : Al añadir una nueva estación, re-ubicar una bici desde la estación donde hay más:

drop trigger if exists mas_est_BI;
delimiter $$
create trigger mas_est_BI before insert
on estaciones for each row
begin
  set @estac_tope := (select park from (select parking as park, count(*) as bicis from bicicletas group by parking order by bicis desc limit 1) as tabla1);
  set @ult_bici := (select max(id_bici) from bicicletas where parking = @estac_tope);
  update bicicletas set parking = new.id_est where id_bici = @ult_bici; 
end $$
delimiter ;
insert into estaciones values (5, "Sant Martí",6);
select * from bicicletas;

 

-- *****************************************************************************
-- Añadir 1 CURSOR en un "procedure" en la base de datos explicando
-- con comentarios el funcionamiento del mismo.

-- Generar un aviso cuando se aparca una bicicleta en el último
-- espacio libre de una estación, en forma de tabla con las estaciones "a tope":

drop table if exists estaciones_full;
create table estaciones_full(
	id int primary key auto_increment,
    nombre varchar(15),
    tope int,
    num_bicis int
);

drop procedure if exists aviso;
delimiter $$
create procedure aviso()
begin
-- 0)Declaramos las variables:
    declare done boolean default false;
    declare barrio varchar(15);
	declare capacidad int;
    declare bicis int;
-- 1)Declaramos el cursor para la consulta que nos indica el enunciado:
    declare cursor_estacion cursor for 
	select E.barrio, count(*) as bicis, E.capacidad from bicicletas B join estaciones E where B.parking = E.id_est group by parking;
-- 2)Declaramos el manejador de error tipo "NOT FOUND":
    declare continue handler for not found set done = true;
-- 3)Abrimos el cursor:
    open cursor_estacion;
-- 4)Lectura de las columnas con un bucle:
    loop_lectura: loop
		-- lectura de la primera fila 
        fetch cursor_estacion into barrio, bicis, capacidad;
        -- si el cursor detecta que no hay fila para leer, salimos del bucle
        if done then
			leave loop_lectura;
		end if;
        if bicis >= capacidad then
			insert into estaciones_full values (null, barrio, capacidad, bicis);
		end if;
	end loop;
-- 5)Cerramos el cursor:
    close cursor_estacion;
-- 6)Damos el resultado:
	select * from estaciones_full;
end $$
delimiter ;
call aviso();

-- *****************************************************************************
-- Añadir 1 EVENTO en la base de datos explicando con comentarios el
-- funcionamiento del mismo.

-- Al inicio de cada jornada, generar un listado de bicis averiadas para retirarlas:

drop event if exists bicis_aver;
create event bicis_aver
on schedule every 1 day starts "2020-02-14 06:00"
do
	select * from bicicletas where estado_bici = "No_Active";



-- *****************************************************************************
-- Final TODO Challenge 2
