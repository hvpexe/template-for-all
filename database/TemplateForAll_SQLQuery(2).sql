USE [master]
GO
/****** Object:  Database [TemplateForAllDB]    Script Date: 10/15/2022 5:24:09 PM ******/
CREATE DATABASE [TemplateForAllDB]
GO
USE [TemplateForAllDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/15/2022 5:24:09 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 10/15/2022 5:24:09 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/15/2022 5:24:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderId] [int] NOT NULL,
	[templateId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 10/15/2022 5:24:09 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/15/2022 5:24:09 PM ******/
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

INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink]) VALUES (1, N'Mẫu Template 1', 5, NULL, 1, N'web/assets/images/template/15_marketing_templates_630x420-1.jpg')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink]) VALUES (2, N'Mẫu Template 2', 4, NULL, 1, N'web/assets/images/template/em_trinhtcsold_ombp.jpg')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink]) VALUES (3, N'Mẫu Template 3', 5, NULL, 1, N'web/assets/images/template/thiet-ke-poster-001.jpg')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink]) VALUES (5, N'Mẫu Template 4', 6, NULL, 1, N'web/assets/images/template/images.jpg')
INSERT [dbo].[Template] ([id], [name], [price], [link], [categoryId], [imgLink]) VALUES (6, N'Mẫu Template 5', 5, NULL, 1, N'web/assets/images/template/templatea.jpg')
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
