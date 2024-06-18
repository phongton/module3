use ss2_database;
create table orders(
id int 	auto_increment,
staff varchar(50),
primary key(id),
customer_id int ,foreign key (customer_id) references customers(id)
);
