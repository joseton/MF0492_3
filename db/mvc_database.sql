drop schema if exists mvc_database;
create schema mvc_database;
use mvc_database;

create table users(
    id int primary key auto_increment,
    email varchar(45),
    pass varchar(45)
);
insert into users values
(1,"hola", "111"); 
select * from users;