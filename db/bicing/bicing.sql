-- TODO Challenge 1: Añadir el código SQL que se indica en la descripción del Challenge 1


-- ---------- BICING --------------
-- JOSE LUIS ESTÉVEZ Y TONIO BLANCO
-----------------------------------

-- Borrarmos la db si existe
drop database if exists bicing;
-- Creamos la db si no existeara
create schema if not exists bicing; -- Crea db taller si no existe
-- Seleccionamos la db
use bicing;

-- CREAMOS TABLAS CON SUS RELACIONES
create table tarifa (
id_tarifa int primary key auto_increment,
nombre varchar(10) not null,
precio float not null
);

create table usuario (
dni varchar(9) primary key,
email nvarchar(50) not null,
nombre nvarchar(50) not null,
apellidos nvarchar(100),
fecha_nacimiento date not null,
fecha_alta datetime default current_timestamp,
fecha_baja date,
saldo float,
id_tarifa int not null,

constraint FK1 foreign key (id_tarifa)
references tarifa(id_tarifa)
on delete restrict on update cascade
);

create table estacion (
id_estacion tinyint primary key auto_increment,
estacion nvarchar(50) not null
);

create table bicicleta (
cod_bici int primary key auto_increment,
id_estacion tinyint not null,
mantenimiento tinyint not null,
disponible tinyint not null,
tipo_bici varchar(10) not null,

constraint FK2 foreign key (id_estacion)
references estacion(id_estacion)
on delete restrict on update cascade
);

create table registro_alquiler (
id_alquiler int primary key auto_increment,
dni varchar(9),
cod_bici int not null,
fecha_recogida datetime not null,
fecha_devolucion datetime not null,
estado_bici tinyint not null,
estacion_recogida tinyint not null,
estacion_devolucion tinyint not null,


constraint FK3 foreign key (dni)
references usuario(dni)
on delete restrict on update cascade,

constraint FK4 foreign key (cod_bici)
references bicicleta(cod_bici)
on delete restrict on update cascade,

constraint FK5 foreign key (estacion_recogida)
references estacion(id_estacion)
on delete restrict on update cascade,

constraint FK6 foreign key (estacion_devolucion)
references estacion(id_estacion)
on delete restrict on update cascade
);



-- INSERTAMOS DATOS
insert into tarifa values
(null,"basic",0.016),(null,"premium",0.025);

insert into usuario values
("47789568z","esteve@gmail.com","Jose Luis","Estévez","1984/01/01",current_timestamp(),null,50,1),
("49578956x","tonio@hotmail.com","Tonio","Garcia","1987/06/15",current_timestamp(),null,1,2),
("42178932m","shakira@hotmail.com","Shakira","Mebarak","1978/02/02",current_timestamp(),null,0,2);

insert into estacion values
(null,"Taller"),(null,"Pedralbes"),(null,"Gracia"),(null,"Poble Nou"),(null,"Eixample");

insert into bicicleta values
(null,4,0,1,"manual"),(null,5,0,0,"electrica"),(null,2,0,1,"manual"),(null,3,0,1,"manual"),(null,1,1,0,"electrica"),(null,4,0,1,"manual"),(null,4,0,1,"manual"),(null,5,0,1,"electrica"),(null,2,0,1,"electrica"),(null,4,1,1,"electrica"),(null,1,0,1,"electrica"),(null,1,0,1,"manual"),(null,2,0,1,"manual"),(null,5,0,1,"manual"),(null,1,1,0,"electrica");

insert into registro_alquiler values
(null,"47789568z",4,"2019/10/02 10:00:00","2019/10/02 11:30:00",0,2,3),
(null,"49578956x",3,"2019/10/02 10:30:00","2019/10/02 13:36:00",0,3,5),
(null,"49578956x",2,"2019/11/02 16:00:00","2019/11/02 18:30:00",0,5,2),
(null,"47789568z",1,"2019/11/22 17:00:00","2019/11/22 20:30:00",1,4,2),
(null,"42178932m",10,"2020/01/15 10:00:00","2020/01/15 11:30:00",0,3,3),
(null,"47789568z",8,"2020/01/18 12:00:00","2020/01/18 13:30:00",1,5,3),
(null,"49578956x",1,"2019/11/22 10:00:00","2019/11/22 11:30:00",1,4,2);


-- 15 CONSULTAS

use bicing;

-- 1.Muestra todos los registros de usuarios
select * from usuario;
-- 2.¿Cuantas bicicletas disponemos actualmente en bicing?
select count(*) as bicicletas_disponibles from bicicleta;

