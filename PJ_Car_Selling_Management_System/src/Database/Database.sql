ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER MYDATABASE IDENTIFIED BY 123;

GRANT ALL PRIVILEGES TO MYDATABASE; 

-- Tao bang NhanVien

CREATE TABLE NhanVien(
  MaNV INT,
  TenNV NVARCHAR2(20),
  SDT VARCHAR(10) UNIQUE,
  QueQuan NVARCHAR2(30),
  GioiTinh NVARCHAR2(3),
  Luong NUMBER(10),
  ChucVu NVARCHAR2(10),
  TaiKhoan VARCHAR2(6),
  MatKhau VARCHAR2(4),
  TrangThai NVARCHAR2(20)
);

-- Tao khoa chinh cho bang NhanVien

ALTER TABLE NhanVien ADD CONSTRAINT PK_NV PRIMARY KEY (MaNV);

-- Them rang buoc

ALTER TABLE NhanVien 
  ADD CONSTRAINT NV_TENNV_NNULL CHECK('TenNV' IS NOT NULL)
  ADD CONSTRAINT NV_SDT_NNULL CHECK('SDT' IS NOT NULL)
  ADD CONSTRAINT NV_QUEQUAN_NNULL CHECK('QueQuan' IS NOT NULL)
  ADD CONSTRAINT NV_GIOTINH_THUOC CHECK('GioiTinh' IN ('Nam', 'Nữ'))
  ADD CONSTRAINT NV_LUONG_NNULL CHECK('Luong' IS NOT NULL)
  ADD CONSTRAINT NV_CHUCVU_THUOC CHECK('ChucVu' IN ('Quản lý', 'Nhân viên kho', 'Nhân viên kỹ thuật', 'Nhân viên bán hàng'))
  ADD CONSTRAINT NV_TAIKHOAN_NNUL CHECK('TaiKhoan' IS NOT NULL)
  ADD CONSTRAINT NV_MATKHAU_NNUL CHECK('MatKhau' IS NOT NULL),
  ADD CONSTRAINT NV_TRANGTHAI_THUOC CHECK('TrangThai' IN ('Còn làm', 'Đã nghỉ'));

-- Tao bang KhachHang

CREATE TABLE KhachHang(
  MaKH INT,
  TenKH NVARCHAR2(20),
  SDT VARCHAR(10),
  QueQuan NVARCHAR2(30),
  GioiTinh NVARCHAR2(3),
  SoTienDaMua NUMBER(13, 2) DEFAULT 0,
  LoaiKH NVARCHAR2(10) DEFAULT 'Thường';
);

-- Tao khoa chinh

ALTER TABLE KhachHang ADD CONSTRAINT PK_KhachHang PRIMARY KEY (MaKH);

-- Tao rang buoc

ALTER TABLE KHACHHANG
  ADD CONSTRAINT KH_TenKH_NNULL CHECK('TenKH' IS NOT NULL)
  ADD CONSTRAINT KH_SDT_NNULL CHECK('SDT' IS NOT NULL)
  ADD CONSTRAINT KH_GioiTinh_NNULL CHECK('GioiTinh' IN ('Nam', 'Nữ')),
  ADD CONSTRAINT KH_LoaiKH_THUOC CHECK('LoaiKH' IN ('Thường', 'Vip'));

-- Tao bang NhaCungCap

CREATE TABLE NhaCungCap(
  MaNCC VARCHAR(3),
  TenNCC NVARCHAR2(30),
  DiaChi NVARCHAR2(50),
  HangXe VARCHAR2(20)
);

-- Tao khoa chinh

ALTER TABLE NhaCungCap ADD CONSTRAINT PK_NCC PRIMARY KEY (MaNCC);

-- Tao rang buoc 

ALTER TABLE NHACUNGCAP  
  ADD CONSTRAINT NCC_TenNCC CHECK('TenNCC' IS NOT NULL)
  ADD CONSTRAINT NCC_DiaChi CHECK('DiaChi' IS NOT NULL)
  ADD CONSTRAINT NCC_HangXe CHECK('HangXe' IS NOT NULL);

