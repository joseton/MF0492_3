-- TODO Challenge 1: Añadir el código SQL que se indica en la descripción del Challenge 1
drop schema if exists bicing;
create schema bicing;
use bicing;

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
estacion varchar(3),
electrica boolean
);

create table alquiler(
id_alquiler int primary key auto_increment,
usuario int,
inicio_uso datetime default current_timestamp,
fin_uso datetime,
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
(null,"061",true),
(null,"061",false),
(null,"061",true),
(null,"062",false),
(null,"062",false),
(null,"062",true),
(null,"062",true),
(null,"301",true),
(null,"301",true),
(null,"301",false),
(null,"302",false),
(null,"302",true),
(null,"302",true),
(null,"302",false);

insert into alquiler values
(null, 1, "2020-02-05 19:19:54", "2020-02-05 19:49:54"),
(null, 2, "2020-02-05 20:19:54", "2020-02-05 20:49:54"),
(null, 2, "2020-02-06 19:19:54", "2020-02-06 20:19:54"),
(null, 2, "2020-03-05 19:20:54", "2020-03-05 19:53:54"),
(null, 1, "2020-08-05 19:30:54", "2020-08-05 20:05:54"),
(null, 1, "2021-02-05 19:45:54", "2021-02-05 20:30:54");

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
select estacion, count(*)
from bicicletas
group by estacion;

-- 4. número de bicis eléctricas por estación
select estacion, count(*)
from bicicletas
where electrica = true
group by estacion;

-- 5. usuario, cuando ha cogido la bici y hora límite de uso
select u.*, inicio_uso, AddTime(inicio_uso, SEC_TO_TIME(tiempo_uso*60)) as limite_uso
from usuarios u, alquiler;

-- 6. listado de bicicletas y si están estropeadas
select b.*, m.defectuosa
from bicicletas b join mantenimiento m
on b.id_bicicleta = m.bicicleta;

-- 7. impago
update usuarios
set pagado = false
where id_usuario = 1;
select * from usuarios where pagado = false;

-- 8. estaciones ordenadas por número de bicicletas descendente
select estacion, count(*) as num_bicis
from bicicletas
group by estacion
order by num_bicis desc, estacion;

-- 9. mover todas las bicis eléctricas a las estaciones 30x, y las normales a las 6x
set sql_safe_updates = 0;
update bicicletas
set estacion = concat("30", substring(estacion, 2, 1))
where estacion between 61 and 69 and electrica = true;
update bicicletas
set estacion = concat("6", substring(estacion, 3, 1))
where estacion between 301 and 309 and electrica = false;
select * from bicicletas;

-- 10. número de alquileres de cada usuario este año
select u.nombre, u.apellidos, count(*) as num_alquileres
from usuarios u join alquiler a
on u.id_usuario = a.usuario
where a.inicio_uso like '2020%'
group by u.id_usuario;

-- 11. alquileres que se han pasado en el tiempo de uso y cantidad de minutos 
select u.nombre, u.apellidos, timestampdiff(minute, a.inicio_uso, a.fin_uso) - u.tiempo_uso as minutos
from usuarios u join alquiler a
on u.id_usuario = a.usuario
having minutos > 0;

-- 12. Número de alquileres por usuario
select u.nombre, u.apellidos, count(*) as num_alquileres
from usuarios u join alquiler a
on u.id_usuario = a.usuario
group by u.id_usuario;

-- 13. El usuario 1 ahora tiene 45 minutos de uso (revisamos respecto la consulta 11)
update usuarios
set tiempo_uso = 45
where id_usuario = 1;
select u.nombre, u.apellidos, timestampdiff(minute, a.inicio_uso, a.fin_uso) - u.tiempo_uso as minutos
from usuarios u join alquiler a
on u.id_usuario = a.usuario
having minutos > 0;

-- 14. Número de estaciones que tiene cada distrito (dde = d: distrito, e: estacion)
select concat("080", substring(estacion, 1, length(estacion) - 1)) as distrito,
count(distinct(estacion)) as num_estaciones
from bicicletas
group by distrito;

-- 15. Número de bicicletas estropeadas por tipología
select electrica, count(*)
from mantenimiento m join bicicletas b
on m.bicicleta = b.id_bicicleta
group by defectuosa;
-- Final TODO Challenge 1
