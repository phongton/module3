create database QuanLyBanHang;
use QuanLyBanHang;
create table customer(
cID int primary key ,
cName varchar(50),
cAge int not null
);
create table oder(
oID int primary key ,
cID int,
oDate date,
oTotalPrice double,
foreign key (cID) references customer(cID)
);
create table product(
pID int primary key,
pName varchar(50),
pPrice double
);
create table oderDetail(
oID int ,
pID int,
odQTY int,
primary key(oID,pID),
foreign key (oID) references oder(oID),
foreign key (pID) references product(pID)
);