-- Tao bang xe

CREATE TABLE Xe (
  MaXe VARCHAR2(16),
  TenXe NVARCHAR2(30),
  MauXe NVARCHAR2(15),
  KieuDangXe NVARCHAR2(20),
  MaNCC VARCHAR(3), 
  LoaiDongCo NVARCHAR2(30),
  DungTich NUMBER(3, 2),
  MucTieuHao NUMBER(3, 2),
  TrongLuong NUMBER(4, 2),
  LoaiLop NVARCHAR2(20),
  KichThuocMamXe NUMBER(5, 2),
  TrangBiNgoaiThat NVARCHAR2(20),
  TrangBiNoiThat NVARCHAR2(20),
  GiaNhap NUMBER(10),
  GiaBan NUMBER(10),
  NamSX NUMBER,
  ThoiGianBaoHanh INT,
  TrangThai NVARCHAR2(20) DEFAULT 'Trong kho'
);

-- Tao khoa chinh

ALTER TABLE Xe ADD CONSTRAINT PK_Xe PRIMARY KEY (MaXe);

-- Tao khoa ngoai

ALTER TABLE Xe ADD CONSTRAINT FK_Xe_NCC_MaNCC FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC);

-- Tao rang buoc

ALTER TABLE Xe
  ADD CONSTRAINT XE_TenXe_NNULL CHECK('TenXe' IS NOT NULL)
  ADD CONSTRAINT Xe_NamSX_NNULL CHECK('NamSX' IS NOT NULL)
  ADD CONSTRAINT Xe_GiaNhap_NNULL CHECK('GiaNhap' IS NOT NULL)
  ADD CONSTRAINT Xe_GiaBan_NNULL CHECK('GiaBan' IS NOT NULL)
  ADD CONSTRAINT Xe_TrangThai_Thuoc CHECK('TrangThai' IN ('Trong kho', 'Đã bán'));

-- Tao bang phu kien

CREATE TABLE PhuKien(
  MaPK VARCHAR2(5),
  TenPK NVARCHAR2(30),
  SoLuong NUMBER DEFAULT 0,
  GiaNhap NUMBER DEFAULT 0,
  GiaBan NUMBER DEFAULT 0
);

-- Tao khoa chinh

ALTER TABLE PhuKien ADD CONSTRAINT PK_PhuKien PRIMARY KEY (MaPK);

-- Tao rang buoc

ALTER TABLE PhuKien 
  ADD CONSTRAINT PK_TenPK_NNULL CHECK('TenPK' IS NOT NULL)
  ADD CONSTRAINT PK_SoLuong_NNULL CHECK ('SoLuong' IS NOT NULL)
  ADD CONSTRAINT PK_GiaNhap_NNULL CHECK('GiaNhap' IS NOT NULL)
  ADD CONSTRAINT PK_GiaBan_NNULL CHECK('GiaBan' IS NOT NULL); 

-- Tao bang XeDaBan

CREATE TABLE XeDaBan(
  MaXe VARCHAR2(16),
  MaKH INT,
  NgayNhan DATE,
  ThoiGianBaoHanh DATE
);

-- Tao khoa chinh

ALTER TABLE XeDaBan ADD CONSTRAINT PK_XeDaBan PRIMARY KEY (MaXe);

-- Tao khoa ngoai

ALTER TABLE XeDaBan ADD CONSTRAINT FK_XeDaBan_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH);

-- Tao rang buoc

ALTER TABLE XEDABAN ADD CONSTRAINT XDB_NgayMua_NNULL CHECK('NgayNhan' IS NOT NULL);

-- Tao bang LichSuaChua

CREATE TABLE SuaChua(
  MaSC INT,
  MaXe VARCHAR2(16),
  NgaySuaChua DATE UNIQUE,
  TrangThai NVARCHAR2(20),
  GhiChu NVARCHAR2(80) DEFAULT '',
  NgayTraXe DATE,
  ThanhTien NUMBER  DEFAULT 0
);

-- Tao khoa chinh

ALTER TABLE SuaChua ADD CONSTRAINT PK_SC PRIMARY KEY (MaSC);

