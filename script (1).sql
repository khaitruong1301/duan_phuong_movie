USE [master]
GO
/****** Object:  Database [BookingTicket]    Script Date: 3/23/2020 10:26:26 PM ******/
CREATE DATABASE [BookingTicket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingTicket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BookingTicket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingTicket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BookingTicket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookingTicket] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingTicket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingTicket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingTicket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingTicket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingTicket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingTicket] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingTicket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookingTicket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingTicket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingTicket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingTicket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingTicket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingTicket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingTicket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingTicket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingTicket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookingTicket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingTicket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingTicket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingTicket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingTicket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingTicket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingTicket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingTicket] SET RECOVERY FULL 
GO
ALTER DATABASE [BookingTicket] SET  MULTI_USER 
GO
ALTER DATABASE [BookingTicket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingTicket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingTicket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingTicket] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookingTicket] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookingTicket', N'ON'
GO
ALTER DATABASE [BookingTicket] SET QUERY_STORE = OFF
GO
USE [BookingTicket]
GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIM_THELOAI]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIM_THELOAI](
	[MaPhim] [int] NOT NULL,
	[MaTheLoai] [int] NOT NULL,
 CONSTRAINT [PK_Phim-TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC,
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_THE_LOAI]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_THE_LOAI]
AS
SELECT dbo.PHIM_THELOAI.MaPhim, dbo.PHIM_THELOAI.MaTheLoai, dbo.THELOAI.TenTheLoai
FROM     dbo.PHIM_THELOAI INNER JOIN
                  dbo.THELOAI ON dbo.PHIM_THELOAI.MaTheLoai = dbo.THELOAI.MaTheLoai
