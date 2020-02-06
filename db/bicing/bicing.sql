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
("93318174B","Lluis","Llorens","llorens@gmail.com",default);



create table bicicletas(
id_bici int primary key,
estado_bici varchar(10),
activa_bici bool
);
insert into bicicletas values
(1,"Active",true),
(2,"No_Active",false),
(3,"Active",true),
(4,"No_Active",true),
(5,"Active",true),
(6,"Active",true),
(7,"Active",true),
(8,"Active",true),
(9,"No_Active",false),
(10,"Active",true),
(11,"Active",true);

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
set @f_alta := (select fecha_alta from alquileres where usuario = "53118274P");
set @f_modif := (select fecha_modif from alquileres where usuario = "53118274P");
select @f_alta;
select @f_modif;
SELECT TIMESTAMPDIFF(MINUTE, @f_alta, @f_modif) AS minutos_transcurridos;

insert into alquileres values
(null,"2020-02-05 19:19:54","2020-02-05 19:40:44",1,"53118274P");





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


create table estaciones(
id_est int primary key,
barrio varchar(15),
capacidad int
);
insert into estaciones values
(1,"Gracia",10),
(2,"Carmelo",10),
(3,"Example",10),
(4,"Maresme",10);





-- Final TODO Challenge 1
