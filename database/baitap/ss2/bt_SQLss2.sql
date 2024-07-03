
create database QuanlySanPham;
use QuanlySanPham;
create table phieu_xuat(
soPx int primary key,
ngayXuat date 
);
create table vattu (
idMVT int  primary key,
tenVT varchar(50)
);
create table phieu_xuat_and_vattu(
soPx int,
maVtu int,
DGXuat double ,
SLXuat int ,
primary key ( soPx,maVtu),
foreign key (soPx) references phieu_xuat(soPx),
foreign key (maVtu) references vattu(idMVT)
);
create table phieunhap(
SoPN int primary key,
ngayNhap date 
);
create table vattu_and_phieunhap(
DGNhap double,
SLNhap int,
mvt int ,
sopn int ,
primary key (mvt,sopn),
foreign key (mvt) references vattu(idMVT),
foreign key (sopn) references phieunhap(SoPN)
);
create table NhaCC(
MaNCC int primary key,

TenNCC varchar(50),
DiaChi varchar(50)

);
create table DonDH(
SoDH int primary key,
NgayDH date,
mncc int,
foreign key (mncc) references NhaCC(MaNCC)
);
create table vattu_and_DonDH(
mvt int,
sodh int,
primary key(mvt,sodh),
foreign key(mvt) references vattu(idMVT),
foreign key(mvt) references DonDH(SoDH)
);

create table SDT(
mancc int ,
sdt varchar (10) primary key,
foreign key(mancc) references NhaCC(MaNCC)
);









