-- TODO Challenge 1: Añadir el código SQL que se indica en la descripción del Challenge 1
drop schema if exists bicing;
create schema bicing;
use bicing;

create table usuario(
dni varchar(9) primary key,
nombre varchar(100),
apellido varchar(200),
email varchar(100)
);
create table puntos(
	id_punto int primary key auto_increment,
    coordenada varchar(100),
    barrio varchar(100),
    capacidad_bici int,-- por ejemplo 100
    bici_actual int ,-- por ejemplo 50 al iniciar el negocio
    taller bool
  );
  create table bicicletas(
	id_bici int primary key auto_increment,
	averiado bool default 0,
    fecha_incorporation datetime default current_timestamp
    );
  create table contratos(
  id_contrato int primary key auto_increment,
  fecha_cont datetime default current_timestamp,
  id_usuario varchar(9),
  constraint  FK1 foreign key (id_usuario)
  references  usuario(dni)
  on delete restrict on update cascade
  );

create table furgon(
-- estado inicial de los furgones al empezar el negocio es vacio
id_furgon varchar(9) primary key,
capacidad_bici int,
bicis_actuales int
);

create table salida_bici(
localizador int primary key auto_increment,
id_salida varchar(9),
id_bici int,
momento datetime default current_timestamp,
id_punto int,
furgon bool ,
--  constraint  FK22 foreign key (id_salida)
--  references  usuario(dni)
-- on delete restrict on update cascade,
-- constraint  FK23 foreign key (id_salida)
-- references  furgon(id_furgon)
-- on delete restrict on update cascade,

constraint  FK3 foreign key (id_bici)
references  bicicletas(id_bici)
on delete restrict on update cascade,
constraint  FK4 foreign key (id_punto)
references  puntos(id_punto)
on delete restrict on update cascade
);
create table entrada_bici(
localizador int primary key auto_increment,
id_entrada varchar(9),
id_bici int,
momento datetime default current_timestamp,
id_punto int,
furgon bool ,
-- constraint  FZ foreign key (id_entrada)
-- references  usuario(dni)
-- on delete restrict on update cascade,
-- constraint  FO foreign key (id_entrada)
-- references  furgon(id_furgon)
-- on delete restrict on update cascade,
constraint  FK5 foreign key (id_bici)
references  bicicletas(id_bici)
on delete restrict on update cascade,
constraint  FK6 foreign key (id_punto)
references  puntos(id_punto)
on delete restrict on update cascade

);
insert into usuario values
("111111111","Juan","Perez","juan@fasd.com"),
("222222222","Pedro","Paramo","pedro@fasd.com"),
("333333333","Armand","Laplana","armand@fasd.com"),
("444444444","Ruben","Fernandez","ruben@fasd.com"),
("555555555","Victor","Aixala","victor@fasd.com"),
("666666666","Vicente","Mateu","vicente@fasd.com"),
("777777777","Joan","Martinez","joan@fasd.com"),
("888888888","Josep","Magret","josep@fasd.com"),
("999999999","Alejo","Vinyeta","alejo@fasd.com"),
("000000000","Jose","Estevez","jose@fasd.com");

insert into puntos values
(null, "A121212", "Gracia", 10, 7, 0),
(null, "A131313", "Ciutat Vella", 10, 7, 0),
(null, "A141414", "Sagrada Familia", 10, 7, 0),
(null, "A151515", "Sants", 10, 7, 0),
(null, "A161616", "Gracia", 10, 7, 0),
(null, "A171717", "Ciutat Vella", 10, 7, 0);

insert into furgon values
("V111", 20, 0),
("V222", 20, 0);

insert into bicicletas values
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default),
(null, default, default);

INSERT INTO `contratos` (`id_contrato`, `fecha_cont`, `id_usuario`) VALUES
(null, '2020-02-06 20:05:11', '000000000'),
(null, '2020-02-06 20:05:11', '111111111'),
(null, '2020-02-06 20:05:11', '222222222'),
(null, '2020-02-06 20:05:11', '333333333');

