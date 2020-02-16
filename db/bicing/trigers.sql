use bicing;
 
SET FOREIGN_KEY_CHECKS = 0;  -- quita error 1451
SET SQL_SAFE_UPDATES = 0;  -- quita error 1175

-- trigger  #1 Si borramos un usuario, tambíen tendremos que borrar el historial de facturas relacionadas.

drop trigger if exists delete_factura;
delimiter $$
create trigger delete_factura after delete
on usuarios for each row
begin 
	delete from facturas where usuario = old.dni;
	
end $$
delimiter ;

-- comprobación
select * from usuarios;
select * from facturas;
delete from usuarios where dni = "53118274P";
-- -----------------------------------------------------------------------------------------------------------
-- trigger #2  Por cada 10 bicicletas que demos de alta vamos a construir una nueva estacion.

drop trigger if exists nueva_estacion_AI;
delimiter $$
create trigger nueva_estacion_AI after insert
on bicicletas for each row
begin 
	
	set @bicis_stand = (select count(*) from bicicletas);
	
    if @bicis_stand / 10 =  0 THEN 
		insert into estaciones values (null,"tibidabo",new.id_bici);
	end if; 
	
end $$

delimiter ;

select * from bicicletas;
select * from estaciones;
insert into bicicletas values
(12,"Active",true,1);

-- -----------------------------------------------------------------------------------------------------------
-- trigger #3 Borra el usuario  que no tenga el historial de facturas facio.

drop trigger if exists drop_usuario;
delimiter $$
create trigger drop_usuario after delete
on usuarios for each row
begin
	SELECT 

    
end $$
delimiter ;
-- comprobación




-- Añadir 1 EVENTO en la base de datos explicando con comentarios el
-- funcionamiento del mismo.

-- Calcular el tiempo consumido de todos los usuarios.

drop event if exists consumo;
create event consumo
on schedule every 1 day starts "2020-02-14 08:00"
do
	
		set @usuarios := (select * from alquileres.usuarios);
		set @f_alta := (select fecha_alta from @usuarios);
		set @f_modif := (select fecha_modif from @usuarios);
		select @f_alta;
		select @f_modif;
		SELECT TIMESTAMPDIFF(MINUTE, @f_alta, @f_modif) AS minutos_transcurridos;

