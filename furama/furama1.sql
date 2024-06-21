use FuramaResort;
-- 2.Hiển Thị thông tin tất cả nhân viên có tên bắt đầu bằng h , t , k có tối đa 15 chữ
select *
from NhanVien
where HoTen like 'h%' or HoTen like 't%' or HoTen like 'k%' limit 0,15 ;

-- 3.