-- Challenge 1

-- Inicializacion
drop schema if exists bicing;
create schema bicing;
use bicing;

-- Tablas de usuarios registrados
drop table if exists usuarios;
create table usuarios (
	id_usuario int primary key auto_increment,
    nombre varchar (50),
    apellidos varchar(50),
    email varchar(50),
    fecha_alta datetime default current_timestamp,
    cuenta_facturacion varchar(30),
    pagado bool
);

-- Tabla de bajas de usuarios
drop table if exists usuarios_bajas;
create table usuarios_bajas(
	id_usuario int primary key,
    nombre varchar(50),
    apellidos varchar(50),
    email varchar(50),
    fecha_baja datetime default current_timestamp,
    deudas bool
);

-- Tablas de biciletas y estaciones
drop table if exists bicis;
create table bicis(
	id_bici int primary key auto_increment,
    -- En tipo_bici 0 corresponde a una bici de 2 marchas, 1 a una de 5 y 2  auna bici eléctrica
    tipo_bici int,
    estacion varchar(50)
);

-- Tabla alquileres
drop table if exists alquileres;
create table alquileres (
	id_alquiler int primary key auto_increment,
	id_usuario int,
    id_bici int,
    fecha_alquiler datetime default current_timestamp,
    fecha_devolucion datetime,
    estacion_final varchar(50),
    en_uso bool,
    constraint FK1 foreign key (id_usuario) references usuarios(id_usuario) on delete restrict on update cascade,
	constraint FK2 foreign key (id_bici) references bicis(id_bici) on delete restrict on update cascade
);

-- Tabla mantenimiento
drop table if exists mantenimiento;
create table mantenimiento (
	id_mantenimiento int primary key auto_increment,
    id_bici int,
    fecha_baja datetime default current_timestamp,
    constraint FK3 foreign key (id_bici) references bicis(id_bici) on delete restrict on update cascade
);

-- Inserts de las tablas

insert into usuarios values 
(null,"Pepe", "Perez Perez","perezcuadrado@gmail.com",default,"ES79 2100 0813 6101 2345 6789",1),
(null, "Pepa","Pereza Pereza","muchapereza@hotmail.com", default,"ES42 5400 8612 5402 9999 1111",0);



insert into usuarios_bajas values
(3,"Gonzalo","Gonzalez Gonzalez","gonzalisimo@yahoo.com", default, 1);

insert into bicis values
(null,0,"Gràcia"),
(null,2,"Eixampla dret"),
(null,2,"Eixampla esquerra"),
(null,0,"Sant Andreu"),
(null,1,"Hospitalet"),
(null,0,"Sarrià"),
(null,0,"Gràcia"),
(null,1,"Gràcia"),
(null,2,"Sarrià"),
(null,0,"Eixampla dret"),
(null,1,"Eixampla esquerra"),
(null,0,"Sant Andreu"),
(null,0,"Hospitalet");

insert into alquileres values
(null,1,1,default, '2020-03-01 23:59:45',"Eixampla esquerra",0),
(null,1,3,default,null,null,1);

insert into mantenimiento values
(null,8,default),
(null,12,default),
(null,11,default);

-- Queries
-- 1 mostrar usuarios registrados
select * from usuarios; 

-- 2 mostrar usuarios dados de baja
select * from usuarios_bajas;

-- 3 mostrar bicis
select * from bicis;

-- 4 mostrar registro de alquileres
select * from alquileres;

-- 5 mostrar bicis en mantenimineto
select * from mantenimiento;

-- 6 mostrar usuarios endeudados
select * from usuarios U join usuarios_bajas UB where U.pagado = 0 or UB.deudas = 0 group by U.id_usuario;

-- 7 mostrar numero de cada tipo de bici
select tipo_bici,count(*) from bicis group by tipo_bici;

-- 8 mostrar bicis disponibles
select * from bicis   where not exists (select 1 from mantenimiento  where bicis.id_bici = mantenimiento.id_bici) and 
not exists (select 1 from alquileres where alquileres.en_uso = 1 and bicis.id_bici = alquileres.id_bici);

-- 9 mostrar estaciones con bicis disponibles en cada estacion
select estacion, count(*) as bicis from bicis    where not exists (select 1 from mantenimiento  where bicis.id_bici = mantenimiento.id_bici) and 
not exists (select 1 from alquileres where alquileres.en_uso = 1 and bicis.id_bici = alquileres.id_bici) group by estacion;

-- 10 mostrar cuantos alquileres hay en cada estación


SELECT DISTINCT bicis.estacion, 
       (SELECT COUNT(*) FROM alquileres
        WHERE id_bici = bicis.id_bici) AS alquileres
FROM bicis;

