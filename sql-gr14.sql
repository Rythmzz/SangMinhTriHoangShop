USE [master]
GO
/****** Object:  Database [QuocTeShop]    Script Date: 21/12/2022 8:33:38 CH ******/
CREATE DATABASE [QuocTeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuocTeShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TRANNGOCSANG\MSSQL\DATA\QuocTeShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuocTeShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TRANNGOCSANG\MSSQL\DATA\QuocTeShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuocTeShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuocTeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuocTeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuocTeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuocTeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuocTeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuocTeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuocTeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuocTeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuocTeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuocTeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuocTeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuocTeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuocTeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuocTeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuocTeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuocTeShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuocTeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuocTeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuocTeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuocTeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuocTeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuocTeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuocTeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuocTeShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuocTeShop] SET  MULTI_USER 
GO
ALTER DATABASE [QuocTeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuocTeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuocTeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuocTeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuocTeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuocTeShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuocTeShop', N'ON'
GO
ALTER DATABASE [QuocTeShop] SET QUERY_STORE = OFF
GO
USE [QuocTeShop]
GO
/****** Object:  User [tranosa]    Script Date: 21/12/2022 8:33:38 CH ******/
CREATE USER [tranosa] FOR LOGIN [tranosa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertise](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [varchar](50) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Code] [nchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupProduct]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupProduct](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Img] [varchar](50) NULL,
	[Brands] [int] NULL,
 CONSTRAINT [PK_GroupProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logger]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logger](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datetime] [datetime] NULL,
	[method_name] [varchar](255) NULL,
	[level] [varchar](10) NULL,
	[message] [varchar](1000) NULL,
 CONSTRAINT [PK__logger__3213E83F8A3B33BB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [varchar](100) NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Total] [float] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [int] NULL,
	[Username] [varchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [varchar](50) NULL,
	[Quanlity] [int] NOT NULL,
	[Size] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Coler] [nvarchar](50) NULL,
	[Price] [int] NOT NULL,
	[Sale] [int] NULL,
	[Img1] [varchar](max) NULL,
	[Img2] [varchar](max) NULL,
	[Img3] [varchar](max) NULL,
	[Sold] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[GroupProductId] [varchar](50) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Size] [nvarchar](50) NULL,
	[Quanlity] [int] NOT NULL,
	[ProductId] [varchar](50) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21/12/2022 8:33:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Fullname] [nvarchar](max) NULL,
	[Gender] [int] NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [AdminName], [Password]) VALUES (4, N'sang2k', N'123')
INSERT [dbo].[Admin] ([Id], [AdminName], [Password]) VALUES (5, N'HbtFQi/VpSc=', N'onB0nsJBJr3+uVm31GQvyw==')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Advertise] ON 

