ALTER SESSION SET CURRENT_SCHEMA= MYDATABASE;

-- Nhan vien

CREATE TABLE NhanVien (
  MaNV NUMBER,
  TenNV NVARCHAR2(20),
  SDT VARCHAR2(10) UNIQUE,
  Luong NUMBER(10),
  ChucVu NVARCHAR2(30),
  NgayVaolam DATE,
  TaiKhoan VARCHAR2(6),
  MatKhau VARCHAR2(4),
  TrangThai NVARCHAR2(20),
  email NVARCHAR2(30),
  ma_nql NUMBER
);
/

ALTER TABLE NHANVIEN ADD CONSTRAINT pk_nv PRIMARY KEY (MaNV);
ALTER TABLE NHANVIEN ADD CONSTRAINT fk_nv_nql FOREIGN KEY (ma_nql) REFERENCES NhanVien(MaNV);

ALTER TABLE NhanVien MODIFY (ChucVu NVARCHAR2(30));
/

-----------------------------------------------------------------------------


-- Khach hang

CREATE TABLE KhachHang (
  MaKH NUMBER,
  TenKH NVARCHAR2(20),
  SDT VARCHAR2(10),
  QueQuan NVARCHAR2(30),
  GioiTinh NVARCHAR2(3)
);

ALTER TABLE khachhang ADD CONSTRAINT pk_kh PRIMARY KEY (MaKH);
/

------------------------------------------------------------------


-- Phu kien

CREATE TABLE PhuKien (
  MaPK NUMBER,
  TenPK NVARCHAR2(30),
  NgayNhap DATE,
  XuatXu NVARCHAR2(20),
  SoLuong NUMBER,
  GiaNhap NUMBER,
  GiaBan NUMBER
);

ALTER TABLE PhuKien ADD CONSTRAINT pk_pk PRIMARY KEY (MaPK);
/

------------------------------------------------------------------


-- Kho xe

CREATE TABLE khoxe (
  MaDongXe NUMBER,
  TenDongXe VARCHAR2(30),
  SoLuong NUMBER
);

ALTER TABLE KHOXE ADD CONSTRAINT pk_kx PRIMARY KEY (MaDongXe);
/

--------------------------------------------------------------------------


-- Xe

CREATE TABLE xe (
  MaXe NUMBER,
  MaDongXe NUMBER,
  TenDongXe VARCHAR2(30),
  LoaiXe VARCHAR2(30),
  GiaNhap NUMBER,
  GiaBan NUMBER,
  ThoiGianBaoHanh NUMBER
);

ALTER TABLE XE ADD CONSTRAINT pk_xe PRIMARY KEY (MaXe);
ALTER TABLE xe ADD CONSTRAINT fk_xe_dx FOREIGN KEY (MaDongXe) REFERENCES KhoXe(MaDongXe);
/

---------------------------------------------------------------


-- Xe da ban

CREATE TABLE XEDABAN (
  MaXe NUMBER,
  TenDongXe VARCHAR2(30),
  GiaNhap NUMBER,
  GiaBan NUMBER,
  NamSX NUMBER,
  ThoiGianBaoHanh NUMBER
);

ALTER TABLE XEDABAN ADD CONSTRAINT pk_xedaban PRIMARY KEY (MaXe);
/


--------------------------------------------------------------------


-- HOp dong mua xe

CREATE TABLE HopDongMuaXe (
  MaHDMX NUMBER,
  MaKH NUMBER,
  NgayTaoHopDong DATE,
  TongCong NUMBER(12, 0),
  MaNV NUMBER
);

ALTER TABLE HOPDONGMUAXE ADD CONSTRAINT PK_hd PRIMARY KEY (MaHDMX);
ALTER TABLE HOPDONGMUAXE ADD CONSTRAINT fk_hd_kh FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH);
ALTER TABLE HOPDONGMUAXE ADD CONSTRAINT fk_hd_nv FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV);
/


--------------------------------------------------------------------


-- Chi tiet hop dong mua xe

CREATE TABLE CTHDMX (
  MaHDMX NUMBER,
  MaXe NUMBER,
  TrangThai NVARCHAR2(20)
);

ALTER TABLE CTHDMX ADD CONSTRAINT PK_CTHDong PRIMARY KEY (MaHDMX, MaXe);

