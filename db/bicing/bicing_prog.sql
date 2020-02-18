-- TODO Challenge 2: Añadir el código SQL que se indica en la descripción del Challenge 2

-- BICING: TRIGGERS, CURSORES Y EVENTOS
-- TONIO BLANCO



-- 1 TRIGGER- INSERTAR NUEVO USUARIO
-- INSERTA UN NUEVO USUARIO Y CREA UNA FECHA DE RECOGIDA DE BICI EN LA TABLA REGISTRO_ALQUILER

USE BICING;
SET FOREIGN_KEY_CHECKS = 0;  -- quita error 1451
SET SQL_SAFE_UPDATES = 0;  -- quita error 1175
--
drop trigger if exists ALTA_USUARIO_AI;
delimiter $$
create trigger ALTA_USUARIO_AI after insert
on USUARIO for each row
begin
	insert into REGISTRO_ALQUILER( dni, fecha_recogida )
    values(new.dni, now());

end $$

-- 1- COMPROBACION.

INSERT INTO USUARIO (dni, email, nombre, apellidos, fecha_nacimiento, fecha_alta, saldo, id_tarifa) values ("47734333z","fsfsf@gmail.com","Marta","Lopez","1994/01/01", now(),50,1)



-- 2 TRIGGER - ESTACION FUERA DE SERVICIO
-- CUANDO UNA ESTACION ESTA FUERA DE SERVICIO, PONEMOS TODAS SUS BICIS , COMO NO DISPONIBLES

USE BICING;
SET FOREIGN_KEY_CHECKS = 0;  -- quita error 1451
SET SQL_SAFE_UPDATES = 0;  -- quita error 1175

drop trigger if exists BORRAR_ESTACION_AD;
delimiter $$
create trigger BORRAR_ESTACION_AD after delete
on ESTACION for each row
begin
	UPDATE bicicleta SET disponible = 0 where  id_estacion = old.id_estacion;
end $$


-- 1- COMPROBACION.

 delete from estacion where id_estacion = 5;
select * from bicicleta;
select * from estacion;


-- 3 TRIGGER- INSERTAR BICI  ,HACER MANTENIMIENTO SOCIOS SIN SALDO
-- si un usuario no tiene saldo lo eliminamos

USE BICING;
SET FOREIGN_KEY_CHECKS = 0;  -- quita error 1451
SET SQL_SAFE_UPDATES = 0;  -- quita error 1175

drop trigger if exists INSERTAR_BICI_AI;
delimiter $$
create trigger INSERTAR_BICI_AI after insert
on BICICLETA for each row
begin
	  DELETE FROM USUARIO WHERE SALDO= 0;

end $$


-- 1- COMPROBACION.

insert into bicicleta values(null,3,0,1,"manual");


select * from USUARIO;




-- *****************************************************************************
-- Añadir 1 CURSOR en un "procedure" en la base de datos explicando
-- con comentarios el funcionamiento del mismo.

-- CURSOR QUE PROPORCIONE INFORMACION DEL USUARIO
-- nos dira la edad que tiene el usuario  .
-- a partir de su nombre
-- *****************************************************************************

drop procedure if exists longer;
delimiter $$
create procedure longer (in in_nombre varchar(50))

begin

	-- declaramos la variables donde se guarda el valor total

    declare done boolean default false;
    declare fecha_primera, fecha_ultima datetime;
    declare in_dni varchar (9);
    declare tiempo float default 0;

    -- declaramos el cursor con el select con cuyos datos se va ha iterar
    declare cursor_ciclos cursor for
    select dni, fecha_nacimiento, fecha_alta from usuario where nombre = in_nombre;

  -- declaramos un manejador de error tipo NOT FOUND
	declare continue handler for not found set done =true;

	-- abrimos el cursor, el cursor se situa en elprimer puntero del resultado de la consulta
    open cursor_ciclos;

    -- empieza el bucle de lectura
    loop_lectura: loop
    -- se guarda el resultado en la variable, hay una variable y un campo en el select de la declaracion del cursor
    fetch cursor_ciclos into in_dni, fecha_primera, fecha_ultima ;

    -- se sale del bucle cuando no hay elementos por recorrer
    if done then
    leave loop_lectura;
    end if;
    set tiempo = tiempo +( select timestampdiff(minute,fecha_primera, fecha_ultima));
    end loop loop_lectura;

-- cerramos el cursor
    close cursor_ciclos;

    -- consultamos la variable
    select tiempo as edad_de_alta_MINUTOS_525600_es_un_año ;

end $$
delimiter ;
 call longer ('Tonio') ;



 -- *****************************************************************************
-- Añadir 1 EVENTO en la base de datos explicando
-- con comentarios el funcionamiento del mismo.

-- EVENTO DE COPIAS DE SEGURIDAD

-- *****************************************************************************

-- CREAMOS EL PROCEDURE  QUE LANZARA LAS COPIAS DE SEGURIDAD

drop procedure if exists copia_seguridad;
delimiter $$
create procedure copia_seguridad()
begin
	drop table if exists usuario_copia;
	CREATE TABLE usuario_copia LIKE usuario;
	INSERT usuario_copia SELECT * FROM usuario;

    drop table if exists bicicleta_copia;
    CREATE TABLE bicicleta_copia LIKE bicicleta;
	INSERT bicicleta_copia SELECT * FROM bicicleta;

    drop table if exists registro_alquiler_copia;
    CREATE TABLE registro_alquiler_copia LIKE registro_alquiler;
	INSERT registro_alquiler_copia SELECT * FROM registro_alquiler;

    drop table if exists estacion_copia;
    CREATE TABLE estacion_copia LIKE estacion;
	INSERT estacion_copia SELECT * FROM estacion;

    drop table if exists tarifa_copia;
	CREATE TABLE tarifa_copia LIKE tarifa;
	INSERT tarifa_copia SELECT * FROM tarifa;
end $$


-- CREAMOS EL EVENTO Y LO PROGRAMAMOS.

drop event if exists copia_seguridad;
create event copia_seguridad
on schedule every 7 day starts "2020-02-18 12:30"
do
call copia_seguridad();





-- Final TODO Challenge 2
