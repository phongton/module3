use FuramaResort;
-- 2.Hiển Thị thông tin tất cả nhân viên có tên bắt đầu bằng h , t , k có tối đa 15 chữ
select *
from NhanVien
where HoTen like 'h%' or HoTen like 't%' or HoTen like 'k%' limit 0,15 ;

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18-50 và có địa chỉ ở "DN" hoặc "QT"

select * 
from KhachHang
where (year(now()) - year(NgaySinh)) between 18 and 50
and (DiaChi like '%đà nẵng%' or DiaChi like '%quảng trị');

-- 4.Đếm xem tương ứng với mỗi khách hàng 
-- đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select KH.HoTen as TenKhachHang , count(HD.IDHopDong) as SoLanDatPhong
from KhachHang KH
join HopDong HD on KH.IDKhachHang = HD.IDKhachHang
join LoaiKhach LK on KH.IDLoaiKhach = LK.IDLoaiKhach
where LK.TenLoaiKhach = "Diamond"
group by KH.IDKhachHang 
order by SoLanDatPhong ASC;

-- 5.Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng.

select KH.IDKhachHang, KH.HoTen , LK.TenLoaiKhach, HD.IDHopDong, DV.TenDichVu, HD.NgayLamHopDong,HD.NgayKetThuc,sum(DV.ChiPhiThue + HDCT.SoLuong*DVK.Gia) as TongTien
from KhachHang KH
left join HopDong HD on KH.IDKhachHang = HD.IDKhachHang
left join LoaiKhach LK on LK.IDLoaiKhach = KH.IDLoaiKhach
left join DichVu DV on DV.IDDichVu = HD.IDDichVu
left join HopDongChiTiet HDCT on HDCT.IDHopDong = HD.IDHopDong
left join DichVuDiKem DVK on DVK.IDDichVuDiKem = HDCT.IDDichVuDiKem
group by KH.IDKhachHang, KH.HoTen , LK.TenLoaiKhach, HD.IDHopDong, DV.TenDichVu, HD.NgayLamHopDong,HD.NgayKetThuc
order by KH.IDKhachHang;

-- 6 .Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select DV.IDDichVu , DV.TenDichVu ,DV.DienTich , DV.ChiPhiThue ,LDV.TenLoaiDichVu
from DichVu DVKhachHang
left join LoaiDichVu LDV on DV.IDLoaiDichVu = LDV.IDLoaiDichVu
left join HopDong HD on HD.IDDichVu =DV.IDDichVu
where HD.IDHopDong is null or
year(HD.NgayLamHopDong)<=2019 and month(HD.NgayLamHopDong) not between 1 and 3;

-- 7.Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu 
-- của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 
-- nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.

select DV.IDDichVu , DV.TenDichVu,DV.DienTich , DV.SoNguoiToiDa , DV.ChiPhiThue, LDV.TenLoaiDichVu
from DichVu DV
join LoaiDichVu LDV on LDV.IDLoaiDichVu = DV.IDLoaiDichVu
join HopDong HD on HD.IDDichVu = DV.IDDichVu
join KhachHang KH on KH.IDKhachHang = HD.IDKhachHang
where year(HD.NgayLamHopDong)= 2018 and year(HD.NgayLamHopDong) <> 2019;
-- 8.Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- c1:
select distinct HoTen
from KhachHang;
-- c2:
select HoTen
from KhachHang
union
select HoTen
from KhachHang;
-- c3:
select HoTen
from KhachHang
group by Hoten;

-- 9 .Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong 
-- năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(HD.NgayLamHopDong) as Thang ,count(HD.IDKhachHang) as SoLuongKhach
from HopDong HD
where year(HD.NgayLamHopDong) = 2019
group by month(HD.NgayLamHopDong);

-- 10.Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm 
-- IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

select HD.IDHopDong , HD.NgayLamHopDong, HD.NgayKetThuc, HD.TienDatCoc ,count(HDCT.IDHopDongChiTiet) as "Số lượng dịch vụ đi kèm "
from HopDong HD
left join HopDongChiTiet HDCT on HDCT.IDHopDong= HD.IDHopDong
group by HD.IDHopDong;

-- 10.Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có 
-- TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”. 