-- 3.Muestra las bicicletas electricas
select cod_bici, tipo_bici from bicicleta where tipo_bici = "electrica";

-- 4. cuantos registros de bicis se han realizado?
select count(*) from registro_alquiler;

-- 5. Cuantas bicicletas tenemos activas y cuantas en mantenimiento;
set @activas := (select count(*) from bicicleta where disponible = 1);
set @inactivas := (select count(*) from bicicleta where disponible = 0);
select @activas as Bicis_Disponible, @inactivas as Bicis_No_disponibles;

-- 6. Que usuario ha cogido más veces la bici.
set @maxi := (select max(cantidad) from (select count(*) as cantidad, dni from registro_alquiler group by dni) as results);
select dni, cantidad from (select count(*) as cantidad, dni from registro_alquiler r  group by dni) as tabla where cantidad = @maxi;

-- 7. Cuantas bicis hay en la estacion de "Eixample"
select count(*) as cantidad, e.estacion from bicicleta r inner join estacion e on r.id_estacion = e.id_estacion where e.estacion = "Eixample";

-- 8. Cuantas bicis hay en cada estacion
select count(*) as bicis, e.estacion from bicicleta r inner join estacion e on r.id_estacion = e.id_estacion group by e.estacion;

-- 9. Cuantos bicicletas se han alquilado en 2019
select count(*) as bicis_alquiladas_2019 from registro_alquiler where fecha_devolucion BETWEEN CAST('2019-01-01' AS DATE) AND CAST('2019-12-31' AS DATE);

-- 10. Que estación tiene más bicis
select max(cantidad), estacion from (select count(*) as cantidad, e.estacion from bicicleta r inner join estacion e on r.id_estacion = e.id_estacion group by e.estacion) as tabla;

-- 11. Cuanto tiempo ha utilizado el servicio "Tonio"?
set @dni := (select dni from usuario where nombre = "Tonio");
select id_alquiler from registro_alquiler where dni = "49578956x";
set @f_alta := (select fecha_recogida from registro_alquiler where dni = @dni and id_alquiler = 2);
set @f_devolucion := (select fecha_devolucion from registro_alquiler where dni = @dni and id_alquiler = 2);
set @id1 := (select timestampdiff(minute, @f_alta, @f_devolucion) as minutos_transcurridos);
set @f_alta := (select fecha_recogida from registro_alquiler where dni = @dni and id_alquiler = 3);
set @f_devolucion := (select fecha_devolucion from registro_alquiler where dni = @dni and id_alquiler = 3);
set @id2 := (select timestampdiff(minute, @f_alta, @f_devolucion) as minutos_transcurridos);
set @f_alta := (select fecha_recogida from registro_alquiler where dni = @dni and id_alquiler = 7);
set @f_devolucion := (select fecha_devolucion from registro_alquiler where dni = @dni and id_alquiler = 7);
set @id3 := (select timestampdiff(minute, @f_alta, @f_devolucion) as minutos_transcurridos);
set @total = (@id1 + @id2 + @id3);
select @total as Tiempo_servicio_MIN;

-- 12. Cuanto dinero se ha gastado "Tonio" en el bicing?
set @tarifa := (select t.precio from tarifa t inner join usuario u on t.id_tarifa = u.id_tarifa where u.nombre = "Tonio");
set @gastado = @total * @tarifa;
select @gastado as Tonio_gastado_bicing;

-- 13 Que usuario tiene menos dinero.
select nombre, min(saldo) from usuario;

-- 14 Cuanto se ha gastado "Jose Luis" en su último viaje en bici
set @dni := (select dni from usuario where nombre = "Jose Luis");
set @ultimo_viaje := (select max(id_alquiler) from registro_alquiler where dni = @dni);
set @f_alta := (select fecha_recogida from registro_alquiler where dni = @dni and id_alquiler = @ultimo_viaje);
set @f_devolucion := (select fecha_devolucion from registro_alquiler where dni = @dni and id_alquiler = @ultimo_viaje);
set @tiempo := (select timestampdiff(minute, @f_alta, @f_devolucion) as minutos_transcurridos);
select @tiempo as ultimoviaje_JoseLuis_MIN;

-- 15 Cual es la última bici alquilada?
select b.cod_bici as Última_bici_alquilada, max(r.id_alquiler) as Id_Alquiler from bicicleta b inner join registro_alquiler r on r.cod_bici = b.cod_bici;




-- Final TODO Challenge 1
