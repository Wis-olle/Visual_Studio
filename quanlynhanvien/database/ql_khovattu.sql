CREATE DATABASE QL_khovattu
GO

USE QL_khovattu
GO

-- 1. KHÁCH HÀNG
CREATE TABLE KhachHang
(
    MaKhachHang VARCHAR(20) PRIMARY KEY,
    TenKhachHang NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(20),
    DiaChi NVARCHAR(200),
    GhiChu NVARCHAR(200)
)
GO

-- 2. NHÀ CUNG CẤP
CREATE TABLE NhaCungCap
(
    MaNhaCungCap VARCHAR(20) PRIMARY KEY,
    TenNhaCungCap NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(20),
    DiaChi NVARCHAR(200),
    GhiChu NVARCHAR(200)
)
GO

-- 3. NHÂN VIÊN
CREATE TABLE NhanVien
(
    MaNhanVien VARCHAR(20) PRIMARY KEY,
    TenNhanVien NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(20),
    DiaChi NVARCHAR(200),
    GhiChu NVARCHAR(200),
    Email VARCHAR(100)
)
GO
ALTER TABLE NhanVien ADD NgaySinh DATE;

-- 4. HÀNG HÓA / VẬT TƯ
CREATE TABLE HangHoa
(
    MaHangHoa VARCHAR(20) PRIMARY KEY,
    TenHangHoa NVARCHAR(100) NOT NULL,
    MaNhaCungCap VARCHAR(20),
    SoLuong INT DEFAULT 0,
    DonViTinh NVARCHAR(30),
    GhiChu NVARCHAR(200),

    FOREIGN KEY (MaNhaCungCap)
    REFERENCES NhaCungCap(MaNhaCungCap)
)
GO
ALTER TABLE HangHoa ADD HinhAnh NVARCHAR(255);
GO

-- 5. PHIẾU NHẬP
CREATE TABLE PhieuNhap
(
    MaPhieuNhap VARCHAR(20) PRIMARY KEY,
    NgayNhap DATE NOT NULL,

    MaNhaCungCap VARCHAR(20),
    MaNhanVien VARCHAR(20),
    GhiChu NVARCHAR(200),

    FOREIGN KEY (MaNhaCungCap)
    REFERENCES NhaCungCap(MaNhaCungCap),

    FOREIGN KEY (MaNhanVien)
    REFERENCES NhanVien(MaNhanVien)
)
GO

-- 6. CHI TIẾT PHIẾU NHẬP
CREATE TABLE ChiTietPhieuNhap
(
    MaPhieuNhap VARCHAR(20),
    MaHangHoa VARCHAR(20),
    SoLuong INT NOT NULL,
    DonGia FLOAT NOT NULL,

    PRIMARY KEY (MaPhieuNhap, MaHangHoa),

    FOREIGN KEY (MaPhieuNhap)
    REFERENCES PhieuNhap(MaPhieuNhap),

    FOREIGN KEY (MaHangHoa)
    REFERENCES HangHoa(MaHangHoa)
)
GO

-- 7. PHIẾU XUẤT
CREATE TABLE PhieuXuat
(
    MaPhieuXuat VARCHAR(20) PRIMARY KEY,
    NgayXuat DATE NOT NULL,
    MaKhachHang VARCHAR(20),
    MaNhanVien VARCHAR(20),
    GhiChu NVARCHAR(200),

    FOREIGN KEY (MaKhachHang)
    REFERENCES KhachHang(MaKhachHang),

    FOREIGN KEY (MaNhanVien)
    REFERENCES NhanVien(MaNhanVien)
)
GO

-- 8. CHI TIẾT PHIẾU XUẤT
CREATE TABLE ChiTietPhieuXuat
(
    MaPhieuXuat VARCHAR(20),
    MaHangHoa VARCHAR(20),
    SoLuong INT NOT NULL,
    DonGia FLOAT NOT NULL,

    PRIMARY KEY (MaPhieuXuat, MaHangHoa),

    FOREIGN KEY (MaPhieuXuat)
    REFERENCES PhieuXuat(MaPhieuXuat),

    FOREIGN KEY (MaHangHoa)
    REFERENCES HangHoa(MaHangHoa)
)
INSERT INTO NhaCungCap
VALUES
('NCC01', N'Công ty Thăng Long', '0123456', N'Hà Nội', N'Hàng chất lượng'),
('NCC02', N'Công ty Phan Thị', '045252523', N'Hà Nội', N'Hàng qua tay'),
('NCC03', N'Công ty Đại Duy', '0787878', N'Số 36 Phan X, Hà Nội', N'')
GO

INSERT INTO KhachHang
VALUES
('KH01', N'Nguyễn Tất Thành', '03141414', N'Hà Nội', N'VIP'),
('KH02', N'Đinh Công Quyền', '03142443', N'Hà Nội', N'VIP'),
('KH03', N'Cao Đức Chính', '0323231', N'Hà Nội', N'Khách mới'),
('KH04', N'Cao Mỹ Vy', '0898988', N'Hồ Chí Minh', N''),
('KH05', N'Đào Xuân', '0365668063', N'Đông Anh - Hà Nội', N'')
GO

INSERT INTO NhanVien (MaNhanVien, TenNhanVien, SoDienThoai, Email, DiaChi, GhiChu) VALUES 
('NV01', N'Nguyễn Văn An', '0912345678', 'an.nv@kho.vn', N'Hà Nội', N'Quản lý'),
('NV02', N'Trần Thị Mai', '0987654321', 'mai.tt@kho.vn', N'Hà Nội', N'Nhân viên kho'),
('NV03', N'Lê Văn Nam', '0909123456', 'nam.lv@kho.vn', N'Hà Nội', N'Nhân viên kho'),
('NV101', N'Đỗ Minh Quân', '0918223344', 'quan.dm@kho.vn', N'Hà Nội', N'Thủ kho ca ngày'),
('NV102', N'Nguyễn Thị Ngọc', '0975112233', 'ngoc.nt@kho.vn', N'Hà Nội', N'Nhân viên kiểm định vật tư'),
('NV103', N'Bùi Thanh Tú', '0909887766', 'tu.bt@kho.vn', N'Hà Nội', N'Phụ trách xuất kho'),
('NV104', N'Hoàng Văn Nam', '0932445566', 'nam.hv@kho.vn', N'Hà Nội', N'Nhân viên kho');
GO

INSERT INTO HangHoa
VALUES
('HH01', N'Đồng 2', 'NCC03', 1000, N'kg', N'Hàng chuyển giao'),
('HH02', N'Đồng 1', 'NCC02', 1000, N'tấn', N'Hàng chuyển giao'),
('HH03', N'Kim cương', 'NCC03', 2, N'kg', N'Hàng'),
('HH04', N'Đồng', 'NCC03', 150, N'kg', N'Không'),
('HH05', N'Sắt 6', 'NCC01', 1000, N'tạ', N'Bán gấp'),
('HH07', N'Sắt', 'NCC02', 100, N'tạ', N'Không')
GO
select * from HangHoa
select * from NhaCungCap
select * from KhachHang
select * from NhanVien


