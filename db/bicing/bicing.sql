-- TODO Challenge 1: Añadir el código SQL que se indica en la descripción del Challenge 1
drop schema if exists db_timestamp;
create schema db_timestamp;
use db_timestamp;
create table usuarios(
id_usuario int primary key auto_increment,
email varchar(45),
nombre varchar(25),
apellidos varchar(100),
fecha_alta datetime default current_timestamp,
fecha_modif datetime default current_timestamp
on update current_timestamp,
tiempo_uso int,
pagado boolean
);
create table bicicletas(
id_bicicleta int primary key auto_increment,
estacion int,
electrica boolean
);
create table alquiler(
id_alquiler int primary key auto_increment,
usuario int,
inicio_uso datetime default current_timestamp,
constraint FK1 foreign key (usuario)
references usuarios(id_usuario)
on delete restrict on update cascade
);
create table mantenimiento(
id_mantenimiento int primary key auto_increment,
bicicleta int,
defectuosa boolean,
constraint FK2 foreign key (bicicleta)
references bicicletas(id_bicicleta)
on delete restrict on update cascade
);
insert into usuarios values
(null,"victor@gmail.com","Víctor","Aixalà","2020-02-05 19:19:52",default,30,true),
(null,"jm@gmail.com","Josep Maria","Magret","2020-02-05 19:19:53",default,45,true);

insert into bicicletas values
(null,61,true),
(null,61,false),
(null,61,true),
(null,62,false),
(null,62,false),
(null,62,true),
(null,62,true),
(null,301,true),
(null,301,true),
(null,301,false),
(null,302,false),
(null,302,true),
(null,302,true),
(null,302,false);

insert into alquiler values
(null, 1, "2020-02-05 19:19:54"),
(null, 2, "2020-02-05 20:19:54"),
(null, 2, "2020-02-06 19:19:54"),
(null, 2, "2020-03-05 19:20:54"),
(null, 1, "2020-08-05 19:30:54"),
(null, 1, "2021-02-05 19:45:54");

insert into mantenimiento values
(null,1,true),
(null,2,true),
(null,3,true),
(null,4,false),
(null,5,true),
(null,6,false),
(null,7,true),
(null,8,false),
(null,9,false),
(null,10,true),
(null,11,true),
(null,12,true),
(null,13,true),
(null,14,true);

-- 1. listado de usuarios
select * from usuarios;

-- 2. sacame el codigo o distrito de la estacion de bicis donde haya mas de dos bicis defectuosas
select estacion, count(*) as estropeadas from bicicletas B join mantenimiento M
on B.id_bicicleta = M.bicicleta
where defectuosa = true
group by estacion
having estropeadas > 2;

-- 3. listado de estaciones y número de bicicletas en cada estación
select estacion, count(*) from bicicletas group by estacion;

-- 4. número de bicis eléctricas por estación
select estacion, count(*) from bicicletas where electrica = true group by estacion;

-- 5. usuario, cuando ha cogido la bici y tiempo de uso
select u.*, inicio_uso, AddTime(inicio_uso, SEC_TO_TIME(tiempo_uso*60)) as limite_uso from usuarios u, alquiler;

-- 6. listado de bicicletas y si están estropeadas
select b.*, m.defectuosa
from bicicletas b join mantenimiento m
on b.id_bicicleta = m.bicicleta;


-- Final TODO Challenge 1