GO
/****** Object:  Table [dbo].[LICHCHIEU]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICHCHIEU](
	[MaLichChieu] [int] IDENTITY(1,1) NOT NULL,
	[MaRap] [int] NOT NULL,
	[MaPhim] [int] NOT NULL,
	[NgayChieuGioChieu] [datetime] NULL,
	[GiaVe] [decimal](18, 0) NULL,
	[GiamGia] [int] NULL,
 CONSTRAINT [PK_LichChieu] PRIMARY KEY CLUSTERED 
(
	[MaLichChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIM]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIM](
	[MaPhim] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](150) NOT NULL,
	[Trailer] [nvarchar](max) NOT NULL,
	[HinhAnh] [varchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NOT NULL,
	[ThoiLuong] [int] NULL,
	[NgayKhoiChieu] [date] NOT NULL,
	[DanhGia] [decimal](10, 1) NOT NULL,
	[DaoDien] [nvarchar](max) NULL,
	[DienVien] [nvarchar](max) NULL,
	[DoTuoi] [nvarchar](max) NOT NULL,
	[BiDanh] [nvarchar](150) NULL,
	[DaXoa] [bit] NOT NULL,
	[KhoiChieu] [bit] NOT NULL,
	[SapChieu] [bit] NOT NULL,
 CONSTRAINT [PK_Phim] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_LICH_CHIEU]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_LICH_CHIEU]
AS
SELECT dbo.LICHCHIEU.MaLichChieu, dbo.LICHCHIEU.MaRap, dbo.LICHCHIEU.MaPhim, dbo.PHIM.TenPhim, dbo.LICHCHIEU.NgayChieuGioChieu, dbo.LICHCHIEU.GiaVe, dbo.LICHCHIEU.MaHeThongRap, dbo.LICHCHIEU.MaCumRap
FROM     dbo.LICHCHIEU INNER JOIN
                  dbo.PHIM ON dbo.LICHCHIEU.MaPhim = dbo.PHIM.MaPhim
GO
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANHVIEN](
	[MaThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](150) NOT NULL,
	[HoTen] [nvarchar](200) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[SoDienThoai] [varchar](10) NOT NULL,
	[MaLoaiThanhVien] [int] NOT NULL,
	[BiDanh] [varchar](150) NULL,
	[SoLuongVeMua] [int] NULL,
	[DaXoa] [bit] NOT NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BINHLUANDANHGIA]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BINHLUANDANHGIA](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[MaThanhVien] [int] NOT NULL,
	[MaPhim] [int] NOT NULL,
	[NoiDungBinhLuan] [nvarchar](max) NOT NULL,
	[ChiSoDanhGia] [float] NULL,
	[NgayBinhLuan] [datetime] NULL,
 CONSTRAINT [PK_BINHLUANDANHGIA] PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_BINH_LUAN]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_BINH_LUAN]
AS
SELECT dbo.BINHLUANDANHGIA.MaPhim, dbo.BINHLUANDANHGIA.MaThanhVien, dbo.THANHVIEN.TaiKhoan, dbo.BINHLUANDANHGIA.NoiDungBinhLuan, dbo.BINHLUANDANHGIA.ChiSoDanhGia
FROM     dbo.BINHLUANDANHGIA INNER JOIN
                  dbo.THANHVIEN ON dbo.BINHLUANDANHGIA.MaThanhVien = dbo.THANHVIEN.MaThanhVien
GO
/****** Object:  Table [dbo].[RAP]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAP](
	[MaRap] [int] IDENTITY(1,1) NOT NULL,
	[TenRap] [nvarchar](50) NOT NULL,
	[SoGhe] [int] NULL,
	[MaCumRap] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rap] PRIMARY KEY CLUSTERED 
(
	[MaRap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUMRAP]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUMRAP](
	[MaCumRap] [varchar](50) NOT NULL,
	[TenCumRap] [nvarchar](100) NOT NULL,
	[ThongTin] [nvarchar](250) NOT NULL,
	[MaHeThongRap] [varchar](20) NOT NULL,
 CONSTRAINT [PK_CumRap] PRIMARY KEY CLUSTERED 
(
	[MaCumRap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_LICH_CHIEU_COMMON]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_LICH_CHIEU_COMMON]
AS
SELECT dbo.LICHCHIEU.MaLichChieu, dbo.LICHCHIEU.MaRap, dbo.LICHCHIEU.MaPhim, dbo.PHIM.TenPhim, dbo.LICHCHIEU.NgayChieuGioChieu, dbo.LICHCHIEU.GiaVe, dbo.LICHCHIEU.GiamGia, dbo.RAP.MaCumRap, 
                  dbo.CUMRAP.MaHeThongRap
FROM     dbo.RAP INNER JOIN
                  dbo.LICHCHIEU ON dbo.RAP.MaRap = dbo.LICHCHIEU.MaRap INNER JOIN
                  dbo.CUMRAP ON dbo.RAP.MaCumRap = dbo.CUMRAP.MaCumRap INNER JOIN
                  dbo.PHIM ON dbo.LICHCHIEU.MaPhim = dbo.PHIM.MaPhim
GO
/****** Object:  Table [dbo].[CHIETKHAUTHANHTOAN]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHIETKHAUTHANHTOAN](
	[MaChietKhau] [int] NOT NULL,
	[MaHeThongRap] [varchar](20) NOT NULL,
	[Ngay] [date] NULL,
	[HeSoChietKhau] [float] NULL,
 CONSTRAINT [PK_ChietKhau_ThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaChietKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHSACHDATVE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHSACHDATVE](
	[TaiKhoan] [nvarchar](150) NOT NULL,
	[DanhSachGhe] [nvarchar](max) NOT NULL,
	[MaLichChieu] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GHE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GHE](
	[MaGhe] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nchar](1) NOT NULL,
	[TenGhe] [nvarchar](10) NOT NULL,
	[MaRap] [int] NOT NULL,
	[SoThuTu] [int] NOT NULL,
	[MaLoaiGhe] [int] NOT NULL,
	[KichHoat] [bit] NOT NULL,
 CONSTRAINT [PK_Ghe] PRIMARY KEY CLUSTERED 
(
	[MaGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HETHONGRAP]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HETHONGRAP](
	[MaHeThongRap] [varchar](20) NOT NULL,
	[TenHeThongRap] [nvarchar](250) NOT NULL,
	[BiDanh] [varchar](50) NULL,
	[Logo] [varchar](max) NULL,
 CONSTRAINT [PK_HeThongRap] PRIMARY KEY CLUSTERED 
(
	[MaHeThongRap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIGHE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIGHE](
	[MaLoaiGhe] [int] IDENTITY(1,1) NOT NULL,
	[MaHeThongRap] [varchar](20) NULL,
	[TenLoaiGhe] [nvarchar](50) NULL,
	[MoTa] [nvarchar](250) NULL,
	[PhuThu] [int] NOT NULL,
 CONSTRAINT [PK_LoaiGhe] PRIMARY KEY CLUSTERED 
(
	[MaLoaiGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAITHANHVIEN]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAITHANHVIEN](
	[MaLoaiThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LoaiKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaLoaiThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUTHANHTOAN]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUTHANHTOAN](
	[MaThanhToan] [int] IDENTITY(1,1) NOT NULL,
	[MaThanhVien] [int] NOT NULL,
	[TongTien] [decimal](18, 0) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[TongTienHoanTra] [decimal](18, 0) NULL,
	[GiamGia] [int] NULL,
	[TrangThaiThanhToan] [int] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SETTING]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SETTING](
	[MaSetting] [varchar](10) NOT NULL,
	[Setting] [int] NOT NULL,
	[MoTa] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[MaThanhToan] [int] NOT NULL,
	[MaGhe] [int] NOT NULL,
	[GiaVe] [decimal](18, 0) NOT NULL,
	[MaLichChieu] [int] NOT NULL,
	[SoTienHoanTra] [decimal](18, 0) NULL,
	[TrangThaiHuy] [bit] NOT NULL,
 CONSTRAINT [PK_VE_1] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BINHLUANDANHGIA] ON 

INSERT [dbo].[BINHLUANDANHGIA] ([MaBinhLuan], [MaThanhVien], [MaPhim], [NoiDungBinhLuan], [ChiSoDanhGia], [NgayBinhLuan]) VALUES (1, 10, 16, N'Phim hay', 4, CAST(N'2019-12-23T00:15:35.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[BINHLUANDANHGIA] OFF
INSERT [dbo].[CHIETKHAUTHANHTOAN] ([MaChietKhau], [MaHeThongRap], [Ngay], [HeSoChietKhau]) VALUES (1, N'BHDStar', CAST(N'2019-12-04' AS Date), 0.5)
INSERT [dbo].[CHIETKHAUTHANHTOAN] ([MaChietKhau], [MaHeThongRap], [Ngay], [HeSoChietKhau]) VALUES (2, N'cgv', CAST(N'2019-12-04' AS Date), 0.4)
INSERT [dbo].[CHIETKHAUTHANHTOAN] ([MaChietKhau], [MaHeThongRap], [Ngay], [HeSoChietKhau]) VALUES (3, N'CineStar', CAST(N'2019-12-04' AS Date), 0.3)
INSERT [dbo].[CHIETKHAUTHANHTOAN] ([MaChietKhau], [MaHeThongRap], [Ngay], [HeSoChietKhau]) VALUES (4, N'Galaxy', CAST(N'2019-12-04' AS Date), 0.4)
INSERT [dbo].[CHIETKHAUTHANHTOAN] ([MaChietKhau], [MaHeThongRap], [Ngay], [HeSoChietKhau]) VALUES (5, N'LotteCinema', CAST(N'2019-12-04' AS Date), 0.5)
INSERT [dbo].[CHIETKHAUTHANHTOAN] ([MaChietKhau], [MaHeThongRap], [Ngay], [HeSoChietKhau]) VALUES (6, N'MegaGS', CAST(N'2019-12-04' AS Date), 0.5)
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'bhd-star-cineplex-3-2', N'BHD Star Cineplex - 3/2', N'L5-Vincom 3/2, 3C Đường 3/2, Q.10', N'BHDStar')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'bhd-star-cineplex-bitexco', N'BHD Star Cineplex - Bitexco', N'L3-Bitexco Icon 68, 2 Hải Triều, Q.1', N'BHDStar')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'bhd-star-cineplex-pham-hung', N'BHD Star Cineplex - Phạm Hùng', N'L4-Satra Phạm Hùng, C6/27 Phạm Hùng, Bình Chánh', N'BHDStar')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'bhd-star-cineplex-vincom-le-van-viet', N'BHD Star Cineplex - Vincom Lê Văn Việt', N'L4-Vincom Plaza, 50 Lê Văn Việt, Q.9', N'BHDStar')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'bhd-star-cineplex-vincom-quang-trung', N'BHD Star Cineplex - Vincom Quang Trung', N'B1-Vincom QT, 190 Quang Trung, Gò Vấp', N'BHDStar')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'bhd-star-cineplex-vincom-thao-dien', N'BHD Star Cineplex - Vincom Thảo Điền', N'L5-Megamall, 159 XL Hà Nội, Q.2', N'BHDStar')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-aeon-binh-tan', N'CGV - Aeon Bình Tân', N'Tầng 3, TTTM Aeon Mall Bình Tân, Số 1 đường số 17A, khu phố 11, Bình Trị Đông B, Bình Tân', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-aeon-tan-phu', N'CGV - Aeon Tân Phú', N'30 Bờ Bao Tân Thắng, Sơn Kỳ, Tân Phú', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-cgv-saigonres-nguyen-xi', N'CGV - CGV Saigonres Nguyễn Xí', N'Tầng 4-5, Saigonres Plaza, 79/81 Nguyễn Xí, P. 26, Bình Thạnh', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-crescent-mall', N'CGV - Crescent Mall', N'Lầu 5, Crescent Mall, Đại lộ Nguyễn Văn Linh, Phú Mỹ Hưng, Q. 7', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-ct-plaza', N'CGV - CT Plaza', N'60A Trường Sơn,P. 2, Tân Bình', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-golden-plaza', N'CGV - Golden Plaza', N'Tầng 4, Trung tâm thương mại Golden Plaza, 922 Nguyễn Trãi, P. 14, Q. 5', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-hoang-van-thu', N'CGV - Hoàng Văn Thụ', N'Tầng 1 và 2 Gala Center, 415 Hoàng Văn Thụ, P. 2, Tân Bình', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-hung-vuong-plaza', N'CGV - Hùng Vương Plaza', N'Lầu 7, 126 Hùng Vương, Q. 5', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-imc-tran-quang-khai', N'CGV - IMC Trần Quang Khải', N'T2&3, TTVH Đa Năng, 62 Trần Quang Khải, P.Tân Định, Q.1', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-liberty-citypoint', N'CGV - Liberty Citypoint', N'Tầng M - 1, khách sạn Liberty Center Saigon Citypoint, 59 - 61 Pateur, Q. 1', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-pandora-city', N'CGV - Pandora City', N'Lầu 3, Pandora City, 1/1 Trường Chinh, Tân Phú', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-paragon', N'CGV - Paragon', N'Tầng 5, toà nhà Parkson Paragon, 03 Nguyễn Lương Bằng, Q. ', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-parkson-dong-khoi', N'CGV - Parkson Đồng Khởi', N'Tầng 5 Parkson Đồng Khởi, 35bis-45 Lê Thánh Tôn, Bến Nghé, Q.1', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-pearl-plaza', N'CGV - Pearl Plaza', N'Lầu 5, Pearl Plaza, 561 Điện Biên Phủ, Bình Thạnh', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-satra-cu-chi', N'CGV - Satra Củ Chi', N'T3, TTTM Satra Củ Chi, Số 1239, Tỉnh Lộ 8, Ấp Thạnh An, Trung An, Củ Chi, TP.HCM', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-su-van-hanh', N'CGV - Sư Vạn Hạnh', N'T6 Vạn Hạnh Mall, 11 Sư Vạn Hạnh, Quận 10', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-vincom-dong-khoi', N'CGV - Vincom Đồng Khởi', N'Tầng 3, TTTM Vincom Center B, 72 Lê Thánh Tôn, Bến Nghé, Q. 1', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-vincom-go-vap', N'CGV - Vincom Gò Vấp', N'Tầng 5 TTTM Vincom Plaza Gò Vấp, 12 Phan Văn Trị, P. 7, Gò Vấp', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-vincom-landmark-81', N'CGV - Vincom Landmark 81', N'T B1 , TTTM Vincom Center Landmark 81, 772 Điện Biên Phủ, P.22, Q. Bình Thạnh, HCM', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-vincom-thu-duc', N'CGV - Vincom Thủ Đức', N'Tầng 5 Vincom Thủ Đức, 216 Võ Văn Ngân, Bình Thọ, Thủ Đức', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cgv-vivocity', N'CGV - VivoCity', N'Lầu 5, Trung tâm thương mại SC VivoCity - 1058 Nguyễn Văn Linh, Q. 7', N'CGV')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cns-hai-ba-trung', N'CNS - Hai Bà Trưng', N'135 Hai Bà Trưng, Bến Nghé, Q.1', N'CineStar')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'cns-quoc-thanh', N'CNS - Quốc Thanh', N'271 Nguyễn Trãi, Q.1', N'CineStar')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'glx-huynh-tan-phat', N'GLX - Huỳnh Tấn Phát', N'1362 Huỳnh Tấn Phát, KP1, Phú Mỹ, Q. 7', N'Galaxy')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'glx-kinh-duong-vuong', N'GLX - Kinh Dương Vương', N'718bis Kinh Dương Vương, Q.6', N'Galaxy')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'glx-nguyen-du', N'GLX - Nguyễn Du', N'116 Nguyễn Du, Q.1', N'Galaxy')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'glx-nguyen-van-qua', N'GLX - Nguyễn Văn Quá', N'119B Nguyễn Văn Quá, Đông Hưng Thuận, Q.12, TPHCM', N'Galaxy')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'glx-pham-van-chi', N'GLX - Phạm Văn Chí', N'Lầu 5, TTTM Platinum Plaza, 634 Phạm Văn Chí, Q.6', N'Galaxy')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'glx-quang-trung', N'GLX - Quang Trung', N'L3-Co.opmart Foodcosa, 304A Quang Trung, Gò Vấp', N'Galaxy')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'glx-tan-binh', N'GLX - Tân Bình', N'246 Nguyễn Hồng Đào, Tân Bình', N'Galaxy')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'glx-trung-chanh', N'GLX - Trung Chánh', N'TTVH Q12 – 09, Q L 22, Trung Mỹ Tây , Q.12', N'Galaxy')
INSERT [dbo].[CUMRAP] ([MaCumRap], [TenCumRap], [ThongTin], [MaHeThongRap]) VALUES (N'megags-cao-thang', N'MegaGS - Cao Thắng', N'19 Cao Thắng, Q.3', N'MegaGS')
SET IDENTITY_INSERT [dbo].[GHE] ON 

INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (198, N'A', N'A1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (199, N'A', N'A2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (200, N'A', N'A3', 113, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (201, N'A', N'A4', 113, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (202, N'A', N'A5', 113, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (203, N'A', N'A6', 113, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (204, N'A', N'A7', 113, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (205, N'A', N'A8', 113, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (206, N'A', N'A9', 113, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (207, N'A', N'A10', 113, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (208, N'A', N'A11', 113, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (209, N'A', N'A12', 113, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (210, N'A', N'A13', 113, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (211, N'A', N'A14', 113, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (212, N'A', N'A15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (213, N'A', N'A16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (214, N'B', N'B1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (215, N'B', N'B2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (216, N'B', N'B3', 113, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (217, N'B', N'B4', 113, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (218, N'B', N'B5', 113, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (219, N'B', N'B6', 113, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (220, N'B', N'B7', 113, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (221, N'B', N'B8', 113, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (222, N'B', N'B9', 113, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (223, N'B', N'B10', 113, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (224, N'B', N'B11', 113, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (225, N'B', N'B12', 113, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (226, N'B', N'B13', 113, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (227, N'B', N'B14', 113, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (228, N'B', N'B15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (229, N'B', N'B16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (230, N'C', N'C1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (231, N'C', N'C2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (232, N'C', N'C3', 113, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (233, N'C', N'C4', 113, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (234, N'C', N'C5', 113, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (235, N'C', N'C6', 113, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (236, N'C', N'C7', 113, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (237, N'C', N'C8', 113, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (238, N'C', N'C9', 113, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (239, N'C', N'C10', 113, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (240, N'C', N'C11', 113, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (241, N'C', N'C12', 113, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (242, N'C', N'C13', 113, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (243, N'C', N'C14', 113, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (244, N'C', N'C15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (245, N'C', N'C16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (246, N'D', N'D1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (247, N'D', N'D2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (248, N'D', N'D3', 113, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (249, N'D', N'D4', 113, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (250, N'D', N'D5', 113, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (251, N'D', N'D6', 113, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (252, N'D', N'D7', 113, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (253, N'D', N'D8', 113, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (254, N'D', N'D9', 113, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (255, N'D', N'D10', 113, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (256, N'D', N'D11', 113, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (257, N'D', N'D12', 113, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (258, N'D', N'D13', 113, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (259, N'D', N'D14', 113, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (260, N'D', N'D15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (261, N'D', N'D16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (262, N'E', N'E1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (263, N'E', N'E2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (264, N'E', N'E3', 113, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (265, N'E', N'E4', 113, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (266, N'E', N'E5', 113, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (267, N'E', N'E6', 113, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (268, N'E', N'E7', 113, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (269, N'E', N'E8', 113, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (270, N'E', N'E9', 113, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (271, N'E', N'E10', 113, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (272, N'E', N'E11', 113, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (273, N'E', N'E12', 113, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (274, N'E', N'E13', 113, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (275, N'E', N'E14', 113, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (276, N'E', N'E15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (277, N'E', N'E16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (278, N'F', N'F1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (279, N'F', N'F2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (280, N'F', N'F3', 113, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (281, N'F', N'F4', 113, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (282, N'F', N'F5', 113, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (283, N'F', N'F6', 113, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (284, N'F', N'F7', 113, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (285, N'F', N'F8', 113, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (286, N'F', N'F9', 113, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (287, N'F', N'F10', 113, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (288, N'F', N'F11', 113, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (289, N'F', N'F12', 113, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (290, N'F', N'F13', 113, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (291, N'F', N'F14', 113, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (292, N'F', N'F15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (293, N'F', N'F16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (294, N'G', N'G1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (295, N'G', N'G2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (296, N'G', N'G3', 113, 3, 2, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (297, N'G', N'G4', 113, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (298, N'G', N'G5', 113, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (299, N'G', N'G6', 113, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (300, N'G', N'G7', 113, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (301, N'G', N'G8', 113, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (302, N'G', N'G9', 113, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (303, N'G', N'G10', 113, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (304, N'G', N'G11', 113, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (305, N'G', N'G12', 113, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (306, N'G', N'G13', 113, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (307, N'G', N'G14', 113, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (308, N'G', N'G15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (309, N'G', N'G16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (310, N'H', N'H1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (311, N'H', N'H2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (312, N'H', N'H3', 113, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (313, N'H', N'H4', 113, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (314, N'H', N'H5', 113, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (315, N'H', N'H6', 113, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (316, N'H', N'H7', 113, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (317, N'H', N'H8', 113, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (318, N'H', N'H9', 113, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (319, N'H', N'H10', 113, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (320, N'H', N'H11', 113, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (321, N'H', N'H12', 113, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (322, N'H', N'H13', 113, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (323, N'H', N'H14', 113, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (324, N'H', N'H15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (325, N'H', N'H16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (326, N'I', N'I1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (327, N'I', N'I2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (328, N'I', N'I3', 113, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (329, N'I', N'I4', 113, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (330, N'I', N'I5', 113, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (331, N'I', N'I6', 113, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (332, N'I', N'I7', 113, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (333, N'I', N'I8', 113, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (334, N'I', N'I9', 113, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (335, N'I', N'I10', 113, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (336, N'I', N'I11', 113, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (337, N'I', N'I12', 113, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (338, N'I', N'I13', 113, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (339, N'I', N'I14', 113, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (340, N'I', N'I15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (341, N'I', N'I16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (342, N'J', N'J1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (343, N'J', N'J2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (344, N'J', N'J3', 113, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (345, N'J', N'J4', 113, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (346, N'J', N'J5', 113, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (347, N'J', N'J6', 113, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (348, N'J', N'J7', 113, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (349, N'J', N'J8', 113, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (350, N'J', N'J9', 113, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (351, N'J', N'J10', 113, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (352, N'J', N'J11', 113, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (353, N'J', N'J12', 113, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (354, N'J', N'J13', 113, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (355, N'J', N'J14', 113, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (356, N'J', N'J15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (357, N'J', N'J16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (358, N'K', N'K1', 113, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (359, N'K', N'K2', 113, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (360, N'K', N'K3', 113, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (361, N'K', N'K4', 113, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (362, N'K', N'K5', 113, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (363, N'K', N'K6', 113, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (364, N'K', N'K7', 113, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (365, N'K', N'K8', 113, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (366, N'K', N'K9', 113, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (367, N'K', N'K10', 113, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (368, N'K', N'K11', 113, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (369, N'K', N'K12', 113, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (370, N'K', N'K13', 113, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (371, N'K', N'K14', 113, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (372, N'K', N'K15', 113, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (373, N'K', N'K16', 113, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (676, N'A', N'A1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (677, N'A', N'A2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (678, N'A', N'A3', 114, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (679, N'A', N'A4', 114, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (680, N'A', N'A5', 114, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (681, N'A', N'A6', 114, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (682, N'A', N'A7', 114, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (683, N'A', N'A8', 114, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (684, N'A', N'A9', 114, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (685, N'A', N'A10', 114, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (686, N'A', N'A11', 114, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (687, N'A', N'A12', 114, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (688, N'A', N'A13', 114, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (689, N'A', N'A14', 114, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (690, N'A', N'A15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (691, N'A', N'A16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (692, N'B', N'B1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (693, N'B', N'B2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (694, N'B', N'B3', 114, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (695, N'B', N'B4', 114, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (696, N'B', N'B5', 114, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (697, N'B', N'B6', 114, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (698, N'B', N'B7', 114, 7, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (699, N'B', N'B8', 114, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (700, N'B', N'B9', 114, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (701, N'B', N'B10', 114, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (702, N'B', N'B11', 114, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (703, N'B', N'B12', 114, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (704, N'B', N'B13', 114, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (705, N'B', N'B14', 114, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (706, N'B', N'B15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (707, N'B', N'B16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (788, N'C', N'C1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (789, N'C', N'C2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (790, N'C', N'C3', 114, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (791, N'C', N'C4', 114, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (792, N'C', N'C5', 114, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (793, N'C', N'C6', 114, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (794, N'C', N'C7', 114, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (795, N'C', N'C8', 114, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (796, N'C', N'C9', 114, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (797, N'C', N'C10', 114, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (798, N'C', N'C11', 114, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (799, N'C', N'C12', 114, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (800, N'C', N'C13', 114, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (801, N'C', N'C14', 114, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (802, N'C', N'C15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (803, N'C', N'C16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (804, N'D', N'D1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (805, N'D', N'D2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (806, N'D', N'D3', 114, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (807, N'D', N'D4', 114, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (808, N'D', N'D5', 114, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (809, N'D', N'D6', 114, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (810, N'D', N'D7', 114, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (811, N'D', N'D8', 114, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (812, N'D', N'D9', 114, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (813, N'D', N'D10', 114, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (814, N'D', N'D11', 114, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (815, N'D', N'D12', 114, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (816, N'D', N'D13', 114, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (817, N'D', N'D14', 114, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (818, N'D', N'D15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (819, N'D', N'D16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (820, N'E', N'E1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (821, N'E', N'E2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (822, N'E', N'E3', 114, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (823, N'E', N'E4', 114, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (824, N'E', N'E5', 114, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (825, N'E', N'E6', 114, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (826, N'E', N'E7', 114, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (827, N'E', N'E8', 114, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (828, N'E', N'E9', 114, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (829, N'E', N'E10', 114, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (830, N'E', N'E11', 114, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (831, N'E', N'E12', 114, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (832, N'E', N'E13', 114, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (833, N'E', N'E14', 114, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (834, N'E', N'E15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (835, N'E', N'E16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (836, N'F', N'F1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (837, N'F', N'F2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (838, N'F', N'F3', 114, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (839, N'F', N'F4', 114, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (840, N'F', N'F5', 114, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (841, N'F', N'F6', 114, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (842, N'F', N'F7', 114, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (843, N'F', N'F8', 114, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (844, N'F', N'F9', 114, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (845, N'F', N'F10', 114, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (846, N'F', N'F11', 114, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (847, N'F', N'F12', 114, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (848, N'F', N'F13', 114, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (849, N'F', N'F14', 114, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (850, N'F', N'F15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (851, N'F', N'F16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (852, N'G', N'G1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (853, N'G', N'G2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (854, N'G', N'G3', 114, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (855, N'G', N'G4', 114, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (856, N'G', N'G5', 114, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (857, N'G', N'G6', 114, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (858, N'G', N'G7', 114, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (859, N'G', N'G8', 114, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (860, N'G', N'G9', 114, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (861, N'G', N'G10', 114, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (862, N'G', N'G11', 114, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (863, N'G', N'G12', 114, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (864, N'G', N'G13', 114, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (865, N'G', N'G14', 114, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (866, N'G', N'G15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (867, N'G', N'G16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (868, N'H', N'H1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (869, N'H', N'H2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (870, N'H', N'H3', 114, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (871, N'H', N'H4', 114, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (872, N'H', N'H5', 114, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (873, N'H', N'H6', 114, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (874, N'H', N'H7', 114, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (875, N'H', N'H8', 114, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (876, N'H', N'H9', 114, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (877, N'H', N'H10', 114, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (878, N'H', N'H11', 114, 11, 2, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (879, N'H', N'H12', 114, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (880, N'H', N'H13', 114, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (881, N'H', N'H14', 114, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (882, N'H', N'H15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (883, N'H', N'H16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (884, N'I', N'I1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (885, N'I', N'I2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (886, N'I', N'I3', 114, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (887, N'I', N'I4', 114, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (888, N'I', N'I5', 114, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (889, N'I', N'I6', 114, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (890, N'I', N'I7', 114, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (891, N'I', N'I8', 114, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (892, N'I', N'I9', 114, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (893, N'I', N'I10', 114, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (894, N'I', N'I11', 114, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (895, N'I', N'I12', 114, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (896, N'I', N'I13', 114, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (897, N'I', N'I14', 114, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (898, N'I', N'I15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (899, N'I', N'I16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (900, N'J', N'J1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (901, N'J', N'J2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (902, N'J', N'J3', 114, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (903, N'J', N'J4', 114, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (904, N'J', N'J5', 114, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (905, N'J', N'J6', 114, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (906, N'J', N'J7', 114, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (907, N'J', N'J8', 114, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (908, N'J', N'J9', 114, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (909, N'J', N'J10', 114, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (910, N'J', N'J11', 114, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (911, N'J', N'J12', 114, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (912, N'J', N'J13', 114, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (913, N'J', N'J14', 114, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (914, N'J', N'J15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (915, N'J', N'J16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (916, N'K', N'K1', 114, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (917, N'K', N'K2', 114, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (918, N'K', N'K3', 114, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (919, N'K', N'K4', 114, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (920, N'K', N'K5', 114, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (921, N'K', N'K6', 114, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (922, N'K', N'K7', 114, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (923, N'K', N'K8', 114, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (924, N'K', N'K9', 114, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (925, N'K', N'K10', 114, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (926, N'K', N'K11', 114, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (927, N'K', N'K12', 114, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (928, N'K', N'K13', 114, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (929, N'K', N'K14', 114, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (930, N'K', N'K15', 114, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (931, N'K', N'K16', 114, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (932, N'A', N'A1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (933, N'A', N'A2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (934, N'A', N'A3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (935, N'A', N'A4', 10, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (936, N'A', N'A5', 10, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (937, N'A', N'A6', 10, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (938, N'A', N'A7', 10, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (939, N'A', N'A8', 10, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (940, N'A', N'A9', 10, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (941, N'A', N'A10', 10, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (942, N'A', N'A11', 10, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (943, N'A', N'A12', 10, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (944, N'A', N'A13', 10, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (945, N'A', N'A14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (946, N'A', N'A15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (947, N'A', N'A16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (948, N'B', N'B1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (949, N'B', N'B2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (950, N'B', N'B3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (951, N'B', N'B4', 10, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (952, N'B', N'B5', 10, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (953, N'B', N'B6', 10, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (954, N'B', N'B7', 10, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (955, N'B', N'B8', 10, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (956, N'B', N'B9', 10, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (957, N'B', N'B10', 10, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (958, N'B', N'B11', 10, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (959, N'B', N'B12', 10, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (960, N'B', N'B13', 10, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (961, N'B', N'B14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (962, N'B', N'B15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (963, N'B', N'B16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (964, N'C', N'C1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (965, N'C', N'C2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (966, N'C', N'C3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (967, N'C', N'C4', 10, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (968, N'C', N'C5', 10, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (969, N'C', N'C6', 10, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (970, N'C', N'C7', 10, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (971, N'C', N'C8', 10, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (972, N'C', N'C9', 10, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (973, N'C', N'C10', 10, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (974, N'C', N'C11', 10, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (975, N'C', N'C12', 10, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (976, N'C', N'C13', 10, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (977, N'C', N'C14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (978, N'C', N'C15', 10, 15, 4, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (979, N'C', N'C16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (980, N'D', N'D1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (981, N'D', N'D2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (982, N'D', N'D3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (983, N'D', N'D4', 10, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (984, N'D', N'D5', 10, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (985, N'D', N'D6', 10, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (986, N'D', N'D7', 10, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (987, N'D', N'D8', 10, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (988, N'D', N'D9', 10, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (989, N'D', N'D10', 10, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (990, N'D', N'D11', 10, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (991, N'D', N'D12', 10, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (992, N'D', N'D13', 10, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (993, N'D', N'D14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (994, N'D', N'D15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (995, N'D', N'D16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (996, N'E', N'E1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (997, N'E', N'E2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (998, N'E', N'E3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (999, N'E', N'E4', 10, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1000, N'E', N'E5', 10, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1001, N'E', N'E6', 10, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1002, N'E', N'E7', 10, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1003, N'E', N'E8', 10, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1004, N'E', N'E9', 10, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1005, N'E', N'E10', 10, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1006, N'E', N'E11', 10, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1007, N'E', N'E12', 10, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1008, N'E', N'E13', 10, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1009, N'E', N'E14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1010, N'E', N'E15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1011, N'E', N'E16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1012, N'F', N'F1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1013, N'F', N'F2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1014, N'F', N'F3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1015, N'F', N'F4', 10, 4, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1016, N'F', N'F5', 10, 5, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1017, N'F', N'F6', 10, 6, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1018, N'F', N'F7', 10, 7, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1019, N'F', N'F8', 10, 8, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1020, N'F', N'F9', 10, 9, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1021, N'F', N'F10', 10, 10, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1022, N'F', N'F11', 10, 11, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1023, N'F', N'F12', 10, 12, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1024, N'F', N'F13', 10, 13, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1025, N'F', N'F14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1026, N'F', N'F15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1027, N'F', N'F16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1028, N'G', N'G1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1029, N'G', N'G2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1030, N'G', N'G3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1031, N'G', N'G4', 10, 4, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1032, N'G', N'G5', 10, 5, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1033, N'G', N'G6', 10, 6, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1034, N'G', N'G7', 10, 7, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1035, N'G', N'G8', 10, 8, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1036, N'G', N'G9', 10, 9, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1037, N'G', N'G10', 10, 10, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1038, N'G', N'G11', 10, 11, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1039, N'G', N'G12', 10, 12, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1040, N'G', N'G13', 10, 13, 5, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1041, N'G', N'G14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1042, N'G', N'G15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1043, N'G', N'G16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1044, N'H', N'H1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1045, N'H', N'H2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1046, N'H', N'H3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1047, N'H', N'H4', 10, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1048, N'H', N'H5', 10, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1049, N'H', N'H6', 10, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1050, N'H', N'H7', 10, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1051, N'H', N'H8', 10, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1052, N'H', N'H9', 10, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1053, N'H', N'H10', 10, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1054, N'H', N'H11', 10, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1055, N'H', N'H12', 10, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1056, N'H', N'H13', 10, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1057, N'H', N'H14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1058, N'H', N'H15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1059, N'H', N'H16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1060, N'I', N'I1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1061, N'I', N'I2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1062, N'I', N'I3', 10, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1063, N'I', N'I4', 10, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1064, N'I', N'I5', 10, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1065, N'I', N'I6', 10, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1066, N'I', N'I7', 10, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1067, N'I', N'I8', 10, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1068, N'I', N'I9', 10, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1069, N'I', N'I10', 10, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1070, N'I', N'I11', 10, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1071, N'I', N'I12', 10, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1072, N'I', N'I13', 10, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1073, N'I', N'I14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1074, N'I', N'I15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1075, N'I', N'I16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1076, N'J', N'J1', 10, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1077, N'J', N'J2', 10, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1078, N'J', N'J3', 10, 3, 4, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1079, N'J', N'J4', 10, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1080, N'J', N'J5', 10, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1081, N'J', N'J6', 10, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1082, N'J', N'J7', 10, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1083, N'J', N'J8', 10, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1084, N'J', N'J9', 10, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1085, N'J', N'J10', 10, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1086, N'J', N'J11', 10, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1087, N'J', N'J12', 10, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1088, N'J', N'J13', 10, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1089, N'J', N'J14', 10, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1090, N'J', N'J15', 10, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1091, N'J', N'J16', 10, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1092, N'A', N'A1', 116, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1093, N'A', N'A2', 116, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1094, N'A', N'A3', 116, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1095, N'A', N'A4', 116, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1096, N'A', N'A5', 116, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1097, N'A', N'A6', 116, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1098, N'A', N'A7', 116, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1099, N'A', N'A8', 116, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1100, N'A', N'A9', 116, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1101, N'A', N'A10', 116, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1102, N'A', N'A11', 116, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1103, N'A', N'A12', 116, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1104, N'A', N'A13', 116, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1105, N'A', N'A14', 116, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1106, N'A', N'A15', 116, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1107, N'A', N'A16', 116, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1108, N'B', N'B1', 116, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1109, N'B', N'B2', 116, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1110, N'B', N'B3', 116, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1111, N'B', N'B4', 116, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1112, N'B', N'B5', 116, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1113, N'B', N'B6', 116, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1114, N'B', N'B7', 116, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1115, N'B', N'B8', 116, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1116, N'B', N'B9', 116, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1117, N'B', N'B10', 116, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1118, N'B', N'B11', 116, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1119, N'B', N'B12', 116, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1120, N'B', N'B13', 116, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1121, N'B', N'B14', 116, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1122, N'B', N'B15', 116, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1123, N'B', N'B16', 116, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1124, N'C', N'C1', 116, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1125, N'C', N'C2', 116, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1126, N'C', N'C3', 116, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1127, N'C', N'C4', 116, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1128, N'C', N'C5', 116, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1129, N'C', N'C6', 116, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1130, N'C', N'C7', 116, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1131, N'C', N'C8', 116, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1132, N'C', N'C9', 116, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1133, N'C', N'C10', 116, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1134, N'C', N'C11', 116, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1135, N'C', N'C12', 116, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1136, N'C', N'C13', 116, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1137, N'C', N'C14', 116, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1138, N'C', N'C15', 116, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1139, N'D', N'D1', 116, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1140, N'D', N'D2', 116, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1141, N'D', N'D3', 116, 3, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1142, N'D', N'D4', 116, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1143, N'D', N'D5', 116, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1144, N'D', N'D6', 116, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1145, N'D', N'D7', 116, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1146, N'D', N'D8', 116, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1147, N'D', N'D9', 116, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1148, N'D', N'D10', 116, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1149, N'D', N'D11', 116, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1150, N'D', N'D12', 116, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1151, N'D', N'D13', 116, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1152, N'D', N'D14', 116, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1153, N'D', N'D15', 116, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1154, N'D', N'D16', 116, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1155, N'E', N'E1', 116, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1156, N'E', N'E2', 116, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1157, N'E', N'E3', 116, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1158, N'E', N'E4', 116, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1159, N'E', N'E5', 116, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1160, N'E', N'E6', 116, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1161, N'E', N'E7', 116, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1162, N'E', N'E8', 116, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1163, N'E', N'E9', 116, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1164, N'E', N'E10', 116, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1165, N'E', N'E11', 116, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1166, N'E', N'E12', 116, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1167, N'E', N'E13', 116, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1168, N'E', N'E14', 116, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1169, N'E', N'E15', 116, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1170, N'E', N'E16', 116, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1171, N'A', N'A1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1172, N'A', N'A2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1173, N'A', N'A3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1174, N'A', N'A4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1175, N'A', N'A5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1176, N'A', N'A6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1177, N'A', N'A7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1178, N'A', N'A8', 138, 8, 7, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1179, N'A', N'A9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1180, N'A', N'A10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1181, N'A', N'A11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1182, N'A', N'A12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1183, N'A', N'A13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1184, N'A', N'A14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1185, N'A', N'A15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1186, N'A', N'A16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1187, N'B', N'B1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1188, N'B', N'B2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1189, N'B', N'B3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1190, N'B', N'B4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1191, N'B', N'B5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1192, N'B', N'B6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1193, N'B', N'B7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1194, N'B', N'B8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1195, N'B', N'B9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1196, N'B', N'B10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1197, N'B', N'B11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1198, N'B', N'B12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1199, N'B', N'B13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1200, N'B', N'B14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1201, N'B', N'B15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1202, N'B', N'B16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1203, N'C', N'C1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1204, N'C', N'C2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1205, N'C', N'C3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1206, N'C', N'C4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1207, N'C', N'C5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1208, N'C', N'C6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1209, N'C', N'C7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1210, N'C', N'C8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1211, N'C', N'C9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1212, N'C', N'C10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1213, N'C', N'C11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1214, N'C', N'C12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1215, N'C', N'C13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1216, N'C', N'C14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1217, N'C', N'C15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1218, N'C', N'C16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1219, N'D', N'D1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1220, N'D', N'D2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1221, N'D', N'D3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1222, N'D', N'D4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1223, N'D', N'D5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1224, N'D', N'D6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1225, N'D', N'D7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1226, N'D', N'D8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1227, N'D', N'D9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1228, N'D', N'D10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1229, N'D', N'D11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1230, N'D', N'D12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1231, N'D', N'D13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1232, N'D', N'D14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1233, N'D', N'D15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1234, N'D', N'D16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1235, N'E', N'E1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1236, N'E', N'E2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1237, N'E', N'E3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1238, N'E', N'E4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1239, N'E', N'E5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1240, N'E', N'E6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1241, N'E', N'E7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1242, N'E', N'E8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1243, N'E', N'E9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1244, N'E', N'E10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1245, N'E', N'E11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1246, N'E', N'E12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1247, N'E', N'E13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1248, N'E', N'E14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1249, N'E', N'E15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1250, N'E', N'E16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1251, N'F', N'F1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1252, N'F', N'F2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1253, N'F', N'F3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1254, N'F', N'F4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1255, N'F', N'F5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1256, N'F', N'F6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1257, N'F', N'F7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1258, N'F', N'F8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1259, N'F', N'F9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1260, N'F', N'F10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1261, N'F', N'F11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1262, N'F', N'F12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1263, N'F', N'F13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1264, N'F', N'F14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1265, N'F', N'F15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1266, N'F', N'F16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1267, N'G', N'G1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1268, N'G', N'G2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1269, N'G', N'G3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1270, N'G', N'G4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1271, N'G', N'G5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1272, N'G', N'G6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1273, N'G', N'G7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1274, N'G', N'G8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1275, N'G', N'G9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1276, N'G', N'G10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1277, N'G', N'G11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1278, N'G', N'G12', 138, 12, 7, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1279, N'G', N'G13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1280, N'G', N'G14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1281, N'G', N'G15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1282, N'G', N'G16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1283, N'H', N'H1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1284, N'H', N'H2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1285, N'H', N'H3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1286, N'H', N'H4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1287, N'H', N'H5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1288, N'H', N'H6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1289, N'H', N'H7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1290, N'H', N'H8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1291, N'H', N'H9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1292, N'H', N'H10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1293, N'H', N'H11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1294, N'H', N'H12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1295, N'H', N'H13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1296, N'H', N'H14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1297, N'H', N'H15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1298, N'H', N'H16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1299, N'I', N'I1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1300, N'I', N'I2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1301, N'I', N'I3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1302, N'I', N'I4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1303, N'I', N'I5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1304, N'I', N'I6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1305, N'I', N'I7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1306, N'I', N'I8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1307, N'I', N'I9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1308, N'I', N'I10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1309, N'I', N'I11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1310, N'I', N'I12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1311, N'I', N'I13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1312, N'I', N'I14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1313, N'I', N'I15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1314, N'I', N'I16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1315, N'J', N'J1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1316, N'J', N'J2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1317, N'J', N'J3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1318, N'J', N'J4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1319, N'J', N'J5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1320, N'J', N'J6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1321, N'J', N'J7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1322, N'J', N'J8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1323, N'J', N'J9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1324, N'J', N'J10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1325, N'J', N'J11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1326, N'J', N'J12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1327, N'J', N'J13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1328, N'J', N'J14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1329, N'J', N'J15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1330, N'J', N'J16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1331, N'K', N'K1', 138, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1332, N'K', N'K2', 138, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1333, N'K', N'K3', 138, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1334, N'K', N'K4', 138, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1335, N'K', N'K5', 138, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1336, N'K', N'K6', 138, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1337, N'K', N'K7', 138, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1338, N'K', N'K8', 138, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1339, N'K', N'K9', 138, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1340, N'K', N'K10', 138, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1341, N'K', N'K11', 138, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1342, N'K', N'K12', 138, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1343, N'K', N'K13', 138, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1344, N'K', N'K14', 138, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1345, N'K', N'K15', 138, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1346, N'K', N'K16', 138, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1347, N'A', N'A1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1348, N'A', N'A2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1349, N'A', N'A3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1350, N'A', N'A4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1351, N'A', N'A5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1352, N'A', N'A6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1353, N'A', N'A7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1354, N'A', N'A8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1355, N'A', N'A9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1356, N'A', N'A10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1357, N'A', N'A11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1358, N'A', N'A12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1359, N'A', N'A13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1360, N'A', N'A14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1361, N'A', N'A15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1362, N'A', N'A16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1363, N'B', N'B1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1364, N'B', N'B2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1365, N'B', N'B3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1366, N'B', N'B4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1367, N'B', N'B5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1368, N'B', N'B6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1369, N'B', N'B7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1370, N'B', N'B8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1371, N'B', N'B9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1372, N'B', N'B10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1373, N'B', N'B11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1374, N'B', N'B12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1375, N'B', N'B13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1376, N'B', N'B14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1377, N'B', N'B15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1378, N'B', N'B16', 140, 16, 7, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1379, N'C', N'C1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1380, N'C', N'C2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1381, N'C', N'C3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1382, N'C', N'C4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1383, N'C', N'C5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1384, N'C', N'C6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1385, N'C', N'C7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1386, N'C', N'C8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1387, N'C', N'C9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1388, N'C', N'C10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1389, N'C', N'C11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1390, N'C', N'C12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1391, N'C', N'C13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1392, N'C', N'C14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1393, N'C', N'C15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1394, N'C', N'C16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1395, N'D', N'D1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1396, N'D', N'D2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1397, N'D', N'D3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1398, N'D', N'D4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1399, N'D', N'D5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1400, N'D', N'D6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1401, N'D', N'D7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1402, N'D', N'D8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1403, N'D', N'D9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1404, N'D', N'D10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1405, N'D', N'D11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1406, N'D', N'D12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1407, N'D', N'D13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1408, N'D', N'D14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1409, N'D', N'D15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1410, N'D', N'D16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1411, N'E', N'E1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1412, N'E', N'E2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1413, N'E', N'E3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1414, N'E', N'E4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1415, N'E', N'E5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1416, N'E', N'E6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1417, N'E', N'E7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1418, N'E', N'E8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1419, N'E', N'E9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1420, N'E', N'E10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1421, N'E', N'E11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1422, N'E', N'E12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1423, N'E', N'E13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1424, N'E', N'E14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1425, N'E', N'E15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1426, N'E', N'E16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1427, N'F', N'F1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1428, N'F', N'F2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1429, N'F', N'F3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1430, N'F', N'F4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1431, N'F', N'F5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1432, N'F', N'F6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1433, N'F', N'F7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1434, N'F', N'F8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1435, N'F', N'F9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1436, N'F', N'F10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1437, N'F', N'F11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1438, N'F', N'F12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1439, N'F', N'F13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1440, N'F', N'F14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1441, N'F', N'F15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1442, N'F', N'F16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1443, N'G', N'G1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1444, N'G', N'G2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1445, N'G', N'G3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1446, N'G', N'G4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1447, N'G', N'G5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1448, N'G', N'G6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1449, N'G', N'G7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1450, N'G', N'G8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1451, N'G', N'G9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1452, N'G', N'G10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1453, N'G', N'G11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1454, N'G', N'G12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1455, N'G', N'G13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1456, N'G', N'G14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1457, N'G', N'G15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1458, N'G', N'G16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1459, N'H', N'H1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1460, N'H', N'H2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1461, N'H', N'H3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1462, N'H', N'H4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1463, N'H', N'H5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1464, N'H', N'H6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1465, N'H', N'H7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1466, N'H', N'H8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1467, N'H', N'H9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1468, N'H', N'H10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1469, N'H', N'H11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1470, N'H', N'H12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1471, N'H', N'H13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1472, N'H', N'H14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1473, N'H', N'H15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1474, N'H', N'H16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1475, N'I', N'I1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1476, N'I', N'I2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1477, N'I', N'I3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1478, N'I', N'I4', 140, 4, 7, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1479, N'I', N'I5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1480, N'I', N'I6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1481, N'I', N'I7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1482, N'I', N'I8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1483, N'I', N'I9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1484, N'I', N'I10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1485, N'I', N'I11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1486, N'I', N'I12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1487, N'I', N'I13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1488, N'I', N'I14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1489, N'I', N'I15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1490, N'I', N'I16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1491, N'J', N'J1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1492, N'J', N'J2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1493, N'J', N'J3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1494, N'J', N'J4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1495, N'J', N'J5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1496, N'J', N'J6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1497, N'J', N'J7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1498, N'J', N'J8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1499, N'J', N'J9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1500, N'J', N'J10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1501, N'J', N'J11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1502, N'J', N'J12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1503, N'J', N'J13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1504, N'J', N'J14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1505, N'J', N'J15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1506, N'J', N'J16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1507, N'K', N'K1', 140, 1, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1508, N'K', N'K2', 140, 2, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1509, N'K', N'K3', 140, 3, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1510, N'K', N'K4', 140, 4, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1511, N'K', N'K5', 140, 5, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1512, N'K', N'K6', 140, 6, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1513, N'K', N'K7', 140, 7, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1514, N'K', N'K8', 140, 8, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1515, N'K', N'K9', 140, 9, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1516, N'K', N'K10', 140, 10, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1517, N'K', N'K11', 140, 11, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1518, N'K', N'K12', 140, 12, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1519, N'K', N'K13', 140, 13, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1520, N'K', N'K14', 140, 14, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1521, N'K', N'K15', 140, 15, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1522, N'K', N'K16', 140, 16, 7, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1523, N'A', N'A1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1524, N'A', N'A2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1525, N'A', N'A3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1526, N'A', N'A4', 118, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1527, N'A', N'A5', 118, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1528, N'A', N'A6', 118, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1529, N'A', N'A7', 118, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1530, N'A', N'A8', 118, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1531, N'A', N'A9', 118, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1532, N'A', N'A10', 118, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1533, N'A', N'A11', 118, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1534, N'A', N'A12', 118, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1535, N'A', N'A13', 118, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1536, N'A', N'A14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1537, N'A', N'A15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1538, N'A', N'A16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1539, N'B', N'B1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1540, N'B', N'B2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1541, N'B', N'B3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1542, N'B', N'B4', 118, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1543, N'B', N'B5', 118, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1544, N'B', N'B6', 118, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1545, N'B', N'B7', 118, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1546, N'B', N'B8', 118, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1547, N'B', N'B9', 118, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1548, N'B', N'B10', 118, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1549, N'B', N'B11', 118, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1550, N'B', N'B12', 118, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1551, N'B', N'B13', 118, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1552, N'B', N'B14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1553, N'B', N'B15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1554, N'B', N'B16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1555, N'C', N'C1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1556, N'C', N'C2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1557, N'C', N'C3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1558, N'C', N'C4', 118, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1559, N'C', N'C5', 118, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1560, N'C', N'C6', 118, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1561, N'C', N'C7', 118, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1562, N'C', N'C8', 118, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1563, N'C', N'C9', 118, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1564, N'C', N'C10', 118, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1565, N'C', N'C11', 118, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1566, N'C', N'C12', 118, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1567, N'C', N'C13', 118, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1568, N'C', N'C14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1569, N'C', N'C15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1570, N'C', N'C16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1571, N'D', N'D1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1572, N'D', N'D2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1573, N'D', N'D3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1574, N'D', N'D4', 118, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1575, N'D', N'D5', 118, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1576, N'D', N'D6', 118, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1577, N'D', N'D7', 118, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1578, N'D', N'D8', 118, 8, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1579, N'D', N'D9', 118, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1580, N'D', N'D10', 118, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1581, N'D', N'D11', 118, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1582, N'D', N'D12', 118, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1583, N'D', N'D13', 118, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1584, N'D', N'D14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1585, N'D', N'D15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1586, N'D', N'D16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1587, N'E', N'E1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1588, N'E', N'E2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1589, N'E', N'E3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1590, N'E', N'E4', 118, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1591, N'E', N'E5', 118, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1592, N'E', N'E6', 118, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1593, N'E', N'E7', 118, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1594, N'E', N'E8', 118, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1595, N'E', N'E9', 118, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1596, N'E', N'E10', 118, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1597, N'E', N'E11', 118, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1598, N'E', N'E12', 118, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1599, N'E', N'E13', 118, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1600, N'E', N'E14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1601, N'E', N'E15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1602, N'E', N'E16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1603, N'F', N'F1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1604, N'F', N'F2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1605, N'F', N'F3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1606, N'F', N'F4', 118, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1607, N'F', N'F5', 118, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1608, N'F', N'F6', 118, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1609, N'F', N'F7', 118, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1610, N'F', N'F8', 118, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1611, N'F', N'F9', 118, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1612, N'F', N'F10', 118, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1613, N'F', N'F11', 118, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1614, N'F', N'F12', 118, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1615, N'F', N'F13', 118, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1616, N'F', N'F14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1617, N'F', N'F15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1618, N'F', N'F16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1619, N'G', N'G1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1620, N'G', N'G2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1621, N'G', N'G3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1622, N'G', N'G4', 118, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1623, N'G', N'G5', 118, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1624, N'G', N'G6', 118, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1625, N'G', N'G7', 118, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1626, N'G', N'G8', 118, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1627, N'G', N'G9', 118, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1628, N'G', N'G10', 118, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1629, N'G', N'G11', 118, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1630, N'G', N'G12', 118, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1631, N'G', N'G13', 118, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1632, N'G', N'G14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1633, N'G', N'G15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1634, N'G', N'G16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1635, N'H', N'H1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1636, N'H', N'H2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1637, N'H', N'H3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1638, N'H', N'H4', 118, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1639, N'H', N'H5', 118, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1640, N'H', N'H6', 118, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1641, N'H', N'H7', 118, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1642, N'H', N'H8', 118, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1643, N'H', N'H9', 118, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1644, N'H', N'H10', 118, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1645, N'H', N'H11', 118, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1646, N'H', N'H12', 118, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1647, N'H', N'H13', 118, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1648, N'H', N'H14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1649, N'H', N'H15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1650, N'H', N'H16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1651, N'I', N'I1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1652, N'I', N'I2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1653, N'I', N'I3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1654, N'I', N'I4', 118, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1655, N'I', N'I5', 118, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1656, N'I', N'I6', 118, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1657, N'I', N'I7', 118, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1658, N'I', N'I8', 118, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1659, N'I', N'I9', 118, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1660, N'I', N'I10', 118, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1661, N'I', N'I11', 118, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1662, N'I', N'I12', 118, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1663, N'I', N'I13', 118, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1664, N'I', N'I14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1665, N'I', N'I15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1666, N'I', N'I16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1667, N'J', N'J1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1668, N'J', N'J2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1669, N'J', N'J3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1670, N'J', N'J4', 118, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1671, N'J', N'J5', 118, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1672, N'J', N'J6', 118, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1673, N'J', N'J7', 118, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1674, N'J', N'J8', 118, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1675, N'J', N'J9', 118, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1676, N'J', N'J10', 118, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1677, N'J', N'J11', 118, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1678, N'J', N'J12', 118, 12, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1679, N'J', N'J13', 118, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1680, N'J', N'J14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1681, N'J', N'J15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1682, N'J', N'J16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1683, N'K', N'K1', 118, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1684, N'K', N'K2', 118, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1685, N'K', N'K3', 118, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1686, N'K', N'K4', 118, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1687, N'K', N'K5', 118, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1688, N'K', N'K6', 118, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1689, N'K', N'K7', 118, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1690, N'K', N'K8', 118, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1691, N'K', N'K9', 118, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1692, N'K', N'K10', 118, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1693, N'K', N'K11', 118, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1694, N'K', N'K12', 118, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1695, N'K', N'K13', 118, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1696, N'K', N'K14', 118, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1697, N'K', N'K15', 118, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1698, N'K', N'K16', 118, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1699, N'A', N'A1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1700, N'A', N'A2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1701, N'A', N'A3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1702, N'A', N'A4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1703, N'A', N'A5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1704, N'A', N'A6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1705, N'A', N'A7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1706, N'A', N'A8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1707, N'A', N'A9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1708, N'A', N'A10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1709, N'A', N'A11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1710, N'A', N'A12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1711, N'A', N'A13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1712, N'A', N'A14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1713, N'A', N'A15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1714, N'A', N'A16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1715, N'B', N'B1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1716, N'B', N'B2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1717, N'B', N'B3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1718, N'B', N'B4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1719, N'B', N'B5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1720, N'B', N'B6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1721, N'B', N'B7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1722, N'B', N'B8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1723, N'B', N'B9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1724, N'B', N'B10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1725, N'B', N'B11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1726, N'B', N'B12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1727, N'B', N'B13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1728, N'B', N'B14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1729, N'B', N'B15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1730, N'B', N'B16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1731, N'C', N'C1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1732, N'C', N'C2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1733, N'C', N'C3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1734, N'C', N'C4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1735, N'C', N'C5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1736, N'C', N'C6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1737, N'C', N'C7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1738, N'C', N'C8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1739, N'C', N'C9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1740, N'C', N'C10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1741, N'C', N'C11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1742, N'C', N'C12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1743, N'C', N'C13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1744, N'C', N'C14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1745, N'C', N'C15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1746, N'C', N'C16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1747, N'D', N'D1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1748, N'D', N'D2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1749, N'D', N'D3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1750, N'D', N'D4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1751, N'D', N'D5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1752, N'D', N'D6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1753, N'D', N'D7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1754, N'D', N'D8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1755, N'D', N'D9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1756, N'D', N'D10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1757, N'D', N'D11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1758, N'D', N'D12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1759, N'D', N'D13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1760, N'D', N'D14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1761, N'D', N'D15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1762, N'D', N'D16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1763, N'E', N'E1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1764, N'E', N'E2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1765, N'E', N'E3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1766, N'E', N'E4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1767, N'E', N'E5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1768, N'E', N'E6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1769, N'E', N'E7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1770, N'E', N'E8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1771, N'E', N'E9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1772, N'E', N'E10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1773, N'E', N'E11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1774, N'E', N'E12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1775, N'E', N'E13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1776, N'E', N'E14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1777, N'E', N'E15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1778, N'E', N'E16', 148, 16, 10, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1779, N'F', N'F1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1780, N'F', N'F2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1781, N'F', N'F3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1782, N'F', N'F4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1783, N'F', N'F5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1784, N'F', N'F6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1785, N'F', N'F7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1786, N'F', N'F8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1787, N'F', N'F9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1788, N'F', N'F10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1789, N'F', N'F11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1790, N'F', N'F12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1791, N'F', N'F13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1792, N'F', N'F14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1793, N'F', N'F15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1794, N'F', N'F16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1795, N'G', N'G1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1796, N'G', N'G2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1797, N'G', N'G3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1798, N'G', N'G4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1799, N'G', N'G5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1800, N'G', N'G6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1801, N'G', N'G7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1802, N'G', N'G8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1803, N'G', N'G9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1804, N'G', N'G10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1805, N'G', N'G11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1806, N'G', N'G12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1807, N'G', N'G13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1808, N'G', N'G14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1809, N'G', N'G15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1810, N'G', N'G16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1811, N'H', N'H1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1812, N'H', N'H2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1813, N'H', N'H3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1814, N'H', N'H4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1815, N'H', N'H5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1816, N'H', N'H6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1817, N'H', N'H7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1818, N'H', N'H8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1819, N'H', N'H9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1820, N'H', N'H10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1821, N'H', N'H11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1822, N'H', N'H12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1823, N'H', N'H13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1824, N'H', N'H14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1825, N'H', N'H15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1826, N'H', N'H16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1827, N'I', N'I1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1828, N'I', N'I2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1829, N'I', N'I3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1830, N'I', N'I4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1831, N'I', N'I5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1832, N'I', N'I6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1833, N'I', N'I7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1834, N'I', N'I8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1835, N'I', N'I9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1836, N'I', N'I10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1837, N'I', N'I11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1838, N'I', N'I12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1839, N'I', N'I13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1840, N'I', N'I14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1841, N'I', N'I15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1842, N'I', N'I16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1843, N'J', N'J1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1844, N'J', N'J2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1845, N'J', N'J3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1846, N'J', N'J4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1847, N'J', N'J5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1848, N'J', N'J6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1849, N'J', N'J7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1850, N'J', N'J8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1851, N'J', N'J9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1852, N'J', N'J10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1853, N'J', N'J11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1854, N'J', N'J12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1855, N'J', N'J13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1856, N'J', N'J14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1857, N'J', N'J15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1858, N'J', N'J16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1859, N'K', N'K1', 148, 1, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1860, N'K', N'K2', 148, 2, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1861, N'K', N'K3', 148, 3, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1862, N'K', N'K4', 148, 4, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1863, N'K', N'K5', 148, 5, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1864, N'K', N'K6', 148, 6, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1865, N'K', N'K7', 148, 7, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1866, N'K', N'K8', 148, 8, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1867, N'K', N'K9', 148, 9, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1868, N'K', N'K10', 148, 10, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1869, N'K', N'K11', 148, 11, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1870, N'K', N'K12', 148, 12, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1871, N'K', N'K13', 148, 13, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1872, N'K', N'K14', 148, 14, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1873, N'K', N'K15', 148, 15, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1874, N'K', N'K16', 148, 16, 10, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1971, N'A', N'A1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1972, N'A', N'A2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1973, N'A', N'A3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1974, N'A', N'A4', 119, 4, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1975, N'A', N'A5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1976, N'A', N'A6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1977, N'A', N'A7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1978, N'A', N'A8', 119, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1979, N'A', N'A9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1980, N'A', N'A10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1981, N'A', N'A11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1982, N'A', N'A12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1983, N'A', N'A13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1984, N'A', N'A14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1985, N'A', N'A15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1986, N'A', N'A16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1987, N'B', N'B1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1988, N'B', N'B2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1989, N'B', N'B3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1990, N'B', N'B4', 119, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1991, N'B', N'B5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1992, N'B', N'B6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1993, N'B', N'B7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1994, N'B', N'B8', 119, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1995, N'B', N'B9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1996, N'B', N'B10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1997, N'B', N'B11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1998, N'B', N'B12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (1999, N'B', N'B13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2000, N'B', N'B14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2001, N'B', N'B15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2002, N'B', N'B16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2003, N'C', N'C1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2004, N'C', N'C2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2005, N'C', N'C3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2006, N'C', N'C4', 119, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2007, N'C', N'C5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2008, N'C', N'C6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2009, N'C', N'C7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2010, N'C', N'C8', 119, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2011, N'C', N'C9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2012, N'C', N'C10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2013, N'C', N'C11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2014, N'C', N'C12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2015, N'C', N'C13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2016, N'C', N'C14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2017, N'C', N'C15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2018, N'C', N'C16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2019, N'D', N'D1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2020, N'D', N'D2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2021, N'D', N'D3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2022, N'D', N'D4', 119, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2023, N'D', N'D5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2024, N'D', N'D6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2025, N'D', N'D7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2026, N'D', N'D8', 119, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2027, N'D', N'D9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2028, N'D', N'D10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2029, N'D', N'D11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2030, N'D', N'D12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2031, N'D', N'D13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2032, N'D', N'D14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2033, N'D', N'D15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2034, N'D', N'D16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2035, N'E', N'E1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2036, N'E', N'E2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2037, N'E', N'E3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2038, N'E', N'E4', 119, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2039, N'E', N'E5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2040, N'E', N'E6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2041, N'E', N'E7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2042, N'E', N'E8', 119, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2043, N'E', N'E9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2044, N'E', N'E10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2045, N'E', N'E11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2046, N'E', N'E12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2047, N'E', N'E13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2048, N'E', N'E14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2049, N'E', N'E15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2050, N'E', N'E16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2051, N'F', N'F1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2052, N'F', N'F2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2053, N'F', N'F3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2054, N'F', N'F4', 119, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2055, N'F', N'F5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2056, N'F', N'F6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2057, N'F', N'F7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2058, N'F', N'F8', 119, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2059, N'F', N'F9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2060, N'F', N'F10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2061, N'F', N'F11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2062, N'F', N'F12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2063, N'F', N'F13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2064, N'F', N'F14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2065, N'F', N'F15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2066, N'F', N'F16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2067, N'G', N'G1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2068, N'G', N'G2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2069, N'G', N'G3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2070, N'G', N'G4', 119, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2071, N'G', N'G5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2072, N'G', N'G6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2073, N'G', N'G7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2074, N'G', N'G8', 119, 8, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2075, N'G', N'G9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2076, N'G', N'G10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2077, N'G', N'G11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2078, N'G', N'G12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2079, N'G', N'G13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2080, N'G', N'G14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2081, N'G', N'G15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2082, N'G', N'G16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2083, N'H', N'H1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2084, N'H', N'H2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2085, N'H', N'H3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2086, N'H', N'H4', 119, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2087, N'H', N'H5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2088, N'H', N'H6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2089, N'H', N'H7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2090, N'H', N'H8', 119, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2091, N'H', N'H9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2092, N'H', N'H10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2093, N'H', N'H11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2094, N'H', N'H12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2095, N'H', N'H13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2096, N'H', N'H14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2097, N'H', N'H15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2098, N'H', N'H16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2099, N'I', N'I1', 119, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2100, N'I', N'I2', 119, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2101, N'I', N'I3', 119, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2102, N'I', N'I4', 119, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2103, N'I', N'I5', 119, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2104, N'I', N'I6', 119, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2105, N'I', N'I7', 119, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2106, N'I', N'I8', 119, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2107, N'I', N'I9', 119, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2108, N'I', N'I10', 119, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2109, N'I', N'I11', 119, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2110, N'I', N'I12', 119, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2111, N'I', N'I13', 119, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2112, N'I', N'I14', 119, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2113, N'I', N'I15', 119, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2114, N'I', N'I16', 119, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2115, N'A', N'A1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2116, N'A', N'A2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2117, N'A', N'A3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2118, N'A', N'A4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2119, N'A', N'A5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2120, N'A', N'A6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2121, N'A', N'A7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2122, N'A', N'A8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2123, N'A', N'A9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2124, N'A', N'A10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2125, N'A', N'A11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2126, N'A', N'A12', 123, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2127, N'A', N'A13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2128, N'A', N'A14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2129, N'A', N'A15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2130, N'A', N'A16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2131, N'B', N'B1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2132, N'B', N'B2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2133, N'B', N'B3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2134, N'B', N'B4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2135, N'B', N'B5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2136, N'B', N'B6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2137, N'B', N'B7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2138, N'B', N'B8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2139, N'B', N'B9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2140, N'B', N'B10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2141, N'B', N'B11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2142, N'B', N'B12', 123, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2143, N'B', N'B13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2144, N'B', N'B14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2145, N'B', N'B15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2146, N'B', N'B16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2147, N'C', N'C1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2148, N'C', N'C2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2149, N'C', N'C3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2150, N'C', N'C4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2151, N'C', N'C5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2152, N'C', N'C6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2153, N'C', N'C7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2154, N'C', N'C8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2155, N'C', N'C9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2156, N'C', N'C10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2157, N'C', N'C11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2158, N'C', N'C12', 123, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2159, N'C', N'C13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2160, N'C', N'C14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2161, N'C', N'C15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2162, N'C', N'C16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2163, N'D', N'D1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2164, N'D', N'D2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2165, N'D', N'D3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2166, N'D', N'D4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2167, N'D', N'D5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2168, N'D', N'D6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2169, N'D', N'D7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2170, N'D', N'D8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2171, N'D', N'D9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2172, N'D', N'D10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2173, N'D', N'D11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2174, N'D', N'D12', 123, 12, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2175, N'D', N'D13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2176, N'D', N'D14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2177, N'D', N'D15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2178, N'D', N'D16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2179, N'E', N'E1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2180, N'E', N'E2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2181, N'E', N'E3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2182, N'E', N'E4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2183, N'E', N'E5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2184, N'E', N'E6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2185, N'E', N'E7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2186, N'E', N'E8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2187, N'E', N'E9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2188, N'E', N'E10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2189, N'E', N'E11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2190, N'E', N'E12', 123, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2191, N'E', N'E13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2192, N'E', N'E14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2193, N'E', N'E15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2194, N'E', N'E16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2195, N'F', N'F1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2196, N'F', N'F2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2197, N'F', N'F3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2198, N'F', N'F4', 123, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2199, N'F', N'F5', 123, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2200, N'F', N'F6', 123, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2201, N'F', N'F7', 123, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2202, N'F', N'F8', 123, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2203, N'F', N'F9', 123, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2204, N'F', N'F10', 123, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2205, N'F', N'F11', 123, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2206, N'F', N'F12', 123, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2207, N'F', N'F13', 123, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2208, N'F', N'F14', 123, 14, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2209, N'F', N'F15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2210, N'F', N'F16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2211, N'G', N'G1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2212, N'G', N'G2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2213, N'G', N'G3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2214, N'G', N'G4', 123, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2215, N'G', N'G5', 123, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2216, N'G', N'G6', 123, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2217, N'G', N'G7', 123, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2218, N'G', N'G8', 123, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2219, N'G', N'G9', 123, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2220, N'G', N'G10', 123, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2221, N'G', N'G11', 123, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2222, N'G', N'G12', 123, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2223, N'G', N'G13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2224, N'G', N'G14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2225, N'G', N'G15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2226, N'G', N'G16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2227, N'H', N'H1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2228, N'H', N'H2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2229, N'H', N'H3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2230, N'H', N'H4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2231, N'H', N'H5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2232, N'H', N'H6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2233, N'H', N'H7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2234, N'H', N'H8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2235, N'H', N'H9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2236, N'H', N'H10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2237, N'H', N'H11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2238, N'H', N'H12', 123, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2239, N'H', N'H13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2240, N'H', N'H14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2241, N'H', N'H15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2242, N'H', N'H16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2243, N'I', N'I1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2244, N'I', N'I2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2245, N'I', N'I3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2246, N'I', N'I4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2247, N'I', N'I5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2248, N'I', N'I6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2249, N'I', N'I7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2250, N'I', N'I8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2251, N'I', N'I9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2252, N'I', N'I10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2253, N'I', N'I11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2254, N'I', N'I12', 123, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2255, N'I', N'I13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2256, N'I', N'I14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2257, N'I', N'I15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2258, N'I', N'I16', 123, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2259, N'J', N'J1', 123, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2260, N'J', N'J2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2261, N'J', N'J3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2262, N'J', N'J4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2263, N'J', N'J5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2264, N'J', N'J6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2265, N'J', N'J7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2266, N'J', N'J8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2267, N'J', N'J9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2268, N'J', N'J10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2269, N'J', N'J11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2270, N'J', N'J12', 123, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2271, N'J', N'J13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2272, N'J', N'J14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2273, N'J', N'J15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2274, N'K', N'K1', 123, 1, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2275, N'K', N'K2', 123, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2276, N'K', N'K3', 123, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2277, N'K', N'K4', 123, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2278, N'K', N'K5', 123, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2279, N'K', N'K6', 123, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2280, N'K', N'K7', 123, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2281, N'K', N'K8', 123, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2282, N'K', N'K9', 123, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2283, N'K', N'K10', 123, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2284, N'K', N'K11', 123, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2285, N'K', N'K12', 123, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2286, N'K', N'K13', 123, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2287, N'K', N'K14', 123, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2288, N'K', N'K15', 123, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2289, N'A', N'A1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2290, N'A', N'A2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2291, N'A', N'A3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2292, N'A', N'A4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2293, N'A', N'A5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2294, N'A', N'A6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2295, N'A', N'A7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2296, N'A', N'A8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2297, N'A', N'A9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2298, N'A', N'A10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2299, N'A', N'A11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2300, N'A', N'A12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2301, N'A', N'A13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2302, N'A', N'A14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2303, N'B', N'B1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2304, N'B', N'B2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2305, N'B', N'B3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2306, N'B', N'B4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2307, N'B', N'B5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2308, N'B', N'B6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2309, N'B', N'B7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2310, N'B', N'B8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2311, N'B', N'B9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2312, N'B', N'B10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2313, N'B', N'B11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2314, N'B', N'B12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2315, N'B', N'B13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2316, N'B', N'B14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2317, N'C', N'C1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2318, N'C', N'C2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2319, N'C', N'C3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2320, N'C', N'C4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2321, N'C', N'C5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2322, N'C', N'C6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2323, N'C', N'C7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2324, N'C', N'C8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2325, N'C', N'C9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2326, N'C', N'C10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2327, N'C', N'C11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2328, N'C', N'C12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2329, N'C', N'C13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2330, N'C', N'C14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2331, N'D', N'D1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2332, N'D', N'D2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2333, N'D', N'D3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2334, N'D', N'D4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2335, N'D', N'D5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2336, N'D', N'D6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2337, N'D', N'D7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2338, N'D', N'D8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2339, N'D', N'D9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2340, N'D', N'D10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2341, N'D', N'D11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2342, N'D', N'D12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2343, N'D', N'D13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2344, N'D', N'D14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2345, N'E', N'E1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2346, N'E', N'E2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2347, N'E', N'E3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2348, N'E', N'E4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2349, N'E', N'E5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2350, N'E', N'E6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2351, N'E', N'E7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2352, N'E', N'E8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2353, N'E', N'E9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2354, N'E', N'E10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2355, N'E', N'E11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2356, N'E', N'E12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2357, N'E', N'E13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2358, N'E', N'E14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2359, N'F', N'F1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2360, N'F', N'F2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2361, N'F', N'F3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2362, N'F', N'F4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2363, N'F', N'F5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2364, N'F', N'F6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2365, N'F', N'F7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2366, N'F', N'F8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2367, N'F', N'F9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2368, N'F', N'F10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2369, N'F', N'F11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2370, N'F', N'F12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2371, N'F', N'F13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2372, N'F', N'F14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2373, N'G', N'G1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2374, N'G', N'G2', 11, 2, 4, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2375, N'G', N'G3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2376, N'G', N'G4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2377, N'G', N'G5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2378, N'G', N'G6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2379, N'G', N'G7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2380, N'G', N'G8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2381, N'G', N'G9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2382, N'G', N'G10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2383, N'G', N'G11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2384, N'G', N'G12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2385, N'G', N'G13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2386, N'G', N'G14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2387, N'H', N'H1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2388, N'H', N'H2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2389, N'H', N'H3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2390, N'H', N'H4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2391, N'H', N'H5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2392, N'H', N'H6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2393, N'H', N'H7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2394, N'H', N'H8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2395, N'H', N'H9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2396, N'H', N'H10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2397, N'H', N'H11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2398, N'H', N'H12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2399, N'H', N'H13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2400, N'H', N'H14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2401, N'I', N'I1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2402, N'I', N'I2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2403, N'I', N'I3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2404, N'I', N'I4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2405, N'I', N'I5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2406, N'I', N'I6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2407, N'I', N'I7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2408, N'I', N'I8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2409, N'I', N'I9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2410, N'I', N'I10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2411, N'I', N'I11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2412, N'I', N'I12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2413, N'I', N'I13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2414, N'I', N'I14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2415, N'J', N'J1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2416, N'J', N'J2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2417, N'J', N'J3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2418, N'J', N'J4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2419, N'J', N'J5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2420, N'J', N'J6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2421, N'J', N'J7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2422, N'J', N'J8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2423, N'J', N'J9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2424, N'J', N'J10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2425, N'J', N'J11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2426, N'J', N'J12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2427, N'J', N'J13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2428, N'J', N'J14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2429, N'K', N'K1', 11, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2430, N'K', N'K2', 11, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2431, N'K', N'K3', 11, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2432, N'K', N'K4', 11, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2433, N'K', N'K5', 11, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2434, N'K', N'K6', 11, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2435, N'K', N'K7', 11, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2436, N'K', N'K8', 11, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2437, N'K', N'K9', 11, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2438, N'K', N'K10', 11, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2439, N'K', N'K11', 11, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2440, N'K', N'K12', 11, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2441, N'K', N'K13', 11, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2442, N'K', N'K14', 11, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2443, N'A', N'A1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2444, N'A', N'A2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2445, N'A', N'A3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2446, N'A', N'A4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2447, N'A', N'A5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2448, N'A', N'A6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2449, N'A', N'A7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2450, N'A', N'A8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2451, N'A', N'A9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2452, N'A', N'A10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2453, N'A', N'A11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2454, N'A', N'A12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2455, N'A', N'A13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2456, N'A', N'A14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2457, N'A', N'A15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2458, N'A', N'A16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2459, N'B', N'B1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2460, N'B', N'B2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2461, N'B', N'B3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2462, N'B', N'B4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2463, N'B', N'B5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2464, N'B', N'B6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2465, N'B', N'B7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2466, N'B', N'B8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2467, N'B', N'B9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2468, N'B', N'B10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2469, N'B', N'B11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2470, N'B', N'B12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2471, N'B', N'B13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2472, N'B', N'B14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2473, N'B', N'B15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2474, N'B', N'B16', 15, 16, 4, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2475, N'C', N'C1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2476, N'C', N'C2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2477, N'C', N'C3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2478, N'C', N'C4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2479, N'C', N'C5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2480, N'C', N'C6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2481, N'C', N'C7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2482, N'C', N'C8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2483, N'C', N'C9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2484, N'C', N'C10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2485, N'C', N'C11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2486, N'C', N'C12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2487, N'C', N'C13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2488, N'C', N'C14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2489, N'C', N'C15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2490, N'C', N'C16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2491, N'D', N'D1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2492, N'D', N'D2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2493, N'D', N'D3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2494, N'D', N'D4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2495, N'D', N'D5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2496, N'D', N'D6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2497, N'D', N'D7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2498, N'D', N'D8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2499, N'D', N'D9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2500, N'D', N'D10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2501, N'D', N'D11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2502, N'D', N'D12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2503, N'D', N'D13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2504, N'D', N'D14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2505, N'D', N'D15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2506, N'D', N'D16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2507, N'E', N'E1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2508, N'E', N'E2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2509, N'E', N'E3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2510, N'E', N'E4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2511, N'E', N'E5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2512, N'E', N'E6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2513, N'E', N'E7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2514, N'E', N'E8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2515, N'E', N'E9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2516, N'E', N'E10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2517, N'E', N'E11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2518, N'E', N'E12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2519, N'E', N'E13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2520, N'E', N'E14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2521, N'E', N'E15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2522, N'E', N'E16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2523, N'F', N'F1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2524, N'F', N'F2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2525, N'F', N'F3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2526, N'F', N'F4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2527, N'F', N'F5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2528, N'F', N'F6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2529, N'F', N'F7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2530, N'F', N'F8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2531, N'F', N'F9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2532, N'F', N'F10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2533, N'F', N'F11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2534, N'F', N'F12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2535, N'F', N'F13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2536, N'F', N'F14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2537, N'F', N'F15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2538, N'F', N'F16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2539, N'G', N'G1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2540, N'G', N'G2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2541, N'G', N'G3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2542, N'G', N'G4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2543, N'G', N'G5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2544, N'G', N'G6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2545, N'G', N'G7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2546, N'G', N'G8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2547, N'G', N'G9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2548, N'G', N'G10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2549, N'G', N'G11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2550, N'G', N'G12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2551, N'G', N'G13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2552, N'G', N'G14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2553, N'G', N'G15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2554, N'G', N'G16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2555, N'H', N'H1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2556, N'H', N'H2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2557, N'H', N'H3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2558, N'H', N'H4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2559, N'H', N'H5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2560, N'H', N'H6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2561, N'H', N'H7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2562, N'H', N'H8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2563, N'H', N'H9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2564, N'H', N'H10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2565, N'H', N'H11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2566, N'H', N'H12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2567, N'H', N'H13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2568, N'H', N'H14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2569, N'H', N'H15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2570, N'H', N'H16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2571, N'I', N'I1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2572, N'I', N'I2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2573, N'I', N'I3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2574, N'I', N'I4', 15, 4, 4, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2575, N'I', N'I5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2576, N'I', N'I6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2577, N'I', N'I7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2578, N'I', N'I8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2579, N'I', N'I9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2580, N'I', N'I10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2581, N'I', N'I11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2582, N'I', N'I12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2583, N'I', N'I13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2584, N'I', N'I14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2585, N'I', N'I15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2586, N'I', N'I16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2587, N'J', N'J1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2588, N'J', N'J2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2589, N'J', N'J3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2590, N'J', N'J4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2591, N'J', N'J5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2592, N'J', N'J6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2593, N'J', N'J7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2594, N'J', N'J8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2595, N'J', N'J9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2596, N'J', N'J10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2597, N'J', N'J11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2598, N'J', N'J12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2599, N'J', N'J13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2600, N'J', N'J14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2601, N'J', N'J15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2602, N'J', N'J16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2603, N'K', N'K1', 15, 1, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2604, N'K', N'K2', 15, 2, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2605, N'K', N'K3', 15, 3, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2606, N'K', N'K4', 15, 4, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2607, N'K', N'K5', 15, 5, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2608, N'K', N'K6', 15, 6, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2609, N'K', N'K7', 15, 7, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2610, N'K', N'K8', 15, 8, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2611, N'K', N'K9', 15, 9, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2612, N'K', N'K10', 15, 10, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2613, N'K', N'K11', 15, 11, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2614, N'K', N'K12', 15, 12, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2615, N'K', N'K13', 15, 13, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2616, N'K', N'K14', 15, 14, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2617, N'K', N'K15', 15, 15, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2618, N'K', N'K16', 15, 16, 4, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2619, N'A', N'A1', 115, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2620, N'A', N'A2', 115, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2621, N'A', N'A3', 115, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2622, N'A', N'A4', 115, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2623, N'A', N'A5', 115, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2624, N'A', N'A6', 115, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2625, N'A', N'A7', 115, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2626, N'A', N'A8', 115, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2627, N'A', N'A9', 115, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2628, N'A', N'A10', 115, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2629, N'A', N'A11', 115, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2630, N'A', N'A12', 115, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2631, N'A', N'A13', 115, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2632, N'A', N'A14', 115, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2633, N'A', N'A15', 115, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2634, N'B', N'B1', 115, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2635, N'B', N'B2', 115, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2636, N'B', N'B3', 115, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2637, N'B', N'B4', 115, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2638, N'B', N'B5', 115, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2639, N'B', N'B6', 115, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2640, N'B', N'B7', 115, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2641, N'B', N'B8', 115, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2642, N'B', N'B9', 115, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2643, N'B', N'B10', 115, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2644, N'B', N'B11', 115, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2645, N'B', N'B12', 115, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2646, N'B', N'B13', 115, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2647, N'B', N'B14', 115, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2648, N'B', N'B15', 115, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2649, N'B', N'B16', 115, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2650, N'C', N'C1', 115, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2651, N'C', N'C2', 115, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2652, N'C', N'C3', 115, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2653, N'C', N'C4', 115, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2654, N'C', N'C5', 115, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2655, N'C', N'C6', 115, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2656, N'C', N'C7', 115, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2657, N'C', N'C8', 115, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2658, N'C', N'C9', 115, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2659, N'C', N'C10', 115, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2660, N'C', N'C11', 115, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2661, N'C', N'C12', 115, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2662, N'C', N'C13', 115, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2663, N'C', N'C14', 115, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2664, N'C', N'C15', 115, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2665, N'C', N'C16', 115, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2666, N'D', N'D1', 115, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2667, N'D', N'D2', 115, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2668, N'D', N'D3', 115, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2669, N'D', N'D4', 115, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2670, N'D', N'D5', 115, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2671, N'D', N'D6', 115, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2672, N'D', N'D7', 115, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2673, N'D', N'D8', 115, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2674, N'D', N'D9', 115, 9, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2675, N'D', N'D10', 115, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2676, N'D', N'D11', 115, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2677, N'D', N'D12', 115, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2678, N'D', N'D13', 115, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2679, N'D', N'D14', 115, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2680, N'D', N'D15', 115, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2681, N'D', N'D16', 115, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2682, N'E', N'E1', 115, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2683, N'E', N'E2', 115, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2684, N'E', N'E3', 115, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2685, N'E', N'E4', 115, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2686, N'E', N'E5', 115, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2687, N'E', N'E6', 115, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2688, N'E', N'E7', 115, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2689, N'E', N'E8', 115, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2690, N'E', N'E9', 115, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2691, N'E', N'E10', 115, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2692, N'E', N'E11', 115, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2693, N'E', N'E12', 115, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2694, N'E', N'E13', 115, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2695, N'E', N'E14', 115, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2696, N'E', N'E15', 115, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2697, N'E', N'E16', 115, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2698, N'F', N'F1', 115, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2699, N'F', N'F2', 115, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2700, N'F', N'F3', 115, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2701, N'F', N'F4', 115, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2702, N'F', N'F5', 115, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2703, N'F', N'F6', 115, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2704, N'F', N'F7', 115, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2705, N'F', N'F8', 115, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2706, N'F', N'F9', 115, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2707, N'F', N'F10', 115, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2708, N'F', N'F11', 115, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2709, N'F', N'F12', 115, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2710, N'F', N'F13', 115, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2711, N'F', N'F14', 115, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2712, N'F', N'F15', 115, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2713, N'F', N'F16', 115, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2714, N'G', N'G1', 115, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2715, N'G', N'G2', 115, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2716, N'G', N'G3', 115, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2717, N'G', N'G4', 115, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2718, N'G', N'G5', 115, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2719, N'G', N'G6', 115, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2720, N'G', N'G7', 115, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2721, N'G', N'G8', 115, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2722, N'G', N'G9', 115, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2723, N'G', N'G10', 115, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2724, N'G', N'G11', 115, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2725, N'G', N'G12', 115, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2726, N'G', N'G13', 115, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2727, N'G', N'G14', 115, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2728, N'G', N'G15', 115, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2729, N'G', N'G16', 115, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2730, N'H', N'H1', 115, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2731, N'H', N'H2', 115, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2732, N'H', N'H3', 115, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2733, N'H', N'H4', 115, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2734, N'H', N'H5', 115, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2735, N'H', N'H6', 115, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2736, N'H', N'H7', 115, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2737, N'H', N'H8', 115, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2738, N'H', N'H9', 115, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2739, N'H', N'H10', 115, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2740, N'H', N'H11', 115, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2741, N'H', N'H12', 115, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2742, N'H', N'H13', 115, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2743, N'H', N'H14', 115, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2744, N'H', N'H15', 115, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2745, N'H', N'H16', 115, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2746, N'A', N'A1', 117, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2747, N'A', N'A2', 117, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2748, N'A', N'A3', 117, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2749, N'A', N'A4', 117, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2750, N'A', N'A5', 117, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2751, N'A', N'A6', 117, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2752, N'A', N'A7', 117, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2753, N'A', N'A8', 117, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2754, N'A', N'A9', 117, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2755, N'A', N'A10', 117, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2756, N'A', N'A11', 117, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2757, N'A', N'A12', 117, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2758, N'A', N'A13', 117, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2759, N'A', N'A14', 117, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2760, N'A', N'A15', 117, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2761, N'A', N'A16', 117, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2762, N'B', N'B1', 117, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2763, N'B', N'B2', 117, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2764, N'B', N'B3', 117, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2765, N'B', N'B4', 117, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2766, N'B', N'B5', 117, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2767, N'B', N'B6', 117, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2768, N'B', N'B7', 117, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2769, N'B', N'B8', 117, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2770, N'B', N'B9', 117, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2771, N'B', N'B10', 117, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2772, N'B', N'B11', 117, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2773, N'B', N'B12', 117, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2774, N'B', N'B13', 117, 13, 1, 1)
GO
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2775, N'B', N'B14', 117, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2776, N'B', N'B15', 117, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2777, N'B', N'B16', 117, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2778, N'C', N'C1', 117, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2779, N'C', N'C2', 117, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2780, N'C', N'C3', 117, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2781, N'C', N'C4', 117, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2782, N'C', N'C5', 117, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2783, N'C', N'C6', 117, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2784, N'C', N'C7', 117, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2785, N'C', N'C8', 117, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2786, N'C', N'C9', 117, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2787, N'C', N'C10', 117, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2788, N'C', N'C11', 117, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2789, N'C', N'C12', 117, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2790, N'C', N'C13', 117, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2791, N'C', N'C14', 117, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2792, N'C', N'C15', 117, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2793, N'C', N'C16', 117, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2794, N'D', N'D1', 117, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2795, N'D', N'D2', 117, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2796, N'D', N'D3', 117, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2797, N'D', N'D4', 117, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2798, N'D', N'D5', 117, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2799, N'D', N'D6', 117, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2800, N'D', N'D7', 117, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2801, N'D', N'D8', 117, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2802, N'D', N'D9', 117, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2803, N'D', N'D10', 117, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2804, N'D', N'D11', 117, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2805, N'D', N'D12', 117, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2806, N'D', N'D13', 117, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2807, N'D', N'D14', 117, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2808, N'D', N'D15', 117, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2809, N'D', N'D16', 117, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2810, N'E', N'E1', 117, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2811, N'E', N'E2', 117, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2812, N'E', N'E3', 117, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2813, N'E', N'E4', 117, 4, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2814, N'E', N'E5', 117, 5, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2815, N'E', N'E6', 117, 6, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2816, N'E', N'E7', 117, 7, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2817, N'E', N'E8', 117, 8, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2818, N'E', N'E9', 117, 9, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2819, N'E', N'E10', 117, 10, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2820, N'E', N'E11', 117, 11, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2821, N'E', N'E12', 117, 12, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2822, N'E', N'E13', 117, 13, 2, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2823, N'E', N'E14', 117, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2824, N'E', N'E15', 117, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2825, N'E', N'E16', 117, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2826, N'F', N'F1', 117, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2827, N'F', N'F2', 117, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2828, N'F', N'F3', 117, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2829, N'F', N'F4', 117, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2830, N'F', N'F5', 117, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2831, N'F', N'F6', 117, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2832, N'F', N'F7', 117, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2833, N'F', N'F8', 117, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2834, N'F', N'F9', 117, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2835, N'F', N'F10', 117, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2836, N'F', N'F11', 117, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2837, N'F', N'F12', 117, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2838, N'F', N'F13', 117, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2839, N'F', N'F14', 117, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2840, N'F', N'F15', 117, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2841, N'F', N'F16', 117, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2842, N'G', N'G1', 117, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2843, N'G', N'G2', 117, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2844, N'G', N'G3', 117, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2845, N'G', N'G4', 117, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2846, N'G', N'G5', 117, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2847, N'G', N'G6', 117, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2848, N'G', N'G7', 117, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2849, N'G', N'G8', 117, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2850, N'G', N'G9', 117, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2851, N'G', N'G10', 117, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2852, N'G', N'G11', 117, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2853, N'G', N'G12', 117, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2854, N'G', N'G13', 117, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2855, N'G', N'G14', 117, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2856, N'G', N'G15', 117, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2857, N'G', N'G16', 117, 16, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2858, N'H', N'H1', 117, 1, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2859, N'H', N'H2', 117, 2, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2860, N'H', N'H3', 117, 3, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2861, N'H', N'H4', 117, 4, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2862, N'H', N'H5', 117, 5, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2863, N'H', N'H6', 117, 6, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2864, N'H', N'H7', 117, 7, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2865, N'H', N'H8', 117, 8, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2866, N'H', N'H9', 117, 9, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2867, N'H', N'H10', 117, 10, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2868, N'H', N'H11', 117, 11, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2869, N'H', N'H12', 117, 12, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2870, N'H', N'H13', 117, 13, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2871, N'H', N'H14', 117, 14, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2872, N'H', N'H15', 117, 15, 1, 1)
INSERT [dbo].[GHE] ([MaGhe], [TenHang], [TenGhe], [MaRap], [SoThuTu], [MaLoaiGhe], [KichHoat]) VALUES (2873, N'H', N'H16', 117, 16, 1, 1)
SET IDENTITY_INSERT [dbo].[GHE] OFF
GO
INSERT [dbo].[HETHONGRAP] ([MaHeThongRap], [TenHeThongRap], [BiDanh], [Logo]) VALUES (N'BHDStar', N'BHD Star Cineplex', N'bhd-star-cineplex', N'http://movie0706.cybersoft.edu.vn/hinhanh/bhd-star-cineplex.png')
INSERT [dbo].[HETHONGRAP] ([MaHeThongRap], [TenHeThongRap], [BiDanh], [Logo]) VALUES (N'CGV', N'CGV', N'cgv', N'http://movie0706.cybersoft.edu.vn/hinhanh/cgv.png')
INSERT [dbo].[HETHONGRAP] ([MaHeThongRap], [TenHeThongRap], [BiDanh], [Logo]) VALUES (N'CineStar', N'CineStar', N'cinestar', N'http://movie0706.cybersoft.edu.vn/hinhanh/cinestar.png')
INSERT [dbo].[HETHONGRAP] ([MaHeThongRap], [TenHeThongRap], [BiDanh], [Logo]) VALUES (N'Galaxy', N'Galaxy Cinema', N'galaxy-cinema', N'http://movie0706.cybersoft.edu.vn/hinhanh/galaxy-cinema.png')
INSERT [dbo].[HETHONGRAP] ([MaHeThongRap], [TenHeThongRap], [BiDanh], [Logo]) VALUES (N'LotteCinema', N'Lotte Cinema', N'lotte-cinema', N'http://movie0706.cybersoft.edu.vn/hinhanh/lotte-cinema.png')
INSERT [dbo].[HETHONGRAP] ([MaHeThongRap], [TenHeThongRap], [BiDanh], [Logo]) VALUES (N'MegaGS', N'MegaGS', N'megags', N'http://movie0706.cybersoft.edu.vn/hinhanh/megags.png')
SET IDENTITY_INSERT [dbo].[LICHCHIEU] ON 

INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (1, 113, 14, CAST(N'2019-09-14T10:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (4, 113, 14, CAST(N'2019-12-18T16:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (5, 113, 14, CAST(N'2019-12-22T19:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (6, 114, 15, CAST(N'2019-12-18T18:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (7, 114, 16, CAST(N'2019-12-08T00:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (8, 138, 14, CAST(N'2019-12-06T10:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (9, 138, 14, CAST(N'2019-12-06T12:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (10, 138, 14, CAST(N'2019-12-06T14:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (11, 138, 14, CAST(N'2019-12-06T16:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (12, 138, 14, CAST(N'2019-12-06T18:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (13, 138, 14, CAST(N'2019-12-06T20:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (14, 139, 14, CAST(N'2019-12-07T10:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (15, 139, 14, CAST(N'2019-12-07T12:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (16, 139, 14, CAST(N'2019-12-07T14:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (17, 139, 14, CAST(N'2019-12-28T16:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (18, 139, 14, CAST(N'2019-12-28T18:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (19, 139, 14, CAST(N'2019-12-29T20:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (20, 114, 17, CAST(N'2019-10-18T20:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (21, 118, 19, CAST(N'2019-12-18T10:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (22, 118, 15, CAST(N'2019-12-22T12:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (23, 118, 17, CAST(N'2019-12-21T19:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (24, 118, 32, CAST(N'2019-12-20T18:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (25, 114, 33, CAST(N'2019-12-19T09:00:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (41, 113, 34, CAST(N'2019-12-26T09:00:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (42, 10, 14, CAST(N'2019-12-20T22:50:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (43, 10, 14, CAST(N'2019-12-18T09:30:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (44, 10, 14, CAST(N'2019-12-24T10:00:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (45, 10, 14, CAST(N'2019-12-09T05:40:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (46, 148, 15, CAST(N'2019-12-12T10:15:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (47, 10, 13, CAST(N'2019-12-19T13:40:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (56, 119, 14, CAST(N'2019-12-18T11:59:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (59, 118, 19, CAST(N'2019-12-21T03:41:32.307' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (60, 118, 15, CAST(N'2019-12-22T13:40:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (63, 123, 34, CAST(N'2019-12-23T15:00:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (64, 123, 34, CAST(N'2019-12-23T17:30:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (65, 11, 16, CAST(N'2019-12-23T16:00:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (66, 11, 16, CAST(N'2019-12-26T19:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (67, 11, 16, CAST(N'2019-12-26T08:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (68, 10, 16, CAST(N'2019-12-26T17:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (69, 15, 16, CAST(N'2019-12-26T16:20:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (70, 15, 16, CAST(N'2019-12-26T09:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (71, 114, 16, CAST(N'2019-12-23T09:15:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (73, 118, 16, CAST(N'2019-12-23T16:20:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (74, 119, 16, CAST(N'2019-12-26T18:20:00.000' AS DateTime), CAST(60000 AS Decimal(18, 0)), 20)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (76, 114, 15, CAST(N'2019-12-26T11:30:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (77, 114, 33, CAST(N'2019-12-26T20:30:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (78, 113, 15, CAST(N'2019-12-23T14:10:00.000' AS DateTime), CAST(75000 AS Decimal(18, 0)), 0)
INSERT [dbo].[LICHCHIEU] ([MaLichChieu], [MaRap], [MaPhim], [NgayChieuGioChieu], [GiaVe], [GiamGia]) VALUES (79, 113, 15, CAST(N'2019-12-23T22:30:00.000' AS DateTime), CAST(60000 AS Decimal(18, 0)), 20)
SET IDENTITY_INSERT [dbo].[LICHCHIEU] OFF
SET IDENTITY_INSERT [dbo].[LOAIGHE] ON 

INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (1, N'BHDStar', N'Thường', NULL, 0)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (2, N'BHDStar', N'Vip', NULL, 20)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (3, N'BHDStar', N'Đôi', NULL, 30)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (4, N'CGV', N'Thường', NULL, 0)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (5, N'CGV', N'Vip', NULL, 20)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (6, N'CGV', N'Đôi', NULL, 30)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (7, N'CineStar', N'Thường', NULL, 0)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (8, N'CineStar', N'Vip', NULL, 20)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (9, N'CineStar', N'Đôi', NULL, 30)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (10, N'Galaxy', N'Thường', NULL, 0)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (11, N'Galaxy', N'Vip', NULL, 20)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (12, N'Galaxy', N'Đôi', NULL, 30)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (13, N'LotteCinema', N'Thường', NULL, 0)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (14, N'LotteCinema', N'Vip', NULL, 20)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (15, N'LotteCinema', N'Đôi', NULL, 30)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (16, N'MegaGS', N'Thường', NULL, 0)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (17, N'MegaGS', N'Vip', NULL, 20)
INSERT [dbo].[LOAIGHE] ([MaLoaiGhe], [MaHeThongRap], [TenLoaiGhe], [MoTa], [PhuThu]) VALUES (18, N'MegaGS', N'Đôi', NULL, 30)
SET IDENTITY_INSERT [dbo].[LOAIGHE] OFF
SET IDENTITY_INSERT [dbo].[LOAITHANHVIEN] ON 

INSERT [dbo].[LOAITHANHVIEN] ([MaLoaiThanhVien], [TenLoai]) VALUES (1, N'Quản Trị')
INSERT [dbo].[LOAITHANHVIEN] ([MaLoaiThanhVien], [TenLoai]) VALUES (2, N'Khách Hàng')
INSERT [dbo].[LOAITHANHVIEN] ([MaLoaiThanhVien], [TenLoai]) VALUES (3, N'Khách Hàng VIP')
SET IDENTITY_INSERT [dbo].[LOAITHANHVIEN] OFF
SET IDENTITY_INSERT [dbo].[PHIEUTHANHTOAN] ON 

INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (98, 10, CAST(150000 AS Decimal(18, 0)), CAST(N'2019-12-18T16:44:31.133' AS DateTime), CAST(30000 AS Decimal(18, 0)), NULL, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (99, 10, CAST(225000 AS Decimal(18, 0)), CAST(N'2019-12-19T10:36:22.713' AS DateTime), CAST(0 AS Decimal(18, 0)), NULL, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (106, 7, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-20T23:31:38.687' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (108, 3, CAST(150000 AS Decimal(18, 0)), CAST(N'2019-12-20T23:32:47.977' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (109, 11, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-20T23:54:15.490' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (110, 11, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-20T23:55:21.567' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (111, 12, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-20T23:59:23.850' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (112, 12, CAST(150000 AS Decimal(18, 0)), CAST(N'2019-12-21T07:59:25.393' AS DateTime), CAST(30000 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (113, 12, CAST(150000 AS Decimal(18, 0)), CAST(N'2019-12-21T07:59:31.007' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (114, 12, CAST(150000 AS Decimal(18, 0)), CAST(N'2019-12-21T08:00:28.277' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (115, 12, CAST(180000 AS Decimal(18, 0)), CAST(N'2019-12-21T08:01:21.760' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (116, 29, CAST(360000 AS Decimal(18, 0)), CAST(N'2019-12-21T08:15:49.423' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (117, 11, CAST(270000 AS Decimal(18, 0)), CAST(N'2019-12-21T08:25:03.483' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (118, 13, CAST(300000 AS Decimal(18, 0)), CAST(N'2019-12-21T08:28:16.637' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (119, 13, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-21T08:29:07.847' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (120, 18, CAST(225000 AS Decimal(18, 0)), CAST(N'2019-12-21T09:12:10.390' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (121, 10, CAST(435000 AS Decimal(18, 0)), CAST(N'2019-12-22T08:58:27.500' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (123, 3, CAST(270000 AS Decimal(18, 0)), CAST(N'2019-12-22T09:11:50.857' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (124, 3, CAST(270000 AS Decimal(18, 0)), CAST(N'2019-12-22T09:13:42.933' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (125, 3, CAST(180000 AS Decimal(18, 0)), CAST(N'2019-12-22T09:14:16.610' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (126, 3, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-22T09:24:46.613' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (127, 3, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-22T09:26:43.963' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (128, 3, CAST(180000 AS Decimal(18, 0)), CAST(N'2019-12-22T09:42:22.473' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (129, 3, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-22T09:43:42.207' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (130, 3, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-22T09:46:55.787' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (131, 3, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-22T10:51:43.967' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (132, 10, CAST(180000 AS Decimal(18, 0)), CAST(N'2019-12-22T10:55:09.367' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (133, 10, CAST(180000 AS Decimal(18, 0)), CAST(N'2019-12-22T10:59:33.027' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (134, 12, CAST(360000 AS Decimal(18, 0)), CAST(N'2019-12-22T11:03:02.697' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (136, 7, CAST(180000 AS Decimal(18, 0)), CAST(N'2019-12-22T11:09:47.663' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (137, 7, CAST(0 AS Decimal(18, 0)), CAST(N'2019-12-22T11:10:55.213' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (138, 7, CAST(0 AS Decimal(18, 0)), CAST(N'2019-12-22T11:11:43.680' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (139, 10, CAST(162000 AS Decimal(18, 0)), CAST(N'2019-12-22T13:55:42.857' AS DateTime), CAST(0 AS Decimal(18, 0)), 18000, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (140, 7, CAST(180000 AS Decimal(18, 0)), CAST(N'2019-12-22T14:02:06.797' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (141, 10, CAST(162000 AS Decimal(18, 0)), CAST(N'2019-12-22T14:03:49.427' AS DateTime), CAST(0 AS Decimal(18, 0)), 18000, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (142, 10, CAST(81000 AS Decimal(18, 0)), CAST(N'2019-12-22T14:05:22.580' AS DateTime), CAST(0 AS Decimal(18, 0)), 9000, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (143, 10, CAST(81000 AS Decimal(18, 0)), CAST(N'2019-12-22T14:17:09.303' AS DateTime), CAST(0 AS Decimal(18, 0)), 9000, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (145, 10, CAST(67500 AS Decimal(18, 0)), CAST(N'2019-12-22T18:06:24.073' AS DateTime), CAST(0 AS Decimal(18, 0)), 7500, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (146, 10, CAST(67500 AS Decimal(18, 0)), CAST(N'2019-12-22T18:07:29.807' AS DateTime), CAST(0 AS Decimal(18, 0)), 7500, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (147, 10, CAST(67500 AS Decimal(18, 0)), CAST(N'2019-12-22T18:09:39.980' AS DateTime), CAST(0 AS Decimal(18, 0)), 7500, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (148, 10, CAST(67500 AS Decimal(18, 0)), CAST(N'2019-12-22T18:10:13.460' AS DateTime), CAST(0 AS Decimal(18, 0)), 7500, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (149, 3, CAST(81000 AS Decimal(18, 0)), CAST(N'2019-12-22T18:11:59.483' AS DateTime), CAST(0 AS Decimal(18, 0)), 9000, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (150, 10, CAST(202500 AS Decimal(18, 0)), CAST(N'2019-12-23T00:24:14.107' AS DateTime), CAST(0 AS Decimal(18, 0)), 22500, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (151, 10, CAST(135000 AS Decimal(18, 0)), CAST(N'2019-12-23T00:44:31.733' AS DateTime), CAST(0 AS Decimal(18, 0)), 15000, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (152, 7, CAST(180000 AS Decimal(18, 0)), CAST(N'2019-12-23T07:46:20.883' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (153, 7, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-23T08:03:17.807' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (154, 7, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-23T08:24:36.257' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (155, 7, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-23T08:26:33.557' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (156, 7, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-23T08:28:33.667' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (157, 7, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-23T08:29:38.780' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (158, 7, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-23T08:32:14.873' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (159, 7, CAST(120000 AS Decimal(18, 0)), CAST(N'2019-12-23T08:33:20.950' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (160, 7, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-23T08:58:47.617' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (161, 11, CAST(150000 AS Decimal(18, 0)), CAST(N'2019-12-23T09:34:19.313' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (162, 11, CAST(90000 AS Decimal(18, 0)), CAST(N'2019-12-23T09:37:37.943' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (163, 11, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-23T09:38:59.907' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (164, 11, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-23T09:40:28.097' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (165, 11, CAST(75000 AS Decimal(18, 0)), CAST(N'2019-12-23T09:42:48.347' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 1, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (166, 11, CAST(375000 AS Decimal(18, 0)), CAST(N'2019-12-23T10:23:48.027' AS DateTime), CAST(0 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (167, 11, CAST(375000 AS Decimal(18, 0)), CAST(N'2019-12-23T10:24:32.613' AS DateTime), CAST(15000 AS Decimal(18, 0)), 0, 0, NULL)
INSERT [dbo].[PHIEUTHANHTOAN] ([MaThanhToan], [MaThanhVien], [TongTien], [NgayDat], [TongTienHoanTra], [GiamGia], [TrangThaiThanhToan], [GhiChu]) VALUES (168, 11, CAST(202500 AS Decimal(18, 0)), CAST(N'2019-12-23T13:41:26.653' AS DateTime), CAST(0 AS Decimal(18, 0)), 22500, 0, NULL)
SET IDENTITY_INSERT [dbo].[PHIEUTHANHTOAN] OFF
SET IDENTITY_INSERT [dbo].[PHIM] ON 

INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (13, N'Fantastic Four', N'https://www.youtube.com/embed/AAgnQdiZFsQ', N'https://localhost:44350/HinhAnh/fantastic-four.jpg', N'Four young outsiders teleport to an alternate and dangerous universe which alters their physical form in shocking ways. The four must learn to harness their new abilities and work together to save Earth from a former friend turned enemy.', 120, CAST(N'2019-12-16' AS Date), CAST(5.7 AS Decimal(10, 1)), N'Tim Story', N'
Ioan Gruffudd, 
Jessica Alba, 
Chris Evans', N'{"doTuoi": "C18",  "backgroundColor": "#fb4226"}', N'fantastic-four', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (14, N'Ted 35', N'https://www.youtube.com/watch?v=v2VIFCHSdrM', N'https://localhost:44350/HinhAnh/ted.jpg', N'Newlywed couple Ted and Tami-Lynn want to have a baby, but in order to qualify to be a parent, Ted will have to prove he''s a person in a court of law.', 120, CAST(N'2019-12-05' AS Date), CAST(4.9 AS Decimal(10, 1)), N'Seth Macfarlane', N'
Mark Wahlberg, 
Mila Kunis, 
Seth Macfarlane  ', N'{"doTuoi":  "P",  "backgroundColor": "#00ac4d"}', N'ted-35', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (15, N'Trainwreck', N'https://www.youtube.com/embed/2MxnhBPoIx4', N'http://movie0706.cybersoft.edu.vn/hinhanh/trainwreck.jpg', N'Having thought that monogamy was never possible, a commitment-phobic career woman may have to face her fears when she meets a good guy.', 90, CAST(N'2019-12-14' AS Date), CAST(5.8 AS Decimal(10, 1)), N'Judd Apatow', N'string', N'{"doTuoi": "C16",  "backgroundColor": "#F7921E"}', N'trainwreck', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (16, N'Inside Out', N'https://www.youtube.com/embed/seMwpP0yeu4', N'http://movie0706.cybersoft.edu.vn/hinhanh/insideout.jpg', N'After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.', 150, CAST(N'2019-12-18' AS Date), CAST(4.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C13",  "backgroundColor": "#FCDF05"}', N'inside-out', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (17, N'Home', N'https://www.youtube.com/embed/MyqZf8LiWvM', N'http://movie0706.cybersoft.edu.vn/hinhanh/home.jpg', N'Oh, an alien on the run from his own people, lands on Earth and makes friends with the adventurous Tip, who is on a quest of her own.', 145, CAST(N'2019-12-15' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C18",  "backgroundColor": "#fb4226"}', N'home', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (18, N'Batman v Superman: Dawn of Justice', N'https://www.youtube.com/embed/0WWzgGyAH6Y', N'https://localhost:44350/HinhAnh/batman-and-superman.jpg', N'Fearing the actions of a god-like Super Hero left unchecked, Gotham City''s own formidable, forceful vigilante takes on Metropolis most revered, modern-day savior, while the world wrestles with what sort of hero it really needs. And with Batman and Superman at war with one another, a new threat quickly arises, putting mankind in greater danger than it''s ever known before.', 102, CAST(N'2019-12-18' AS Date), CAST(105.5 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C18",  "backgroundColor": "#fb4226"}', N'batman-v-superman-dawn-of-justice', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (19, N'Ant-Man', N'https://www.youtube.com/embed/1HpZevFifuo', N'https://localhost:44350/HinhAnh/ant-man.jpg', N'Armed with a super-suit with the astonishing ability to shrink in scale but increase in strength, cat burglar Scott Lang must embrace his inner hero and help his mentor, Dr. Hank Pym, plan and pull off a heist that will save the world.', 94, CAST(N'2019-12-19' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C18",  "backgroundColor": "#fb4226"}', N'ant-man', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (22, N'Jurassic World', N'https://www.youtube.com/embed/RFinNxS5KN4', N'http://movie0706.cybersoft.edu.vn/hinhanh/jurassicworld.jpg', N'A new theme park is built on the original site of Jurassic Park. Everything is going well until the park''s newest attraction--a genetically modified giant stealth killing machine--escapes containment and goes on a killing spree.', 94, CAST(N'2019-12-24' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C18",  "backgroundColor": "#fb4226"}', N'jurassic-world', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (26, N'Mad Max: Fury Road', N'https://www.youtube.com/embed/hEJnMQG9ev8', N'https://localhost:44350/HinhAnh/mad-max-fury-road.jpg', N'In a stark desert landscape where humanity is broken, two rebels just might be able to restore order: Max, a man of action and of few words, and Furiosa, a woman of action who is looking to make it back to her childhood homeland.', 105, CAST(N'2019-12-23' AS Date), CAST(0.0 AS Decimal(10, 1)), NULL, NULL, N'{"doTuoi": "C18",  "backgroundColor": "#fb4226"}', N'mad-max-fury-road', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (27, N'True Detective', N'https://www.youtube.com/embed/TXwCoNwBSkQ', N'https://localhost:44350/HinhAnh/true-detective.jpg', N'An anthology series in which police investigations unearth the personal and professional secrets of those involved, both within and outside the law.', 94, CAST(N'2019-12-22' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C16",  "backgroundColor": "#F7921E"}', N'true-detective', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (28, N'The Longest Ride', N'https://www.youtube.com/embed/FUS_Q7FsfqU', N'http://movie0706.cybersoft.edu.vn/hinhanh/thelongestride.jpg', N'After an automobile crash, the lives of a young couple intertwine with a much older man, as he reflects back on a past love.', 132, CAST(N'2019-12-21' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C16",  "backgroundColor": "#F7921E"}', N'the-longest-ride', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (29, N'The Walking Dead', N'https://www.youtube.com/embed/R1v0uFms68U', N'http://movie0706.cybersoft.edu.vn/hinhanh/thewalkingdead.jpg', N'Sheriff''s Deputy Rick Grimes leads a group of survivors in a world overrun by zombies.', 145, CAST(N'2019-12-20' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C16",  "backgroundColor": "#F7921E"}', N'the-walking-dead', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (30, N'Southpaw', N'https://www.youtube.com/embed/Mh2ebPxhoLs', N'http://movie0706.cybersoft.edu.vn/hinhanh/southpaw.jpg', N'Boxer Billy Hope turns to trainer Tick Willis to help him get his life back on track after losing his wife in a tragic accident and his daughter to child protection services.', 165, CAST(N'2019-12-31' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi":  "P",  "backgroundColor": "#00ac4d"}', N'southpaw', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (31, N'Specter', N'https://www.youtube.com/embed/LTDaET-JweU', N'http://movie0706.cybersoft.edu.vn/hinhanh/spectre.jpg', N'A cryptic message from Bond''s past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.', 80, CAST(N'2019-12-30' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi":  "P",  "backgroundColor": "#00ac4d"}', N'specter', 0, 0, 1)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (32, N'Chuyện Ngày Xưa Ở Hollywood', N'https://www.youtube.com/embed/NBdkQGFDNXY', N'http://movie0706.cybersoft.edu.vn/hinhanh/chuyen-ngay-xua-o-hollywood_gp10.jpg', N'Chuyện Ngày Xưa ở... Hollywood lấy bối cảnh Los Angeles vào năm 1969 với hai nhân vật chính là Rick Dalton - cựu ngôi sao của một bộ phim truyền hình viễn Tây - và người đóng thế lâu năm cho anh là Cliff Booth. ', 85, CAST(N'2019-12-18' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi":  "P",  "backgroundColor": "#00ac4d"}', N'chuyen-ngay-xua-o-hollywood', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (33, N'Angry Bird 2', N'https://www.youtube.com/embed/RDj8Y2K0ODA', N'http://movie0706.cybersoft.edu.vn/hinhanh/angry-bird-2_gp10.jpeg', N'Angry Birds 2 tiếp tục kể về âm mưu trả thù Angry Birds sau cuộc đại chiến giành lại trứng ở Angry Birds 1 của Vua Lợn. Thế nhưng cuối cùng cả hai lại phải bắt tay hợp tác để chống lại nữ hoàng băng giá Zeta. Kẻ đã dùng đại bác phá hủy đảo Heo và đảo Chim, khiến cư dân của hai hòn đảo bỏ chạy toán loạn.', 135, CAST(N'2019-12-20' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi":  "P",  "backgroundColor": "#00ac4d"}', N'angry-bird-2', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (34, N'Địa Đạo Cá Sấu Tử Thần - Crawl', N'https://www.youtube.com/embed/xYwC4oxldL0', N'http://movie0706.cybersoft.edu.vn/hinhanh/dia-dao-ca-sau-tu-than-crawl_gp10.jpg', N'Cá Sấu Tử Thần (Crawl) là một trong những bộ phim mới chiếu rạp kinh dị nói về cơn bão cấp 5 dữ dội ập đến một thị trấn ở Florida , Haley Keller ( Kaya Scodelario ) đã đi ngược lại lệnh di tản của thị trấn để tìm cha mình là Dave ( Barry Peppe ). Anh tìm thấy trong một tầng hầm trong nhà của gia đình họ ở Hồ Coral, và trong đó tràn ngập cá sấu. Hoàn toàn không có sự giải cứu, không thể trốn thoát và nước dâng cao, Haley và Dave phải trốn thoát khỏi cá sấu khi họ cố gắng thoát khỏi cơn bão.', 130, CAST(N'2019-12-17' AS Date), CAST(0.0 AS Decimal(10, 1)), N'string', N'string', N'{"doTuoi": "C13",  "backgroundColor": "#FCDF05"}', N'dia-dao-ca-sau-tu-than-crawl', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (35, N'Fantastic Four test', N'https://www.youtube.com/embed/AAgnQdiZFsQ', N'http://movie0706.cybersoft.edu.vn/hinhanh/fantasticfour.jpg', N'Four young outsiders teleport to an alternate and dangerous universe which alters their physical form in shocking ways. The four must learn to harness their new abilities and work together to save Earth from a former friend turned enemy.', 115, CAST(N'2019-12-15' AS Date), CAST(0.0 AS Decimal(10, 1)), N'Tim Story', N'
Ioan Gruffudd, 
Jessica Alba, 
Chris Evans, 
', N'{"doTuoi": "C13",  "backgroundColor": "#FCDF05"}', N'fantastic-four', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (43, N'Lôi Báo', N'https://youtu.be/f_pmSmrR0VU', N'https://localhost:44350/HinhAnh/loi-bao.jpg', N'Làm siêu anh hùng vĩ đại thì phải bất khả chiến bại hay cần có gia đình ở bên?", với sự tranh luận về quan điểm giữa Tâm và chú Mã. Trong mắt mọi người, Tâm chỉ là một gã họa sĩ lông bông mà không biết đến chừng chết rồi anh có được nổi tiếng không. Còn Tâm, anh chẳng quan tâm thế giới nghĩ gì, chỉ chuyên tâm cho ước mơ tạo ra một người hùng của mình, cho dù việc đó khiến anh dần xa rời vợ con. Theo mạch phim, thông điệp được định hình rõ dần lên xoay quanh đại ý ', 110, CAST(N'2019-12-19' AS Date), CAST(0.0 AS Decimal(10, 1)), NULL, NULL, N'{"doTuoi": "C13",  "backgroundColor": "#FCDF05"}', N'loi-bao', 0, 1, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (53, N'Avengers: Infinity War', N'https://www.youtube.com/embed/DKqu9qc-5f4', N'https://localhost:44350/HinhAnh/avengers-infinity-war.jpg', N'Biệt đội siêu anh hùng Avengers và những đồng minh sẽ phải sẵn sàng hi sinh tính mạng để chống lại siêu ác nhân hùng mạnh Thanos trước khi hắn phá huỷ mọi thứ và đặt dấu chấm hết cho vũ trụ.', 100, CAST(N'2019-12-25' AS Date), CAST(0.0 AS Decimal(10, 1)), N'', N'', N'{"doTuoi":  "P",  "backgroundColor": "#00ac4d"}', N'avengers-infinity-war', 0, 0, 0)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [Trailer], [HinhAnh], [MoTa], [ThoiLuong], [NgayKhoiChieu], [DanhGia], [DaoDien], [DienVien], [DoTuoi], [BiDanh], [DaXoa], [KhoiChieu], [SapChieu]) VALUES (67, N'Fozen', N'https://www.youtube.com/embed/gIOyB9ZXn8', N'https://localhost:44350/HinhAnh/fozen.jpg', N'test edit', NULL, CAST(N'2019-12-18' AS Date), CAST(0.0 AS Decimal(10, 1)), N'Tim Story', N'', N'{"doTuoi": "C18",  "backgroundColor": "#fb4226"}', N'fozen', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[PHIM] OFF
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (13, 4)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (13, 5)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (14, 1)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (14, 2)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (14, 7)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (15, 1)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (15, 2)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (16, 1)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (16, 5)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (16, 6)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (17, 3)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (17, 4)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (18, 1)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (18, 2)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (18, 3)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (19, 1)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (19, 2)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (19, 5)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (22, 2)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (22, 3)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (26, 5)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (27, 7)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (28, 3)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (29, 1)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (30, 2)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (30, 5)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (31, 1)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (31, 5)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (31, 7)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (32, 1)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (32, 6)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (33, 4)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (34, 5)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (34, 7)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (35, 4)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (43, 5)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (43, 6)
INSERT [dbo].[PHIM_THELOAI] ([MaPhim], [MaTheLoai]) VALUES (53, 7)
SET IDENTITY_INSERT [dbo].[RAP] ON 

INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (1, N'Rạp 1', NULL, N'megags-cao-thang')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (3, N'Rạp 2', NULL, N'megags-cao-thang')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (7, N'Rạp 3', NULL, N'megags-cao-thang')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (8, N'Rạp 4', NULL, N'megags-cao-thang')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (9, N'Rạp 5', NULL, N'megags-cao-thang')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (10, N'Rạp 1', 160, N'cgv-aeon-binh-tan')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (11, N'Rạp 2', 154, N'cgv-aeon-binh-tan')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (12, N'Rạp 3', NULL, N'cgv-aeon-binh-tan')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (13, N'Rạp 4', NULL, N'cgv-aeon-binh-tan')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (14, N'Rạp 5', NULL, N'cgv-aeon-binh-tan')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (15, N'Rạp 1', 176, N'cgv-aeon-tan-phu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (16, N'Rạp 2', NULL, N'cgv-aeon-tan-phu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (17, N'Rạp 3', NULL, N'cgv-aeon-tan-phu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (20, N'Rạp 4', NULL, N'cgv-aeon-tan-phu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (21, N'Rạp 5', NULL, N'cgv-aeon-tan-phu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (22, N'Rạp 1', NULL, N'cgv-cgv-saigonres-nguyen-xi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (23, N'Rạp 2', NULL, N'cgv-cgv-saigonres-nguyen-xi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (25, N'Rạp 3', NULL, N'cgv-cgv-saigonres-nguyen-xi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (26, N'Rạp 4', NULL, N'cgv-cgv-saigonres-nguyen-xi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (27, N'Rạp 5', NULL, N'cgv-cgv-saigonres-nguyen-xi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (28, N'Rạp 1', NULL, N'cgv-crescent-mall')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (29, N'Rạp 2', NULL, N'cgv-crescent-mall')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (30, N'Rạp 3', NULL, N'cgv-crescent-mall')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (31, N'Rạp 4', NULL, N'cgv-crescent-mall')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (32, N'Rạp 5', NULL, N'cgv-crescent-mall')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (33, N'Rạp 1', NULL, N'cgv-ct-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (34, N'Rạp 2', NULL, N'cgv-ct-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (35, N'Rạp 3', NULL, N'cgv-ct-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (36, N'Rạp 4', NULL, N'cgv-ct-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (37, N'Rạp 5', NULL, N'cgv-ct-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (38, N'Rạp 1', NULL, N'cgv-golden-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (39, N'Rạp 2', NULL, N'cgv-golden-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (40, N'Rạp 3', NULL, N'cgv-golden-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (41, N'Rạp 4', NULL, N'cgv-golden-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (42, N'Rạp 5', NULL, N'cgv-golden-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (43, N'Rạp 1', NULL, N'cgv-hoang-van-thu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (44, N'Rạp 2', NULL, N'cgv-hoang-van-thu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (45, N'Rạp 3', NULL, N'cgv-hoang-van-thu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (46, N'Rạp 4', NULL, N'cgv-hoang-van-thu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (47, N'Rạp 5', NULL, N'cgv-hoang-van-thu')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (48, N'Rạp 1', NULL, N'cgv-hung-vuong-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (49, N'Rạp 2', NULL, N'cgv-hung-vuong-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (50, N'Rạp 3', NULL, N'cgv-hung-vuong-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (51, N'Rạp 4', NULL, N'cgv-hung-vuong-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (52, N'Rạp 5', NULL, N'cgv-hung-vuong-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (53, N'Rạp 1', NULL, N'cgv-imc-tran-quang-khai')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (54, N'Rạp 2', NULL, N'cgv-imc-tran-quang-khai')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (55, N'Rạp 3', NULL, N'cgv-imc-tran-quang-khai')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (56, N'Rạp 4', NULL, N'cgv-imc-tran-quang-khai')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (57, N'Rạp 5', NULL, N'cgv-imc-tran-quang-khai')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (58, N'Rạp 1', NULL, N'cgv-liberty-citypoint')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (59, N'Rạp 2', NULL, N'cgv-liberty-citypoint')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (60, N'Rạp 3', NULL, N'cgv-liberty-citypoint')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (61, N'Rạp 4', NULL, N'cgv-liberty-citypoint')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (62, N'Rạp 5', NULL, N'cgv-liberty-citypoint')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (63, N'Rạp 1', NULL, N'cgv-pandora-city')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (64, N'Rạp 2', NULL, N'cgv-pandora-city')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (65, N'Rạp 3', NULL, N'cgv-pandora-city')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (66, N'Rạp 4', NULL, N'cgv-pandora-city')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (67, N'Rạp 5', NULL, N'cgv-pandora-city')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (68, N'Rạp 1', NULL, N'cgv-paragon')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (69, N'Rạp 2', NULL, N'cgv-paragon')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (70, N'Rạp 3', NULL, N'cgv-paragon')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (71, N'Rạp 4', NULL, N'cgv-paragon')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (72, N'Rạp 5', NULL, N'cgv-paragon')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (73, N'Rạp 1', NULL, N'cgv-parkson-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (74, N'Rạp 2', NULL, N'cgv-parkson-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (75, N'Rạp 3', NULL, N'cgv-parkson-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (76, N'Rạp 4', NULL, N'cgv-parkson-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (77, N'Rạp 5', NULL, N'cgv-parkson-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (78, N'Rạp 1', NULL, N'cgv-pearl-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (79, N'Rạp 2', NULL, N'cgv-pearl-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (80, N'Rạp 3', NULL, N'cgv-pearl-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (81, N'Rạp 4', NULL, N'cgv-pearl-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (82, N'Rạp 5', NULL, N'cgv-pearl-plaza')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (83, N'Rạp 1', NULL, N'cgv-satra-cu-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (84, N'Rạp 2', NULL, N'cgv-satra-cu-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (85, N'Rạp 3', NULL, N'cgv-satra-cu-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (86, N'Rạp 4', NULL, N'cgv-satra-cu-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (87, N'Rạp 5', NULL, N'cgv-satra-cu-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (88, N'Rạp 1', NULL, N'cgv-su-van-hanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (89, N'Rạp 2', NULL, N'cgv-su-van-hanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (90, N'Rạp 3', NULL, N'cgv-su-van-hanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (91, N'Rạp 4', NULL, N'cgv-su-van-hanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (92, N'Rạp 5', NULL, N'cgv-su-van-hanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (93, N'Rạp 1', NULL, N'cgv-vincom-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (94, N'Rạp 2', NULL, N'cgv-vincom-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (95, N'Rạp 3', NULL, N'cgv-vincom-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (96, N'Rạp 4', NULL, N'cgv-vincom-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (97, N'Rạp 5', NULL, N'cgv-vincom-dong-khoi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (98, N'Rạp 1', NULL, N'cgv-vincom-go-vap')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (99, N'Rạp 2', NULL, N'cgv-vincom-go-vap')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (100, N'Rạp 3', NULL, N'cgv-vincom-go-vap')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (101, N'Rạp 4', NULL, N'cgv-vincom-go-vap')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (102, N'Rạp 5', NULL, N'cgv-vincom-go-vap')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (103, N'Rạp 1', NULL, N'cgv-vincom-thu-duc')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (104, N'Rạp 2', NULL, N'cgv-vincom-thu-duc')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (105, N'Rạp 3', NULL, N'cgv-vincom-thu-duc')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (106, N'Rạp 4', NULL, N'cgv-vincom-thu-duc')
GO
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (107, N'Rạp 5', NULL, N'cgv-vincom-thu-duc')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (108, N'Rạp 1', NULL, N'cgv-vivocity')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (109, N'Rạp 2', NULL, N'cgv-vivocity')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (110, N'Rạp 3', NULL, N'cgv-vivocity')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (111, N'Rạp 4', NULL, N'cgv-vivocity')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (112, N'Rạp 5', NULL, N'cgv-vivocity')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (113, N'Rạp 1', 176, N'bhd-star-cineplex-3-2')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (114, N'Rạp 2', 176, N'bhd-star-cineplex-3-2')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (115, N'Rạp 3', 127, N'bhd-star-cineplex-3-2')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (116, N'Rạp 4', 79, N'bhd-star-cineplex-3-2')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (117, N'Rạp 5', 128, N'bhd-star-cineplex-3-2')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (118, N'Rạp 1', 176, N'bhd-star-cineplex-bitexco')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (119, N'Rạp 2', 144, N'bhd-star-cineplex-bitexco')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (120, N'Rạp 3', NULL, N'bhd-star-cineplex-bitexco')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (121, N'Rạp 4', NULL, N'bhd-star-cineplex-bitexco')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (122, N'Rạp 5', NULL, N'bhd-star-cineplex-bitexco')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (123, N'Rạp 1', 174, N'bhd-star-cineplex-pham-hung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (124, N'Rạp 2', NULL, N'bhd-star-cineplex-pham-hung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (125, N'Rạp 3', NULL, N'bhd-star-cineplex-pham-hung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (126, N'Rạp 4', NULL, N'bhd-star-cineplex-pham-hung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (127, N'Rạp 5', NULL, N'bhd-star-cineplex-pham-hung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (128, N'Rạp 1', NULL, N'bhd-star-cineplex-vincom-le-van-viet')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (129, N'Rạp 2', NULL, N'bhd-star-cineplex-vincom-le-van-viet')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (130, N'Rạp 3', NULL, N'bhd-star-cineplex-vincom-le-van-viet')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (131, N'Rạp 4', NULL, N'bhd-star-cineplex-vincom-le-van-viet')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (132, N'Rạp 5', NULL, N'bhd-star-cineplex-vincom-le-van-viet')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (133, N'Rạp 1', NULL, N'bhd-star-cineplex-vincom-thao-dien')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (134, N'Rạp 2', NULL, N'bhd-star-cineplex-vincom-thao-dien')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (135, N'Rạp 3', NULL, N'bhd-star-cineplex-vincom-thao-dien')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (136, N'Rạp 4', NULL, N'bhd-star-cineplex-vincom-thao-dien')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (137, N'Rạp 5', NULL, N'bhd-star-cineplex-vincom-thao-dien')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (138, N'Rạp 1', 176, N'cns-hai-ba-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (139, N'Rạp 2', NULL, N'cns-hai-ba-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (140, N'Rạp 3', 176, N'cns-hai-ba-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (141, N'Rạp 4', NULL, N'cns-hai-ba-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (142, N'Rạp 5', NULL, N'cns-hai-ba-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (143, N'Rạp 1', NULL, N'cns-quoc-thanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (144, N'Rạp 2', NULL, N'cns-quoc-thanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (145, N'Rạp 3', NULL, N'cns-quoc-thanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (146, N'Rạp 4', NULL, N'cns-quoc-thanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (147, N'Rạp 5', NULL, N'cns-quoc-thanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (148, N'Rạp 1', 176, N'glx-huynh-tan-phat')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (149, N'Rạp 2', NULL, N'glx-huynh-tan-phat')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (150, N'Rạp 3', NULL, N'glx-huynh-tan-phat')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (151, N'Rạp 4', NULL, N'glx-huynh-tan-phat')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (152, N'Rạp 5', NULL, N'glx-huynh-tan-phat')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (153, N'Rạp 1', NULL, N'glx-kinh-duong-vuong')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (154, N'Rạp 2', NULL, N'glx-kinh-duong-vuong')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (155, N'Rạp 3', NULL, N'glx-kinh-duong-vuong')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (156, N'Rạp 4', NULL, N'glx-kinh-duong-vuong')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (157, N'Rạp 5', NULL, N'glx-kinh-duong-vuong')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (158, N'Rạp 1', NULL, N'glx-nguyen-du')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (159, N'Rạp 2', NULL, N'glx-nguyen-du')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (160, N'Rạp 3', NULL, N'glx-nguyen-du')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (161, N'Rạp 4', NULL, N'glx-nguyen-du')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (162, N'Rạp 5', NULL, N'glx-nguyen-du')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (163, N'Rạp 1', NULL, N'glx-nguyen-van-qua')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (164, N'Rạp 2', NULL, N'glx-nguyen-van-qua')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (165, N'Rạp 3', NULL, N'glx-nguyen-van-qua')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (166, N'Rạp 4', NULL, N'glx-nguyen-van-qua')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (167, N'Rạp 5', NULL, N'glx-nguyen-van-qua')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (168, N'Rạp 1', NULL, N'glx-pham-van-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (169, N'Rạp 2', NULL, N'glx-pham-van-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (170, N'Rạp 3', NULL, N'glx-pham-van-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (171, N'Rạp 4', NULL, N'glx-pham-van-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (172, N'Rạp 5', NULL, N'glx-pham-van-chi')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (173, N'Rạp 1', NULL, N'glx-quang-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (174, N'Rạp 2', NULL, N'glx-quang-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (175, N'Rạp 3', NULL, N'glx-quang-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (176, N'Rạp 4', NULL, N'glx-quang-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (177, N'Rạp 5', NULL, N'glx-quang-trung')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (178, N'Rạp 1', NULL, N'glx-tan-binh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (179, N'Rạp 2', NULL, N'glx-tan-binh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (180, N'Rạp 3', NULL, N'glx-tan-binh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (181, N'Rạp 4', NULL, N'glx-tan-binh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (182, N'Rạp 5', NULL, N'glx-tan-binh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (183, N'Rạp 1', NULL, N'glx-trung-chanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (184, N'Rạp 2', NULL, N'glx-trung-chanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (185, N'Rạp 3', NULL, N'glx-trung-chanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (186, N'Rạp 4', NULL, N'glx-trung-chanh')
INSERT [dbo].[RAP] ([MaRap], [TenRap], [SoGhe], [MaCumRap]) VALUES (187, N'Rạp 5', NULL, N'glx-trung-chanh')
SET IDENTITY_INSERT [dbo].[RAP] OFF
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'HT1', 20, N'Mức hoàn tiền khi ngày hủy cách ngày chiếu > 5 ngày')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'HT2', 50, N'Mức hoàn tiền khi ngày hủy cách ngày chiếu từ 2 đến 5 ngày')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'13', 20, N'Thời gian có thể đặt vé kể từ ngày khởi chiếu của phim có mã 13')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'14', 20, N'Mã phim 14 lịch chiếu kéo dài 15 ngày')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'15', 20, N'Mã phim 15 lịch chiếu kéo dài 15 ngày')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'16', 10, N'Thời gian có thể đặt vé từ ngày khởi chiếu của phim có mã 16')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'17', 10, N'Thời gian có thể đặt vé từ ngày khởi chiếu của phim có mã 17')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'32', 8, N'Thời gian có thể đặt vé từ ngày khởi chiếu của phim có mã 32')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'33', 10, N'Thời gian có thể đặt vé từ ngày khởi chiếu của phim có mã 33')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'34', 10, N'Thời gian có thể đặt vé từ ngày khởi chiếu của phim có mã 34')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'35', 10, N'Thời gian có thể đặt vé từ ngày khởi chiếu của phim có mã 35')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'43', 10, N'Thời gian có thể đặt vé từ ngày khởi chiếu của phim có mã 43')
INSERT [dbo].[SETTING] ([MaSetting], [Setting], [MoTa]) VALUES (N'GG1', 10, N'Phần trăm giảm giá cho thành viên VIP')
SET IDENTITY_INSERT [dbo].[THANHVIEN] ON 

INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (1, N'TrucPhuong', N'Trúc Phương', N'123456', N'dreamstore2201@gmail.com', N'0398884505', 1, NULL, 0, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (3, N'ThanhLoc', N'Trần Thanh Lộc', N'123456', N'thanhloc@gmail.com', N'0771218989', 3, NULL, 18, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (4, N'NhatTuong', N'Trần Nhật Tường', N'123456', N'nhattuong@gmail.com', N'0895622337', 2, NULL, 0, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (5, N'vanphi', N'Nguyễn Thị Vân Phi', N'123456@', N'vanphi@gmail.com', N'0776853916', 2, NULL, 0, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (7, N'xuanthuy', N'Phạm Hương Xuân Thủy', N'123456@', N'xuanthuy@gmail.com', N'0895632659', 3, NULL, 15, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (10, N'chaudiem', N'Châu Hồng Diễm', N'123456', N'diem@gmail.com', N'0785689632', 3, NULL, 27, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (11, N'tuyettrang', N'Trần Tuyết Trang', N'123456', N'trangtran@gmail.com', N'0895623651', 3, NULL, 23, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (12, N'huehuong', N'Đặng Cao Huế Hương', N'123456', N'dhuong4869@gmail.com', N'0895623651', 3, NULL, 11, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (13, N'thanhthao', N'Nguyễn Thị Thanh Thảo', N'123456', N'tthanhthao@gmail.com', N'0895623651', 2, NULL, 6, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (18, N'minhchau', N'Lê Minh Châu', N'123456z', N'string@gmail.com', N'0123645980', 2, NULL, 3, 0)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TaiKhoan], [HoTen], [MatKhau], [Email], [SoDienThoai], [MaLoaiThanhVien], [BiDanh], [SoLuongVeMua], [DaXoa]) VALUES (29, N'trucphuongvantran', N'Văn Trần Trúc Phương', N'123456', N'vantrantrucphuong@gmail.com', N'0398884505', 2, NULL, 4, 0)
SET IDENTITY_INSERT [dbo].[THANHVIEN] OFF
SET IDENTITY_INSERT [dbo].[THELOAI] ON 

INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (1, N'Action')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (2, N'Adventure ')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (3, N'Comedy ')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (4, N'Crime & Gangster')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (5, N'Drama ')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (6, N'Epics / Hisorical')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (7, N'Horror ')
SET IDENTITY_INSERT [dbo].[THELOAI] OFF
SET IDENTITY_INSERT [dbo].[VE] ON 

INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (126, 98, 344, CAST(75000 AS Decimal(18, 0)), 5, CAST(15000 AS Decimal(18, 0)), 1)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (127, 98, 345, CAST(75000 AS Decimal(18, 0)), 5, CAST(15000 AS Decimal(18, 0)), 1)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (128, 99, 1047, CAST(75000 AS Decimal(18, 0)), 47, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (129, 99, 1048, CAST(75000 AS Decimal(18, 0)), 47, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (130, 99, 1049, CAST(75000 AS Decimal(18, 0)), 47, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (135, 106, 344, CAST(75000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (137, 108, 348, CAST(75000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (138, 108, 349, CAST(75000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (139, 109, 355, CAST(75000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (140, 110, 354, CAST(75000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (141, 111, 316, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (142, 112, 1026, CAST(75000 AS Decimal(18, 0)), 44, CAST(15000 AS Decimal(18, 0)), 1)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (143, 112, 1025, CAST(75000 AS Decimal(18, 0)), 44, CAST(15000 AS Decimal(18, 0)), 1)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (144, 113, 1026, CAST(75000 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (145, 113, 1025, CAST(75000 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (146, 114, 1026, CAST(75000 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (147, 114, 1025, CAST(75000 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (148, 115, 1024, CAST(90000 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (149, 115, 1023, CAST(90000 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (150, 116, 296, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (151, 116, 297, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (152, 116, 298, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (153, 116, 299, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (154, 117, 317, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (155, 117, 318, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (156, 117, 319, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (157, 118, 1047, CAST(75000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (158, 118, 1048, CAST(75000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (159, 118, 1049, CAST(75000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (160, 118, 1050, CAST(75000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (161, 119, 1031, CAST(90000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (162, 119, 1032, CAST(90000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (163, 120, 1051, CAST(75000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (164, 120, 1052, CAST(75000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (165, 120, 1053, CAST(75000 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (168, 121, 320, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (169, 121, 321, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (170, 121, 322, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (171, 121, 323, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (172, 121, 345, CAST(75000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (178, 123, 300, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (179, 123, 301, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (180, 123, 302, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (181, 124, 871, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (182, 124, 872, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (183, 124, 873, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (184, 125, 874, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (185, 125, 875, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (186, 126, 876, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (187, 127, 877, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (188, 128, 887, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (189, 128, 888, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (190, 129, 878, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (191, 130, 882, CAST(75000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (192, 131, 879, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (193, 132, 880, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (194, 132, 881, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (195, 133, 889, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (196, 133, 890, CAST(90000 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (197, 134, 303, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (198, 134, 304, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (199, 134, 305, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (200, 134, 306, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (204, 138, 886, CAST(75000 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (205, 139, 328, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (206, 139, 329, CAST(90000 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (207, 140, 887, CAST(90000 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (208, 140, 888, CAST(90000 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (209, 141, 889, CAST(90000 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (210, 141, 890, CAST(90000 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (211, 142, 891, CAST(90000 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (212, 143, 892, CAST(90000 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (214, 145, 1286, CAST(75000 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (215, 146, 1287, CAST(75000 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (216, 147, 1288, CAST(75000 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (217, 148, 1289, CAST(75000 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (218, 149, 893, CAST(90000 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (219, 150, 2559, CAST(75000 AS Decimal(18, 0)), 69, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (220, 150, 2560, CAST(75000 AS Decimal(18, 0)), 69, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (221, 150, 2561, CAST(75000 AS Decimal(18, 0)), 69, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (222, 151, 902, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (223, 151, 903, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (224, 152, 886, CAST(90000 AS Decimal(18, 0)), 71, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (225, 152, 887, CAST(90000 AS Decimal(18, 0)), 71, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (226, 153, 888, CAST(90000 AS Decimal(18, 0)), 71, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (227, 154, 889, CAST(90000 AS Decimal(18, 0)), 71, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (228, 155, 902, CAST(75000 AS Decimal(18, 0)), 71, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (229, 156, 903, CAST(75000 AS Decimal(18, 0)), 71, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (230, 157, 890, CAST(90000 AS Decimal(18, 0)), 71, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (231, 158, 907, CAST(75000 AS Decimal(18, 0)), 71, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (232, 159, 344, CAST(60000 AS Decimal(18, 0)), 79, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (233, 159, 345, CAST(60000 AS Decimal(18, 0)), 79, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (234, 160, 2405, CAST(75000 AS Decimal(18, 0)), 66, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (235, 161, 904, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (236, 161, 905, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (237, 162, 886, CAST(90000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (238, 163, 906, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (239, 164, 907, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (240, 165, 908, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (241, 166, 909, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (242, 166, 910, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (243, 166, 911, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (244, 166, 912, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (245, 166, 913, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (246, 167, 822, CAST(75000 AS Decimal(18, 0)), 76, CAST(15000 AS Decimal(18, 0)), 1)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (247, 167, 823, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (248, 167, 824, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (249, 167, 825, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (250, 167, 826, CAST(75000 AS Decimal(18, 0)), 76, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (251, 168, 902, CAST(75000 AS Decimal(18, 0)), 77, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (252, 168, 903, CAST(75000 AS Decimal(18, 0)), 77, CAST(0 AS Decimal(18, 0)), 0)
INSERT [dbo].[VE] ([MaVe], [MaThanhToan], [MaGhe], [GiaVe], [MaLichChieu], [SoTienHoanTra], [TrangThaiHuy]) VALUES (253, 168, 904, CAST(75000 AS Decimal(18, 0)), 77, CAST(0 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[VE] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_TaiKhoan]    Script Date: 3/23/2020 10:26:26 PM ******/
ALTER TABLE [dbo].[THANHVIEN] ADD  CONSTRAINT [Unique_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BINHLUANDANHGIA] ADD  CONSTRAINT [DF_BINHLUANDANHGIA_NgayBinhLuan]  DEFAULT (getdate()) FOR [NgayBinhLuan]
GO
ALTER TABLE [dbo].[LICHCHIEU] ADD  CONSTRAINT [DF_LICHCHIEU_GiamGia]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[PHIEUTHANHTOAN] ADD  CONSTRAINT [DF_THANHTOAN_MucHoanTien]  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[PHIEUTHANHTOAN] ADD  CONSTRAINT [DF_THANHTOAN_MucHoanTien_1]  DEFAULT ((0)) FOR [TongTienHoanTra]
GO
ALTER TABLE [dbo].[PHIEUTHANHTOAN] ADD  CONSTRAINT [DF_PHIEUTHANHTOAN_GiamGia]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[PHIEUTHANHTOAN] ADD  CONSTRAINT [DF_PHIEUTHANHTOAN_TrangThaiThanhToan]  DEFAULT ((0)) FOR [TrangThaiThanhToan]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_DanhGia]  DEFAULT ((0.0)) FOR [DanhGia]
GO
ALTER TABLE [dbo].[THANHVIEN] ADD  CONSTRAINT [DF_THANHVIEN_SoLuongVeMua]  DEFAULT ((0)) FOR [SoLuongVeMua]
GO
ALTER TABLE [dbo].[THANHVIEN] ADD  CONSTRAINT [DF_THANHVIEN_DaXoa]  DEFAULT ((0)) FOR [DaXoa]
GO
ALTER TABLE [dbo].[VE] ADD  CONSTRAINT [DF_VE_SoTienHoanTra]  DEFAULT ((0)) FOR [SoTienHoanTra]
GO
ALTER TABLE [dbo].[VE] ADD  CONSTRAINT [DF_VE_TrangThaiHuy]  DEFAULT ((0)) FOR [TrangThaiHuy]
GO
ALTER TABLE [dbo].[BINHLUANDANHGIA]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUANDANHGIA_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
GO
ALTER TABLE [dbo].[BINHLUANDANHGIA] CHECK CONSTRAINT [FK_BINHLUANDANHGIA_PHIM]
GO
ALTER TABLE [dbo].[BINHLUANDANHGIA]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUANDANHGIA_THANHVIEN] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[THANHVIEN] ([MaThanhVien])
GO
ALTER TABLE [dbo].[BINHLUANDANHGIA] CHECK CONSTRAINT [FK_BINHLUANDANHGIA_THANHVIEN]
GO
ALTER TABLE [dbo].[CHIETKHAUTHANHTOAN]  WITH CHECK ADD  CONSTRAINT [FK_CHIETKHAUTHANHTOAN_HETHONGRAP] FOREIGN KEY([MaHeThongRap])
REFERENCES [dbo].[HETHONGRAP] ([MaHeThongRap])
GO
ALTER TABLE [dbo].[CHIETKHAUTHANHTOAN] CHECK CONSTRAINT [FK_CHIETKHAUTHANHTOAN_HETHONGRAP]
GO
ALTER TABLE [dbo].[CUMRAP]  WITH CHECK ADD  CONSTRAINT [FK_CumRap_HeThongRap] FOREIGN KEY([MaHeThongRap])
REFERENCES [dbo].[HETHONGRAP] ([MaHeThongRap])
GO
ALTER TABLE [dbo].[CUMRAP] CHECK CONSTRAINT [FK_CumRap_HeThongRap]
GO
ALTER TABLE [dbo].[GHE]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_LoaiGhe] FOREIGN KEY([MaLoaiGhe])
REFERENCES [dbo].[LOAIGHE] ([MaLoaiGhe])
GO
ALTER TABLE [dbo].[GHE] CHECK CONSTRAINT [FK_Ghe_LoaiGhe]
GO
ALTER TABLE [dbo].[GHE]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_Rap] FOREIGN KEY([MaRap])
REFERENCES [dbo].[RAP] ([MaRap])
GO
ALTER TABLE [dbo].[GHE] CHECK CONSTRAINT [FK_Ghe_Rap]
GO
ALTER TABLE [dbo].[LICHCHIEU]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Phim] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
GO
ALTER TABLE [dbo].[LICHCHIEU] CHECK CONSTRAINT [FK_LichChieu_Phim]
GO
ALTER TABLE [dbo].[LICHCHIEU]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Rap1] FOREIGN KEY([MaRap])
REFERENCES [dbo].[RAP] ([MaRap])
GO
ALTER TABLE [dbo].[LICHCHIEU] CHECK CONSTRAINT [FK_LichChieu_Rap1]
GO
ALTER TABLE [dbo].[PHIEUTHANHTOAN]  WITH CHECK ADD  CONSTRAINT [FK_THANHTOAN_THANHVIEN] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[THANHVIEN] ([MaThanhVien])
GO
ALTER TABLE [dbo].[PHIEUTHANHTOAN] CHECK CONSTRAINT [FK_THANHTOAN_THANHVIEN]
GO
ALTER TABLE [dbo].[PHIM_THELOAI]  WITH CHECK ADD  CONSTRAINT [FK_PHIM_THELOAI_PHIM] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
GO
ALTER TABLE [dbo].[PHIM_THELOAI] CHECK CONSTRAINT [FK_PHIM_THELOAI_PHIM]
GO
ALTER TABLE [dbo].[PHIM_THELOAI]  WITH CHECK ADD  CONSTRAINT [FK_Phim-TheLoai_TheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[THELOAI] ([MaTheLoai])
GO
ALTER TABLE [dbo].[PHIM_THELOAI] CHECK CONSTRAINT [FK_Phim-TheLoai_TheLoai]
GO
ALTER TABLE [dbo].[RAP]  WITH CHECK ADD  CONSTRAINT [FK_Rap_CumRap] FOREIGN KEY([MaCumRap])
REFERENCES [dbo].[CUMRAP] ([MaCumRap])
GO
ALTER TABLE [dbo].[RAP] CHECK CONSTRAINT [FK_Rap_CumRap]
GO
ALTER TABLE [dbo].[THANHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_LoaiThanhVien] FOREIGN KEY([MaLoaiThanhVien])
REFERENCES [dbo].[LOAITHANHVIEN] ([MaLoaiThanhVien])
GO
ALTER TABLE [dbo].[THANHVIEN] CHECK CONSTRAINT [FK_ThanhVien_LoaiThanhVien]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_GHE] FOREIGN KEY([MaGhe])
REFERENCES [dbo].[GHE] ([MaGhe])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_GHE]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_THANHTOAN] FOREIGN KEY([MaThanhToan])
REFERENCES [dbo].[PHIEUTHANHTOAN] ([MaThanhToan])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_THANHTOAN]
GO
/****** Object:  StoredProcedure [dbo].[BINH_LUAN_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[BINH_LUAN_INSERT]
@MATHANHVIEN INT,
@MAPHIM INT,
@NOIDUNGBINHLUAN nvarchar(MAX),
@CHISODANHGIA FLOAT

AS
BEGIN
	SET NOCOUNT  ON
	INSERT INTO dbo.[BINHLUANDANHGIA] (MaThanhVien, MaPhim, NoiDungBinhLuan, ChiSoDanhGia)
	VALUES (@MATHANHVIEN, @MAPHIM, @NOIDUNGBINHLUAN, @CHISODANHGIA);
END

GO
/****** Object:  StoredProcedure [dbo].[CHIET_KHAU_THANH_TOAN_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CHIET_KHAU_THANH_TOAN_DELETE]
@MACHIETKHAU int
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM [dbo].[CHIETKHAUTHANHTOAN]
	WHERE MaChietKhau = @MACHIETKHAU
END
GO
/****** Object:  StoredProcedure [dbo].[CUM_RAP_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[CUM_RAP_DELETE]
@MACUMRAP int
AS
BEGIN
	DELETE FROM dbo.CUMRAP
    WHERE MaCumRap = @MACUMRAP
END
GO
/****** Object:  StoredProcedure [dbo].[CUM_RAP_GET]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[CUM_RAP_GET]
@MAHETHONGRAP NVARCHAR(100)
AS
BEGIN
SET NOCOUNT  ON
	SELECT * FROM dbo.CUMRAP CR WHERE CR.MaHeThongRap = @MAHETHONGRAP	
END
GO
/****** Object:  StoredProcedure [dbo].[CUM_RAP_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[CUM_RAP_INSERT]
@TENCUMRAP nvarchar(100),
@THONGTIN nvarchar(250),
@MAHETHONGRAP varchar(150)

AS
BEGIN
	SET NOCOUNT  ON
	INSERT INTO dbo.[CUMRAP] (TenCumRap, ThongTin, MaHeThongRap)
	VALUES (@TENCUMRAP, @THONGTIN, @MAHETHONGRAP);
END

GO
/****** Object:  StoredProcedure [dbo].[CUM_RAP_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[CUM_RAP_UPDATE]
@MACUMRAP  int,
@TENCUMRAP nvarchar(100),
@THONGTIN nvarchar(250),
@MAHETHONGRAP varchar(150)

AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.CUMRAP
    SET
		TenCumRap = @TENCUMRAP,
		ThongTin = @THONGTIN,
		MaHeThongRap = @MAHETHONGRAP
    WHERE MaCumRap = @MACUMRAP
END




GO
/****** Object:  StoredProcedure [dbo].[DANG_KY]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[DANG_KY]
@TAIKHOAN nvarchar(50),
@HOTEN nvarchar(100),
@MATKHAU varchar(50),
@EMAIL varchar(100),
@SODIENTHOAI varchar(50),
@MALOAITHANHVIEN int,
@BIDANH varchar(100)
AS
BEGIN
	IF EXISTS(SELECT TaiKhoan FROM [dbo].[THANHVIEN] WHERE TaiKhoan = @TAIKHOAN)
    BEGIN
        RETURN -1;
    END
    ELSE IF EXISTS(SELECT Email FROM [dbo].[THANHVIEN] WHERE Email = @EMAIL)
    BEGIN
        RETURN 1;
    END
	ELSE IF NOT EXISTS(SELECT MaLoaiThanhVien FROM [dbo].[LOAITHANHVIEN] WHERE MaLoaiThanhVien = @MALOAITHANHVIEN)
	BEGIN
		RETURN 2;
	END
    ELSE
    BEGIN
        INSERT INTO dbo.THANHVIEN (TaiKhoan, HoTen, MatKhau, Email, SoDienThoai, MaLoaiThanhVien, BiDanh, DaXoa)
		VALUES (@TAIKHOAN, @HOTEN, @MATKHAU, @EMAIL, @SODIENTHOAI, @MALOAITHANHVIEN, @BIDANH, '');
    END
END
GO
/****** Object:  StoredProcedure [dbo].[DANG_NHAP]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DANG_NHAP]
@TAIKHOAN nvarchar(50),
@MATKHAU varchar(50)
AS
BEGIN
	SELECT * FROM [dbo].[THANHVIEN] TV
	WHERE TV.TaiKhoan = @TAIKHOAN AND TV.MatKhau = @MATKHAU
END
GO
/****** Object:  StoredProcedure [dbo].[DS_GHE_DANG_DAT_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[DS_GHE_DANG_DAT_DELETE]
@TENTAIKHOAN nvarchar(150),
@MALICHCHIEU int
AS
BEGIN
	DELETE FROM dbo.DANHSACHDATVE
    WHERE TaiKhoan = @TENTAIKHOAN AND MaLichChieu = @MALICHCHIEU
END
GO
/****** Object:  StoredProcedure [dbo].[GHE_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[GHE_DELETE]
@MAGHE int
AS
BEGIN
	DELETE FROM dbo.GHE
    WHERE MaGhe = @MAGHE
END
GO
/****** Object:  StoredProcedure [dbo].[GHE_GET]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[GHE_GET]
@KEYWORD NVARCHAR(100)
AS
BEGIN
SET NOCOUNT  ON
IF @KEYWORD != 'NULL'
	BEGIN
	SELECT * FROM dbo.GHE WHERE (GHE.TenGhe is null or GHE.TenGhe like '%' + @KEYWORD +'%')	
	END
ELSE
	BEGIN
		SELECT * FROM dbo.GHE
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GHE_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[GHE_INSERT]
@TENGHE nvarchar(50),
@MARAP int,
@SOTHUTU int,
@MALOAIGHE int,
@KICHHOAT bit
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO dbo.GHE (TenGhe, MaRap, SoThuTu, MaLoaiGhe, KichHoat)
	VALUES (@TENGHE, @MARAP, @SOTHUTU, @MALOAIGHE, @KICHHOAT);
END
GO
/****** Object:  StoredProcedure [dbo].[GHE_INSERT_THEO_HANG]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[GHE_INSERT_THEO_HANG]
@MARAP INT,
@TENHANG nchar(1),
@SOLUONGGHETRENHANG INT
AS
BEGIN
	DECLARE @hid INT;
	DECLARE @MAHETHONGRAP VARCHAR(20)
	DECLARE @MALOAIGHE INT
	SET @hid=1

	SELECT  TOP 1  @MAHETHONGRAP = dbo.CUMRAP.MaHeThongRap
	FROM  dbo.RAP 
		JOIN dbo.CUMRAP ON dbo.CUMRAP.MaCumRap = dbo.RAP.MaCumRap
		JOIN dbo.HETHONGRAP HTR ON HTR.MaHeThongRap = dbo.CUMRAP.MaHeThongRap
	WHERE MaRap = @MARAP

	SET @MALOAIGHE = (SELECT MaLoaiGhe FROM LOAIGHE WHERE MaHeThongRap = @MAHETHONGRAP AND TenLoaiGhe = N'Thường')
	WHILE @hid <= @SOLUONGGHETRENHANG
	BEGIN 
		INSERT GHE(TenHang, TenGhe, MaRap, SoThuTu, MaLoaiGhe, KichHoat) 
		VALUES(@TENHANG, @TENHANG + LTRIM(STR(@hid)), @MARAP, @hid, @MALOAIGHE, 1); 
		SET @hid = @hid + 1;
	END
	RETURN @MALOAIGHE
END

GO
/****** Object:  StoredProcedure [dbo].[GHE_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[GHE_UPDATE]
@MAGHE int,
@TENGHE nvarchar(50),
@MARAP int,
@SOTHUTU int,
@MALOAIGHE int,
@KICHHOAT bit
AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.GHE	
	SET
		TenGhe = @TENGHE,
		MaRap = @MARAP,
		SoThuTu = @SOTHUTU,
		MaLoaiGhe = @MALOAIGHE,
		KichHoat = @KICHHOAT
	WHERE MaGhe = @MAGHE
END
GO
/****** Object:  StoredProcedure [dbo].[GHE_UPDATE_LOAI_GHE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[GHE_UPDATE_LOAI_GHE]
@MAGHE int,
@TENLOAIGHE nvarchar(50)

AS
BEGIN
	SET NOCOUNT ON
	DECLARE @MALOAIGHE INT
	DECLARE @MAHETHONGRAP VARCHAR(20)
	DECLARE @MARAP INT
	SET @MARAP = (SELECT MaRap FROM GHE WHERE MaGhe = @MAGHE)

	SELECT  TOP 1  @MAHETHONGRAP = dbo.CUMRAP.MaHeThongRap
	FROM  dbo.RAP 
		JOIN dbo.CUMRAP ON dbo.CUMRAP.MaCumRap = dbo.RAP.MaCumRap
		JOIN dbo.HETHONGRAP HTR ON HTR.MaHeThongRap = dbo.CUMRAP.MaHeThongRap
	WHERE MaRap = @MARAP

	SET @MALOAIGHE = (SELECT MaLoaiGhe FROM LOAIGHE WHERE MaHeThongRap = @MAHETHONGRAP AND TenLoaiGhe = @TENLOAIGHE)
	UPDATE dbo.GHE	
	SET
		MaLoaiGhe = @MALOAIGHE
	WHERE MaGhe = @MAGHE
END
GO
/****** Object:  StoredProcedure [dbo].[HE_THONG_RAP_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[HE_THONG_RAP_DELETE]
@MAHETHONGRAP  varchar(10)
AS
BEGIN
	DELETE FROM [HETHONGRAP]
    WHERE MaHeThongRap = @MAHETHONGRAP
END
GO
/****** Object:  StoredProcedure [dbo].[HE_THONG_RAP_GET]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[HE_THONG_RAP_GET]
@MAHETHONGRAP NVARCHAR(100)
AS
BEGIN
SET NOCOUNT  ON
	SELECT * FROM [dbo].[HETHONGRAP] HTR WHERE (@MAHETHONGRAP is null or HTR.MaHeThongRap = @MAHETHONGRAP)	
END
GO
/****** Object:  StoredProcedure [dbo].[HE_THONG_RAP_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[HE_THONG_RAP_INSERT]
@TENHETHONGRAP nvarchar(250),
@BIDANH varchar(50),
@LOGO nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO dbo.[HETHONGRAP] (TenHeThongRap, BiDanh, Logo)
	VALUES (@TENHETHONGRAP, @BIDANH, @LOGO);
END
GO
/****** Object:  StoredProcedure [dbo].[HE_THONG_RAP_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[HE_THONG_RAP_UPDATE]
@MAHETHONGRAP  int,
@TENHETHONGRAP nvarchar(100),
@LOGO nvarchar(MAX),
@BIDANH varchar(150)

AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.[HETHONGRAP]
    SET
	TenHeThongRap = @TENHETHONGRAP,
	BiDanh = @BIDANH,
	Logo = @LOGO	
    WHERE MaHeThongRap = @MAHETHONGRAP
END
GO
/****** Object:  StoredProcedure [dbo].[LICH_CHIEU_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[LICH_CHIEU_DELETE]
@MALICHCHIEU int
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM [dbo].[LICHCHIEU]
	WHERE MaLichChieu = @MALICHCHIEU
END
GO
/****** Object:  StoredProcedure [dbo].[LICH_CHIEU_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[LICH_CHIEU_INSERT]
@MARAP int,
@MAPHIM int,
@NGAYCHIEUGIOCHIEU datetime,
@GIAVE decimal(18,0),
@GIAMGIA INT
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO [dbo].[LICHCHIEU] (MaRap, MaPhim, NgayChieuGioChieu, GiaVe, GiamGia)
	VALUES (@MARAP, @MAPHIM, @NGAYCHIEUGIOCHIEU, @GIAVE, @GIAMGIA);
END
GO
/****** Object:  StoredProcedure [dbo].[LICH_CHIEU_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[LICH_CHIEU_UPDATE]
@MALICHCHIEU int,
@MARAP int,
@MAPHIM int,
@NGAYCHIEUGIOCHIEU datetime,
@GIAVE decimal(18,0),
@THOILUONG varchar(20),
@MAHETHONGRAP int,
@MACUMRAP int
AS
BEGIN
	SET NOCOUNT ON
	UPDATE [dbo].[LICHCHIEU]
	SET
		MaRap = @MARAP,
		MaPhim = @MAPHIM,
		NgayChieuGioChieu = @NGAYCHIEUGIOCHIEU,
		GiaVe = @GIAVE,
		ThoiLuong = @THOILUONG,
		MaHeThongRap = @MAHETHONGRAP,
		MaCumRap = @MACUMRAP
	WHERE MaLichChieu = @MALICHCHIEU
END
GO
/****** Object:  StoredProcedure [dbo].[LOAI_GHE_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[LOAI_GHE_DELETE]
@MALOAIGHE int
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM [dbo].[LOAIGHE]
	WHERE MaLoaiGhe = @MALOAIGHE
END
GO
/****** Object:  StoredProcedure [dbo].[LOAI_GHE_GET]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOAI_GHE_GET]
@KEYWORD nvarchar(50)
AS
BEGIN
	IF @KEYWORD != 'NULL'
		BEGIN
		SELECT * FROM [dbo].[LOAIGHE] LG WHERE (LG.TenLoaiGhe is null or LG.TenLoaiGhe like '%' + @KEYWORD +'%')	
		END
	ELSE
		BEGIN
			SELECT * FROM [dbo].[LOAIGHE]
		END
END
GO
/****** Object:  StoredProcedure [dbo].[LOAI_GHE_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[LOAI_GHE_INSERT]
@TENLOAIGHE nvarchar(50),
@MOTA nvarchar(250),
@CHIETKHAU float
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO [dbo].[LOAIGHE] (TenLoaiGhe, MoTa, ChietKhau)
	VALUES (@TENLOAIGHE, @MOTA, @CHIETKHAU)
END
GO
/****** Object:  StoredProcedure [dbo].[LOAI_GHE_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[LOAI_GHE_UPDATE]
@MALOAIGHE int,
@TENLOAIGHE nvarchar(50),
@MOTA nvarchar(250),
@CHIETKHAU float
AS
BEGIN
	SET NOCOUNT ON
	UPDATE [dbo].[LOAIGHE]
	SET 
		TenLoaiGhe = @TENLOAIGHE, 
		MoTa = @MOTA,
		ChietKhau = @CHIETKHAU
	WHERE MaLoaiGhe = @MALOAIGHE
END
GO
/****** Object:  StoredProcedure [dbo].[LOAI_THANH_VIEN_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOAI_THANH_VIEN_DELETE]
@MALOAITHANHVIEN int
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM [dbo].[LOAITHANHVIEN]
	WHERE MaLoaiThanhVien = @MALOAITHANHVIEN
END
GO
/****** Object:  StoredProcedure [dbo].[LOAI_THANH_VIEN_GET]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOAI_THANH_VIEN_GET]
AS
BEGIN
	SELECT * FROM [dbo].[LOAITHANHVIEN]
END
GO
/****** Object:  StoredProcedure [dbo].[LOAI_THANH_VIEN_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOAI_THANH_VIEN_INSERT]
@TENLOAITHANHVIEN nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO [dbo].[LOAITHANHVIEN] (TenLoai)
	VALUES (@TENLOAITHANHVIEN);
END
GO
/****** Object:  StoredProcedure [dbo].[LOAI_THANH_VIEN_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOAI_THANH_VIEN_UPDATE]
@MALOAITHANHVIEN int,
@TENLOAITHANHVIEN nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON
	UPDATE [dbo].[LOAITHANHVIEN]
	SET
		TenLoai = @TENLOAITHANHVIEN
	WHERE MaLoaiThanhVien = @MALOAITHANHVIEN
END
GO
/****** Object:  StoredProcedure [dbo].[PHIM_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PHIM_DELETE]
@MAPHIM  int
AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.PHIM
	SET 
		DaXoa = 1
    WHERE MaPhim = @MAPHIM
END
GO
/****** Object:  StoredProcedure [dbo].[PHIM_GET]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PHIM_GET]
@KEYWORD NVARCHAR(100)
AS
BEGIN
SET NOCOUNT  ON
IF @KEYWORD != 'NULL'
	BEGIN
	SELECT * FROM [PHIM] WHERE (@KEYWORD is null or PHIM.TenPhim like '%' + @KEYWORD +'%')	
	END
ELSE
	BEGIN
		SELECT * FROM [PHIM]
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PHIM_GETPAGING]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PHIM_GETPAGING]
	@KEYWORD nvarchar(50),
	@PAGEINDEX int,
	@PAGESIZE int,
	@TOTALROW int output
AS
BEGIN
	SET NOCOUNT ON;
	SELECT @TOTALROW = count(*) FROM [dbo].[PHIM] Phim
	WHERE (@KEYWORD is null or Phim.TenPhim like '%' + @KEYWORD +'%')

	SELECT * from [dbo].[PHIM] Phim
	WHERE (@KEYWORD is null or Phim.TenPhim like '%' + @KEYWORD +'%')
	ORDER BY Phim.TenPhim
	OFFSET (@PAGEINDEX - 1) * @PAGESIZE ROWS
	FETCH NEXT @PAGESIZE ROW ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[PHIM_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[PHIM_INSERT]
@TENPHIM nvarchar(100),
@BIDANH nvarchar(50),
@TRAILER nvarchar(MAX),
@HINHANH varchar(150),
@MOTA nvarchar(MAX),
@NGAYKHOICHIEU date,
@DANHGIA varchar(50),
@DIENVIEN nvarchar(50),
@DAODIEN nvarchar(MAX),
@DOTUOI nvarchar(MAX),
@DAXOA bit,
@KHOICHIEU bit,
@SAPCHIEU bit
AS
BEGIN
	SET NOCOUNT  ON
	INSERT INTO [PHIM] (  TenPhim , BiDanh, Trailer, HinhAnh, MoTa, NgayKhoiChieu, DanhGia, DienVien, DaoDien, DoTuoi,  DaXoa, KhoiChieu, SapChieu)
	VALUES ( @TENPHIM, @BIDANH, @TRAILER, @HINHANH, @MOTA, @NGAYKHOICHIEU, @DANHGIA, @DIENVIEN, @DAODIEN, @DOTUOI, @DAXOA, @KHOICHIEU, @SAPCHIEU);
END

GO
/****** Object:  StoredProcedure [dbo].[PHIM_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PHIM_UPDATE]
@MAPHIM  int,
@TENPHIM nvarchar(100),
@TRAILER nvarchar(MAX),
@HINHANH varchar(150),
@MOTA nvarchar(MAX),
@NGAYKHOICHIEU date,
@DANHGIA varchar(50),
@DIENVIEN nvarchar(50),
@DAODIEN nvarchar(MAX),
@DOTUOI nvarchar(MAX),
@BIDANH nvarchar(50),
@DAXOA bit,
@KHOICHIEU bit,
@SAPCHIEU bit

AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.PHIM
    SET
		TenPhim = @TENPHIM,
		Trailer = @TRAILER,
		HinhAnh = @HINHANH,
		MoTa = @MOTA,
		NgayKhoiChieu = @NGAYKHOICHIEU,
		DanhGia = @DANHGIA,
		DienVien = @DIENVIEN,
		DaoDien = @DAODIEN,
		DoTuoi = @DOTUOI,
		BiDanh = @BIDANH,
		DaXoa = @DAXOA,
		SapChieu = @SAPCHIEU
    WHERE MaPhim = @MAPHIM
END
GO
/****** Object:  StoredProcedure [dbo].[PUT_DS_GHE_DANG_DAT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[PUT_DS_GHE_DANG_DAT]
@TENTAIKHOAN nvarchar(150),
@DANHSACHGHE nvarchar(MAX),
@MALICHCHIEU INT

AS
BEGIN
	SET NOCOUNT  ON
	IF (EXISTS (SELECT * 
                 FROM [dbo].[DANHSACHDATVE] 
                 WHERE TaiKhoan = @TENTAIKHOAN 
                 AND  MaLichChieu = @MALICHCHIEU))
	BEGIN
		UPDATE [dbo].[DANHSACHDATVE] 
		SET DanhSachGhe = @DANHSACHGHE 
		WHERE TaiKhoan = @TENTAIKHOAN AND  MaLichChieu = @MALICHCHIEU
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[DANHSACHDATVE] (TaiKhoan, DanhSachGhe, MaLichChieu)
		VALUES (@TENTAIKHOAN, @DANHSACHGHE, @MALICHCHIEU);
	END	
END

GO
/****** Object:  StoredProcedure [dbo].[THANH_TOAN_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THANH_TOAN_INSERT]
@MATHANHVIEN int,
@TONGTIEN decimal(18,0),
@NGAYDAT datetime,
@MALICHCHIEU varchar(20),
@TRANGTHAITHANHTOAN int,
@GIAMGIA decimal(18,0)
AS
BEGIN
	DECLARE @MATHANHTOAN INT
	DECLARE @MAHETHONGRAP VARCHAR(20)

	SET XACT_ABORT ON

	--SELECT TOP 1 @MAHETHONGRAP = MaHeThongRap  FROM [dbo].[View_LICH_CHIEU_COMMON] WHERE MaLichChieu = @MALICHCHIEU
	--SELECT TOP 1 @MACHIETKHAU = MaChietKhau FROM [dbo].[CHIETKHAUTHANHTOAN] WHERE MaHeThongRap = @MAHETHONGRAP

	declare @IdentityOutput table ( ID int )
	INSERT INTO [dbo].[PHIEUTHANHTOAN] (MaThanhVien, TongTien, NgayDat, TrangThaiThanhToan, GiamGia)
	OUTPUT inserted.MaThanhToan INTO  @IdentityOutput
	VALUES (@MATHANHVIEN, @TONGTIEN, @NGAYDAT, @TRANGTHAITHANHTOAN, @GIAMGIA);
    SET @MATHANHTOAN = (select ID from @IdentityOutput)

	return @MATHANHTOAN
END
GO
/****** Object:  StoredProcedure [dbo].[THANH_VIEN_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THANH_VIEN_DELETE]
@TAIKHOAN nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON
	IF NOT EXISTS(SELECT TaiKhoan FROM [dbo].[THANHVIEN] WHERE TaiKhoan = @TAIKHOAN)
		BEGIN
			RETURN -2; -- TÀI KHOẢN KHÔNG TỒN TẠI
		END
	ELSE
	BEGIN
		UPDATE [dbo].[THANHVIEN]
		SET DaXoa = 1
		WHERE TaiKhoan = @TAIKHOAN
	END	
END
GO
/****** Object:  StoredProcedure [dbo].[THANH_VIEN_GETALL]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THANH_VIEN_GETALL]
@TAIKHOAN NVARCHAR(100)
AS
BEGIN
SET NOCOUNT  ON
	SELECT * FROM [dbo].[THANHVIEN] TV WHERE (@TAIKHOAN is null or TV.TaiKhoan like '%' + @TAIKHOAN +'%')
END
GO
/****** Object:  StoredProcedure [dbo].[THANH_VIEN_GETPAGING]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THANH_VIEN_GETPAGING]
	@KEYWORD nvarchar(50),
	@PAGEINDEX int,
	@PAGESIZE int,
	@TOTALROW int output
AS
BEGIN
	SET NOCOUNT ON;
	SELECT @TOTALROW = count(*) FROM [dbo].[THANHVIEN] TV
	WHERE (@KEYWORD is null or TV.TaiKhoan like '%' + @KEYWORD +'%')

	SELECT MaThanhVien, TaiKhoan, HoTen, MatKhau, Email, SoDienThoai, MaLoaiThanhVien, DaXoa from [dbo].[THANHVIEN] TV
	WHERE (@KEYWORD is null or TV.TaiKhoan like '%' + @KEYWORD +'%')
	ORDER BY tv.TaiKhoan
	OFFSET (@PAGEINDEX - 1) * @PAGESIZE ROWS
	FETCH NEXT @PAGESIZE ROW ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[THANH_VIEN_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THANH_VIEN_INSERT]
@TAIKHOAN nvarchar(50),
@HOTEN nvarchar(100),
@MATKHAU varchar(50),
@EMAIL varchar(100),
@SODIENTHOAI varchar(50),
@MALOAITHANHVIEN int,
@BIDANH varchar(100),
@DAXOA bit
AS
BEGIN
	SET NOCOUNT  ON
	INSERT INTO dbo.THANHVIEN (TaiKhoan, HoTen, MatKhau, Email, SoDienThoai, MaLoaiThanhVien, BiDanh, DaXoa)
	VALUES (@TAIKHOAN, @HOTEN, @MATKHAU, @EMAIL, @SODIENTHOAI, @MALOAITHANHVIEN, @BIDANH, @DAXOA);
END
GO
/****** Object:  StoredProcedure [dbo].[THANH_VIEN_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THANH_VIEN_UPDATE]
@TAIKHOAN nvarchar(50),
@HOTEN nvarchar(100),
@MATKHAU varchar(50),
@EMAIL varchar(100),
@SODIENTHOAI varchar(50),
@MALOAITHANHVIEN int

AS
BEGIN
	SET NOCOUNT  ON
	DECLARE @RET INT
	IF NOT EXISTS(SELECT TaiKhoan FROM [dbo].[THANHVIEN] WHERE TaiKhoan = @TAIKHOAN)
		BEGIN
			RETURN -2; -- TÀI KHOẢN KHÔNG TỒN TẠI
		END
	IF EXISTS(SELECT TaiKhoan FROM [dbo].[THANHVIEN] WHERE TaiKhoan = @TAIKHOAN)
		BEGIN
			RETURN -1; -- TÀI KHOẢN TRÙNG
		END
    ELSE IF EXISTS(SELECT Email FROM [dbo].[THANHVIEN] WHERE Email = @EMAIL)
		BEGIN
			RETURN 1; -- EMAIL TRÙNG
		END
	ELSE IF NOT EXISTS(SELECT MaLoaiThanhVien FROM [dbo].[LOAITHANHVIEN] WHERE MaLoaiThanhVien = @MALOAITHANHVIEN)
		BEGIN
			RETURN 2; -- MÃ LOẠI THÀNH VIÊN KHÔNG HỢP LỆ
		END
    ELSE
		BEGIN
			UPDATE dbo.THANHVIEN
			SET
				HoTen = @HOTEN,
				MatKhau = @MATKHAU,
				Email = @EMAIL,
				SoDienThoai = @SODIENTHOAI,
				MaLoaiThanhVien = @MALOAITHANHVIEN
			WHERE TaiKhoan = @TAIKHOAN
		END
END
GO
/****** Object:  StoredProcedure [dbo].[THE_LOAI_DELETE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THE_LOAI_DELETE]
@MATHELOAI int
AS
BEGIN
	SET NOCOUNT  ON
	DELETE FROM dbo.THELOAI
    WHERE MaTheLoai = @MATHELOAI
END
GO
/****** Object:  StoredProcedure [dbo].[THE_LOAI_GET]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THE_LOAI_GET]
@KEYWORD NVARCHAR(100)
AS
BEGIN
SET NOCOUNT  ON
IF @KEYWORD != 'NULL'
	BEGIN
	SELECT * FROM dbo.THELOAI TL WHERE (TL.TenTheLoai is null or TL.TenTheLoai like '%' + @KEYWORD +'%')	
	END
ELSE
	BEGIN
		SELECT * FROM dbo.THELOAI
	END
END
GO
/****** Object:  StoredProcedure [dbo].[THE_LOAI_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THE_LOAI_INSERT]
@TENTHELOAI nvarchar(50)
AS
BEGIN
	SET NOCOUNT  ON
	INSERT INTO dbo.THELOAI (TenTheLoai)
    VALUES (@TENTHELOAI);
END
GO
/****** Object:  StoredProcedure [dbo].[THE_LOAI_UPDATE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THE_LOAI_UPDATE]
@MATHELOAI int,
@TENTHELOAI nvarchar(50)
AS
BEGIN
	SET NOCOUNT  ON
	UPDATE dbo.THELOAI
    SET TenTheLoai = @TENTHELOAI
	WHERE MaTheLoai = @MATHELOAI
END
GO
/****** Object:  StoredProcedure [dbo].[THONG_KE_DOANH_THU]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THONG_KE_DOANH_THU]
@NGAYBD DATE,	
@NGAYKT DATE,
@MAHETHONGRAP varchar(20)
AS
BEGIN
	--THỐNG KÊ SỐ LƯỢNG VÉ BÁN THEO LỊCH CHIẾU TỪNG THÁNG
	SELECT LC.MaLichChieu, LC.MaCumRap, LC.MaPhim, PHIM.TenPhim, 
	RIGHT('0' + CAST(DATEPART(month, LC.NgayChieuGioChieu) AS NVARCHAR), 2) +'/'+cast(datepart(yyyy,LC.NgayChieuGioChieu) as varchar) As ThangNam, SUM(TT.TongTien - TT.TongTien*TT.MucHoanTien/100) AS DoanhThu
	FROM     dbo.LICHCHIEU AS LC INNER JOIN
			 dbo.PHIM AS PHIM ON LC.MaPhim = PHIM.MaPhim INNER JOIN
			 dbo.VE AS VE ON LC.MaLichChieu = VE.MaLichChieu
	INNER JOIN dbo.THANHTOAN AS TT ON VE.MaThanhToan = TT.MaThanhToan
	WHERE ( LC.NgayChieuGioChieu BETWEEN @NGAYBD AND @NGAYKT) AND LC.MaHeThongRap = @MAHETHONGRAP
	GROUP BY LC.MaLichChieu, LC.MaCumRap, LC.MaPhim, PHIM.TenPhim, LC.NgayChieuGioChieu
END
GO
/****** Object:  StoredProcedure [dbo].[THONG_KE_DOANH_THU_KHOANG_TG]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[THONG_KE_DOANH_THU_KHOANG_TG]
@NGAYBD DATE,	
@NGAYKT DATE,
@MAHETHONGRAP varchar(20)
AS
BEGIN
	SELECT t2.MaCumRap, t2.MaPhim, ISNULL(t1.DoanhThu,0) As DoanhThu
	FROM
	(SELECT dbo.CUMRAP.MaCumRap as MaCumRap, LC.MaPhim AS MaPhim
			FROM dbo.CUMRAP 
			INNER JOIN dbo.RAP ON dbo.CUMRAP.MaCumRap = dbo.RAP.MaCumRap
			INNER JOIN dbo.View_LICH_CHIEU_COMMON AS LC ON (LC.NgayChieuGioChieu BETWEEN @NGAYBD AND @NGAYKT ) AND LC.MaCumRap = Rap.MaCumRap 
														AND LC.MaHeThongRap = @MAHETHONGRAP		
	GROUP BY dbo.CUMRAP.MaCumRap, LC.MaPhim) t2
	LEFT JOIN
	(SELECT t1.MaPhim, t1.MaCumRap, SUM(t2.TongTien - t2.TongTienHoanTra) As DoanhThu
			FROM
			(SELECT dbo.VE.MaThanhToan AS MaThanhToan, dbo.View_LICH_CHIEU_COMMON.MaPhim AS MaPhim, dbo.View_LICH_CHIEU_COMMON.TenPhim As TenPhim, dbo.View_LICH_CHIEU_COMMON.MaCumRap As MaCumRap
			FROM    dbo.VE 
					INNER JOIN dbo.View_LICH_CHIEU_COMMON ON dbo.VE.MaLichChieu = dbo.View_LICH_CHIEU_COMMON.MaLichChieu 
												AND (dbo.View_LICH_CHIEU_COMMON.NgayChieuGioChieu BETWEEN @NGAYBD AND @NGAYKT ) 
												AND dbo.View_LICH_CHIEU_COMMON.MaHeThongRap = @MAHETHONGRAP
			GROUP BY dbo.VE.MaThanhToan, dbo.View_LICH_CHIEU_COMMON.MaPhim, dbo.View_LICH_CHIEU_COMMON.TenPhim, dbo.View_LICH_CHIEU_COMMON.MaCumRap) t1
			LEFT JOIN
			(SELECT MaThanhToan, TongTien, TongTienHoanTra FROM dbo.PHIEUTHANHTOAN ) t2
			ON t1.MaThanhToan = t2.MaThanhToan
			GROUP BY t1.MaPhim, t1.MaCumRap) t1
	ON  t1.MaPhim = t2.MaPhim AND t1.MaCumRap = t2.MaCumRap
END
GO
/****** Object:  StoredProcedure [dbo].[THONG_KE_DOANH_THU_THEO_NAM]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THONG_KE_DOANH_THU_THEO_NAM]
@NAM INT,	
@MAHETHONGRAP varchar(20)
AS
BEGIN
	--THỐNG KÊ DOANH THU THEO THANG TRONG NAM
WITH mcte AS (
		SELECT CAST('2019' as date) as MONTH_NAME
		UNION ALL
		SELECT DATEADD(MONTH,1,MONTH_NAME)
		FROM mcte
		WHERE DATEPART(MONTH,MONTH_NAME) < 12
	), octe AS (
		SELECT  (DATENAME (MONTH, DATEADD ( MONTH, DATEPART(MONTH, t1.NgayChieuGioChieu), -1) )) AS MONTH_NAME,
				t1.DoanhThu AS TOTAL_SALES
		FROM
			(SELECT SUM(t2.TongTien - t2.TongTienHoanTra) As DoanhThu, t1.NgayChieuGioChieu
			FROM
			(SELECT dbo.VE.MaThanhToan AS MaThanhToan,
			 (LC.NgayChieuGioChieu) AS NgayChieuGioChieu
			FROM dbo.VE 
				INNER JOIN dbo.View_LICH_CHIEU_COMMON LC ON dbo.VE.MaLichChieu = LC.MaLichChieu 
												AND (YEAR(LC.NgayChieuGioChieu) = @NAM ) 
												AND LC.MaHeThongRap = @MAHETHONGRAP
			GROUP BY  dbo.VE.MaThanhToan ,  (LC.NgayChieuGioChieu)) t1
			LEFT JOIN
			(SELECT MaThanhToan, TongTien, TongTienHoanTra FROM dbo.PHIEUTHANHTOAN ) t2
			ON t1.MaThanhToan = t2.MaThanhToan
			GROUP BY t1.NgayChieuGioChieu) t1
	)

	SELECT  DATEPART(m, m.MONTH_NAME) as Thang, ISNULL(o.TOTAL_SALES,0) As DoanhThu
	FROM mcte m
	LEFT JOIN octe o
		ON o.MONTH_NAME = DATENAME(MONTH,m.MONTH_NAME)
END
GO
/****** Object:  StoredProcedure [dbo].[THONG_KE_SO_LUONG_VE]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THONG_KE_SO_LUONG_VE]
@NGAYBD DATE,	
@NGAYKT DATE,
@MAHETHONGRAP varchar(20)
AS
BEGIN
	--THỐNG KÊ SỐ LƯỢNG VÉ BÁN THEO LỊCH CHIẾU TỪNG THÁNG
	SELECT LC.MaLichChieu, LC.MaCumRap, LC.MaPhim, PHIM.TenPhim, 
	RIGHT('0' + CAST(DATEPART(month, LC.NgayChieuGioChieu) AS NVARCHAR), 2) +'/'+cast(datepart(yyyy,LC.NgayChieuGioChieu) as varchar) As ThangNam, COUNT(VE.MaVe) AS SoLuongVeBan
	FROM     dbo.LICHCHIEU AS LC INNER JOIN
			 dbo.PHIM AS PHIM ON LC.MaPhim = PHIM.MaPhim INNER JOIN
			 dbo.VE AS VE ON LC.MaLichChieu = VE.MaLichChieu AND VE.TrangThaiHuy = 'False'
	WHERE ( LC.NgayChieuGioChieu BETWEEN @NGAYBD AND @NGAYKT) AND LC.MaHeThongRap = @MAHETHONGRAP
	GROUP BY LC.MaLichChieu, LC.MaCumRap, LC.MaPhim, PHIM.TenPhim, LC.NgayChieuGioChieu
END
GO
/****** Object:  StoredProcedure [dbo].[THONG_KE_SO_LUONG_VE_THEO_NAM]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[THONG_KE_SO_LUONG_VE_THEO_NAM]
@NAM INT,	
@MAHETHONGRAP varchar(20)
AS
BEGIN
	--THỐNG KÊ SỐ LƯỢNG VÉ BÁN THEO LỊCH CHIẾU TỪNG THÁNG
	WITH mcte AS (
		SELECT CAST('2019' as datetime) as MONTH_NAME
		UNION ALL
		SELECT DATEADD(MONTH,1,MONTH_NAME)
		FROM mcte
		WHERE DATEPART(MONTH,MONTH_NAME) < 12
	), octe AS (
		SELECT  (DATENAME (MONTH, DATEADD ( MONTH, DATEPART(MONTH, LC.NgayChieuGioChieu), -1) )) AS MONTH_NAME,
				COUNT(VE.MaVe) AS TOTAL_SALES
		FROM [dbo].[View_LICH_CHIEU_COMMON] LC
		INNER JOIN dbo.VE AS VE ON LC.MaLichChieu = VE.MaLichChieu AND VE.TrangThaiHuy = 'False'
			--AND (DATENAME (MONTH, DATEADD ( MONTH, DATEPART(MONTH, ORDER_DATE), -1) )) = (DATENAME (MONTH, DATEADD ( MONTH, DATEPART(MONTH, @Order_month), -1) )) 
		WHERE YEAR(LC.NgayChieuGioChieu) = @NAM AND LC.MaHeThongRap = @MAHETHONGRAP
		GROUP BY MONTH(LC.NgayChieuGioChieu), YEAR(LC.NgayChieuGioChieu)
	)
	SELECT  DATEPART(m, m.MONTH_NAME)  as Thang, ISNULL(o.TOTAL_SALES,0) As SoLuongVeBan
	FROM mcte m
	LEFT JOIN octe o
		ON o.MONTH_NAME = DATENAME(MONTH,m.MONTH_NAME)
END
GO
/****** Object:  StoredProcedure [dbo].[THONG_KE_VE_KHOANG_TG]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[THONG_KE_VE_KHOANG_TG]
@NGAYBD DATE,	
@NGAYKT DATE,
@MAHETHONGRAP varchar(20)
AS
BEGIN
	SELECT t2.TenCumRap, t2.MaPhim, t2.SoLuongGhe, ISNULL(t1.SoLuongVeBan,0) As SoLuongVeBan
	FROM
	(SELECT dbo.CUMRAP.TenCumRap as TenCumRap, SUM(dbo.RAP.SoGhe) AS SoLuongGhe, LC.MaPhim AS MaPhim
	FROM	dbo.CUMRAP 
			INNER JOIN dbo.RAP ON dbo.CUMRAP.MaCumRap = dbo.RAP.MaCumRap 
			INNER JOIN dbo.View_LICH_CHIEU_COMMON AS LC ON dbo.RAP.MaRap = LC.MaRap 
													AND (LC.NgayChieuGioChieu BETWEEN @NGAYBD AND @NGAYKT) 
													AND LC.MaHeThongRap = @MAHETHONGRAP
	GROUP BY dbo.CUMRAP.TenCumRap, LC.MaPhim) t2
	LEFT JOIN
	(SELECT LC.MaPhim, COUNT(dbo.VE.MaVe) AS SoLuongVeBan, dbo.CUMRAP.TenCumRap
	FROM    dbo.View_LICH_CHIEU_COMMON AS LC  
			INNER JOIN dbo.VE ON LC.MaLichChieu = dbo.VE.MaLichChieu AND dbo.VE.TrangThaiHuy = 'False' 
			INNER JOIN dbo.CUMRAP ON LC.MaCumRap = dbo.CUMRAP.MaCumRap
	WHERE (LC.NgayChieuGioChieu BETWEEN @NGAYBD AND @NGAYKT) AND LC.MaHeThongRap = @MAHETHONGRAP
	GROUP BY LC.MaPhim, dbo.CUMRAP.TenCumRap) t1
	ON  t1.MaPhim = t2.MaPhim AND t1.TenCumRap = t2.TenCumRap
END
GO
/****** Object:  StoredProcedure [dbo].[TIM_KIEM_LICH_CHIEU]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[TIM_KIEM_LICH_CHIEU]
@MAPHIM INT,
@MACUMRAP varchar(50),
@NGAYCHIEUGIOCHIEU nvarchar(20)
AS
BEGIN
SET NOCOUNT  ON
	DECLARE @MaLichChieu INT
	SELECT @MaLichChieu=MaLichChieu 
	FROM [dbo].[View_LICH_CHIEU_COMMON] AS LC
	WHERE LC.MaPhim = @MAPHIM 
	AND LC.MaCumRap = @MACUMRAP 
	AND LC.NgayChieuGioChieu = convert(datetime, @NGAYCHIEUGIOCHIEU)
	RETURN @MaLichChieu
END
GO
/****** Object:  StoredProcedure [dbo].[VE_HUY]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[VE_HUY]
@MAVE int,
@SOTIENHOANTRA int
AS
BEGIN
	SET NOCOUNT ON
	UPDATE [dbo].[VE]
    SET TrangThaiHuy = 1, SoTienHoanTra = @SOTIENHOANTRA
	WHERE MaVe = @MAVE
END
GO
/****** Object:  StoredProcedure [dbo].[VE_INSERT]    Script Date: 3/23/2020 10:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VE_INSERT]
@MATHANHTOAN int,
@MAGHE int,
@GIAVE decimal(18,0),
@MALICHCHIEU int
AS
BEGIN
	SET XACT_ABORT ON
	INSERT INTO [dbo].[VE] (MaThanhToan, MaGhe, GiaVe, MaLichChieu)
	VALUES (@MATHANHTOAN, @MAGHE, @GIAVE, @MALICHCHIEU);
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BINHLUANDANHGIA"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "THANHVIEN"
            Begin Extent = 
               Top = 7
               Left = 311
               Bottom = 170
               Right = 524
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BINH_LUAN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BINH_LUAN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[3] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LICHCHIEU"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "PHIM"
            Begin Extent = 
               Top = 7
               Left = 323
               Bottom = 170
               Right = 520
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1848
         Width = 1632
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LICH_CHIEU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LICH_CHIEU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[3] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RAP"
            Begin Extent = 
               Top = 40
               Left = 529
               Bottom = 203
               Right = 723
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LICHCHIEU"
            Begin Extent = 
               Top = 54
               Left = 219
               Bottom = 217
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "CUMRAP"
            Begin Extent = 
               Top = 27
               Left = 781
               Bottom = 190
               Right = 984
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PHIM"
            Begin Extent = 
               Top = 35
               Left = 0
               Bottom = 198
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1920
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LICH_CHIEU_COMMON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'50
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LICH_CHIEU_COMMON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LICH_CHIEU_COMMON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PHIM_THELOAI"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "THELOAI"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 126
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_THE_LOAI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_THE_LOAI'
GO
USE [master]
GO
ALTER DATABASE [BookingTicket] SET  READ_WRITE 
GO