-- insert into contratos values
-- (null, default,),
insert into salida_bici values
-- ejemplo de una carga de camion
(null,"V111",1,default,1,true),
(null,"V111",2,default,1,true),
(null,"V111",3,default,1,true),
(null,"V111",4,default,1,true),
(null,"V111",5,default,1,true);
update puntos set bici_actual = bici_actual - 5 where id_punto=1;
-- fin ejemplo de una carga de furgón
-- ejemplo descarga de un furgón
insert into entrada_bici values
(null,"V111",1,default,4,true),
(null,"V111",2,default,4,true),
(null,"V111",3,default,4,true);
update puntos set bici_actual = bici_actual + 3 where id_punto=4;
insert into entrada_bici values
(null,"V111",4,default,6,true),
(null,"V111",5,default,6,true);
update puntos set bici_actual = bici_actual + 2 where id_punto=6;
-- fin ejemplo descarga furgón
-- ejemplo recogida de un usuario de una bici
insert into salida_bici values
(null,"000000000",7,default,1,false); -- el 7 es el numero de bici el 1 es el punto
insert into entrada_bici values
(null,"000000000",7,default,2,false);
insert into salida_bici values
(null,"111111111",8,default,2,false);
insert into entrada_bici values
(null,"111111111",8,default,3,false);
insert into salida_bici values
(null,"222222222",9,default,2,false);
insert into entrada_bici values
(null,"222222222",9,default,4,false);
insert into salida_bici values
(null,"333333333",10,default,2,false);
insert into entrada_bici values
(null,"333333333",10,default,5,false);
insert into salida_bici values
(null,"444444444",11,default,2,false);
-- fin ejemplo recogida de un usuario de una bici

-- ejemplo bici averiada
update bicicletas set averiado = 1 where id_bici = 10;


-- CONSULTAS

-- 1 Todos los datos de las bicicletas en stock
select * from bicicletas;
-- 2 Buscar por bici averiada
select * from bicicletas where averiado = 1;
-- 3 bicis en perfecto estado
select * from bicicletas where averiado = 0;
-- 4 Todos los datos de los puntos bicing habilitados
select * from puntos ;
-- 5 Puntos bicing en el barrio de Gracia
select * from puntos where barrio="Gracia";
-- 6 Cuántas bicis hay actualmente en el punto bicing #2
select bici_actual from puntos where id_punto ="2";
-- 7. Número de bicis que hay actualmente en cada punto
select bici_actual from puntos where taller = 0;
-- 8. Cuántas bicis están en el taller
select bici_actual from puntos where taller = 1;
-- 9 Nombres de los usuarios que actualmente tienen contrato
select U.nombre , U.apellido from usuario U join contratos C on U.dni=C.id_usuario;
-- 10  Tiempo de contrato que le queda al usuario con dni "000000000"
set @f_alta := (select fecha_cont from contratos where id_usuario = "000000000");
set @f_actual := (select now());
select timestampdiff(DAY,@f_alta,@f_actual);
set @f_resto := year()-(@f_actual-@f_alta) AS dias_transcurridos;
select @f_resto;
-- 11. Todos los datos de quiene hayan sacado bicis de los puntos bicing
select * from salida_bici;
-- 12. Cuántas bicicletas han salido del punto bicing 2?
select count(*) from salida_bici where id_punto = 2;
-- 13. Nombre del usuario ha utilizado la bicicleta # 7
select U.nombre, U.apellido from usuario U join salida_bici S on S.id_salida = U.dni where id_bici = 7;
-- 14. Todos los datos de quienes hayan ingresado bicis después de sacarlas de otros puntos
select * from entrada_bici;
-- Bicicletas que hayan salido de un punto y aún no hayan sido devueltas
-- select S.id_bici from salida_bici S join entrada_bici E on

-- Final TODO Challenge 1
