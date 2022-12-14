USE [master]
GO
/****** Object:  Database [TemplateForAll]    Script Date: 7/12/2022 3:21:17 PM ******/
CREATE DATABASE [TemplateForAll]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TemplateForAll', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TemplateForAll.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TemplateForAll_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TemplateForAll_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TemplateForAll] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TemplateForAll].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TemplateForAll] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TemplateForAll] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TemplateForAll] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TemplateForAll] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TemplateForAll] SET ARITHABORT OFF 
GO
ALTER DATABASE [TemplateForAll] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TemplateForAll] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TemplateForAll] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TemplateForAll] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TemplateForAll] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TemplateForAll] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TemplateForAll] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TemplateForAll] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TemplateForAll] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TemplateForAll] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TemplateForAll] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TemplateForAll] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TemplateForAll] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TemplateForAll] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TemplateForAll] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TemplateForAll] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TemplateForAll] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TemplateForAll] SET RECOVERY FULL 
GO
ALTER DATABASE [TemplateForAll] SET  MULTI_USER 
GO
ALTER DATABASE [TemplateForAll] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TemplateForAll] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TemplateForAll] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TemplateForAll] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TemplateForAll] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TemplateForAll] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TemplateForAll', N'ON'
GO
ALTER DATABASE [TemplateForAll] SET QUERY_STORE = OFF
GO
USE [TemplateForAll]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/12/2022 3:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/12/2022 3:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[userId] [int] NOT NULL,
	[templateId] [int] NULL,
	[orderDate] [datetime] NULL,
	[orderType] [nvarchar](500) NULL,
	[orderPrice] [int] NULL,
	[isApproved] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 7/12/2022 3:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [int] NULL,
	[link] [varchar](500) NULL,
	[categoryId] [int] NOT NULL,
	[imgLink] [varchar](500) NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/12/2022 3:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](50) NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
	[coin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Video')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Âm Thanh')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Hình Ảnh')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Website')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Thuyết Trình')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (1, 1, CAST(N'2022-12-04T18:23:20.503' AS DateTime), N'purchase', 5000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (1, 2, CAST(N'2022-12-04T11:04:03.447' AS DateTime), N'purchase', 3000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (1, 3, CAST(N'2022-12-04T11:11:48.063' AS DateTime), N'purchase', 2000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (1, 4, CAST(N'2022-12-04T18:20:42.690' AS DateTime), N'purchase', 1000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (1, 8, CAST(N'2022-12-04T11:28:13.790' AS DateTime), N'purchase', 2000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (3, 2, CAST(N'2022-12-07T10:40:40.320' AS DateTime), N'purchase', 3000, 0)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (3, 3, CAST(N'2022-12-07T11:35:07.540' AS DateTime), N'purchase', 2000, 0)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (7, 1, CAST(N'2022-12-04T11:08:44.477' AS DateTime), N'purchase', 5000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (7, 2, CAST(N'2022-12-04T11:05:06.770' AS DateTime), N'purchase', 3000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (7, 3, CAST(N'2022-12-04T11:05:18.240' AS DateTime), N'purchase', 2000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (7, 11, CAST(N'2022-12-04T11:09:22.770' AS DateTime), N'purchase', 4000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (8, 1, CAST(N'2022-12-04T11:10:53.923' AS DateTime), N'purchase', 5000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (9, 2, CAST(N'2022-12-04T11:30:17.193' AS DateTime), N'purchase', 3000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (1, NULL, CAST(N'2022-12-07T12:13:17.910' AS DateTime), N'recharge', 1000, 1)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (3, NULL, CAST(N'2022-12-07T12:24:33.603' AS DateTime), N'recharge', 20000, 0)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (3, NULL, CAST(N'2022-12-07T12:25:41.177' AS DateTime), N'recharge', 20000, 0)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (2, NULL, CAST(N'2022-12-07T12:41:26.840' AS DateTime), N'recharge', 20000, 0)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (2, 2, CAST(N'2022-12-07T15:19:57.520' AS DateTime), N'purchase', 3000, 0)
INSERT [dbo].[OrderDetail] ([userId], [templateId], [orderDate], [orderType], [orderPrice], [isApproved]) VALUES (2, NULL, CAST(N'2022-08-05T13:53:21.780' AS DateTime), N'recharge', 1000000, 1)
GO
SET IDENTITY_INSERT [dbo].[Template] ON 

INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (1, N'Template số 1', 5000, N'assets/rar/Creative Event Roll Up Banner.rar', 1, N'assets/images/template/15_marketing_templates_630x420-1.jpg', N'Đây là mẫu template 1 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (2, N'Template số 2', 3000, N'assets/rar/Creative Event Roll Up Banner.rar', 1, N'assets/images/template/em_trinhtcsold_ombp.jpg', N'Đây là mẫu template 2 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (3, N'Template số 3', 2000, N'assets/rar/Creative Event Roll Up Banner.rar', 1, N'assets/images/template/thiet-ke-poster-001.jpg', N'Đây là mẫu template 3 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (4, N'Template số 4', 1000, N'assets/rar/Fall Festival Flyer.rar', 1, N'assets/images/template/templatea.jpg', N'Đây là mẫu template 4 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (5, N'Template số 5', 2000, N'assets/rar/Creative Event Roll Up Banner.rar', 1, N'assets/images/template/15_marketing_templates_630x420-1.jpg', N'Đây là mẫu template 5 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (7, N'Template số 6', 1000, N'assets/rar/Fall Festival Flyer.rar', 1, N'assets/images/template/images.jpg', N'Đây là mẫu template 6 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (8, N'Template số 7', 2000, N'assets/rar/Creative Event Roll Up Banner.rar', 1, N'assets/images/template/em_trinhtcsold_ombp.jpg', N'Đây là mẫu template 7 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (11, N'Template số 8', 4000, N'assets/rar/Fall Festival Flyer.rar', 1, N'assets/images/template/15_marketing_templates_630x420-1.jpg', N'Đây là mẫu template 8 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (1, N'lamlam123', N'123456789', N'Lam', N'Vo', 1, 7019008)
INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (2, N'Phu', N'123456', NULL, NULL, 0, 997000)
INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (3, N'lamlam', N'123456789', NULL, NULL, 1, 55000)
INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (4, N'abc', N'123', NULL, NULL, 0, 0)
INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (5, N'mcgame2014', N'12345', NULL, NULL, 0, 0)
INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (6, N'huynhvanphu111', N'0398550944', NULL, NULL, 0, 0)
INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (7, N'hihihaha', N'123', NULL, NULL, 0, 20000)
INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (8, N'huynhvanphu333', N'0398550944', NULL, NULL, 0, 50000)
INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (9, N'phuhv123', N'0398550944', NULL, NULL, 0, 17000)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [coin]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([templateId])
REFERENCES [dbo].[Template] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Template]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
USE [master]
GO
ALTER DATABASE [TemplateForAll] SET  READ_WRITE 
GO