ALTER TABLE CTHDMX ADD CONSTRAINT FK_CTHDMX_HD FOREIGN KEY (MaHDMX) REFERENCES HopDongMuaXe(MaHDMX);
ALTER TABLE CTHDMX ADD CONSTRAINT FK_CTHDMX_Xe FOREIGN KEY (MaXe) REFERENCES XeDaBan(MaXe);
/


--------------------------------------------------------------------


--Lich sua chua

CREATE TABLE LichSuaChua (
  MaLSC NUMBER,
  MaXe NUMBER,
  Ngay DATE,
  Ca NUMBER,
  MaNV NUMBER  
);

ALTER TABLE LICHSUACHUA ADD CONSTRAINT pk_lsc PRIMARY KEY (MaLSC);

ALTER TABLE LICHSUACHUA ADD CONSTRAINT fk_lsc_xe FOREIGN KEY (MaXe) REFERENCES XeDaBan(MaXe);
ALTER TABLE LICHSUACHUA ADD CONSTRAINT fk_lsc_nv FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV);
/


--------------------------------------------------------------------

-- Hoa don sua chua 

CREATE TABLE HoaDonSuaChua (
  MaHD NUMBER,
  MaLSC NUMBER,
  TrangThai NVARCHAR2(20),
  NgayTraXe DATE,
  ThanhTien NUMBER
);

ALTER TABLE HoaDonSuaChua ADD CONSTRAINT PK_HDSC PRIMARY KEY (MaHD);

ALTER TABLE HoaDonSuaChua ADD CONSTRAINT FK_HDSC_SC FOREIGN KEY (MaLSC) REFERENCES LichSuaChua(MaLSC);
/

--------------------------------------------------------------------


-- Chi tiet hoa don

CREATE TABLE ChiTietHoaDon (
  MaHD NUMBER,
  MaPK NUMBER,
  SoLuong NUMBER
);

ALTER TABLE ChiTietHoaDon ADD CONSTRAINT PK_CTHD PRIMARY KEY (MaHD, MaPK);

ALTER TABLE ChiTietHoaDon ADD CONSTRAINT FK_CTHD_SC FOREIGN KEY (MaHD) REFERENCES HoaDonSuaChua(MaHD);
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT FK_CTHD_PK FOREIGN KEY (MaPK) REFERENCES PhuKien(MaPK);


---------------------------------------------------------------------------

-- Dữ liệu bảng NhanVien

INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (100, 'Nguyen Van A', '1234567890', 5000000, 'Quản lý', TO_DATE('2024-05-13', 'YYYY-MM-DD'), 'acc001', 'pass', 'Active', 'example0@email.com', NULL);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (101, 'Tran Thi B', '0987654321', 4500000, 'Quản lý bán hàng', TO_DATE('2024-05-14', 'YYYY-MM-DD'), 'acc002', 'pass', 'Active', 'example1@email.com', 100);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (102, 'Le Van C', '0987654322', 4800000, 'Quản lý sửa chữa', TO_DATE('2024-05-15', 'YYYY-MM-DD'), 'acc003', 'pass', 'Active', 'example2@email.com', 100);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (103, 'Hoang Thi D', '0987654323', 4900000, 'Bán hàng', TO_DATE('2024-05-16', 'YYYY-MM-DD'), 'acc004', 'pass', 'Active', 'example3@email.com', 101);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (104, 'Pham Van E', '0987654324', 5200000, 'Bán hàng', TO_DATE('2024-05-17', 'YYYY-MM-DD'), 'acc005', 'pass', 'Active', 'example4@email.com', 101);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (105, 'Vo Thi F', '0987654325', 4700000, 'Bán hàng', TO_DATE('2024-05-18', 'YYYY-MM-DD'), 'acc006', 'pass', 'Active', 'example5@email.com', 101);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (106, 'Dinh Van G', '0987654326', 5100000, 'Bán hàng', TO_DATE('2024-05-19', 'YYYY-MM-DD'), 'acc007', 'pass', 'Active', 'example6@email.com', 101);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (107, 'Bui Thi H', '0987654327', 4600000, 'Sửa chữa', TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'acc008', 'pass', 'Active', 'example7@email.com', 102);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (108, 'Nguyen Van I', '0987654328', 5300000, 'Sửa chữa', TO_DATE('2024-05-21', 'YYYY-MM-DD'), 'acc009', 'pass', 'Active', 'example8@email.com', 102);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (109, 'Tran Van K', '0987654329', 4400000, 'Sửa chữa', TO_DATE('2024-05-22', 'YYYY-MM-DD'), 'acc010', 'pass', 'Active', 'example9@email.com', 102);
INSERT INTO NhanVien (MaNV, TenNV, SDT, Luong, ChucVu, NgayVaolam, TaiKhoan, MatKhau, TrangThai, email, ma_nql) VALUES (110, 'Hoang Van L', '0987643249', 4700000, 'Sửa chữa', TO_DATE('2024-05-22', 'YYYY-MM-DD'), 'acc011', 'pass', 'Active', 'example10@email.com', 102);


