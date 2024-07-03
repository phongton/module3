use classicmodels;
select * from customers where customername =   'Land of Toys Inc.';
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
alter table customers add index idx_customerName(customerName);
alter table customers add index idx_full_name(contactFirstName , contactLastName);
explain select * from customers where contactFirstName = 'Jean' or contactFirstName = 'King';
alter table customers drop index idx_full_name;s