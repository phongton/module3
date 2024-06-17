
use yourdatabase;


create table classes(
id int auto_increment,
name varchar(100) not null,
primary key(id)
);
create table teachers(
id int auto_increment,
name varchar(100) not null,
age int ,
country varchar(100) not null,
primary key(id)
);