select DVDK.IDDichVuDiKem , DVDK.TenDichVuDiKem ,DVDK.Gia,DVDK.DonVi, DVDK.TrangThaiKhaDung,
KH.HoTen,LK.TenLoaiKhach
from DichVuDiKem DVDK
left join HopDongChiTiet HDCT on HDCT.IDDichVuDiKem = DVDK.IDDichVuDiKem
left join HopDong HD on HD.IDHopDong = HDCT.IDHopDong
left join KhachHang KH on KH.IDKhachHang = HD.IDKhachHang
left join LoaiKhach LK on LK.IDLoaiKhach = KH.IDLoaiKhach
where LK.TenLoaiKhach = 'Diamond'
and KH.DiaChi ='Vinh' or KH.DiaChi ='quảng ngãi';

-- 11. Tiền đặt đặt cọc của tất cẩ các dịch vụ đã từng đc khách hàng đặt vào 3 thánh cuối 2019
select HD.IDHopDong , NV.HoTen , KH.HoTen, Kh.SDT, DV.TenDichVu , sum(HDCT.SoLuong) as SoLuongDichVuDiKem , HD.TienDatCoc
from HopDong HD 
left join NhanVien NV on HD.IDNhanVien = NV.IDNhanVien
left join KhachHang KH on KH.IDKhachHang = HD.IDKhachHang 
left join DichVu DV on DV.IDDichVu = HD.IDDichVu
left join HopDongChiTiet HDCT on HDCT.IDHopDong = HD.IDHopDong
where month(HD.NgayLamHopDong) between 10 and 12
and month(HD.NgayLamHopDong) not between 1 and 6
group by HD.IDHopDong;

-- 12.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select DVDK.TenDichVuDiKem, DVDK.IDDichVuDiKem , count(HD.IDHopDong) as SoLanSuDung
from HopDong HD
join HopDongChiTiet HDCT on HDCT.IDHopDong = HD.IDHopDong
join DichVuDiKem DVDK on DVDK.IDDichVuDiKem = HDCT.IDDichVuDiKem
group by DVDK.IDDichVuDiKem;


-- 13. Hiển thị thông tin các dich vụ đi kèm chỉ mới được sử dụng 1 lần duy nhất 

select HD.IDHopDong,LDV.TenLoaiDichVu ,LDV.TenLoaiDichVu , count(HD.IDHopDong) as SoLanSuDung
from HopDong HD
join HopDongChiTiet HDCT on HDCT.IDHopDong = HD.IDHopDong
join DichVuDiKem DVDK on DVDK.IDDichVuDiKem = HDCT.IDDichVuDiKem
join DichVu DV on HD.IDDichVu =DV.IDDichVu
join LoaiDichVu LDV on DV.IDLoaiDichVu = LDV.IDLoaiDichVu
group by HD.IDHopDong
having SoLanSuDung =1;

-- 14 .Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.


select NV.IDNhanVien, NV.HoTen , TD.TrinhDo,BP.TenBoPhan , NV.SDT, NV.DiaChi , count(HD.IDHopDong) as SoHopDong
from NhanVien NV
join TrinhDo TD on TD.IDTrinhDo = NV.IDTrinhDo
join BoPhan BP on BP.IDBoPhan = NV.IDBoPhan
join HopDong HD on HD.IDNhanVien = NV.IDNhanVien
where year(HD.NgayLamHopDong) between 2018 and 2019
 group by NV.IDNhanVien
 having SoHopDong <=3;
 
 -- 15. Xoá những nhân viên chưa từng lập đc hợp đồng từ năm 2017 đến năm 2019
 SET foreign_key_checks = 0;
 delete NV from NhanVien NV
 where IDNhanVien not in(
 select NV.IDNhanVien 
 from NhanVien NV
 join HopDong HD on NV.IDNhanVien = HD.IDNhanVien
 where year(HD.NgayLamHopDong) between 2017 and 2019
);
SET foreign_key_checks = 1;
-- 16.cập nhật thông tin những kháchnhangf có ten loại khách là platinum lên diamond chỉ cập nhâtj khách đã từng đặt phòng với tổng
-- tiền thanh toán năm 2019 là lớn hơn 10.000.000 


