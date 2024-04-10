USE [master]
GO
/****** Object:  Database [BookStore_data]    Script Date: 4/10/2024 10:07:43 AM ******/
CREATE DATABASE [BookStore_data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore_data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookStore_data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookStore_data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStore_data] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore_data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore_data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore_data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore_data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore_data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore_data] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore_data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore_data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore_data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore_data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore_data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore_data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore_data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore_data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore_data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore_data] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStore_data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore_data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore_data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore_data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore_data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore_data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore_data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore_data] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore_data] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore_data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore_data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore_data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore_data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore_data] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStore_data] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStore_data] SET QUERY_STORE = OFF
GO
USE [BookStore_data]
GO
/****** Object:  User [root]    Script Date: 4/10/2024 10:07:43 AM ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](20) NOT NULL,
	[Lastname] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [varchar](13) NOT NULL,
	[Provincial] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[User_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calamviec]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calamviec](
	[caid] [int] NOT NULL,
	[tenca] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[caid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](50) NULL,
	[StartDay] [date] NULL,
	[User_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lichlamviec]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lichlamviec](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[caid] [int] NOT NULL,
	[thuid] [int] NOT NULL,
	[nvid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactures]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Information] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Address_Id] [int] NOT NULL,
	[Color_Id] [int] NULL,
	[Size_Id] [int] NULL,
	[Quality] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Method] [bit] NOT NULL,
	[Name] [varchar](6) NULL,
	[Status] [bit] NULL,
	[trangthai] [int] NULL,
	[ghichu] [nvarchar](100) NULL,
 CONSTRAINT [pk_orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Cate]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Cate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Cate_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Color]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Product_Id] [int] NOT NULL,
	[Color_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Size_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Image] [nvarchar](4000) NULL,
	[Price] [int] NOT NULL,
	[Origin] [nvarchar](100) NULL,
	[Material] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[Describe] [nvarchar](max) NULL,
	[Review] [nvarchar](max) NULL,
	[Manu_Id] [int] NULL,
	[Views] [int] NULL,
	[ManuDay] [date] NULL,
	[id_order] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thu]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thu](
	[thuid] [int] NOT NULL,
	[tenthu] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[thuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Role_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/10/2024 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](36) NOT NULL,
	[Password] [varchar](125) NULL,
	[Fullname] [nvarchar](125) NOT NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 
GO
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (1, N'Trần', N'Kỷ', N'kyttps13912@fpt.edu.vn', N'0787982721', N'Cần Thơ', N'Cần Thơ', 1)
GO
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (2, N'Anh', N'Võ Kim ', N'tiba@gmail.com', N'0338246391', N'binh', N'130 ấp nam', 2013)
GO
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (3, N'Toan', N'Nguyen Ngoc', N'toan53356@gmail.com', N'0383753980', N'Mekong Delta', N'Phường 14 Gò Vấp , HCM', 2019)
GO
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (4, N'Trần', N'Mẫn', N'man1772003@gmail.com', N'0814528145', N'Đồng Nai', N'J6, Tổ 1', 2020)
GO
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (11, N'Vo', N'Anh', N'anh@gmail.com', N'0814528145', N'Đồng Nai', N'xxxxxxx', 2026)
GO
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (12, N'Trần', N'Mẫn', N'man1772003@gmail.com', N'+84814528145', N'Đồng Nai', N'xxxxxxx', 2027)
GO
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
INSERT [dbo].[calamviec] ([caid], [tenca]) VALUES (1, N'Ca 1')
GO
INSERT [dbo].[calamviec] ([caid], [tenca]) VALUES (2, N'Ca 2')
GO
INSERT [dbo].[calamviec] ([caid], [tenca]) VALUES (3, N'Ca 3')
GO
INSERT [dbo].[calamviec] ([caid], [tenca]) VALUES (4, N'Ca hành chính')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (1, N'Kinh dị', N'book13.webp')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (2, N'Thiếu nhi', N'book14.webp')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (3, N'Chinh thám', N'book15.webp')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (4, N'Lãng mạn', N'book16.webp')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (5, N'Văn học', N'')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (6, N'Tâm lý học', N'')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 
GO
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Đỏ')
GO
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Trắng')
GO
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Xanh')
GO
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Đen')
GO
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Bạc')
GO
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (3, N'Nhân viên bán hàng', CAST(N'2022-06-16' AS Date), 2013)
GO
INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (10, N'Kỹ sư phần mềm', CAST(N'2024-02-26' AS Date), 2019)
GO
INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (11, N'Nhân viên giao hàng', CAST(N'2024-07-17' AS Date), 2)
GO
INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (13, N'Kỹ sư phần mềm', CAST(N'2024-10-20' AS Date), 2020)
GO
INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (16, N'Nhân viên giao hàng', CAST(N'2022-10-15' AS Date), 6)
GO
INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (17, N'Nhân viên bán hàng', CAST(N'2023-03-18' AS Date), 1014)
GO
INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (33, N'Nhân viên giao hàng', CAST(N'2022-10-22' AS Date), 2026)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 
GO
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (1, 1, 7, CAST(N'2022-06-19' AS Date))
GO
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (2, 1014, 2, CAST(N'2023-06-10' AS Date))
GO
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (1003, 2019, 2, CAST(N'2024-01-26' AS Date))
GO
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (1004, 2019, 11, CAST(N'2024-01-26' AS Date))
GO
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (1005, 2019, 3, CAST(N'2024-02-20' AS Date))
GO
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (1006, 2019, 4, CAST(N'2024-04-10' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[lichlamviec] ON 
GO
INSERT [dbo].[lichlamviec] ([id], [caid], [thuid], [nvid]) VALUES (1, 1, 1, 3)
GO
INSERT [dbo].[lichlamviec] ([id], [caid], [thuid], [nvid]) VALUES (2, 1, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[lichlamviec] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufactures] ON 
GO
INSERT [dbo].[Manufactures] ([Id], [Name], [Image], [Information]) VALUES (1, N'APPLE', N'', N'Tên công ty	Apple Inc.
Lĩnh vực hoạt động	Phần cứng máy tính, phần mềm máy tính, phụ kiện, thiết bị di động và các dịch vụ trực tuyến
Ngày thành lập	1/4/1976
Người sáng lập	Steve Jobs, Steve Wozniak và Ronald Wayne
Trụ sở chính	Cupertino, California, Mỹ
Giám đốc điều hành	Tim Cook
Số lượng nhân viên:	147.000 (2020)
Website:	https://www.apple.com/')
GO
INSERT [dbo].[Manufactures] ([Id], [Name], [Image], [Information]) VALUES (2, N'SamSung', N'', N'Allows you to synchronize personal information data saved in the Phone. Also the data saved in the PC’s personal information management program. The PC personal information management programs supported by PC Sync are Microsoft Outlook and Outlook Express.')
GO
INSERT [dbo].[Manufactures] ([Id], [Name], [Image], [Information]) VALUES (3, N'Oppo', N'', N'OPPO Electronics Corp (với tên thương hiệu là OPPO - Camera Phone, trước là: OPPO - Smartphone) là nhà sản xuất thiết bị điện tử, điện thoại di động Android Trung Quốc, có trụ sở đặt tại Đông Hoản, Quảng Đông, công ty con của tập đoàn điện tử BBK Electronics. OPPO cung cấp một số sản phẩm chính như máy nghe nhạc MP3, eBook, DVD/Blu-ray và điện thoại thông minh. Thành lập vào năm 2000, công ty đã đăng ký tên thương hiệu OPPO ở nhiều quốc gia trên thế giới.

OPPO hiện nằm trong top 5 hãng sản xuất điện thoại di động lớn nhất thế giới, đạt thị phần 8,1% vào đầu năm 2019[1]. Tại Việt Nam, OPPO là hãng điện thoại di động đứng thứ 2, với thị phần lên tới 25,2% vào cuối năm 2019.[2] Sản phẩm chủ yếu của hãng là điện thoại thông minh trong phân khúc tầm trung và cận cao cấp, với dòng sản phẩm chiến lược OPPO Reno (trước đây là OPPO F series) cùng các dự án quảng cáo lớn, rầm rộ.')
GO
INSERT [dbo].[Manufactures] ([Id], [Name], [Image], [Information]) VALUES (4, N'Laptop', N'', N'Dell sells personal computers (PCs), servers, data storage devices, network switches, software, computer peripherals, HDTVs, cameras, printers, and electronics built by other manufacturers. The company is known for how it manages its supply chain and electronic commerce. This includes Dell selling directly to customers and delivering PCs that the customer wants.[6][5] Dell was a pure hardware vendor until 2009 when it acquired Perot Systems. Dell then entered the market for IT services. The company has expanded storage and networking systems, The company is aiming to expand from offering computers only to delivering a range of technology for enterprise customers.[7][8]

It is the 3rd largest personal computer vendor as of January 2021.[9] [10] Dell is the sixth-largest company in Texas by total revenue, according to Fortune magazine. It is the second-largest non-oil company in Texas.[11][12] After going private in 2013, Fortune couldn''t rank the company. It was a publicly-traded company (Nasdaq: DELL), as well as a component of the NASDAQ-100 and S&P 500.

In 2015, Dell acquired the enterprise technology firm EMC Corporation. Dell and EMC became divisions of Dell Technologies. Dell EMC sells data storage, information security, virtualization, analytics, and cloud computing.[13]')
GO
INSERT [dbo].[Manufactures] ([Id], [Name], [Image], [Information]) VALUES (5, N'Card màng hình', N'', N'Nhân đồ họa: Nvidia RTX 3080Ti
Số nhân Cuda: 10240
Dung lượng VRAM: 12GB GDDR6X
Card màn hình MSI RTX 3080 Ti GAMING X TRIO 12G là một trong những sản phẩm cao cấp nhất của MSI phục vụ cho nhu cầu gaming ở độ phân giải 4K. Đây là  sử dụng kiến trúc Ampare hoàn toàn mới cùng nhân RT thế hệ 2, nhân Tensor thế hệ 3, Nvidia RTX IO, VRAM GDDR6X và sản xuất trên tiến trình 8nm được Samsung làm riêng. 

*Đây là phiên bản Over Clock sẵn, cho hiệu năng cao hơn RTX 3080Ti thông thường. ')
GO
SET IDENTITY_INSERT [dbo].[Manufactures] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (1, 1, 1, NULL, NULL, 11, CAST(N'2022-06-18' AS Date), 0, N'682524', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (2, 1, 1, 1, NULL, 1, CAST(N'2022-06-18' AS Date), 1, N'824882', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (3, 1, 1, 1, NULL, 1, CAST(N'2022-06-18' AS Date), 1, N'204559', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (4, 2, 1, 2, NULL, 2, CAST(N'2022-06-19' AS Date), 0, N'384036', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (5, 8, 1, NULL, NULL, 1, CAST(N'2022-10-19' AS Date), 1, N'931975', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (6, 2, 2, 2, NULL, 1, CAST(N'2023-06-15' AS Date), 0, N'745842', 1, 3, N'Không nhận hàng')
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (7, 3, 2, NULL, NULL, 1, CAST(N'2023-06-15' AS Date), 1, N'401119', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (9, 2, 2, 2, NULL, 3, CAST(N'2024-01-27' AS Date), 0, N'280718', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (10, 2, 2, 2, NULL, 3, CAST(N'2024-01-27' AS Date), 1, N'431753', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (11, 1, 3, NULL, NULL, 2, CAST(N'2024-02-20' AS Date), 0, N'201564', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (12, 2, 3, NULL, NULL, 2, CAST(N'2024-02-20' AS Date), 0, N'201564', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (13, 6, 3, NULL, NULL, 2, CAST(N'2024-02-20' AS Date), 0, N'201564', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (14, 9, 3, NULL, NULL, 2, CAST(N'2024-02-20' AS Date), 0, N'201564', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (15, 3, 3, NULL, NULL, 1, CAST(N'2024-02-20' AS Date), 0, N'603479', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (16, 1, 3, NULL, NULL, 15, CAST(N'2024-02-20' AS Date), 1, N'336763', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (17, 1, 3, NULL, NULL, 1, CAST(N'2024-02-20' AS Date), 0, N'891792', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (18, 3, 3, NULL, NULL, 1, CAST(N'2024-02-20' AS Date), 0, N'891792', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (44, 2, 11, NULL, NULL, 1, CAST(N'2024-03-26' AS Date), 1, N'644226', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (66, 2, 12, NULL, NULL, 4, CAST(N'2024-03-30' AS Date), 1, N'622075', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (67, 3, 11, NULL, NULL, 3, CAST(N'2024-03-30' AS Date), 1, N'233385', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (68, 1, 11, NULL, NULL, 5, CAST(N'2024-03-30' AS Date), 1, N'672574', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (69, 3, 11, NULL, NULL, 1, CAST(N'2024-03-30' AS Date), 1, N'672574', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (70, 1, 4, NULL, NULL, 1, CAST(N'2024-04-02' AS Date), 1, N'858215', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (71, 2, 4, NULL, NULL, 1, CAST(N'2024-04-02' AS Date), 1, N'858215', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (72, 3, 4, NULL, NULL, 1, CAST(N'2024-04-02' AS Date), 1, N'206930', 0, 3, N'Khách hàng không có tiền.')
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (73, 4, 4, NULL, NULL, 1, CAST(N'2024-04-02' AS Date), 1, N'216835', 0, 1, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (74, 5, 4, NULL, NULL, 1, CAST(N'2024-04-02' AS Date), 1, N'733953', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (75, 6, 4, NULL, NULL, 1, CAST(N'2024-04-02' AS Date), 1, N'733527', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (76, 8, 4, NULL, NULL, 3, CAST(N'2024-04-02' AS Date), 1, N'410587', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (77, 9, 4, NULL, NULL, 3, CAST(N'2024-04-02' AS Date), 1, N'410587', 1, 2, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (78, 53, 4, NULL, NULL, 2, CAST(N'2024-04-06' AS Date), 1, N'743002', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (79, 3, 4, NULL, NULL, 1, CAST(N'2024-04-06' AS Date), 1, N'695017', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (80, 9, 4, NULL, NULL, 2, CAST(N'2024-04-06' AS Date), 1, N'743228', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (81, 56, 4, NULL, NULL, 1, CAST(N'2024-04-06' AS Date), 1, N'131702', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (82, 5, 12, NULL, NULL, 4, CAST(N'2024-04-10' AS Date), 1, N'750319', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (83, 2, 12, NULL, NULL, 1, CAST(N'2024-04-10' AS Date), 1, N'796960', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (84, 3, 12, NULL, NULL, 1, CAST(N'2024-04-10' AS Date), 1, N'796960', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (85, 2, 12, NULL, NULL, 1, CAST(N'2024-04-10' AS Date), 1, N'492577', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (86, 3, 4, NULL, NULL, 1, CAST(N'2024-04-10' AS Date), 1, N'636520', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (87, 6, 4, NULL, NULL, 1, CAST(N'2024-04-10' AS Date), 1, N'992674', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (88, 12, 4, NULL, NULL, 1, CAST(N'2024-04-10' AS Date), 0, N'946469', 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status], [trangthai], [ghichu]) VALUES (89, 9, 3, NULL, NULL, 1, CAST(N'2024-04-10' AS Date), 0, N'998404', 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Cate] ON 
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (2, 2, 1)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (3, 3, 2)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (4, 4, 2)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (5, 5, 3)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (6, 6, 3)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (7, 7, 4)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (8, 8, 4)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (9, 9, 4)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (10, 60, 6)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (11, 60, 5)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (12, 55, 5)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (13, 55, 6)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (23, 54, 4)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (24, 6, 4)
GO
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (25, 4, 4)
GO
SET IDENTITY_INSERT [dbo].[Product_Cate] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Color] ON 
GO
INSERT [dbo].[Product_Color] ([Id], [Image], [Product_Id], [Color_Id]) VALUES (4, N'', 2, 2)
GO
INSERT [dbo].[Product_Color] ([Id], [Image], [Product_Id], [Color_Id]) VALUES (8, N'', 2, 4)
GO
INSERT [dbo].[Product_Color] ([Id], [Image], [Product_Id], [Color_Id]) VALUES (9, N'', 1, 3)
GO
INSERT [dbo].[Product_Color] ([Id], [Image], [Product_Id], [Color_Id]) VALUES (10, N'', 1, 5)
GO
INSERT [dbo].[Product_Color] ([Id], [Image], [Product_Id], [Color_Id]) VALUES (11, N'', 1, 1)
GO
INSERT [dbo].[Product_Color] ([Id], [Image], [Product_Id], [Color_Id]) VALUES (12, N'', 1, 2)
GO
INSERT [dbo].[Product_Color] ([Id], [Image], [Product_Id], [Color_Id]) VALUES (13, N'', 1, 4)
GO
SET IDENTITY_INSERT [dbo].[Product_Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (1, N'Cây Cam Ngọt Của Tôi', N'book1.webp', 773000, N'Nhà Xuất Bản Hội Nhà Văn', N'Bìa cứng', 0, N'', N'“Vị chua chát của cái nghèo hòa trộn với vị ngọt ngào khi khám phá ra những điều khiến cuộc đời này đáng số một tác phẩm kinh điển của Brazil.” <br> - Booklist <br> “Một cách nhìn cuộc sống gần như hoàn chỉnh từ con mắt trẻ thơ… có sức mạnh sưởi ấm và làm tan nát cõi lòng, dù người đọc ở lứa tuổi nào.” <br> - The National <br> Hãy làm quen với Zezé, cậu bé tinh nghịch siêu hạng đồng thời cũng đáng yêu bậc nhất, với ước mơ lớn lên trở thành nhà thơ cổ thắt nơ bướm. Chẳng phải ai cũng công nhận khoản “đáng yêu” kia đâu nhé. Bởi vì, ở cái xóm ngoại ô nghèo ấy, nỗi khắc khổ bủa vây đã che mờ mắt người ta trước trái tim thiện lương cùng trí tưởng tượng tuyệt vời của cậu bé con năm tuổi. <br> Có hề gì đâu bao nhiêu là hắt hủi, đánh mắng, vì Zezé đã có một người bạn đặc biệt để trút nỗi lòng: cây cam ngọt nơi vườn sau. Và cả một người bạn nữa, bằng xương bằng thịt, một ngày kia xuất hiện, cho cậu bé nhạy cảm khôn sớm biết thế nào là trìu mến, thế nào là nỗi đau, và mãi mãi thay đổi cuộc đời cậu.
Mở đầu bằng những thanh âm trong sáng và kết thúc lắng lại trong những nốt trầm hoài niệm, Cây cam ngọt của tôi khiến ta nhận ra vẻ đẹp thực sự của cuộc sống đến từ những điều giản dị như bông hoa trắng của cái cây sau nhà, và rằng cuộc đời thật khốn khổ nếu thiếu đi lòng yêu thương và niềm trắc ẩn. Cuốn sách kinh điển này bởi thế không ngừng khiến trái tim người đọc khắp thế giới thổn thức, kể từ khi ra mắt lần đầu năm 1968 tại Brazil. ', 4, 0, CAST(N'2022-06-16' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (2, N'Như Chỉ Mới Hôm Qua', N'book2.webp', 129000, N'Nhà Xuất Bản Văn Học', N'Bìa mềm', 1, N'lãng mạn', N'Cô từng ví cuộc đời mình như một dấu chấm hết kết thúc một áng văn buồn, cho đến khi gặp anh, cùng anh trải qua mười một giờ hẹn hò ngắn ngủi, chưa bao giờ sinh mệnh lại đáng trân quý với cô đến vậy. <br> <br> Anh từng nói: "Chỉ cần em không ngừng nỗ lực, kỳ tích nhất định sẽ xuất hiện." Vì câu nói này mà cô gắng gượng chờ đợi suốt nhiều năm. Những năm sống không bằng chết, mỗi khi cận kề phút ly tử, trước mắt cô lại hiện ra khuôn mặt tràn ngập niềm hy vọng cùng nụ cười như vầng dương rực rỡ của anh. <br> Ngày tình cờ gặp lại, khoảnh khắc đó, cô thực sự tin rằng thế giới này có kỳ tích - người đàn ông trước mắt này chính là kỳ tích của cô, vì thế, cô không ngừng bám víu, thậm chí bỏ qua mọi sự nghi ngờ, để rồi số phận lại lần nữa trêu ngươi, khi đưa tới trước mặt cô một người đàn ông có khuôn mặt giống anh y hệt. <br> Đây đơn giản chỉ là một sự nhầm lẫn hay mối duyên nợ của cô và anh thực sự đã cạn rồi? Cô và anh có còn cơ hội nào cho nhau nữa không hay từ nay sẽ chỉ là những chuỗi lầm sai nối tiếp? <br> Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 1, 0, CAST(N'2022-06-18' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (3, N'Nếu Một Đêm Đông Có Người Lữ Khách', N'book3.webp', 131000, N'
Nhà Xuất Bản Văn Học', N'Bìa mềm', 1, N'lãng mạn', N'Một cái kết mở thì rất nhiều nhà văn giỏi đã làm, nhưng một cái mở không tiến lên, thậm chí không kết, thì hình như chỉ một người như Italo Calvino mới dám biến thành trò chơi tiểu thuyết của mình. Làm cho một cuốn tiểu thuyết “đi tới” trong sự tiến triển hợp lý và đẹp đã là khó, nhưng giữ cho một cuốn tiểu thuyết hoàn chỉnh đứng yên ở ngưỡng bắt đầu còn khó hơn nhiều lần.
 <br> Nếu một đêm đông có người lữ khách nhốt câu chuyện ngập ngừng trong vẻ tươi mới của sự khởi đầu trong suốt mấy trăm trang sách, buộc người đọc liên tục hào hứng với không ngớt những bước chân đầu tiên, dự cảm đầu tiên, đoán định đầu tiên. Cuốn tiểu thuyết từ khi ra đời đã giữ chân bao độc giả lòng vui sướng thỏa mãn ở ngay điểm xuất phát, và cũng là nguồn khai thác dồi dào cho không ít lý thuyết gia văn học nhìn thấy ở đây một trò chơi tài tình và một suy tư sâu sắc về bản chất của tiểu thuyết và văn chương. <br>', 1, 0, CAST(N'2022-06-18' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (4, N'Sữa Nóng - Deborah Levy', N'book4.webp', 135000, N'Nhà Xuất Bản Hội Nhà Văn', N'Bìa cứng', 1, N'kinh dị', N'Lớn lên thiếu vắng tình thương của bố, còn mẹ mắc một chứng bệnh lạ không thể đi lại bình thường dù đã cố công chạy chữa, Sofia Papastergiadis trở thành đôi chân của mẹ mình. Cô gác lại luận văn tiến sĩ, sự nghiệp và cuộc sống riêng để chăm sóc cho bà. <br> Mùa hè năm 2015, hai mẹ con Sofia thế chấp nhà, gom góp tiền qua Tây Ban Nha để tìm đến Bác sĩ Gómez, như một nỗ lực cuối cùng, với hy vọng chữa được căn bệnh bí hiểm. Ở vùng hoang mạc ven biển đầy nắng, gặp gỡ những con người phóng khoáng, lạ kỳ, tất cả đã thổi bùng lên trong cô ngọn lửa vốn bấy lâu chỉ nhen nhúm trong lòng, soi rọi một cuộc đời mà cô chưa từng sống. <br> Deborah Levy, bằng những câu văn tinh tế, gợi cảm đã đưa người đọc vào một câu chuyện lạ kỳ về mẹ và con gái, về những nỗi niềm và mong mỏi trong đời. Sữa nóng đã lọt vào vòng chung khảo giải Booker năm 2016. <br> ', 2, 0, CAST(N'2022-06-15' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (5, N'Con Hủi (Tái Bản 2020)', N'book5.webp', 170000, N'
Nhà Xuất Bản Văn Học', N'
Bìa cứng', 1, N'kinh dị', N'Không có căn bệnh nào đáng sợ của nhân loại xuất hiện trong câu chuyện, cũng không có người nào mắc phải căn bệnh đó, Con Hủi là cái tên mà trong giới quý tộc gọi nàng, người con gái xinh đẹp, trong trắng như đóa huệ mang tên Stefcia.
 <br> Nàng có một chuyện tình thơ mộng, đắm say, trong sáng và vô cùng mãnh liệt nhưng lại bi thương đến nao lòng. Bởi người nàng yêu không ai khác chính là đại công tử của dòng họ quyền quý nhất cả nước – Waldemar Michorowski. Họ chống lại những ràng buộc của đẳng cấp quý tộc để đến được với nhau và bảo vệ hạnh phúc đã lựa chọn. Nhưng liệu họ có vượt qua những rào cản khó khăn và hà khắc của giới quý tộc? <br> Sách được tái bản nhiều lần. Huy Hoàng Bookstore trân trọng giới thiệu tới bạn đọc!
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 2, 0, CAST(N'2022-01-01' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (6, N'Kiếp Nào Ta Cũng Tìm Thấy Nhau', N'book6.webp', 89500, N'Thái Hà', N'Bìa mềm', 1, N'', N'Kiếp nào ta cũng tìm thấy nhau là cuốn sách thứ ba của Brain L. Weiss – một nhà tâm thần học có tiếng. Trước đó ông đã viết hai cuốn sách: cuốn đầu tiên là Ám ảnh từ kiếp trước, cuốn sách mô tả câu chuyện có thật về một bệnh nhân trẻ tuổi cùng với những liệu pháp thôi miên về kiếp trước đã làm thay đổi cả cuộc đời tác giả lẫn cô ấy. Cuốn sách đã bán chạy trên toàn thế giới với hơn 2 triệu bản in và được dịch sang hơn 20 ngôn ngữ. Cuốn sách thứ hai Through  Time  into  Healing (Đi  qua  thời  gian  để chữa lành), mô tả những gì tác giả đã học được về tiềm năng chữa bệnh của liệu pháp hồi quy tiền kiếp. Trong cuốn sách đều là những câu chuyện người thật việc thật. Nhưng  câu  chuyện  hấp  dẫn  nhất lại  nằm  trong cuốn sách thứ ba. <br>  Kiếp nào ta cũng tìm thấy nhau nói về những linh hồn tri kỷ, những người có mối liên kết vĩnh viễn với nhau bằng tình yêu thương, luôn gặp lại nhau hết lần này đến lần khác, qua hết kiếp này tới kiếp khác. Chúng ta sẽ tìm thấy và nhận ra tri kỷ của mình như thế nào, rồi đưa ra những quyết định làm thay đổi cuộc sống của chính mình ra sao là những khoảnh khắc quan trọng và xúc động nhất trong cuộc đời mỗi người. <br> Định  mệnh  sẽ dẫn  lối cho  những  linh  hồn tri  kỷ hội ngộ. Chúng ta sẽ gặp họ. Nhưng quyết định làm gì sau đó lại là quyền tự do lựa chọn của mỗi người. Một lựa chọn sai lầm hoặc một cơ hội bị bỏ lỡ có thể dẫn đến nỗi cô đơn và thống khổ tột cùng. Và một lựa chọn đúng đắn, một cơ hội được nắm bắt có thể mang lại niềm hạnh phúc sâu sắc. <br> Những gì tác giả viết trong sách được ghi lại từ hồ sơ bệnh án, băng thu âm và trí nhớ. Chỉ có tên và một vài chi tiết nhỏ được thay đổi để giữ tính bảo mật. Đây là câu chuyện về vận mệnh và hy vọng. Đây là câu chuyện xảy ra âm thầm mỗi ngày. <br> Ngày này năm đó, đã có người lắng nghe. <br> Linh hồn tựa như nước <br> Rơi xuống từ thiên đường <br> Lên trời như khói sương <br> Rồi trở về với đất <br> Chuỗi tuần hoàn bất tận.', 4, 0, CAST(N'2021-02-01' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (7, N'Ra Bờ Suối Ngắm Hoa Kèn Hồng', N'book7.webp', 240000, N'NXB Trẻ', N'Bìa cứng', 0, N'', N'Ra Bờ Suối Ngắm Hoa Kèn Hồng - Bìa Cứng - Tặng Kèm Bookmark Bồi Hai Mặt + Thiệp Trái Tim In Bài Thơ Của Tác Giả + Phiên Bản Khổ Nhỏ Sách Út Quyên Và Tôi <br> Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 2, 0, CAST(N'2022-01-08' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (8, N'Khu Vườn Ngôn Từ', N'book8.webp', 119000, N'Nhà Xuất Bản Văn Học', N'Bìa mềm', 1, N'Khu vườn ngôn từ kể về một tình yêu còn xa xưa hơn cả tình yêu.', N'Khái niệm tình yêu trong tiếng Nhật hiện đại là luyến hoặc ái, nhưng vào thời xưa nó được viết là cô bi, nghĩa là nỗi buồn một mình. Shinkai Makoto đã cấu tứ Khu vườn ngôn từ theo ý nghĩa cổ điển này, miêu tả tình yêu theo khái niệm ban sơ của nó, tức là cô bi - nỗi buồn khi một mình thương nhớ một người. <br> Những ngày mưa triền miên.... Nơi hàng hiên ngập tràn màu xanh của một khu vườn Nhật Bản... Có một cảm xúc êm dịu đến không thốt nên lời cứ thế manh nha, tựu hình và lửng lơ tồn tại. Trong lúc dòng đời cuồn cuộn chảy trôi, tất cả hối hả tiến về phía trước, thì cậu và cô lại dừng chân, chìm xuống trong tĩnh lặng riêng mình, và ở cái vũng tĩnh lặng đó, họ tìm thấy nhau. Dần dần và mạo hiểm, quên đi cả các chênh lệch về tuổi tác và vị trí, họ thả hồn mình trôi về nhau hòa điệu.<br> Làm nền cho tất cả là mưa rơi không ngừng, là lá mướt mát rung rinh. Nhưng khi mưa tạnh và trời quang trở lại, mọi đường nét của hiện thực trở nên rõ rệt đến khắc nghiệt, thì những êm dịu và lửng lơ kia liệu còn khả năng tồn tại? <br> Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 4, 0, CAST(N'2020-01-01' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (9, N'Thay Đổi Hay Là Chết', N'book9.webp', 115000, N'
Nhà Xuất Bản Thế Giới', N'
Bìa mềm', 1, N'', N'Nếu muốn có cuộc sống tuyệt vời, bạn phải sẵn sàng đương đầu với khó khăn - nguyên tắc tưởng rằng quen thuộc này hóa ra lại bị chối bỏ bởi rất nhiều người. Phần lớn chúng ta muốn đạt được chiến thắng to lớn, vĩ đại, nhưng lại không thể chịu nổi một thách thức nhỏ. Chúng ta ích kỷ, hèn nhát, đa phần không dám thay đổi và thoát khỏi vùng an toàn. Nếu bạn đang nhận ra mình trong những miêu tả vừa qua, thì đã đến lúc bạn cầm lên cuốn sách của Alexi Panos và Preston Smiles. Bộ đôi tác giả trẻ tuổi, tràn ngập nhiệt huyết với cuộc sống này sẽ cùng bạn “lột xác” trong tác phẩm “Thay đổi hay là chết”. <br> Alexi Panos và Preston Smiles là những người trẻ thuộc thế hệ lãnh đạo mới, những người đang tìm cách tái xác định bản chất của các mối quan hệ, sự nghiệp và cuộc sống. Cặp đôi quyền lực trong Nghệ thuật Phát triển Cá nhân này đã đúc kết 5 nguyên tắc giúp bạn định hướng lại cuộc sống thường ngày, học cách vượt qua những trở ngại nội tâm và luôn là chính mình – ở phiên bản tốt nhất. <br> Với lối viết giản dị và thẳng thắn, không hoa mỹ phô trương, hai tác giả vạch trần những rào cản đang kìm giữ và cản trở bạn tiến về phía trước. “Thay đổi hay là chết” tràn đầy cảm hứng, niềm tin và năng lượng tích cực; là công cụ hữu hiệu và quý giá trong lĩnh vực xây dựng quan hệ cá nhân, tự khám phá bản thân và sự nghiệp. Cuộc sống đầy rẫy các bất trắc, nhưng cũng không thiếu cơ hội để giúp bạn đạt được các khát vọng. Đừng thụ động, hãy đón nhận tất cả bằng một tâm thế sẵn sàng. Bởi chi khi bạn đi theo dẫn dắt của trái tim và sống đúng với con người mình, các cánh cửa cơ hội mới mở rộng và bạn sẽ tìm thấy hành trình thực sự dành cho bạn. <br> Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 4, 0, CAST(N'2022-02-02' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (10, N'Lấy Tình Thâm Mà Đổi Đầu Bạc', N'book10.webp', 83000, N'
Nhà Xuất Bản Thế Giới', N'
Bìa mềm', 1, N'VÃN TÌNH là nhà biên kịch - tác giả. Các tác phẩm của Vãn Tình đều thẳng thắn, trực diện, đánh trúng tâm lý của các cô gái.', N'Ở Việt Nam, Vãn Tình được coi như “nữ hoàng” của dòng sách cảm hứng sống dành cho phái nữ. Cuốn sách Bạn đắt giá bao nhiêu? của cô đã tạo nên một làn sóng mạnh mẽ nhằm cổ vũ tinh thần, thay đổi quan điểm hạnh phúc của mọi độc giả. <br> Không mạnh mẽ, sắc sảo với những câu chuyện nhân tình thế thái, sự trở lại lần này của Vãn Tình với Lấy tình thâm mà đổi đầu bạc mang đến cho độc giả một sắc thái khác hẳn: Dịu dàng, ôn nhu như nước, với những câu chuyện tình yêu, cuộc sống, hôn nhân, vừa ấm áp, vừa nhỏ bé chân thành. <br> Điều đặc biệt CHƯA TỪNG CÓ trong những cuốn sách trước của Vãn Tình chính là những câu chuyện, triết lý của cô lần này sẽ được soi chiếu từ góc một góc nhìn khác, góc nhìn trực diện, tỉnh táo và đầy lý trí của người đàn ông mang tên A Ngạn - cũng chính là chồng của Vãn Tình. <br> Cuốn sách là liều thuốc giúp CHỮA LÀNH những tâm hồn đang đau khổ trong tình yêu, là ngọn lửa thắp lên niềm tin và hi vọng cho những người đang theo đuổi một hôn nhân êm đềm, viên mãn. <br> Và quan trọng, vẫn là một Vãn Tình luôn yêu thương và đứng về phía phái nữ, “Lấy tình thâm mà đổi đầu bạc” chính là những lời thủ thỉ vừa giản dị, vừa thấu đáo, để cổ vũ cho tất cả phụ nữ biết yêu và trân quý chính bản thân, cùng những giá trị cốt lõi bên trong mình. <br> “Năm tháng thanh xuân tôi luôn theo đuổi một tình yêu sống chết có nhau. Cứ mỗi lần thấy những cảnh sinh ly tử biệt trong phim tôi lại khóc nức nở. Còn bây giờ lại dễ xúc động bởi những khung cảnh giản dị nhưng đầy ấm áp, chỉ muốn được sống mãi trong hạnh phúc nhỏ bé của mình. <br> Mong rằng năm tháng ấm áp, cả đời bình yên.” <br> Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 4, 0, CAST(N'2022-06-18' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (11, N'Từ Ngày Mai Hãy Làm Người Hạnh Phúc', N'book11.webp', 101000, N'Nhà Xuất Bản Đại Học Quốc Gia Hà Nội', N'Bìa mềm', 1, N'Ngày hôm nay của bạn thế nào, có mệt không?  Ngày hôm nay của bạn có đang hoang mang mơ hồ? Ngày hôm nay của bạn có đang hoài nghi bản thân?', N'Vậy thì cuốn sách “Từ ngày mai hãy làm người hạnh phúc” này là dành cho bạn. “Từ ngày mai hãy làm người hạnh phúc” sẽ đồng hành bên bạn, dịu dàng gửi gắm các thông điệp ý nghĩa chân thành và tích cực về tình thân, tình bạn, tình yêu… dễ dàng chạm tới trái tim bạn, vỗ về sự tủi thân trong bạn, xoa dịu nỗi cô độc của bạn. <br> Những con người khác nhau với những câu chuyện khác nhau, nhưng đều là những băn khoăn trăn trở của người trẻ trên hành trình trưởng thành, phấn đấu trở thành một “bản thân” tốt đẹp hơn, hạnh phúc hơn ở tương lai. <br> Thực chất, hạnh phúc không phải thứ gì quá mức to lớn xa vời, mà chỉ là những điều rất đỗi nhỏ bé ở xung quanh ta. Tựa như lúc tuyết phủ rợp trời, được lim dim thiếp đi trong căn nhà sáng ánh đèn, bên chậu than hồng ấm áp đã là niềm hạnh phúc to lớn nhất của cuộc đời vậy. <br> “Mỗi ngày là khởi đầu, cũng là kết thúc. Mỗi ngày đều chỉ là quá khứ của ngày mai. <br> Hãy hướng tới ngày mai với tình yêu, đối đãi với mọi người, mọi chuyện bằng lòng yêu thương. <br> Hãy yêu cuộc đời giật gấu vá vai của mình. <br>Hãy bước về phía trước với lòng yêu thương, cho đến khi bạn trở nên thuần khiết, bao dung, tâm hồn trong sáng, khoáng đạt. <br> Từ ngày mai hãy làm người hạnh phúc.” <br> Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 4, 0, CAST(N'2022-06-18' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (12, N'Trong Vòng Tay Mẹ', N'book12.webp', 73000, N'
Nhà Xuất Bản Thế Giới', N'
Bìa mềm', 1, N'', N'Có nghề nào đặc biệt như “nghề” làm mẹ? Với chứa chan nước mắt và nụ cười, nỗi hoang mang bên cạnh lòng kiên định, cơn giận dữ giữa khả năng nhẫn nại vô biên…, hành trình đứa trẻ lớn lên cũng là hành trình một người mẹ trưởng thành. <br> Trong vòng tay mẹ của Diệu Thủy là tập hợp những mảnh ghép be bé, chân thực, nhiều màu sắc kể lại một cách sinh động và cảm động câu chuyện mẹ - con bất tận: trải nghiệm những khó khăn chưa từng gặp, tận hưởng niềm hạnh phúc chưa từng biết, và câu trả lời cho tất cả luôn là thấu hiểu và yêu thương. <br> Có lẽ, người mẹ người bố nào nuôi con cũng sẽ thấy mình đâu đó trong cuốn sách này.', 4, 0, CAST(N'2022-06-21' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (48, N'Tô Bình Yên Vẽ Hạnh Phúc (Tái Bản 2022)', N'8935325006289.jpg', 66880, N'NXB Phụ Nữ Việt Nam', N'Bìa mềm', 1, N'', N'', NULL, 0, CAST(N'2017-02-20' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (49, N'Mình Chỉ Là Người Bình Thường', N'bia_minhchilanguoibinhthuong.jpg', 120000, N'NXB Phụ Nữ Việt Nam', N'Bìa mềm', 1, N'null', N'', NULL, 0, CAST(N'2021-01-20' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (50, N'Những Nỗi Buồn Cũng Cần Được Yêu Thương - Tô Bình Yên Vẽ Hạnh Phúc 2', N'b_a-1_5_3.jpg', 120000, N'Phụ Nữ Việt Nam', N'Bìa mềm', 1, N'', N'', NULL, 0, CAST(N'2020-07-17' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (51, N'Nơi Những Giấc Mơ Không Bao Giờ Kết Thúc', N'bia_noi-nhung-giac-mo-khong-bao-gio-ket-thuc.jpg', 100000, N'Văn Học', N'Bìa mềm', 1, N'', N'', NULL, 0, CAST(N'2017-10-10' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (52, N'Tớ Có Một Cậu Bạn Mang Tên Nỗi Buồn', N'b_a_t_-c_-m_t-c_u-b_n-mang-t_n-n_i-bu_n.jpg', 120000, N'Văn Học', N'Bìa mềm', 1, N'null', N'', NULL, 0, CAST(N'2021-02-11' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (53, N'Yêu Những Ngày Nắng Chẳng Ghét Những Ngày Mưa', N'ttph---y_u-nh_ng-ng_y-n_ng-ch_ng-gh_t-nh_ng-ng_y-m_a.jpg', 132000, N'Phụ Nữ Việt Nam', N'Bìa mềm', 1, N'', N'', NULL, 0, CAST(N'2022-10-20' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (54, N'Hẹn Nhau Phía Sau Tan Vỡ', N'bia_hen-nhau-sau-tan-vo_2.jpg', 86000, N'Phụ Nữ Việt Nam', N'Bìa mềm', 1, N'', N'', NULL, 0, CAST(N'2021-01-21' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (55, N'Vui Vẻ Không Quạu Nha (Tái Bản 2021)', N'image_195509_1_33312_2.jpg', 69000, N'NXB Phụ Nữ Việt Nam', N'Bìa mềm', 0, N'', N'', NULL, 0, CAST(N'2020-10-10' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (56, N'Con Đường Chẳng Mấy Ai Đi', N'9786044009674.jpg', 165000, N'Dân Trí', N'Bìa mềm', 1, N'', N'', NULL, 0, CAST(N'2023-03-25' AS Date), NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay], [id_order]) VALUES (60, N'Bộ Sách Ý Chí ', N'image_244718_1_1506.jpg', 288000, N'NXB Dân Trí', N'Bìa mềm', 0, N'', N'', NULL, 0, CAST(N'2022-01-21' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'ROLE_ADMIN')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'ROLE_USER')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (1, N'X')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (2, N'Xs')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (3, N'Xs Max')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (4, N'Pro')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (5, N'Pro max')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (6, N'Full')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (7, N'Series')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (8, N'Ultra ')
GO
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (9, N'Ultra 5G')
GO
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
INSERT [dbo].[thu] ([thuid], [tenthu]) VALUES (1, N'Thứ 2')
GO
INSERT [dbo].[thu] ([thuid], [tenthu]) VALUES (2, N'Thứ 3')
GO
INSERT [dbo].[thu] ([thuid], [tenthu]) VALUES (3, N'Thứ 4')
GO
INSERT [dbo].[thu] ([thuid], [tenthu]) VALUES (4, N'Thứ 5')
GO
INSERT [dbo].[thu] ([thuid], [tenthu]) VALUES (5, N'Thứ 6')
GO
INSERT [dbo].[thu] ([thuid], [tenthu]) VALUES (6, N'Thứ 7')
GO
INSERT [dbo].[thu] ([thuid], [tenthu]) VALUES (7, N'Chủ nhật')
GO
SET IDENTITY_INSERT [dbo].[User_Role] ON 
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (2, 1, 1)
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (3, 2, 1)
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (4, 3, 1)
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (7, 6, 1)
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (8, 7, 1)
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (2016, 2013, 1)
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (2018, 2019, 1)
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (2021, 2020, 1)
GO
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (2023, 2027, 2)
GO
SET IDENTITY_INSERT [dbo].[User_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (1, N'snappy240101@gmail.com', N'$2a$10$ogsS5zFF4bia6Uaoc/Unuenq/pWSk9mkIkqh5PxPpSJJjLxbPkbFG', N'Trần Thanh Đạt', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (2, N'kyttps13912@fpt.edu.vn', N'$2a$10$D2vbfnA/SrFHzBnMnrbhGO8Iagfh3AUDshHV1vPo0zoaNEh86XWmS', N'Trần Thế Kỷ', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (3, N'0787982721@gmail.com', N'$2a$10$AeVst2fUFkcKasAcskH4b.1xXczpYU4NZlcjuJpQzDCFNgc9bDUAC', N'Trần Thanh Vân', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (6, N'Dung@gmail.com', N'$2a$10$zwRqTel7U41wfdQUonr85.Y0wK3L8katMY.5wNePSsdJ8RdyaRdk2', N'Trần Văn Dũng', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (7, N'Kim@gmail.com', N'$2a$10$e9FCUmuX/5FCFDjQV2FRm.j/UrrNq7w6432L4Cgo/GYCLMqeyYth2', N'Kim', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (1014, N'vokimanh@gmail.com', N'ádasd', N'Võ Kim Anh', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (2013, N'nguyenminhquang071203@gmail.com', N'$2a$10$Qvb9iSyyhqukVMtviTwDJuEr41oGGVmGu5oFUeVVdL203XpUPdcr2', N'nguyen minh quang', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (2019, N'toan53356@gmail.com', N'$2a$10$i3JYMAjKnlZfo3isdDTmYul2o1UbFW.N.e/AehSs08HkUMYbz6S0m', N'Toasn nguyen', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (2020, N'man1772003@gmail.com', N'$2a$10$yta/Uu2CzSdwAhGNFjZx4OLTzek6lB1QrLYPugmkGUNCopHsOg3wO', N'Trần Ngọc Mẫn', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (2026, N'mantran0610@gmail.com', N'', N'Mẫn Trần', NULL)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Date]) VALUES (2027, N'mantnps22526@fpt.edu.vn', N'$2a$10$Sm52piyPQt.iLUXWlJov9O4sU1A1RRZhVaTsG0EIl7KFmOyXl9uO6', N'Trần Ngọc Minh', CAST(N'2024-03-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534B6B4BD6A]    Script Date: 4/10/2024 10:07:44 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534D2EBA22B]    Script Date: 4/10/2024 10:07:44 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [Position]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [StartDay]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (NULL) FOR [Color_Id]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (NULL) FOR [Size_Id]
GO
ALTER TABLE [dbo].[Product_Color] ADD  DEFAULT (NULL) FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (NULL) FOR [Review]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[lichlamviec]  WITH CHECK ADD FOREIGN KEY([thuid])
REFERENCES [dbo].[thu] ([thuid])
GO
ALTER TABLE [dbo].[lichlamviec]  WITH CHECK ADD FOREIGN KEY([caid])
REFERENCES [dbo].[calamviec] ([caid])
GO
ALTER TABLE [dbo].[lichlamviec]  WITH CHECK ADD FOREIGN KEY([nvid])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Color_Id])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Color_Id])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Size_Id])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Size_Id])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [dbo].[Product_Cate]  WITH CHECK ADD FOREIGN KEY([Cate_Id])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_Cate]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_Color]  WITH CHECK ADD FOREIGN KEY([Color_Id])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_Color]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Product_Color]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD FOREIGN KEY([Size_Id])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Manu_Id])
REFERENCES [dbo].[Manufactures] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_orderr] FOREIGN KEY([id_order])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_orderr]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[DoanhThuNamProc]    Script Date: 4/10/2024 10:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DoanhThuNamProc]
		as begin
		SELECT 
        YEAR(o.date) AS [nam], 
        SUM(o.Quality*p.Price) AS [tien]
    FROM 
        orders AS o 
    INNER JOIN 
        products AS p ON o.Product_Id = p.Id 
    GROUP BY 
        YEAR(o.date);
		end
GO
/****** Object:  StoredProcedure [dbo].[DoanhThuNgayProc]    Script Date: 4/10/2024 10:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DoanhThuNgayProc]  
    @NgayThangNam DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  SUM(o.Quality*p.Price) AS [Doanh thu ngày] 
    FROM orders AS o 
    INNER JOIN products AS p ON o.Product_Id = p.Id 
    WHERE o.date = @NgayThangNam
END;
GO
/****** Object:  StoredProcedure [dbo].[DoanhThuThangProc]    Script Date: 4/10/2024 10:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DoanhThuThangProc]  
    @Nam varchar(10)
AS
BEGIN
	-- buoc 1: 
		--CREATE TABLE #DT (Thang int	, DT int)
		--INSERT INTO #DT(Thang, DT)
		--SELECT 1 , 0 
		--UNION
		--SELECT 2 , 0 
		--UNION
		--SELECT 3 , 0 
		--UNION
		--SELECT 4 , 0 
		--UNION
		--SELECT 5 , 0 
		--UNION
		--SELECT 6 , 0 
		--UNION
		--SELECT 7 , 0 
		--UNION
		--SELECT 8 , 0 
		--UNION
		--SELECT 9 , 0 
		--UNION
		--SELECT 10, 0 
		--UNION
		--SELECT 11 , 0 
		--UNION
		--SELECT 12 , 0 
		
	-- buoc 2:
		--CREATE TABLE #DTTT (Thang int	, DT int)
		--INSERT INTO #DTTT(Thang, DT)
		SELECT month(o.Date) AS [month] , SUM(o.Quality * p.Price)  AS [revenue]
		FROM 
			orders o INNER JOIN products p on o.Product_Id = p.Id
		WHERE  YEAR(o.date) = @Nam
		GROUP BY month(o.Date)
	-- buoc 3:	
		--SELECT #dt.Thang AS [month],  isnull(#DTTT.DT,0) AS [revenue]  FROM 
		--#DT LEFT JOIN #DTTT ON #DT.Thang = #DTTT.Thang

END;

--exec [DoanhThuThangProc] 2024
GO
/****** Object:  StoredProcedure [dbo].[getdaywork]    Script Date: 4/10/2024 10:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getdaywork]
 as 
 begin 
	select l.id,e.User_Id as [manhanvien],u.Fullname, e.Position, thu.tenthu,ca.tenca from lichlamviec l 
inner join  calamviec ca on l.caid = ca.caid
inner join  thu thu on l.thuid = thu.thuid
inner join  Employees e on l.nvid = e.Id
inner join Users u on e.User_Id= u.Id
where e.User_Id = 2013
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuTuNgayDenNgay]    Script Date: 4/10/2024 10:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DoanhThuTuNgayDenNgay]  
    @NgayBatDau DATE,
	 @NgayKetThuc DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT o.date as [date], SUM(o.Quality*p.Price) AS [tien] ,Count(*)as [donhang],sum(o.Quality) as [sosanpham]
    FROM orders AS o 
    INNER JOIN products AS p ON o.Product_Id = p.Id 
    WHERE o.date between @NgayBatDau and @NgayKetThuc
    GROUP BY o.date;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getUserToday]    Script Date: 4/10/2024 10:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getUserToday]
@date date,
@userCount INT OUTPUT
as
begin
select @userCount= count(*) from users where users.Date = @date
end
GO
/****** Object:  StoredProcedure [dbo].[sp_thongkeabc]    Script Date: 4/10/2024 10:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_thongkeabc](@Year INT)
AS BEGIN
SELECT TenPhong tenphong, count(hd.IDHoaDon) SoHoaDOn, count(ctkh.IDKhachHang) soluongkhachang,sum(hd.GiaHoaDon) tongtien, MAX(hd.GiaHoaDon) sotienlonnhat, MIN(hd.GiaHoaDon) sotiennhonhat, AVG(hd.GiaHoaDon)	trungbinh
FROM HoaDon hd JOIN ChiTietKhachHang ctkh ON hd.IDHoaDon = ctkh.IDHoaDon
JOIN Phong p ON p.IDPhong = hd.IDPhong where YEAR(NgayTao) = @Year
GROUP BY TenPhong
END
GO
USE [master]
GO
ALTER DATABASE [BookStore_data] SET  READ_WRITE 
GO
