-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2
-- Inicialización
use bicing;

-- Primer trigger: cada vez que se hace update a alquileres añadiendo la fecha y estación de llegada actualizar con los nuevos datos de estación en la tabla bicis
drop trigger if exists estacion_shuffle;
delimiter \\
create trigger estacion_shuffle after update
on alquileres for each row
begin
	update bicis
    set bicis.estacion = new.estacion_final 
    where bicis.id_bici = new.id_bici;
end \\

-- Comprobación: el alquiler de id 2 esta usando la bici ed id 3 que esta en la estacion "Eixample dret", al hacer este update deberia cambiar el valor de estacion de esta bici a "Hospitalet" 
update alquileres
set fecha_devolucion = current_timestamp, estacion_final = "Hospitalet", en_uso = 0
where id_alquiler = 2;

select * 
from bicis;

-- Trigger 2: cuando se borra una entrada de usuarios  se crea la entrada correspondiente de suusarios_bajas
drop trigger if exists usuarios_bajas_auto_insert;
delimiter \\
create trigger usuarios_bajas_auto_insert after delete
on usuarios for each row
begin
	insert into usuarios_bajas values 
    (old.id_usuario, old.nombre, old.apellidos, old.email, current_timestamp, not old.pagado);
end \\

-- comporbación: al borrar el primer elemento de la tabla usuarios se deberia crear la entrada correspondiente de la tabla usuarios_bajas

SET FOREIGN_KEY_CHECKS = 0;

delete from usuarios
 where id_usuario=1;

select *
from usuarios_bajas;

-- Trigger 3: cuando se añade una nueva entrada a mantenimiento el campo estacion de la bici afectada pasa a taller
drop trigger if exists bici_taller;
delimiter \\
create trigger bici_taller after insert
on mantenimiento for each row
begin
	update bicis 
    set bicis.estacion = "Taller"
    where bicis.id_bici = new.id_bici;
end \\

-- Comprobacion: añadimos una nueva entrada  a amntenimiento y revisamos que la estacion de dicha bici cambia a taller

insert into mantenimiento values
(null,4,default);

select *
from bicis;

-- Cursor: usamos un cursor para encontrar el usuario con mayor numero de alquileres
-- Creamos la tabla donde  almacenaremos los valores de los usuarios con mayor numero de alquileres
drop table if exists max_alquileres;
create table max_alquileres (
	id int primary key auto_increment,
	id_usuario int,
    nombre varchar(50),
    apellidos varchar(50),
    alquileres int
);

-- creamos el procedure del cursor
drop procedure if exists cursor_max_alquileres;
delimiter \\
create procedure cursor_max_alquileres ()
begin
	-- declaramos las variables necesarias, en este caso el maximo ed alquileres por usuario y valores para almacenar los valores temporales del cursor y el handler para parar el curosr al llegar a l final de tabla
    declare done boolean default false;
    declare id_cursor, nombre_cursor, apellidos_cursor varchar(50);
    declare count_cursor int;
	declare max_alquileres_count int default (select  count(*) as count from alquileres group by id_usuario order by count desc limit 1);
    
    -- declaramos el cursor necesario donde cojemos la id de usuario, nombre y apellidos de cada row para guardarlos en caso de ser necesario y el contador ya descrito como subquery
    declare cursor_alquileres_usuario cursor for 
    select U.id_usuario,U.nombre, U.apellidos, 
		(select count(*)
        from alquileres 
        where id_usuario=U.id_usuario)
	from usuarios U;
    
	-- declaramos el manejador de error tipo "NOT FOUND"
    declare continue handler for not found set done = true;
    
    -- abrimos el cursor
    open cursor_alquileres_usuario;
    
      -- lectura de las columnas con un bucle
    loop_lectura: loop
		-- lectura de la primera fila 
        fetch cursor_alquileres_usuario into id_cursor, nombre_cursor, apellidos_cursor, count_cursor;
        -- si el cursor detecta que no hay fila para leer,
        -- salimos del bucle
        if done then
			leave loop_lectura;
		end if;
        
        -- si count_cursor es igual a max_alquileres_count ya tiene el maximo posible y guardamos los datos del cursor en la tabla creada previamente, sino no nos interesa, solo queremos el máximo
        if count_cursor = max_alquileres_count then
            insert into max_alquileres values (null, id_cursor, nombre_cursor, apellidos_cursor, count_cursor);
		end if;
        
    end loop;
    -- cerramos el cursor
    close cursor_alquileres_usuario;
    
    -- consultamos las variables temporales
    select * from max_alquileres;
    
end \\

-- Comprobación: llamamos al procedure, el resultado deberia ser el primer y segundo usuario con 1 alquiler cada uno o bien el segundo usuario si hemos hecho el delete del primer usuario

call cursor_max_alquileres ();


-- Evento: borramos una entrada de usuarios_bajas si han pasado 5 ños de su creaciom cada 20 segundos
-- activamos el programador de eventos
set global event_scheduler = ON;

-- creamos el evento
drop event if exists borrar_usuarios_bajas;
create event borrar_usuarios_bajas
on schedule every  20 second starts now()
do
	delete from usuarios_bajas 
    where fecha_baja < current_timestamp - interval 5 year;
    
-- Comprobación: creamos una entrada de usuarios_bajas mediante el trigger 2 con una fecha adecuada, miramos la tabla para ver que se ha creado y la volvemos a  mirar al cabo de 20 segundos comprobando que ya no esta la entrada
insert into usuarios_bajas values
(4,"nombre","apellidos","email",current_timestamp - interval 5 year,0);

select *
from usuarios_bajas;

-- Final TODO Challenge 2
