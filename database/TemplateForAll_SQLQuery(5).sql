USE [master]
GO
/****** Object:  Database [TemplateForAll]    Script Date: 10/16/2022 1:46:58 AM ******/
CREATE DATABASE [TemplateForAll]

/****** Object:  Table [dbo].[Category]    Script Date: 10/16/2022 1:46:58 AM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/16/2022 1:46:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[userId] [int] NOT NULL,
	[templateId] [int] NOT NULL,
	[orderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[templateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 10/16/2022 1:46:58 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/16/2022 1:46:58 AM ******/
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

INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (1, N'Template số 1', 5000, NULL, 1, N'assets/images/template/15_marketing_templates_630x420-1.jpg', N'Đây là mẫu template 1 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (2, N'Template số 2', 3000, NULL, 1, N'assets/images/template/em_trinhtcsold_ombp.jpg', N'Đây là mẫu template 2 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (3, N'Template số 3', 2000, NULL, 1, N'assets/images/template/thiet-ke-poster-001.jpg', N'Đây là mẫu template 3 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (4, N'Template số 4', 1000, NULL, 1, N'assets/images/template/templatea.jpg', N'Đây là mẫu template 4 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (5, N'Template số 5', 2000, NULL, 1, N'assets/images/template/15_marketing_templates_630x420-1.jpg', N'Đây là mẫu template 5 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (7, N'Template số 6', 1000, NULL, 1, N'assets/images/template/images.jpg', N'Đây là mẫu template 6 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (8, N'Template số 7', 2000, NULL, 1, N'assets/images/template/em_trinhtcsold_ombp.jpg', N'Đây là mẫu template 7 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink], [description]) VALUES (11, N'Template số 8', 4000, NULL, 1, N'assets/images/template/15_marketing_templates_630x420-1.jpg', N'Đây là mẫu template 8 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì')
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [password], [firstName], [lastName], [isAdmin], [coin]) VALUES (1, N'lamlam', N'123', N'Lam', N'Vo', 0, 0)
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
