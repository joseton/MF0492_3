-- TODO Challenge 1: Añadir el código SQL que se indica en la descripción del Challenge 1
drop database if exists bicing;
create database if not exists bicing;
use bicing;

create table usuarios(
	id_usuario int primary key auto_increment,
    nombre varchar(45),
    apellidos varchar(100),
    email  varchar(100),
    contraseña varchar(50),
    dni varchar(9),
    fecha_nac date,
    telefono varchar(20),
    direccion varchar (100),
    ciudad varchar(50),
    cod_postal varchar(6),
    newsletter boolean,
    activo boolean

);


create table fabricantes (
	id_fabricante int primary key auto_increment,
    nombre varchar(45),
    telefono varchar(20)
);

create table estaciones(
	id_estacion int primary key auto_increment,
    nombre varchar(45),
    direccion varchar(100),
    capacidad int
);

create table tarifas(
	id_tarifa int primary key auto_increment,
    nombre varchar(45),
    es_electrica boolean,
    treinta float,
    hastados float,
    masdedos float,
    precio_anual float
);


create table averias(
	id_averia int primary key auto_increment,
    nombre varchar(50),
    tiempo_rep time,
    coste float
);

create table usuarios_tarifas(
	id_usuario int primary key,
    id_tarifa int,
    fecha_alta datetime default current_timestamp,
    fecha_baja date,
    moroso boolean,

	constraint FKUT1 foreign key(id_usuario)
    references usuarios(id_usuario)
    on delete restrict on update cascade,

	constraint FKUT2 foreign key(id_tarifa)
    references tarifas(id_tarifa)
    on delete restrict on update cascade

);

create table bicicletas(
	id_bicicleta int primary key auto_increment,
    es_electrica boolean,
    cod_fab int,

    constraint FKB1 foreign key(cod_fab)
    references fabricantes(id_fabricante)
    on delete restrict on update cascade
);

create table averia_bicicletas(
	id_averia int primary key auto_increment,
    id_bicicleta int,
    cod_averia int,

    constraint FKAB1 foreign key(cod_averia)
    references averias(id_averia)
	on delete restrict on update cascade,

	constraint FKAB2 foreign key(id_bicicleta)
    references bicicletas(id_bicicleta)
	on delete restrict on update cascade
);

create table averia_estaciones(
	id_averia int primary key auto_increment,
	id_estacion int,
    cod_averia int,

	constraint FKAE1 foreign key(cod_averia)
    references averias(id_averia)
	on delete restrict on update cascade,

	constraint FKAE2 foreign key(id_estacion)
    references estaciones(id_estacion)
	on delete restrict on update cascade
);

create table alquileres(
	id_alquiler bigint primary key auto_increment,
    id_bicicleta int,
    id_usuario int,
    estacion_salida int,
    fecha_salida datetime default current_timestamp,
    estacion_llegada int,
    fecha_llegada datetime default current_timestamp on update current_timestamp,
    precio float,

	constraint FKA1 foreign key(id_bicicleta)
    references bicicletas(id_bicicleta)
	on delete restrict on update cascade,

    constraint FKA2 foreign key(id_usuario)
    references usuarios(id_usuario)
	on delete restrict on update cascade,

	constraint FKA3 foreign key(estacion_salida)
    references estaciones(id_estacion)
	on delete restrict on update cascade,

	constraint FKA4 foreign key(estacion_llegada)
    references estaciones(id_estacion)
	on delete restrict on update cascade
);


-- INSERTS_______________________________________________________________________________________________________________
use bicing;

insert into tarifas values
(null, "Tarifa Plana", false, 0, 0.7, 5, 50),
(null, "Tarifa Plana", true, 0.35, 0.9, 5, 50 ),
(null, "Tarifa d'ús", false, 0.35, 0.7, 5, 35),
(null, "Tarifa d'us", true, 0.55, 0.9, 5, 35);


insert into fabricantes values
(null, "BH", "+34365417987"),
(null, "Orbea", "+34365371798"),
(null, "Cannondale", "+47365417987"),
(null, "Vitoria", "+343654179844");

insert into estaciones values
(null, "Sagrada familia", "Carrer sagrada familia ", 15 ),
(null, "Parc Guell", "Carrer parc guell ", 4),
(null, "Sants estació", "Carrer Sants estació ", 20),
(null, "Palau reial", "Carrer Palau reial ", 60 ),
(null, "Secretari Coloma ", "Carrer Secretari Coloma ", 20),
(null, "Taxdir ", "CarrerTaxdir", 50),
(null, "Rambla Catalunya", "Carrer Rambla Catalunya ", 10 ),
(null, "Plaza Espanya ", "Carrer Plaza Espanya ", 12),
(null, "Barceloneta ", "Carrer Barceloneta ", 15),
(null, "Maria Cristina ", "Carrer Maria Cristina ", 20),
(null, "Corsega ", "Carrer Corsega", 30 ),
(null, "CIFO la Violeta ", "Carrer CIFO la Violeta ", 10 ),
(null, "L'illa ", "Carrer L'illa ", 15);

