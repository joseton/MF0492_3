-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2


-- TRIGGERS:
-- Añadir 3 TRIGGERS en las tablas de la base de datos explicando con
--comentarios el funcionamiento de los mismos.
use bicing;

SET FOREIGN_KEY_CHECKS = 0;  -- quita error 1451
SET SQL_SAFE_UPDATES = 0;  -- quita error 1175

-- Triger #1  Si borramos un usuario, tambíen tendremos que borrar el historial de facturas relacionadas.
        drop trigger if exists delete_factura;
        delimiter $$
        create trigger delete_factura after delete
            on usuarios for each row
            begin
            delete from facturas where usuario = old.dni;

        end $$
        delimiter ;

        -- comprobación
        select * from usuarios;
        select * from facturas;
        delete from usuarios where dni = "53118274P";

                                    -- ********** --
                                    -- ********** --

-- Triger #2 Por cada 10 bicicletas que demos de alta vamos a construir una nueva estacion.

            drop trigger if exists nueva_estacion_AI;
            delimiter $$
            create trigger nueva_estacion_AI after insert
                on bicicletas for each row
                begin

                set @bicis_stand = (select count(*) from bicicletas);

                if @bicis_stand / 10 =  0 THEN
                insert into estaciones values (null,"tibidabo",new.id_bici);
                    end if;

                    end $$

                    delimiter ;

                    select * from bicicletas;
                    select * from estaciones;
                    insert into bicicletas values
                        (12,"Active",true,1);

                                    -- ********** --
                                    -- ********** --
        -- Triger #3: Cuando se registra un nuevo alquiler, se genera una factura nueva:

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


 -- Añadir 1 CURSOR en un "procedure" en la base de datos explicando
 --con comentarios el funcionamiento del mismo.

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

                                    -- ********** --
                                    -- ********** --


 -- Añadir 1 EVENTO en la base de datos explicando con comentarios el
    --funcionamiento del mismo.


    -- Sacar el promedio de bicis en todas las estaciones.

                drop event if exists bicis_aver;
                create event bicis_aver
                on schedule every 1 day starts "2020-02-14 06:00"
                do
                select avg(capacidad) from estaciones;



                        -- Final TODO Challenge 2
