use bicing;
drop trigger if exists sumar_puntos;
delimiter $$
create trigger sumar_puntos after insert
on entrada_bici for each row
-- es para actualizar las bicis actuales para ir controlando el stock en cada punto
begin
	update puntos set bici_actual = bici_actual + 1 where id_punto= new.id_punto;
end $$
delimiter ;
-- comprobacion

drop trigger if exists restar_puntos;
delimiter $$
create trigger sumar_puntos after insert
on salida_bici for each row
-- es para actualizar las bicis actuales para ir controlando el stock en cada punto
begin
	update puntos set bici_actual = bici_actual -1 where id_punto= new.id_punto;
end $$
delimiter ;
-- comprobaciones

-- tercer trigger para sacar un alarma y segun se puede o no prohibir o permitir inserts en tal punto os

drop trigger if exists alarma_entradas;
delimiter $$
create trigger alarma_entradas after insert
on entrada_bici for each row
begin
-- calcular en que punto se quiere hacer el insert
set @punt = new.id_punto;
set @bici_actual = (select bici_actual from puntos where id_punto = @punt);
	if(@bici_actual = 9 and exists(select 1 from entrada_bici where id_punto = new.id_punto)  )
    -- salta el alarma prohibir el insert en la tabla entrada_bic
	then
		delete from entrada_bici where localizador = new.localizador;
        -- signal sqlstate "45000" SET MESSAGE_TEXT = "no se pueden añadir mas bicis ";
		-- hago manualmente un delete y un update
    end if;



end $$

delimiter ;
drop trigger if exists alarma_entradas2;
delimiter $$
create trigger alarma_entradas2 before insert
on entrada_bici for each row
begin

set @bici_actual = (select bici_actual from puntos where id_punto = new.id_punto);
    if(@bici_actual = 9 )
	then
        signal sqlstate "45000" SET MESSAGE_TEXT = "no se pueden añadir mas bicis ";
	end if;
end $$
delimiter ;
select * from entrada_bici;
update puntos set bici_actual = 9 where id_punto = 1;
-- simulo el insert que quiero prohibir
insert into entrada_bici values(null,"zzzzzz",6,null,1,0);


-- --------------------------------------------
--           buscar en los puntos los que tengan menos bicis
-- 			sacar estadisticas de los puntos mas usados
drop procedure if exists tiempo_transcr;
delimiter $$
create procedure tiempo_transcr(in dni varchar(9))
begin
		-- declarar variables
	declare done boolean default false;
	declare  fecha_ini datetime default (select momento from entrada_bici where id_entrada = dni order by momento asc limit 1);
	declare  fecha_fin datetime default (select momento from salida_bici where id_salida = dni limit 1);
	declare momento datetime;
	declare momento2 datetime;
    declare cursor_entrada cursor for
    select momento from entrada_bici
	where id_entrada = dni;

	declare cursor_salida cursor for
	select momento from salida_bici
	where id_salida = dni;
	declare continue handler for not found set done = true;

    open cursor_entrada;
	loop_lectura: loop
		fetch cursor_entrada into momento;
		if done then
			leave loop_lectura;
		end if;
        if momento <= fecha_ini then
			set fecha_ini = momento;
        end if;
    end loop;
	close cursor_entrada;
    set done = false;
	open cursor_salida;
	loop_lectura: loop
		fetch cursor_salida into momento2;
		if done then
			leave loop_lectura;
		end if;
        if momento2 >= fecha_fin then
			set fecha_fin = momento2;
        end if;
    end loop;
	close cursor_salida;
	 select fecha_ini as primera_vez, fecha_fin as ultima_vez;
end $$
-- tiempo desde la primera vez de todas hasta la ultima de todas
call tiempo_transcr("xxmanouar");
--        //////////////////////////////////eventos

set global event_scheduler = on;
use bicing;
drop event if exists volcado_tabla;
create event volcado_tabla
on schedule every 1 day starts "2020-02-19 19:00"
do
	insert into entrada_bici values
	(null,"xxmanouar",7,"2020-02-14 16:16:35",2,false);
	-- INSERT INTO #volcado_tabla (SELECT * FROM entrada_bici);

-- Final TODO Challenge 2