insert into bicicletas values
(null, true, 1),
(null, true, 2),
(null, true, 2),
(null, true, 3),
(null, true, 1),
(null, true, 1),
(null, true, 2),
(null, true, 2),
(null, false, 3),
(null, true, 3),
(null, true, 1),
(null, false, 1),
(null, true, 1),
(null, true, 1),
(null, false, 1),
(null, true, 1),
(null, true, 1),
(null, true, 1),
(null, true, 2),
(null, true, 2),
(null, true, 3),
(null, true, 1),
(null, true, 1),
(null, true, 2),
(null, true, 2),
(null, false, 3),
(null, true, 3),
(null, true, 1),
(null, false, 1),
(null, true, 1),
(null, true, 1),
(null, false, 1),
(null, true, 1),
(null, true, 1),
(null, true, 1),
(null, true, 2),
(null, true, 2),
(null, true, 3),
(null, true, 1),
(null, true, 1),
(null, true, 2),
(null, true, 2),
(null, false, 3),
(null, true, 3),
(null, true, 1),
(null, false, 1),
(null, true, 1),
(null, true, 1),
(null, false, 1),
(null, true, 1),
(null, true, 1),
(null, true, 1);

insert into averias values
(null, "manillar", '00:30:00', 15.50),
(null, "pinchazo", '00:15:00', 5 ),
(null, "freno", '01:00:00', 10),
(null, "luz", '00:10:00', 5.50),
(null, "sillín", '00:05:00', 10.20),
(null, "cuadro", '02:00:00', 100),
(null, "radios", '01:00:00', 3),
(null, "batería", '00:20:00', 35.50),
(null, "anclajes", '00:30:00', 15.50),
(null, "cesta", '00:40:00', 10.50),
(null, "pantalla de control", '01:30:00', 300.50),
(null, "pedales", '00:20:00', 20.30),
(null, "protector rueda", '00:30:00', 10.20);


insert into averia_estaciones values
(null, 5, 9),
(null, 8, 11);


insert into averia_bicicletas values
(null, 12, 3),
(null, 12, 1),
(null, 13, 4),
(null, 10, 3),
(null, 5, 9),
(null, 1, 1),
(null, 2, 4),
(null, 11, 5);

insert into usuarios values
(null, "Luis", "Gomez", "luisgomez@homtail.com", md5(456781332),"345686Z", '2020-01-01', "+34895564710", "Carrer Villamayor", "Bcn", "08405", true, false),
(null, "Ramon", "Suarez", "ramonsuarez@homtail.com", md5(1456781296234),"478912L", '1984-12-12', "+34895564771", "Carrer Secretari Coloma", "Bcn", "08054", false, true),
(null, "Juan", "Jimenez", "juanjimenez@homtail.com", md5(7894525212),"021445H", '1974-05-02', "+34895564712", "Carrer Taxdir", "Bcn", "08405", false, false),
(null, "Marcos", "Gonzalez", "marcosgonzalez@homtail.com", md5(1256985),"369875V", '1980-02-15', "+34895564773", "Carrer Palomo", "Bcn", "08405", true, true),
(null, "Carla", "Fernandez", "carlafernandez@homtail.com", md5(46931250),"496698S", '1980-12-12', "+34895564774", "Carrer Colon", "Bcn", "08025", true, true),
(null, "Martina", "Alcazar", "martinaalcazar@homtail.com", md5(1025400236),"163215T", '1980-11-12', "+34895564775", "Carrer Tuset", "Bcn", "08405", true, false),
(null, "Andrea", "Rodriguez", "andrearodriguez@homtail.com", md5(0120156896),"968965Q", '1980-12-9', "+34895564776", "Carrer Ramon Cortes", "Bcn", "08405", true, true),
(null, "Jorge", "Villamayor", "jorgevillamayor@homtail.com", md5(12540032562),"169854Q", '1980-12-12', "+34895564777", "Carrer Mediodía", "Bcn", "08458", true, true),
(null, "Armand", "Laplana", "armanlaplana@homtail.com", md5(1254003254512),"6963121A", '1980-12-15', "+34895564748", "Carrer Arquitecte Ros", "Bcn", "08405", false, true),
(null, "Pilar", "Aparicio", "pilaraparicio@homtail.com", md5(125458585960),"2345685W", '1980-04-12', "+34895564759", "Carrer Roses", "Bcn", "08658", false, true),
(null, "Gema", "Martinez", "gemamartinez@homtail.com", md5(125632556),"568778F", '1980-12-19', "+34895564765", "Carrer Pi i Margall", "Bcn", "08405", false, false),
(null, "Laura", "Ruiz", "lauraruiz@homtail.com", md5(12345024545),"365654W", '1980-02-12', "+34895564733", "Carrer Font Segura", "Bcn", "08145", true, true);

insert into usuarios_tarifas values

(1, 1, default, null, true),
(2, 2, default, null, false),
(3, 2, default, null, false),
(4, 3, default, null, true),
(5, 3, default, null, false),
(6, 4, default, null, false),
(7, 1, default, null, true),
(8, 1, default, null, false),
(9, 1, default, null, true),
(10, 4, default, null, false),
(11, 1, default, null, false),
(12, 1, default, null, true);