-- Tao rang buoc 

ALTER TABLE SUACHUA
  ADD CONSTRAINT SC_MaXe_NNULL CHECK('MaXe' IS NOT NULL)
  ADD CONSTRAINT SC_TrangThai CHECK ('TrangThai' IN ('Chưa hoàn thành', 'Hoàn thành'));

-- Tao bang ThongTinSuaChua

CREATE TABLE ThongTinSuaChua( 
  MaSC INT,
  MaPK VARCHAR2(5),
  SoLuong INT DEFAULT 0
);

-- Tao khoa chinh

ALTER TABLE ThongTinSuaChua ADD CONSTRAINT PK_TTSC PRIMARY KEY (MaSC, MaPK);

-- Tao khoa ngoai

ALTER TABLE ThongTinSuaChua ADD CONSTRAINT FK_TTSC_SC FOREIGN KEY (MaSC) REFERENCES SuaChua(MaSC);
ALTER TABLE ThongTinSuaChua ADD CONSTRAINT FK_TTSC_PK FOREIGN KEY (MaPK) REFERENCES PhuKien(MaPK);

-- Tao bang HopDongMuaXe

CREATE TABLE HopDongMuaXe(
  MaHD INT,
  MaKH INT,
  NgayTaoHopDong DATE,
  TongCong NUMBER(12, 0) DEFAULT 0,
  MaNV INT
);

-- Tao khoa chinh

ALTER TABLE HopDongMuaXe ADD CONSTRAINT PK_HDMX PRIMARY KEY (MaHD);

-- Tao khoa ngoai

ALTER TABLE HopDongMuaXe 
  ADD CONSTRAINT FK_HDMX_KH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
  ADD CONSTRAINT FK_HDMX_NV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV);

-- Tao bang CTHDMX (Chi tiet hop dong mua xe)

CREATE TABLE CTHDMX (
  MaHD INT,
  MaXe VARCHAR2(16),
  TrangThai NVARCHAR2(20) DEFAULT 'Trong kho'
);

-- Tao khoa chinh

ALTER TABLE CTHDMX ADD CONSTRAINT PK_CTHDMX PRIMARY KEY (MaHD, MaXe);

-- Tao khoa ngoai

ALTER TABLE CTHDMX 
  ADD CONSTRAINT FK_CTHDMX_HD FOREIGN KEY (MaHD) REFERENCES HopDongMuaXe(MaHD)
  ADD CONSTRAINT FK_CTHDMX_Xe FOREIGN KEY (MaXe) REFERENCES Xe(MaXe);
  
-- Tao rang buoc

ALTER TABLE CTHDMX ADD CONSTRAINT CTHDMX_TrangThai_Thuoc CHECK('TrangThai' IN ('Trong kho', 'Đã giao')); 

-- Tao trigger cho bang ThongTinSuaChua(SoLuong) < PhuKien(SoLuong), neu du thi cap nhap so luong trong kho

CREATE OR REPLACE TRIGGER TG_TTSC_SL
BEFORE INSERT OR UPDATE OF SoLuong ON THONGTINSUACHUA
FOR EACH ROW
DECLARE 
  n_SoLuongKho PhuKien.SOLUONG%TYPE;
BEGIN
  SELECT COUNT(*) INTO N_SOLUONGKHO 
  FROM PhuKien 
  WHERE :NEW.MAPK = MAPK;

  IF (N_SOLUONGKHO < :NEW.SOLUONG) THEN 
    RAISE_APPLICATION_ERROR(-20000, 'So luong phu kien trong kho khong du');
  ELSE 
    UPDATE PHUKIEN
    SET SOLUONG = SOLUONG - :NEW.SOLUONG
    WHERE MAPK = :NEW.MAPK;
  END IF;
END;

-- Tao trigger cho bang ThongTinSuaChua neu SuaChua(TrangThai) = 'Hoàn thành' thi khong them duoc TTSC

CREATE OR REPLACE TRIGGER TG_TTSC_THEM
BEFORE INSERT ON THONGTINSUACHUA
FOR EACH ROW
DECLARE
  v_TrangThai SUACHUA.TRANGTHAI%TYPE;
