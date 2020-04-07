drop database if exists yourvocabulary;
create database if not exists yourvocabulary;
use yourvocabulary;

create table user(
user_email nvarchar(100) primary key,
nickname nvarchar(100) unique,
pwd nvarchar(50) not null
);

create table topic(
id_topic int primary key auto_increment,
name nvarchar(150) not null,
user_email nvarchar(100),

constraint topic_user foreign key (user_email)
references user(user_email)
on delete restrict on update cascade
);

create table word(
id_word int primary key auto_increment,
n_word nvarchar(150) not null,
t_word nvarchar(150),
id_topic int not null,

constraint word_topic foreign key (id_topic)
references topic(id_topic)
on delete restrict on update cascade
);