-- Dữ liệu bảng KhachHang

INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (101, 'Nguyen Van A', '1234567890', 'Ha Noi', 'Nam');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (102, 'Tran Thi B', '0987654321', 'Ho Chi Minh', 'Nu');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (103, 'Le Van C', '0987654322', 'Da Nang', 'Nam');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (104, 'Hoang Thi D', '0987654323', 'Hai Phong', 'Nu');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (105, 'Pham Van E', '0987654324', 'Can Tho', 'Nam');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (106, 'Vo Thi F', '0987654325', 'Vinh', 'Nu');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (107, 'Dinh Van G', '0987654326', 'Hue', 'Nam');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (108, 'Bui Thi H', '0987654327', 'Nha Trang', 'Nu');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (109, 'Nguyen Van I', '0987654328', 'Da Lat', 'Nam');
INSERT INTO KhachHang (MaKH, TenKH, SDT, QueQuan, GioiTinh) VALUES (110, 'Tran Van K', '0987654329', 'Buon Ma Thuot', 'Nam');


-- Dữ liệu bảng PhuKien

INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (101, 'Bộ ốp trang trí nội thất', TO_DATE('2024-05-12', 'YYYY-MM-DD'), 'Trung Quốc', 15, 2000000, 2500000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (102, 'Màn hình DVD cho ghế sau', TO_DATE('2024-05-11', 'YYYY-MM-DD'), 'Hàn Quốc', 8, 3500000, 4000000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (103, 'Bộ túi cứu hộ', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'Việt Nam', 20, 500000, 700000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (104, 'Bộ gương chiếu hậu camera', TO_DATE('2024-05-09', 'YYYY-MM-DD'), 'Trung Quốc', 10, 1500000, 1800000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (105, 'Ổ khóa cốp xe', TO_DATE('2024-05-08', 'YYYY-MM-DD'), 'Hàn Quốc', 12, 300000, 400000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (106, 'Camera hành trình', TO_DATE('2024-05-07', 'YYYY-MM-DD'), 'Việt Nam', 18, 800000, 1000000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (107, 'Thảm lót sàn', TO_DATE('2024-05-06', 'YYYY-MM-DD'), 'Trung Quốc', 25, 500000, 600000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (108, 'Dây đai an toàn', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'Hàn Quốc', 30, 200000, 250000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (109, 'Ốp bảo vệ cản sau', TO_DATE('2024-05-04', 'YYYY-MM-DD'), 'Việt Nam', 15, 600000, 700000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (110, 'Dây buộc hành lý', TO_DATE('2024-05-03', 'YYYY-MM-DD'), 'Trung Quốc', 20, 100000, 150000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (111, 'Đèn pha', TO_DATE('2024-05-02', 'YYYY-MM-DD'), 'Hàn Quốc', 25, 700000, 800000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (112, 'Hỗ trợ tản nhiệt', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Việt Nam', 20, 450000, 550000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (113, 'Quạt tản nhiệt', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Trung Quốc', 18, 300000, 350000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (114, 'Gương', TO_DATE('2024-04-29', 'YYYY-MM-DD'), 'Hàn Quốc', 30, 500000, 600000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (115, 'Đèn hậu', TO_DATE('2024-04-28', 'YYYY-MM-DD'), 'Việt Nam', 15, 400000, 450000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (116, 'Ốp cản', TO_DATE('2024-04-27', 'YYYY-MM-DD'), 'Trung Quốc', 22, 600000, 700000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (117, 'Cảm biến', TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Hàn Quốc', 12, 200000, 250000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (118, 'Còi', TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Việt Nam', 20, 100000, 120000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (119, 'Cần gạt mưa', TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'Trung Quốc', 25, 150000, 180000);
INSERT INTO PhuKien (MaPK, TenPK, NgayNhap, XuatXu, SoLuong, GiaNhap, GiaBan) VALUES (120, 'Giảm xóc', TO_DATE('2024-04-23', 'YYYY-MM-DD'), 'Hàn Quốc', 30, 1000000, 120000);




-- Dữ liệu bảng KhoXe
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (101, 'BMW Z1', 3);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (102, 'BMW Z3', 6);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (103, 'BMW Z4', 4);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (104, 'BMW Z8', 5);

INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (105, 'BMW i3', 5);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (106, 'BMW i4', 3);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (107, 'BMW iX', 4);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (108, 'BMW iX3', 1);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (109, 'BMW iNEXT', 3);

INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (110, 'BMW 3 Series', 5);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (111, 'BMW 5 Series', 6);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (112, 'BMW 7 Series', 4);

INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (113, 'BMW 2 Series Convertible', 6);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (114, 'BMW 4 Series Convertible', 4);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (115, 'BMW 8 Series Convertible', 2);

INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (116, 'BMW X4', 1);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (117, 'BMW X6', 4);

INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (118, 'BMW X1', 5);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (119, 'BMW X3', 4);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (120, 'BMW X5', 5);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (121, 'BMW X7', 3);

INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (122, 'BMW 2 Series Gran Coupe', 3);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (123, 'BMW 4 Series Gran Coupe', 5);
INSERT INTO KhoXe (MaDongXe, TenDongXe, SoLuong) VALUES (124, 'BMW 8 Series Gran Coupe', 4);


-- Thêm dữ liệu bảng Xe
-- Roadster
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (101, 101, 'BMW Z1', 'Roadster', 50000, 60000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (102, 101, 'BMW Z1', 'Roadster', 50000, 60000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (103, 101, 'BMW Z1', 'Roadster', 50000, 60000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (201, 102, 'BMW Z3', 'Roadster', 70000, 84000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (202, 102, 'BMW Z3', 'Roadster', 70000, 84000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (203, 102, 'BMW Z3', 'Roadster', 70000, 84000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (204, 102, 'BMW Z3', 'Roadster', 70000, 84000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (205, 102, 'BMW Z3', 'Roadster', 70000, 84000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (206, 102, 'BMW Z3', 'Roadster', 70000, 84000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (301, 103, 'BMW Z4', 'Roadster', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (302, 103, 'BMW Z4', 'Roadster', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (303, 103, 'BMW Z4', 'Roadster', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (304, 103, 'BMW Z4', 'Roadster', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (401, 104, 'BMW Z8', 'Roadster', 60000, 72000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (402, 104, 'BMW Z8', 'Roadster', 60000, 72000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (403, 104, 'BMW Z8', 'Roadster', 60000, 72000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (404, 104, 'BMW Z8', 'Roadster', 60000, 72000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (405, 104, 'BMW Z8', 'Roadster', 60000, 72000, 24);


-- Electric
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (501, 105, 'BMW i3', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (502, 105, 'BMW i3', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (503, 105, 'BMW i3', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (504, 105, 'BMW i3', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (505, 105, 'BMW i3', 'Electric', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (601, 106, 'BMW i4', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (602, 106, 'BMW i4', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (603, 106, 'BMW i4', 'Electric', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (701, 107, 'BMW iX', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (702, 107, 'BMW iX', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (703, 107, 'BMW iX', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (704, 107, 'BMW iX', 'Electric', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (801, 108, 'BMW iX3', 'Electric', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (901, 109, 'BMW iNEXT', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (902, 109, 'BMW iNEXT', 'Electric', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (903, 109, 'BMW iNEXT', 'Electric', 75000, 90000, 24);



-- Sedan
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1001, 110, 'BMW 3 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1002, 110, 'BMW 3 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1003, 110, 'BMW 3 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1004, 110, 'BMW 3 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1005, 110, 'BMW 3 Series', 'Sedan', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1101, 111, 'BMW 5 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1102, 111, 'BMW 5 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1103, 111, 'BMW 5 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1104, 111, 'BMW 5 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1105, 111, 'BMW 5 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1106, 111, 'BMW 5 Series', 'Sedan', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1201, 112, 'BMW 7 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1202, 112, 'BMW 7 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1203, 112, 'BMW 7 Series', 'Sedan', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1204, 112, 'BMW 7 Series', 'Sedan', 75000, 90000, 24);


-- Convertible
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1301, 113, 'BMW 2 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1302, 113, 'BMW 2 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1303, 113, 'BMW 2 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1304, 113, 'BMW 2 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1305, 113, 'BMW 2 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1306, 113, 'BMW 2 Series Convertible', 'Convertible', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1401, 114, 'BMW 4 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1402, 114, 'BMW 4 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1403, 114, 'BMW 4 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1404, 114, 'BMW 4 Series Convertible', 'Convertible', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1501, 115, 'BMW 8 Series Convertible', 'Convertible', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1502, 115, 'BMW 8 Series Convertible', 'Convertible', 75000, 90000, 24);


-- Sport activity coupe
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1601, 116, 'BMW X4', 'Sport activity coupe', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1701, 117, 'BMW X6', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1702, 117, 'BMW X6', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1703, 117, 'BMW X6', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1704, 117, 'BMW X6', 'Sport activity coupe', 75000, 90000, 24);


-- Sport activity vehicle
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1801, 118, 'BMW X1', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1802, 118, 'BMW X1', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1803, 118, 'BMW X1', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1804, 118, 'BMW X1', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1805, 118, 'BMW X1', 'Sport activity coupe', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1901, 119, 'BMW X3', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1902, 119, 'BMW X3', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1903, 119, 'BMW X3', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (1904, 119, 'BMW X3', 'Sport activity coupe', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2001, 120, 'BMW X5', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2002, 120, 'BMW X5', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2003, 120, 'BMW X5', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2004, 120, 'BMW X5', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2005, 120, 'BMW X5', 'Sport activity coupe', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2101, 121, 'BMW X7', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2102, 121, 'BMW X7', 'Sport activity coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2103, 121, 'BMW X7', 'Sport activity coupe', 75000, 90000, 24);


-- Gran coupe
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2201, 122, 'BMW 2 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2202, 122, 'BMW 2 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2203, 122, 'BMW 2 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2301, 123, 'BMW 4 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2302, 123, 'BMW 4 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2303, 123, 'BMW 4 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2304, 123, 'BMW 4 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2305, 123, 'BMW 4 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);

INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2401, 124, 'BMW 8 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2402, 124, 'BMW 8 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2403, 124, 'BMW 8 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);
INSERT INTO xe (MaXe, MaDongXe, TenDongXe, LoaiXe, GiaNhap, GiaBan, ThoiGianBaoHanh) VALUES (2404, 124, 'BMW 8 Series Gran Coupe', 'Gran coupe', 75000, 90000, 24);

SELECT * FROM xe;


-- Thêm dữ liệu bảng XEDABAN
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (104, 'BMW Z1', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (105, 'BMW Z1', 50000, 60000, 2020, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (305, 'BMW Z4', 50000, 60000, 2020, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (506, 'BMW i3', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (507, 'BMW i3', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (802, 'BMW iX3', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (803, 'BMW iX3', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (904, 'BMW iX3', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (905, 'BMW iNEXT', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (906, 'BMW iNEXT', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (907, 'BMW iNEXT', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (1006, 'BMW 3 Series', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (1205, 'BMW 7 Series', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (1206, 'BMW 7 Series', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (1207, 'BMW 7 Series', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (1307, 'BMW 2 Series Convertible', 50000, 60000, 2020, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (1405, 'BMW 4 Series Convertible', 50000, 60000, 2020, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (1806, 'BMW X1', 70000, 84000, 2021, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (1807, 'BMW X1', 50000, 60000, 2020, 24);
INSERT INTO XEDABAN (MaXe, TenDongXe, GiaNhap, GiaBan, NamSX, ThoiGianBaoHanh) VALUES (2204, 'BMW 2 Series Gran Coupe', 70000, 84000, 2021, 24);


-- Thêm dữ liệu bảng HOPDONGMUAXE

INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (101, 101, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 80000, 103);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (102, 102, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 90000, 104);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (103, 103, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 80000, 105);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (104, 104, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 90000, 106);
INSERT INTO HopDongMuaXe (MAHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (105, 105, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 80000, 103);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (106, 106, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 90000, 104);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (107, 107, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 80000, 105);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (108, 108, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 90000, 106);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (109, 109, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 80000, 103);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (110, 110, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 90000, 104);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (111, 101, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 80000, 105);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (112, 102, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 90000, 106);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (113, 103, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 80000, 103);
INSERT INTO HopDongMuaXe (MaHDMX, MaKH, NgayTaoHopDong, TongCong, MaNV) VALUES (114, 104, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 90000, 104);



-- Thêm dữ liệu bảng CTHDMX

INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (101, 104);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (102, 105);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (103, 305);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (104, 506);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (105, 507);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (106, 802);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (107, 803);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (108, 904);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (109, 905);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (110, 906);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (111, 907);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (112, 1006);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (113, 1205);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (114, 1206);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (101, 1207);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (102, 1307);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (103, 1405);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (104, 1806);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (105, 1807);
INSERT INTO CTHDMX (MaHDMX, MaXe) VALUES (106, 2204);



-- Thêm dữ liệu bảng LichSuaChua

INSERT INTO LichSuaChua (MaLSC, MaXe, Ngay, Ca, MaNV) VALUES (101, 104, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 1, 107);
INSERT INTO LichSuaChua (MaLSC, MaXe, Ngay, Ca, MaNV) VALUES (102, 105, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 2, 108);
INSERT INTO LichSuaChua (MaLSC, MaXe, Ngay, Ca, MaNV) VALUES (103, 907, TO_DATE('2024-05-14', 'YYYY-MM-DD'), 1, 109);
INSERT INTO LichSuaChua (MaLSC, MaXe, Ngay, Ca, MaNV) VALUES (104, 904, TO_DATE('2024-05-15', 'YYYY-MM-DD'), 2, 110);
INSERT INTO LichSuaChua (MaLSC, MaXe, Ngay, Ca, MaNV) VALUES (105, 506, TO_DATE('2024-05-14', 'YYYY-MM-DD'), 1, 107);
INSERT INTO LichSuaChua (MaLSC, MaXe, Ngay, Ca, MaNV) VALUES (106, 803, TO_DATE('2024-05-15', 'YYYY-MM-DD'), 2, 108);


SELECT * FROM LichSuaChua

-- Thêm dữ liệu bảng HoaDonSuaChua

INSERT INTO HoaDonSuaChua (MaHD, MaLSC, TrangThai, NgayTraXe, ThanhTien) VALUES (101, 101, 'Hoan thanh', TO_DATE('2024-05-23', 'YYYY-MM-DD'), 120000);
INSERT INTO HoaDonSuaChua (MaHD, MaLSC, TrangThai, NgayTraXe, ThanhTien) VALUES (102, 102, 'Hoan thanh', TO_DATE('2024-05-23', 'YYYY-MM-DD'), 120000);
INSERT INTO HoaDonSuaChua (MaHD, MaLSC, TrangThai, NgayTraXe, ThanhTien) VALUES (103, 103, 'Hoan thanh', TO_DATE('2024-05-23', 'YYYY-MM-DD'), 120000);
INSERT INTO HoaDonSuaChua (MaHD, MaLSC, TrangThai, NgayTraXe, ThanhTien) VALUES (104, 104, 'Hoan thanh', TO_DATE('2024-05-23', 'YYYY-MM-DD'), 120000);
INSERT INTO HoaDonSuaChua (MaHD, MaLSC, TrangThai, NgayTraXe, ThanhTien) VALUES (105, 105, 'Hoan thanh', TO_DATE('2024-05-23', 'YYYY-MM-DD'), 120000);
INSERT INTO HoaDonSuaChua (MaHD, MaLSC, TrangThai, NgayTraXe, ThanhTien) VALUES (106, 106, 'Hoan thanh', TO_DATE('2024-05-23', 'YYYY-MM-DD'), 120000);


-- Thêm dữ liệu bảng ChiTietHoaDon

INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (101, 101, 1);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (101, 105, 3);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (101, 107, 4);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (102, 102, 2);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (102, 103, 4);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (103, 104, 1);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (103, 106, 2);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (103, 109, 3);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (104, 102, 4);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (105, 108, 3);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (105, 110, 2);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (106, 103, 3);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (106, 105, 1);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (106, 108, 2);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (106, 113, 1);
INSERT INTO ChiTietHoaDon (MaHD, MaPK, SoLuong) VALUES (106, 118, 1);

select * from hoadonsuachua