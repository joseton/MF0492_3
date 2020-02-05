-- TODO Challenge 1: Añadir el código SQL que se indica en la descripción del Challenge 1
drop schema if exists bicing;
create schema bicing;
use bicing;

create table tarifas(
id_trf int primary key,
nombre_trf varchar(10),
unid_1 varchar(25),
precio_1 float,
unid_2 varchar(25),
precio_2 float,
unid_3 varchar(25),
precio_3 float
);

create table usuarios(
dni varchar(9) primary key,
nombre varchar(25),
apellidos varchar(50),
email varchar(40),
contraseña varchar(8),
fecha_alta datetime default current_timestamp,
fecha_baja datetime,
tarifa int,
constraint fk1 foreign key (tarifa)
references tarifas(id_trf)
on delete restrict on update cascade
);

create table facturas(
id_fra int primary key,
fecha_fact datetime,
credito float,
importe float,
usuario varchar(9),
constraint fk1 foreign key (usuario)
references usuarios(dni)
on delete restrict on update cascade
);

create table estaciones(
id_est int primary key,
barrio varchar(15),
capacidad int
);

create table bicicletas(
id_bici int primary key,
estado_bici varchar(10),
activa_bici bool
);

create table alquileres(
id_alq int primary key,
fecha_ini datetime,
fecha_fin datetime,
bicicleta int,
constraint fk1 foreign key (bicicleta)
references bicicletas(id_bici)
on delete restrict on update cascade,
estac_ini int,
constraint fk2 foreign key (estac_ini)
references estaciones(id_est)
on delete restrict on update cascade,
estac_fin int,
constraint fk3 foreign key (estac_fin)
references estaciones(id_est)
on delete restrict on update cascade
);

-- Final TODO Challenge 1