BEGIN
  SELECT TRANGTHAI INTO V_TRANGTHAI
  FROM SUACHUA 
  WHERE MASC = :NEW.MASC;

  IF (V_TRANGTHAI = 'Hoàn thành') THEN  
    RAISE_APPLICATION_ERROR(-20000, 'Xe đã sửa chữa xong');
  END IF;
END;

-- Tao trigger cho bang ThongTinSuaChua neu them ThongTin thi cap nhat don gia cho SuaChua

CREATE OR REPLACE TRIGGER TG_TTSC_THANHTIEN_THEM
AFTER INSERT ON THONGTINSUACHUA
FOR EACH ROW 
DECLARE 
  n_DonGia PHUKIEN.GIABAN%TYPE;
BEGIN
  SELECT GiaBan INTO N_DONGIA
  FROM PHUKIEN 
  WHERE MAPK = :NEW.MAPK;

  UPDATE SUACHUA
  SET THANHTIEN = THANHTIEN + N_DONGIA * :NEW.SOLUONG
  WHERE MASC = :NEW.MASC;
END;

CREATE OR REPLACE TRIGGER TG_TTSC_THANHTIEN_SUA
AFTER UPDATE OF SOLUONG ON THONGTINSUACHUA
FOR EACH ROW
DECLARE 
  n_DonGia PHUKIEN.GIABAN%TYPE;
BEGIN
  SELECT GiaBan INTO N_DONGIA
  FROM PHUKIEN 
  WHERE MAPK = :NEW.MAPK;

  UPDATE SUACHUA
  SET THANHTIEN = THANHTIEN + N_DONGIA * (:NEW.SOLUONG - :OLD.SOLUONG)
  WHERE MASC = :NEW.MASC;
END;

CREATE OR REPLACE TRIGGER TG_TTSC_THANHTIEN_XOA
AFTER DELETE ON THONGTINSUACHUA
FOR EACH ROW
DECLARE
  n_DonGia PHUKIEN.GIABAN%TYPE;
BEGIN
  SELECT GiaBan INTO N_DONGIA
  FROM PHUKIEN 
  WHERE MAPK = :NEW.MAPK;

  UPDATE SUACHUA
  SET THANHTIEN = THANHTIEN - N_DONGIA * :NEW.SOLUONG
  WHERE MASC = :NEW.MASC;
END;

-- Tao trigger cho bang PHUKIEN khi UPDATE GIABAN thi se UPDATE lai THANHTIEN nhung SUACHUA co TRANGTHAI la 'Chưa hoàn thành'

CREATE OR REPLACE TRIGGER TG_PK_GIABAN
AFTER UPDATE OF GIABAN ON PHUKIEN
FOR EACH ROW
DECLARE 
  n_DonGiaCu PHUKIEN.GIABAN%TYPE := :OLD.GIABAN;
  n_DonGiaMoi PHUKIEN.GIABAN%TYPE := :NEW.GIABAN; 
  CURSOR c IS ( SELECT T.MASC, T.SOLUONG
                FROM SuaChua s
                JOIN THONGTINSUACHUA t ON s.MASC = t.MASC
                WHERE s.TRANGTHAI = 'Chưa hoàn thành' AND T.MAPK = :NEW.MAPK);
  i_MaSC SUACHUA.MASC%TYPE;
  i_SoLuong THONGTINSUACHUA.SOLUONG%TYPE;
BEGIN 
  OPEN c;
  LOOP
    FETCH c INTO I_MASC, I_SOLUONG;
    UPDATE SUACHUA
    SET ThanhTien = ThanhTien - (N_DONGIACU - N_DONGIAMOI) * I_SOLUONG
    WHERE MASC = I_MASC;
  EXIT WHEN c%NOTFOUND;
  END LOOP;
END;

-- Trigger cho bang CTHDMX khi da giao xe