INSERT [dbo].[Advertise] ([Id], [Name], [Link], [Content], [Status], [type]) VALUES (1, N'Ananas Track 6', N'bbanner4.jpg', NULL, 1, NULL)
INSERT [dbo].[Advertise] ([Id], [Name], [Link], [Content], [Status], [type]) VALUES (2, N'Ananas Vintas', N'bbanner2.jpeg', NULL, 1, NULL)
INSERT [dbo].[Advertise] ([Id], [Name], [Link], [Content], [Status], [type]) VALUES (3, N'Black Friday 2022', N'sub-banner1.png', N'Black Friday 2022 - LAPTOP RẺ VÔ ĐỐI - GIẢM GIÁ CỰC NGON đến 38% chỉ có tại MediaMart', 2, N'TR6')
INSERT [dbo].[Advertise] ([Id], [Name], [Link], [Content], [Status], [type]) VALUES (4, N'BÙNG NỔ SUPER SALE LAPTOP
', N'sub-banner2.png', N'Chương trình SALE lớn nhất từ trước đến nay của Laptop Hải Đăng', 2, N'PT')
INSERT [dbo].[Advertise] ([Id], [Name], [Link], [Content], [Status], [type]) VALUES (5, N'Khi mua ổ cứng kềm PC Gaming', N'sub-banner3.png', N'Giảm giá sốc đến 50% khi mua ổ cứng kèm PC Gaming lắp sẵn tại HACOM', 2, N'BS')
INSERT [dbo].[Advertise] ([Id], [Name], [Link], [Content], [Status], [type]) VALUES (6, N'SIÊU SALE CUỐI NĂM - BUILD PC GIẢM TIỀN MẶT', N'sub-banner4.png', N'Chương trình khuyến mại lớn nhất năm tại Nguyễn Công PC với rất nhiều chương trình khuyến mại như Build PC, linh kiện lẻ, laptop ...', 3, N'sale')
SET IDENTITY_INSERT [dbo].[Advertise] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Phone], [Email], [Address], [Code]) VALUES (10, N'Dương Công Sáng', 979336861, N'duongcongsang2000@gmail.com', N'42 Man Thiện', N'                                                                                                    ')
INSERT [dbo].[Customer] ([Id], [Name], [Phone], [Email], [Address], [Code]) VALUES (13, N'Dương Công Sáng', 979336861, N'duongcongsang2000@gmail.com', N'42 Man Thiện', N'                                                                                                    ')
INSERT [dbo].[Customer] ([Id], [Name], [Phone], [Email], [Address], [Code]) VALUES (15, N'Dương Công Sáng', 979336861, N'duongcongsang2000@gmail.com', N'42 Man Thiện', N'                                                                                                    ')
INSERT [dbo].[Customer] ([Id], [Name], [Phone], [Email], [Address], [Code]) VALUES (17, N'sang', 886932566, N'sang@gmail.com', N'ssssssss', N'                                                                                                    ')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'3D5', N'Phụ kiện máy tính', N'Các loại phụ kiện hỗ trợ đi kèm cho máy tính như chuột, bàn phím, tai nghe,..', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'AD', N'Adidas', N'hhh', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'DRM', N'Doraemon', N'Doraemon', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'GD', N'Gỉa Da', N'Gỉa Da', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'GÐ', N'Gỉa Đá', N'Xốp Gỉa Đá', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'HH01', N'Hoạt Hình', N'Hoạt Hình', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'HV', N'Hoa Văn', N'Hoa Văn', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'LT', N'Laptop', N'Sản phẩm chuyên về laptop, máy tính xách tay.', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'NI', N'Nike', N'Điện thoại di động một vật dụng nghe và gọi', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'PU', N'Puma', N'Sản phẩm máy tính để bàn', NULL, 1)
INSERT [dbo].[GroupProduct] ([Id], [Name], [Content], [Img], [Brands]) VALUES (N'VS', N'Vân Sóng', N'Xốp Vân Sóng', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (1, N'Sản Phẩm', N'list/product.htm', NULL)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (2, N'Thương Hiệu Khác', N'list/other.htm', NULL)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (3, N'Best Buy', N'list/best.htm', NULL)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (4, N'Hàng Mới', N'list/new.htm', NULL)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (5, N'Sale Off', N'list/sale.htm', NULL)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (10, N'Fila', N'HV', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (13, N'Tuần', N'best-week', 3)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (14, N'Tháng', N'best-month', 3)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (16, N'Hàng Nhập Khẩu', N'new-an', 4)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (17, N'Khác', N'new-other', 4)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (18, N'Tuần', N'sale-week', 5)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (19, N'Tháng', N'sale-month', 5)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (21, N'Adidas', N'AD', 1)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (22, N'Puma', N'PU', 1)
INSERT [dbo].[Menu] ([Id], [Name], [Link], [ParentId]) VALUES (23, N'Nike', N'NI', 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [CustomerId], [Total], [Date], [Status], [Username]) VALUES (8, 10, 20000, CAST(N'2021-11-17' AS Date), 0, N'eDy7C9qP59I=')
INSERT [dbo].[Order] ([Id], [CustomerId], [Total], [Date], [Status], [Username]) VALUES (11, 13, 80000, CAST(N'2021-11-18' AS Date), 0, N'g9fAiEAJk0Y=')
INSERT [dbo].[Order] ([Id], [CustomerId], [Total], [Date], [Status], [Username]) VALUES (13, 15, 120000, CAST(N'2021-11-18' AS Date), 0, N'din+xGu2pZdUxmJtHPlYoA==')
INSERT [dbo].[Order] ([Id], [CustomerId], [Total], [Date], [Status], [Username]) VALUES (15, 17, 36990000, CAST(N'2022-12-20' AS Date), 1, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quanlity], [Size]) VALUES (11, 8, N'AD', 1, 32)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quanlity], [Size]) VALUES (12, 11, N'AD', 3, 32)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quanlity], [Size]) VALUES (13, 11, N'AD5', 1, 31)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quanlity], [Size]) VALUES (14, 13, N'AD', 2, 32)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quanlity], [Size]) VALUES (15, 13, N'AD4', 2, 31)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quanlity], [Size]) VALUES (16, 13, N'N2', 1, 12)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quanlity], [Size]) VALUES (17, 15, N'AD4', 1, 31)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'AD', N'Adidas GP3', N'Thoáng mát thích hợp cho vận động', N'Black', 60000, 50, N'A1.jpeg', N'A1.jpeg', N'A1.jpeg', 0, CAST(N'2022-12-21' AS Date), N'AD', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'AD2', N'Adidas DA34', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'White', 89000, 3, N'A2.jpeg', N'steel-2.jpg', N'steel-3.jpg', 4, CAST(N'2022-12-15' AS Date), N'AD', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'AD3', N'Adidas DXF12', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'Black,White', 99000, 0, N'A3.jpeg', N'g20-2.jpg', N'g20-3.jpg', 2, CAST(N'2022-12-15' AS Date), N'AD', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'AD4', N'Adidas XB33', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'Black,White,', 130000, 11, N'A4.jpeg', N'iphone14-2.png', N'iphone14-3.png', 3, CAST(N'2021-04-07' AS Date), N'AD', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'AD5', N'Adidas SQW2', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'Black', 135000, 13, N'A5.jpeg', N'vga-2.jpg', N'vga-3.jpg', 2, CAST(N'2021-04-12' AS Date), N'AD', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'AD6', N'Adidas SA54', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'Black', 200000, 9, N'A6.jpeg', N'vibobook5-2.jpg', N'vibobook5-3.jpg', 1, CAST(N'2021-04-14' AS Date), N'AD', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'AD7', N'Adidas SS2', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'Gray', 70000, 15, N'A7.jpeg', N'dellxps-2.png', N'dellxps-3.png', 2, CAST(N'2021-04-14' AS Date), N'AD', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'N1', N'Nike AT23', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'Black', 60000, 3, N'N1.jpeg', N'zfold-2.jpg', N'zfold-3.jpg', 3, CAST(N'2021-04-14' AS Date), N'NI', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'N2', N'Nike AT33', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'Black', 145000, 0, N'N2.jpeg', N'precision-2.jpg', N'precision-3.jpg', 1, CAST(N'2021-04-14' AS Date), N'NI', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'N3', N'Nike AT66', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'Black', 231000, 0, N'N3.jpeg', N'highend-2.jpg', N'highend-3.jpg', 1, CAST(N'2021-04-14' AS Date), N'NI', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'P1', N'Puma PM22', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'BLACK', 99000, 10, N'P1.jpeg', N'P1.jpeg', N'P1.jpeg', 1, CAST(N'2022-05-17' AS Date), N'PU', 1)
INSERT [dbo].[Product] ([Id], [Name], [Content], [Coler], [Price], [Sale], [Img1], [Img2], [Img3], [Sold], [Date], [GroupProductId], [Status]) VALUES (N'P2', N'Puma  PM20', N'Thành phần vải: 100% cotton
Kiểu dáng áo thun polo tay ngắn trẻ trung
Cổ bẻ thanh lịch phối nút cài ẩn
Phom relaxed fit thoải mái', N'WHITE', 130000, 15, N'P2.jpeg', N'P2.jpeg', N'P2.jpeg', 1, CAST(N'2022-12-12' AS Date), N'PU', 1)
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([Id], [Size], [Quanlity], [ProductId], [Status]) VALUES (97, N'M', 19, N'AD', 1)
INSERT [dbo].[ProductDetail] ([Id], [Size], [Quanlity], [ProductId], [Status]) VALUES (98, N'L', 148, N'AD2', NULL)
INSERT [dbo].[ProductDetail] ([Id], [Size], [Quanlity], [ProductId], [Status]) VALUES (100, N'L', 4, N'AD3', NULL)
INSERT [dbo].[ProductDetail] ([Id], [Size], [Quanlity], [ProductId], [Status]) VALUES (103, N'XL', 20, N'AD4', 1)
INSERT [dbo].[ProductDetail] ([Id], [Size], [Quanlity], [ProductId], [Status]) VALUES (104, N'L', 49, N'AD5', NULL)
INSERT [dbo].[ProductDetail] ([Id], [Size], [Quanlity], [ProductId], [Status]) VALUES (105, N'M', 13, N'AD6', 1)
INSERT [dbo].[ProductDetail] ([Id], [Size], [Quanlity], [ProductId], [Status]) VALUES (107, N'XXL', 25, N'AD7', NULL)
INSERT [dbo].[ProductDetail] ([Id], [Size], [Quanlity], [ProductId], [Status]) VALUES (109, N'L', 29, N'N1', NULL)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'zbG04vF8CaL+uVm31GQvyw==', N'ED5wLgc3Mnw=', N'Dương Công Sáng', 1, CAST(N'2000-04-13' AS Date), N'9pqIqTUnG1sn+EI2zQEuk6oFUSBTqb/ntEe+fh2f0E4=', N'+LmLECUJMLNw/HRVC+02cg==', N'45 Man Thiện')
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'eDy7C9qP59I=', N'ED5wLgc3Mnw=', N'Dương Công Sáng', 1, CAST(N'2000-04-13' AS Date), N'9pqIqTUnG1sn+EI2zQEuk6oFUSBTqb/ntEe+fh2f0E4=', N'aBELLWbsZxicYKdchGKpZw==', N'42 Man Thiện')
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'din+xGu2pZdUxmJtHPlYoA==', N'ED5wLgc3Mnw=', N'Dương Sáng', 1, CAST(N'2000-04-13' AS Date), N'9pqIqTUnG1sn+EI2zQEuk6oFUSBTqb/ntEe+fh2f0E4=', N'axOLIHvPg6tom/VbDHCtPA==', N'42 Man Thiện')
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'AdIfL1bWtCs=', N'ED5wLgc3Mnw=', N'Nguyễn Thanh Thông', 1, CAST(N'2000-12-03' AS Date), N'Z6C2lgK4fbQpMxrFEs1YDjlb8WIt7QzMPR/rcGljKuQ=', N'IP8TCLBbKVvOpyXbBk4cuA==', N'41 Man Thiện')
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'g9fAiEAJk0Y=', N'ED5wLgc3Mnw=', N'Dương Công Sáng Nè', 1, CAST(N'2000-04-13' AS Date), N'9pqIqTUnG1sn+EI2zQEuk6oFUSBTqb/ntEe+fh2f0E4=', N'Fwm4mSIJ5glsAN2SXyF9nA==', N'42 Man Thiện')
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'n/K26UmAW748y5+InEzpwA==', N'ED5wLgc3Mnw=', N'Trần Tú Minh', 1, CAST(N'2001-03-04' AS Date), N'qOEnWWVwXhWLmqsxDQwMbKv8BAI2At7F', N'1O8obxyCAc337Caog0eCSA==', N'92 Man Thiện, Phường Hiệp Phú, Quận 9, TP HCM')
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'HbtFQi/VpSc=', N'onB0nsJBJr3+uVm31GQvyw==', N'tran sang', 1, CAST(N'2001-10-12' AS Date), N'YbVLjekmssMWl09Uzh/D2A==', N'e1/LxerbXxCLjLhUZrPnaw==', N'vinh long')
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'CuyCK5aQL5f+uVm31GQvyw==', N'zmfnaiygd5LZvJTcxubMLA==', N'tran ngoc sang', 1, CAST(N'2001-10-12' AS Date), N'9ujx/eg4r6/Ce2+aJ9SmYA==', N'5mj9Yw3FfsKl/4ldXFyokQ==', N'ptithcm')
INSERT [dbo].[User] ([Username], [Password], [Fullname], [Gender], [Birthday], [Email], [Phone], [Address]) VALUES (N'r10mmh8d5Po=', N'$2a$10$YKFB0jnelnyYtPVEQ6lkre7ojpUvi91SaCk5Dp4jD9ds3KgJbEqgu', N'trung nguyen', 1, CAST(N'2001-10-10' AS Date), N'UBU6xOcC2Kb0OTZ3HceaNbRHvn4dn9BO', N'fPBFwnqbeMqbu+Jo4DZ7Lw==', N'hcm')
GO
ALTER TABLE [dbo].[GroupProduct] ADD  CONSTRAINT [DF_GroupProduct_Brands]  DEFAULT ((1)) FOR [Brands]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Sold]  DEFAULT ((0)) FOR [Sold]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_GroupProduct1] FOREIGN KEY([GroupProductId])
REFERENCES [dbo].[GroupProduct] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_GroupProduct1]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [QuocTeShop] SET  READ_WRITE 
GO
