USE [master]
GO
/****** Object:  Database [TemplateForAllDB]    Script Date: 10/15/2022 9:52:39 PM ******/
CREATE DATABASE [TemplateForAllDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TemplateForAllDB', FILENAME = N'E:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\TemplateForAllDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TemplateForAllDB_log', FILENAME = N'E:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\TemplateForAllDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TemplateForAllDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TemplateForAllDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TemplateForAllDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TemplateForAllDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TemplateForAllDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TemplateForAllDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TemplateForAllDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TemplateForAllDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TemplateForAllDB] SET  MULTI_USER 
GO
ALTER DATABASE [TemplateForAllDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TemplateForAllDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TemplateForAllDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TemplateForAllDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TemplateForAllDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TemplateForAllDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TemplateForAllDB] SET QUERY_STORE = OFF
GO
USE [TemplateForAllDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/15/2022 9:52:40 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 10/15/2022 9:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[orderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/15/2022 9:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderId] [int] NOT NULL,
	[templateId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 10/15/2022 9:52:40 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/15/2022 9:52:40 PM ******/
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
SET IDENTITY_INSERT [dbo].[Template] ON 

INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (1, N'Mẫu Template 1', 5, NULL, 1, N'assets/images/template/15_marketing_templates_630x420-1.jpg', N'Đây là mẫu template 1 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (2, N'Mẫu Template 2', 4, NULL, 1, N'assets/images/template/em_trinhtcsold_ombp.jpg', N'Đây là mẫu template 2 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (3, N'Mẫu Template 3', 5, NULL, 1, N'assets/images/template/thiet-ke-poster-001.jpg', N'Đây là mẫu template 3 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (5, N'Mẫu Template 4', 6, NULL, 1, N'assets/images/template/images.jpg', N'Đây là mẫu template 4 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (6, N'Mẫu Template 5', 5, NULL, 1, N'assets/images/template/templatea.jpg', N'Đây là mẫu template 1 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (1, N'lamlam', N'123', N'Lam', N'Vo', 0, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [coin]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([templateId])
REFERENCES [dbo].[Template] ([id])
GO
ALTER TABLE [dbo].[Template]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
USE [master]
GO
ALTER DATABASE [TemplateForAllDB] SET  READ_WRITE 
GO
