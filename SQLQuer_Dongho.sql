create database QLBanDongHo
go
use QLBanDongHo


create table KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) not null,
	Taikhoan Varchar(50) unique,
	Matkhau Varchar(50) not null,
	Email Varchar(100) unique,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),
	Ngaysinh Datetime,
	CONSTRAINT PK_Khachhang PRIMARY KEY (MaKH)
)
go
create table NHASANXUAT
(
	MaNSX int identity(1,1),
	TenNSX nvarchar(50) not null,
	Diachi nvarchar(200),
	DienThoai varchar(50),
	CONSTRAINT PK_NhaSanXuat PRIMARY KEY (MaNSX)
) 
go
create table DONGHO
(
	Madongho INT IDENTITY(1,1),
	Tendongho nvarchar(100) not null,
	Giaban Decimal(18,0) CHECK(Giaban>=0),
	Mota NVarchar(Max),
	Anhnen varchar(50),
	Ngaycapnhat datetime,
	soluongton int,
	MaNSX int,
	Constraint FK_NHASX Foreign key (MaNSX) references NHASANXUAT(MaNSX),
	Constraint PK_DONGHO Primary key (Madongho)
)
go
create table DONDATHANG
(
	MaDonHang int identity(1,1),
	Dathanhtoan bit,
	Tinhtranggiaohang bit,
	Ngaydat Datetime,
	Ngaygiao Datetime,
	MaKH int,
	constraint FK_Khachhang foreign key (MaKH) References KhachHang(MaKH),
	constraint FK_DonDatHang primary key (Madonhang)
)

go

create table CHITIETDONHANG
(
	MaDonHang int,
	Madongho int,
	soluong int check (soluong>0),
	Dongia Decimal(18,0) check (Dongia>0),
	Constraint PK_CTDathang primary key(MaDonHang,Madongho),
	Constraint FK_Donhang Foreign key (Madonhang) references Dondathang(Madonhang),
	Constraint FK_Dongho foreign key (Madongho) references Dongho(Madongho)
)