-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2


-- TRIGGER 1 ________________________________________________________________________________________________________________________________________


-- valida la capacidad de personas de una estacion (que sea menor 10)
-- Si el campo es > 10 , se aplicará un NULL


SET SQL_SAFE_UPDATES = 0;
use bicing;

drop trigger if exists capacidadestaciones_max_BU;

delimiter $$
create trigger capacidadestaciones_max_BU before update
on estaciones for each row
begin
	if new.capacidad = 15 then
		set new.capacidad = null;
	end if;
end $$

delimiter ;
-- comprobación
update estaciones set capacidad = 15 where id_estacion = 10;

select * from estaciones;



-- _________________________________________________________________________________________________________________


-- TRIGGER 2 ________________________________________________________________________________________________________________________________________


delimiter $$
create trigger averia_estaciones_AU after update
on averia_estaciones for each row
begin
	insert into averias (id_averia,nombre, tiempo_rep, coste) values
	(current_user(), concat('Se ha modificado el registro','(,' , old.id_averia,',',old.id_bicicleta,',',old.cod_averia,') por',
    '(',new.id_averia,',',new.id_bicicleta,',',new.cod_averia,')'));

end $$

delimiter ;

-- comprobación
insert into averias values (null, "manillar", '00:30:00', 15.5);
select * from averias;
select * from averia_estaciones;
update averias set coste = 15.50 where id_averia = 1;

-- ______________________________________________________________________________________________________________________________________


-- TRIGGER 3 ________________________________________________________________________________________________________________________________________

-- si la nueva contraseña es null o esta vacía cogemos la nueva contraseña y la igualamos a la antigua, sino cogemos la nueva contraseña
-- y la encriptamos (md5)

drop trigger if exists actualizacion_user;
DELIMITER $$

create trigger actualizacion_user before update
on usuarios for each row begin

if (new.contrasena is null or new.contrasena = '') then
		set new.contrasena = old.contrasena;
else
		set new.contrasena = md5(new.contrasena);
end if;
end$$

-- md5(new.contrasena), significa que la encriptamos la contraseña

DELIMITER ;
update usuarios set contrasena = '2828282828' where id_usuario = 1;

-- ______________________________________________________________________________________________________________________________________

-- TRIGER 4

-- creamos un trigger para que cuando hagamos un insert(antes) nos diga que se ha introducido un valor desde el => TRIGGER

use bicing;

delimiter $$

create trigger miTabla_bi
before insert on fabricantes
for each row
begin
    set @x = 'Trigger activado';
    set NEW.nombre = 'Valor introducido desde el trigger';
end$$

insert into fabricantes values (null, "Luis B", "+343654479844");
    -- ______________________________________________________________________________________________________________________________________


    --  CURSOR_________________________________________________________________________________________________________________
    -- Cursor que proporciona la información de las averías más caras.
    -- Se llama a un procedimiento y se le envía el número de avería.
    -- Realizando una consulta podemos sacar la avería más cara pero en el caso que haya más de una
    -- con la avería más cara(dos o más con el mismo coste), no nos servirá la consulta, para eso hacemos el cursor

    use bicing;

    select * from averias;

    drop table if exists coste_max;
    create table coste_max(
    	id int primary key auto_increment,
        nombre varchar(45),
        coste int
    );

    drop procedure if exists averia_mayorcoste;
    delimiter $$
    create procedure averia_mayorcoste()

    begin
    	-- declaramos las variables

        declare done boolean default false;
        declare nombre_averia, temp_nombre varchar(45);
        declare coste_averia float;
        declare temp_averia int default (select max(coste) from averias);



        -- declaramos el cursor para la consulta que nos indica el enunciado


        declare cursor_averia cursor for select nombre, coste from averias;

          -- declaramos el manejador de error tipo "NOT FOUND"
        declare continue handler for not found set done = true;

        -- abrimos el cursor
        open cursor_averia;

        -- lectura de las columnas con un bucle
        loop_lectura: loop
    		-- lectura de la primera fila
            fetch cursor_averia into nombre_averia, coste_averia;
            -- si el cursor detecta que no hay fila para leer,
            -- salimos del bucle
            if done then
    			leave loop_lectura;
    		end if;

            if coste_averia >= temp_averia then
    		       set temp_nombre = nombre_averia;
                   set temp_averia = coste_averia;
                   insert into coste_max values (null, temp_nombre, temp_averia);
    		end if;

        end loop;
        -- cerramos el cursor
        close cursor_averia;

        -- consultamos las variables temporales
        select * from coste_max;

    end $$

    delimiter ;

    call averia_mayorcoste();

    select * from averias;

    -- ______________________________________________________________________________________________________________________________________


    -- EVENTO _____________________________________________________________________________________________________________________________


    -- evento, que se actualiza cada 5 segundos, haciendo un update, donde los usuarios no esten activos y la fecha_nac empiece por el año 1980
    set global event_scheduler = ON;
    SET FOREIGN_KEY_CHECKS = 0;

    use bicing;


    drop event if exists actualizausuarios;
    create event actualizausuarios
    on schedule at now() + interval 5 second
    do
    	update usuarios set activo = false where fecha_nac like '1980%' ;

    show events;
    select * from usuarios;

    -- ______________________________________________________________________________________________________________________________________
    -- HAGO UN EVENTO PARA QUE CADA 1 MIN. ME CREE UN USUARIO LLAMADO DE NOMBRE ADMIN, Y APELLIDO MANTENIMIENTO

    set global event_scheduler = ON;
    SET FOREIGN_KEY_CHECKS = 0;


    drop event if exists actualiza;
    create event actualiza
    on schedule every 1 minute starts "2020-02-13 17:26"
    do

     insert into usuarios values (null, "Admin", "Mantenimiento", "mantenimiento_admin@homtail.com", md5(456781332),"", '', "", " ", "", "", null, null);

    show events;
    select * from usuarios;
    -- ______________________________________________________________________________________________________________________________________












-- Final TODO Challenge 2