insert into alquileres values
(null, 3, 1, 1, default, null, null, null),
(null, 2, 2, 2, default, null, null, null),
(null, 4, 3, 3, default, null, null, null),
(null, 6, 4, 3, default, null, null, null),
(null, 7, 5, 2, default, null, null, null),
(null, 9, 6, 5, default, null, null, null),
(null, 15, 7, 6, default, null, null, null),
(null, 16, 8, 7, default, null, null, null),
(null, 18, 9, 10, default, null, null, null),
(null, 22, 10, 13, default, null, null, null);
-- _______________________________________________________________________________________________________________




-- CONSULTAS_______________________________________________________________________________________________________________

use bicing;
-- CONSULTAS
-- 1 Obtener las distintas tarifas  del bicing
select * from tarifas ;
-- 2 Obtener los usuarios activos
select * from usuarios where activo = true;
-- 3 Obtener las averias que sean mas baratas de 20€
select * from averias where coste < 20;

-- Obtener los nombres de fabricantes que tengan numero de telefono que sea de España
select nombre, telefono from fabricantes where telefono like "+34%";

-- 5 Aplicar un descuento del 25% a las tarifas anuales(a todas, tanto las de 50€ como las de 35€).
set sql_safe_updates=0;
update tarifas  set precio_anual = precio_anual * 0.85;

-- 6 Obtener un listado completo de todas las averias, tanto de bicicletas como de estaciones.
select "Bicicleta" as TipoAveria, A.nombre from averia_bicicletas AB join averias A on AB.cod_averia=A.id_averia
union select "Estación" as TipoAveria, A.nombre from averia_estaciones AE join averias A on AE.cod_averia=A.id_averia;

-- union = nos une el resultado de dos consultas, que tienen que tener los mismos campos(mismo numero de campos)

-- 7  Obtener un listado de todos los usuarios que empiecen por "A".
select * from usuarios where nombre like 'A%';

-- 8 Obtener todos los alquileres donde la estacion de salida sea la estacion num. 1 .
select * from alquileres where estacion_salida = 1;

-- 9 Obtener los usuarios que tengan contratada la "Tarifa Plana"
select U.nombre, U.apellidos, U.telefono from usuarios U join usuarios_tarifas UT on U.id_usuario = UT.id_usuario join tarifas T  on T.id_tarifa  = UT.id_tarifa;


-- 10 Obtener las averias que duren menos de 1 hora, y que su coste de reparacion sea menor de 30€
select * from averias where tiempo_rep < '01:00:00';

-- 11 Registrar una nueva avería de estacion llamada "Interfono" en averias.
insert into averias values (null, "Interfono", '01:00:00', 30);

-- 12 Comprobar los usuarios que han alquilado una bicicleta
select distinct U.id_usuario, U.nombre, U.apellidos, U.activo   from usuarios U join alquileres A on U.id_usuario = A.id_usuario;

-- 13 Añadir una nueva tarifa anual llamada Tarifa Contento, cuyo precio sea 20€. El precio de la tarifa será..
		-- 13.1 Los primeros 30 min de esta tarifa, costará 0,10€.
		-- 13.2 Hasta 2 horas, costará 1,70€
		-- 13.2 Más de 2 horas, costará 3,20€
insert into tarifas values
(null, "Tarifa Contento", true, 0.10, 1.70, 3.20, 20);

-- 14 Borrar todos los usuarios que sean morosos.
delete from usuarios_tarifas where moroso = true;

-- 15 Borrar todos los usuarios
delete from usuarios;

-- _______________________________________________________________________________________________________________




-- TIEMPO-PRECIO_______________________________________________________________________________________________________________

use bicing;
-- /////////////UPDATE FECHA LLEGADA/////////////
-- CUANDO UN USUARIO DEJA LA BICI EN UNA ESTACION
update alquileres set estacion_llegada=4, fecha_llegada=default where id_alquiler=5;

set @f_salida := (select fecha_salida from alquileres where id_alquiler=5);
set @f_llegada := (select fecha_llegada from alquileres where id_alquiler=5);

select timestampdiff(minute, @f_salida, @f_llegada) as tiempodeuso;

-- //////////////////CALCULO COSTE, A RAZON DE TIEMPO DE USO/////////////
-- Obtener el precio de la tarifa que pertenece a tarifa.
select T.treinta, T.hastados, T.masdedos from alquileres A
join usuarios U on A.id_alquiler = U.id_usuario
join usuarios_tarifas UT on UT. id_usuario = U.id_usuario
join tarifas T on UT.id_tarifa =  T. id_tarifa
where id_alquiler=5;

-- CON EL TIEMPO QUE HA ESTADO Y CONSULTANDO EL PRECIO CONTRATADO CALCULAR EL COSTE Y ACTUALIZAR DE LA TABLA 'ALQUILER' EL CAMPO 'PRECIO'

-- _______________________________________________________________________________________________________________
-- coment
-- Final TODO Challenge 1
