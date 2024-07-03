create database FuramaResort;
use FuramaResort;
create table ViTri(
IDViTri int primary key,
TenViTri varchar(45)
);
create table TrinhDo(
IDTrinhDo int primary key,
TrinhDo varchar(45)
);
create table BoPhan(
IDBoPhan int primary key,
TenBoPhan varchar(45)
);
create table NhanVien (
IDNhanVien int primary key ,
HoTen varchar(100),
IDViTri int,
IDTrinhDo int ,
IDBoPhan int,
NgaySinh date,
SoCMND varchar(45),
Luong varchar(45),
SDT varchar(45),
Email varchar(45),
DiaChi varchar(45),
foreign key(IDViTri) references ViTri(IDVitri),
foreign key(IDTrinhDo) references TrinhDo(IDTrinhDo),
foreign key (IDBoPhan) references BoPhan(IDBoPhan)
);
create table LoaiKhach(
IDLoaiKhach int primary key,
TenLoaiKhach varchar(100)
);
create table KhachHang(
IDKhachHang int primary key ,
IDLoaiKhach int ,
HoTen varchar(45),
NgaySinh date,
SoCMND varchar(45),
SDT varchar(45),
Email varchar(45),
DiaChi varchar(45),
foreign key(IDLoaiKhach) references LoaiKhach(IDLoaiKhach)
);
create table KieuThue(
IDKieuThue int primary key,
TenKieuThue varchar(45),
Gia int
);
create table LoaiDichVu(
IDLoaiDichVu int primary key,
TenLoaiDichVu varchar(45)
);
create table DichVu(
IDDichVu int primary key,
TenDichVu varchar(45),
DienTich int ,
SoTang int ,
SoNguoiToiDa varchar(45),
ChiPhiThue varchar(45),
IDKieuThue int,
IDLoaiDichVu int , 
TrangThai varchar(45),
foreign key(IDKieuThue) references KieuThue(IDKieuThue),
foreign key(IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu)
);


create table HopDong (
IDHopDong int primary key ,
IDNhanVien int,
IDKhachHang int,
IDDichVu int,
NgayLamHopDong date,
NgayKetThuc date,
TienDatCoc int,
TongTien int,
foreign key (IDNhanVien) references NhanVien(IDNhanVien),
foreign key (IDKhachHang) references KhachHang(IDKhachHang),
foreign key(IDDichVu) references DichVu(IDDichVu)
);


create table DichVuDiKem(
IDDichVuDiKem int primary key,
TenDichVuDiKem varchar(45),
Gia int,
DonVi int,
TrangThaiKhaDung varchar(45)
);
create table HopDongChiTiet(
IDHopDongChiTiet int primary key,
IDHopDong int,
IDDichVuDiKem int,
Soluong int,
foreign key(IDHopDong) references HopDong(IDHopDong),
foreign key(IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem)
);
-- Thêm nhân viên
INSERT INTO NhanVien (IDNhanVien, HoTen, IDViTri, IDTrinhDo, IDBoPhan, NgaySinh, SoCMND, Luong, SDT, Email, DiaChi)
VALUES (10, 'Nguyen Van Nhan', 1, 1, 1, '1990-01-01', '123456789', '10000000', '0912345678', 'nhanvien1@example.com', 'Hanoi');
-- Thêm khách hàng
INSERT INTO KhachHang (IDKhachHang, IDLoaiKhach, HoTen, NgaySinh, SoCMND, SDT, Email, DiaChi)
VALUES (10, 1, 'Nguyen Thi Khach', '1985-05-05', '987654321', '0987654321', 'khachhang1@example.com', 'Vinh');

-- Thêm dịch vụ
INSERT INTO DichVu (IDDichVu, TenDichVu, DienTich, SoTang, SoNguoiToiDa, ChiPhiThue, IDKieuThue, IDLoaiDichVu, TrangThai)
VALUES (7, 'Villa Deluxe', 300, 2, '10', '5000000', 1, 1, 'Còn trống');

-- Thêm kiểu thuê dịch vụ
INSERT INTO KieuThue (IDKieuThue, TenKieuThue, Gia)
VALUES (8, 'Thuê theo ngày', 500000);
-- Thêm hợp đồng
INSERT INTO HopDong (IDHopDong, IDNhanVien, IDKhachHang, IDDichVu, NgayLamHopDong, NgayKetThuc, TienDatCoc, TongTien)
VALUES (7, 1, 1, 1, '2019-11-15', '2019-11-30', 1000000, 5000000);

-- Thêm chi tiết hợp đồng
INSERT INTO HopDongChiTiet (IDHopDongChiTiet, IDHopDong, IDDichVuDiKem, Soluong)
VALUES (3, 1, 1, 2); -- Ví dụ cho dịch vụ đi kèm có ID là 1 và số lượng là 2