CREATE OR REPLACE TRIGGER TG_CTHDMX_TRANGTHAI
AFTER INSERT OR UPDATE OF TRANGTHAI ON CTHDMX
FOR EACH ROW
DECLARE 
  V_MAXE CTHDMX.MAXE%TYPE := :NEW.MAXE;
  I_MAKH HOPDONGMUAXE.MAKH%TYPE;
  I_THOIHANBAOHANH xe.THOIGIANBAOHANH%TYPE;
BEGIN 
  SELECT MAKH INTO I_MAKH
  FROM HOPDONGMUAXE h
  WHERE H.MAHD = :NEW.MAHD;

  SELECT THOIGIANBAOHANH INTO I_THOIHANBAOHANH
  FROM xe 
  WHERE maxe = :NEW.MAXE;

  IF :NEW.TRANGTHAI = 'Đã giao' THEN 
    UPDATE XE
    SET TRANGTHAI = 'Đã bán'
    WHERE MAXE = :NEW.MAXE;
    
    INSERT INTO XeDaBan(MAXE, MAKH, NGAYNHAN, THOIGIANBAOHANH) VALUES
      (:NEW.MAXE, I_MAKH, SYSDATE, ADD_MONTHS(SYSDATE, 12 * I_THOIHANBAOHANH));
  END IF;
END;

-- Trigger cho bang CTHDMX khi them vao hop dong 1 xe -> tinh tong cong


CREATE OR REPLACE TRIGGER TG_CTHDMX_THANHTIEN_THEM
AFTER INSERT ON CTHDMX
FOR EACH ROW 
DECLARE 
  n_GiaXe Xe.GIABAN%TYPE;
BEGIN
  SELECT GiaBan INTO N_GIAXE
  FROM Xe 
  WHERE MAXE = :NEW.MAXE;

  UPDATE HOPDONGMUAXE
  SET TONGCONG = TONGCONG + N_GIAXE
  WHERE MAHD = :NEW.MAHD;
END;


CREATE OR REPLACE TRIGGER TG_CTHDMX_THANHTIEN_SUA
AFTER UPDATE OF MAXE ON CTHDMX
FOR EACH ROW 
DECLARE 
  n_GiaXeCu Xe.GIABAN%TYPE;
  N_GIAXEMOI Xe.GIABAN%TYPE;
BEGIN
  SELECT GiaBan INTO N_GIAXEMOI
  FROM Xe 
  WHERE MAXE = :NEW.MAXE;

  SELECT GIABAN INTO N_GIAXECU
  FROM XE
  WHERE MAXE = :OLD.MAXE;

  UPDATE HOPDONGMUAXE
  SET TONGCONG = TONGCONG + N_GIAXEMOI - N_GIAXECU
  WHERE MAHD = :NEW.MAHD;
END;

CREATE OR REPLACE TRIGGER TG_CTHDMX_THANHTIEN_XOA
AFTER DELETE ON CTHDMX
FOR EACH ROW 
DECLARE 
  n_GiaXe Xe.GIABAN%TYPE;
BEGIN
  SELECT GiaBan INTO N_GIAXE
  FROM Xe 
  WHERE MAXE = :OLD.MAXE;

  UPDATE HOPDONGMUAXE
  SET TONGCONG = TONGCONG - N_GIAXE
  WHERE MAHD = :OLD.MAHD;
END;

-- Tao trigger bang khach hang, tinh sotiendamua = tong(hopdongmuaxe(tongcong))
-- Neu so tien > 3ty => khachhang vip 
-- Neu khong thi la khach hang thuong

CREATE OR REPLACE TRIGGER TG_KH_TONGTIEN
BEFORE INSERT ON KHACHHANG
FOR EACH ROW
DECLARE 
  n_tongtien KHACHHANG.SOTIENDAMUA%TYPE;
BEGIN
  SELECT SUM(tongcong) INTO N_TONGTIEN
  FROM HOPDONGMUAXE h
  WHERE MAKH = :NEW.MAKH;
  :NEW.SOTIENDAMUA := N_TONGTIEN;

  IF (N_TONGTIEN >= 3000000000) THEN
    :NEW.LOAIKH := 'Vip';
  END IF;
END;