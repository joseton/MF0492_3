-- TODO Challenge 1: Añadir el código SQL que se indica en la descripción del Challenge 1
drop schema if exists bicing;
create schema bicing;
use bicing;


create table usuarios(
dni varchar(9) primary key,
nombre varchar(25),
apellidos varchar(50),
email varchar(40),
fecha_alta datetime default current_timestamp
);
insert into usuarios values
("53118274P","Albert","Valles","albert@gmail.com",default),
("93318174B","Lluis","Llorens","llorens@gmail.com",default),
("13315174E","Jordi","Esteve","loreto@gmail.com",default),
("53315174C","Carlos","Randero","randero@gmail.com",default),
("73315174Y","Salva","Bolufer","bolufer@gmail.com",default),
("84445174W","Joaquim","Pietro","pietro@gmail.com",default),
("33315174D","Joan","Valero","valero@gmail.com",default),
("52215174T","Charly","Vinent","vicents@gmail.com",default),
("21115174V","Andreu","Casals","casals@gmail.com",default),
("63315174C","Lluis","Bertomeu","bertomeu@gmail.com",default),
("83225174A","Alvaro","Laporta","laporta@gmail.com",default);

create table estaciones(
id_est int primary key,
barrio varchar(15),
capacidad int
);
insert into estaciones values
(1,"Gracia",10),
(2,"Carmelo",20),
(3,"Example",15),
(4,"Maresme",8);


create table bicicletas(
id_bici int primary key,
estado_bici varchar(10),
activa_bici boolean,
parking int,
constraint fk10 foreign key (parking)
references estaciones(id_est)
on delete restrict on update cascade

);
insert into bicicletas values
(1,"Active",true,1),
(2,"No_Active",false,2),
(3,"Active",true,1),
(4,"No_Active",true,4),
(5,"Active",true,2),
(6,"Active",true,3),
(7,"Active",true,3),
(8,"Active",true,2),
(9,"No_Active",false,4),
(10,"Active",true,3),
(11,"Active",true,4);

create table alquileres(
id_alq int primary key auto_increment,
fecha_alta datetime,
fecha_modif datetime,
bicicleta int,
usuario varchar(9),

constraint fk1 foreign key (usuario)
references usuarios(dni)
on delete restrict on update cascade,
constraint fk2 foreign key (bicicleta)
references bicicletas(id_bici)
on delete restrict on update cascade
);


insert into alquileres values (null,"2020-02-05 19:19:54","2020-02-05 19:40:44",1,"53118274P");
insert into alquileres values (null,"2020-02-05 10:20:54","2020-02-05 10:30:54",2,"93318174B");
insert into alquileres values (null,"2020-02-05 11:09:14","2020-02-05 09:10:09",3,"13315174E");
insert into alquileres values (null,"2020-02-05 19:19:54","2020-02-05 19:55:15",4,"53315174C");
insert into alquileres values (null,"2020-02-05 19:00:00","2020-02-05 19:10:20",5,"73315174Y");
insert into alquileres values (null,"2020-02-05 14:30:00","2020-02-05 15:00:17",6,"84445174W");
insert into alquileres values (null,"2020-02-05 10:30:30","2020-02-05 10:45:00",8,"52215174T");
insert into alquileres values (null,"2020-02-05 20:20:00","2020-02-05 21:30:55",9,"21115174V");
insert into alquileres values (null,"2020-02-05 19:00:54","2020-02-05 19:40:44",10,"63315174C");






create table facturas(
id_fact int primary key auto_increment,
fecha_fact datetime default current_timestamp,
usuario varchar(9),
constraint fk3 foreign key (usuario)
references usuarios(dni)
on delete restrict on update cascade
);
insert into facturas values
(null,default,"53118274P"),
(null,default,"93318174B");





-- CONSULTAS

-- #001 Obtener todos los usuarios.
		select * from usuarios;
-- #002 Obtener todos los usuarios.
		select * from bicicletas;
-- #003 Obtener todos los alquileres.
		select * from alquileres;
-- #003 Obtener todos los alquileres.
		select * from estaciones;
-- #004	Obtener las Bicicletas que estan Activas.
		select * from bicicletas where estado_bici = "Active";
-- #005 Obtener las Bicicletas que no estan en funcionamiento.
		select * from bicicletas where estado_bici = "No_Active";
-- #006 Obtener el número de bicicletas que hay en cada estacion.
		select count(*) from bicicletas group by parking;
-- #007 Activar las bicis
		update bicicletas set estado_bici = "Active";
        set sql_safe_updates = 0;
-- #008 Añadir una nueva estacio de bicicletas
		insert into estaciones values (5,"Sant Gervasi",10);
-- #009 Crear una lista de todos los DNI
		select dni from usuarios;
-- #010 Saber cuantas bicicletas hay activas en la parada de Gracia.
		select id_bici from bicicletas  join estaciones on parking=id_est where  estado_bici = "Active"  and  barrio =  "Gracia";
-- #011 Ordenar las estaciones por capacidad de bicicletas de mayor a menor.
		select * from estaciones order by capacidad  desc;
-- #012 Sacar el promedio de bicis en todas las estaciones.
		select avg(capacidad) from estaciones; -- not working
-- #013 Calcular el tiempo consumido de un usuario.
		set @f_alta := (select fecha_alta from alquileres where usuario = "53118274P");
		set @f_modif := (select fecha_modif from alquileres where usuario = "53118274P");
		select @f_alta;
		select @f_modif;
		SELECT TIMESTAMPDIFF(MINUTE, @f_alta, @f_modif) AS minutos_transcurridos;
-- #014

-- #015


-- Final TODO Challenge 1
