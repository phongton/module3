create database demo;
use demo;
-- bước 1
create table Products(
Id int auto_increment primary key,
productCode varchar(50),
productName varchar(50),
productPrice int,
productAmount int,
productDescription text,
productStatus varchar(50)
);
-- bước 2
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) 
VALUES
    ('P001', 'Laptop ASUS Zenbook UX534', 1200, 50, 'Thin and powerful laptop with a 15-inch screen.', 'active'),
    ('P002', 'Smartphone Samsung Galaxy S20', 999, 100, 'Flagship smartphone with 5G capabilities and great camera.', 'active'),
    ('P003', 'Tablet Apple iPad Air', 699, 30, 'Lightweight tablet with a 10.9-inch Retina display.', 'active'),
    ('P004', 'Headphones Sony WH-1000XM4', 349, 80, 'Premium noise-canceling headphones with excellent sound quality.', 'inactive');
 -- bước 3
 create index idx_ProductCode on Products(productCode);
create index idx_Name_Price on Products(productName,productPrice);
explain select *from Products where productCode = 'P001'; -- sau khi sử dụng truy vấn từ 4 hàng xuống còn 1 hàng 

-- bước 4
create view product_view as
select productCode ,productName,productPrice, productStatus
from Products;
select * from product_view;
alter view product_view as 
select productCode ,productName,productPrice, productStatus,productDescription
from Products;
select* from product_view;

drop view product_view;

-- bươcs 5
-- tạo procedure lấy thông tin sản phẩm 
delimiter //
create procedure sp_InfoProduct()
begin
select* from Products;
end //
delimiter ;
call sp_InfoProduct;

-- tạo procedure thêm 1 sản phẩm mới
delimiter //
create procedure sp_addProduct(
in product_Code varchar(50),
in product_Name varchar(50),
in product_Price int,
in product_Amount int,
in product_Description text,
in product_Status varchar(50))
begin
insert into Products(productCode,productName,productPrice ,productAmount ,productDescription ,productStatus)
values(product_Code ,product_Name,product_Price, product_Amount, product_Description, product_Status);
end//
delimiter ;
drop procedure sp_addProduct;

call sp_addProduct('P005','Headphones Sony WH-1000XM4', 349, 80, 'Premium noise-canceling headphones with excellent sound quality.', 'inactive');
-- tạo procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_updateProduct(
in product_id int,
in product_Code varchar(50),
in product_Name varchar(50),
in product_Price int,
in product_Amount int,
in product_Description text,
in product_Status varchar(50))

begin
update Products
set productCode = product_Code,
productName = product_Name,
productPrice = product_Price,
productAmount = product_Amount,
productDescription = product_Description,
productStatus = product_Status
where Id = product_id;
end //
delimiter ;

call sp_updateProduct(1 , 'P007', 'Laptop ', 1200, 50, 'Thin and powerful ', 'in active');
-- tạo procedure xoá sản phẩm theo id
delimiter //
create procedure sp_deleteProduct(in product_id int)
begin
delete from Products
where id = product_id;
end //
delimiter ;
call sp_deleteProduct(1);
call sp_InfoProduct;









