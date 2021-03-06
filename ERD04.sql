USE [master]
GO
/****** Object:  Database [User04]    Script Date: 18.12.2021 13:11:49 ******/
CREATE DATABASE [User04]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'User04', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\User04.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'User04_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\User04_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [User04] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [User04].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [User04] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [User04] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [User04] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [User04] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [User04] SET ARITHABORT OFF 
GO
ALTER DATABASE [User04] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [User04] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [User04] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [User04] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [User04] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [User04] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [User04] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [User04] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [User04] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [User04] SET  DISABLE_BROKER 
GO
ALTER DATABASE [User04] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [User04] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [User04] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [User04] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [User04] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [User04] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [User04] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [User04] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [User04] SET  MULTI_USER 
GO
ALTER DATABASE [User04] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [User04] SET DB_CHAINING OFF 
GO
ALTER DATABASE [User04] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [User04] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [User04] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [User04] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [User04] SET QUERY_STORE = OFF
GO
USE [User04]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](12) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[id] [int] NOT NULL,
	[NameMaterials] [nvarchar](60) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[IDWarehouse] [int] NOT NULL,
	[IDTypeMaterial] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[id] [int] NOT NULL,
	[IDMaterial] [int] NOT NULL,
	[IDSupplier] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](12) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[IDTypeSupplier] [int] NOT NULL,
	[INN] [numeric](10, 0) NOT NULL,
	[IDSupplierOfRetion] [int] NOT NULL,
	[StartDateSupplier] [date] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierOfRating]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierOfRating](
	[id] [int] NOT NULL,
	[SupplierRating] [int] NOT NULL,
 CONSTRAINT [PK_SupplierOfRating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfMaterial]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfMaterial](
	[id] [int] NOT NULL,
	[TypeMaterial] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_TypeOfMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeSupplier]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeSupplier](
	[id] [int] NOT NULL,
	[TypeOfSupplier] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TypeSupplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitMeasurementMaterial]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitMeasurementMaterial](
	[id] [int] NOT NULL,
	[IDMaterial] [int] NOT NULL,
	[IdTypeMaterial] [int] NOT NULL,
	[UnitOfMeasurement] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UnitMeasurementMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 18.12.2021 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[id] [int] NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[MinQuantity] [int] NOT NULL,
	[QuantityInThePackage] [int] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (1, N'Гранулы белый 1x2', N'отсутствует', CAST(28326.00 AS Numeric(18, 2)), 1, 1)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (2, N'Гранулы белый 2x1', N'нет', CAST(49124.00 AS Numeric(18, 2)), 2, 2)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (3, N'Гранулы белый 2x2', N'не указано', CAST(11843.00 AS Numeric(18, 2)), 3, 3)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (4, N'Гранулы белый 3x2', N'отсутствует', CAST(36635.00 AS Numeric(18, 2)), 4, 4)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (5, N'Гранулы зеленый 0x2', N'нет', CAST(46326.00 AS Numeric(18, 2)), 5, 5)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (6, N'Гранулы зеленый 0x3', N'не указано', CAST(33037.00 AS Numeric(18, 2)), 6, 6)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (7, N'Гранулы зеленый 1x2', N'\materials\material_4.jpeg', CAST(36121.00 AS Numeric(18, 2)), 7, 7)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (8, N'Гранулы зеленый 1x3', N'отсутствует', CAST(48576.00 AS Numeric(18, 2)), 8, 8)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (9, N'Гранулы зеленый 2x0', N'нет', CAST(18961.00 AS Numeric(18, 2)), 9, 9)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (10, N'Гранулы зеленый 2x3', N'отсутствует', CAST(19788.00 AS Numeric(18, 2)), 10, 10)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (11, N'Гранулы серый 2x3', N'нет', CAST(30903.00 AS Numeric(18, 2)), 11, 11)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (12, N'Гранулы серый 3x0', N'отсутствует', CAST(50093.00 AS Numeric(18, 2)), 12, 12)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (13, N'Гранулы синий 1x0', N'отсутствует', CAST(19889.00 AS Numeric(18, 2)), 13, 13)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (14, N'Гранулы цветной 0x3', N'\materials\material_20.jpeg', CAST(16202.00 AS Numeric(18, 2)), 14, 14)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (15, N'Гранулы цветной 1x3', N'\materials\material_11.jpeg', CAST(16651.00 AS Numeric(18, 2)), 15, 15)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (16, N'Гранулы цветной 2x0', N'\materials\material_21.jpeg', CAST(2670.00 AS Numeric(18, 2)), 16, 16)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (17, N'Гранулы цветной 2x1', N'не указано', CAST(33885.00 AS Numeric(18, 2)), 17, 17)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (18, N'Гранулы цветной 3x0', N'нет', CAST(3273.00 AS Numeric(18, 2)), 18, 18)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (19, N'Гранулы цветной 3x1', N'\materials\material_1.jpeg', CAST(21534.00 AS Numeric(18, 2)), 19, 19)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (20, N'Нарезка белый 0x1', N'нет', CAST(32370.00 AS Numeric(18, 2)), 20, 20)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (21, N'Нарезка белый 0x3', N'нет', CAST(34619.00 AS Numeric(18, 2)), 21, 21)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (22, N'Нарезка белый 1x0', N'не указано', CAST(16050.00 AS Numeric(18, 2)), 22, 22)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (23, N'Нарезка белый 1x2', N'нет', CAST(39259.00 AS Numeric(18, 2)), 23, 23)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (24, N'Нарезка белый 2x2', N'\materials\material_26.jpeg', CAST(39945.00 AS Numeric(18, 2)), 24, 24)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (25, N'Нарезка белый 3x1', N'отсутствует', CAST(27374.00 AS Numeric(18, 2)), 25, 25)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (26, N'Нарезка зеленый 0x1', N'нет', CAST(53874.00 AS Numeric(18, 2)), 26, 26)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (27, N'Нарезка зеленый 0x3', N'не указано', CAST(7884.00 AS Numeric(18, 2)), 27, 27)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (28, N'Нарезка зеленый 1x1', N'\materials\material_6.jpeg', CAST(53096.00 AS Numeric(18, 2)), 28, 28)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (29, N'Нарезка зеленый 1x2', N'не указано', CAST(45568.00 AS Numeric(18, 2)), 29, 29)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (30, N'Нарезка зеленый 3x0', N'\materials\material_7.jpeg', CAST(25985.00 AS Numeric(18, 2)), 30, 30)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (31, N'Нарезка зеленый 3x3', N'нет', CAST(30112.00 AS Numeric(18, 2)), 31, 31)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (32, N'Нарезка серый 1x1', N'нет', CAST(36682.00 AS Numeric(18, 2)), 32, 32)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (33, N'Нарезка серый 2x0', N'нет', CAST(35548.00 AS Numeric(18, 2)), 33, 33)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (34, N'Нарезка серый 2x1', N'не указано', CAST(7801.00 AS Numeric(18, 2)), 34, 34)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (35, N'Нарезка серый 2x2', N'не указано', CAST(30474.00 AS Numeric(18, 2)), 35, 35)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (36, N'Нарезка серый 3x3', N'отсутствует', CAST(51486.00 AS Numeric(18, 2)), 36, 36)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (37, N'Нарезка синий 1x2', N'не указано', CAST(40754.00 AS Numeric(18, 2)), 37, 37)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (38, N'Нарезка синий 2x0', N'не указано', CAST(13380.00 AS Numeric(18, 2)), 38, 38)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (39, N'Нарезка синий 2x1', N'отсутствует', CAST(30327.00 AS Numeric(18, 2)), 39, 39)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (40, N'Нарезка синий 2x2', N'отсутствует', CAST(55748.00 AS Numeric(18, 2)), 40, 40)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (41, N'Нарезка синий 2x3', N'\materials\material_23.jpeg', CAST(53097.00 AS Numeric(18, 2)), 41, 41)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (42, N'Нарезка синий 3x0', N'\materials\material_19.jpeg', CAST(52955.00 AS Numeric(18, 2)), 42, 42)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (43, N'Нарезка синий 3x1', N'не указано', CAST(50887.00 AS Numeric(18, 2)), 43, 43)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (44, N'Нарезка цветной 0x0', N'не указано', CAST(4018.00 AS Numeric(18, 2)), 44, 44)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (45, N'Нарезка цветной 2x0', N'отсутствует', CAST(49221.00 AS Numeric(18, 2)), 45, 45)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (46, N'Нарезка цветной 2x1', N'нет', CAST(9509.00 AS Numeric(18, 2)), 46, 46)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (47, N'Нарезка цветной 2x2', N'\materials\material_9.jpeg', CAST(41538.00 AS Numeric(18, 2)), 47, 47)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (48, N'Нарезка цветной 2x3', N'нет', CAST(32336.00 AS Numeric(18, 2)), 48, 48)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (49, N'Рулон белый 0x1', N'нет', CAST(50081.00 AS Numeric(18, 2)), 49, 49)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (50, N'Рулон белый 1x0', N'\materials\material_18.jpeg', CAST(37126.00 AS Numeric(18, 2)), 50, 50)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (51, N'Рулон белый 1x2', N'отсутствует', CAST(17952.00 AS Numeric(18, 2)), 51, 51)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (52, N'Рулон белый 3x1', N'не указано', CAST(13360.00 AS Numeric(18, 2)), 52, 52)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (53, N'Рулон белый 3x2', N'не указано', CAST(17632.00 AS Numeric(18, 2)), 53, 53)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (54, N'Рулон зеленый 0x0', N'\materials\material_25.jpeg', CAST(43562.00 AS Numeric(18, 2)), 54, 54)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (55, N'Рулон зеленый 0x1', N'отсутствует', CAST(46510.00 AS Numeric(18, 2)), 55, 55)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (56, N'Рулон зеленый 0x2', N'отсутствует', CAST(50081.00 AS Numeric(18, 2)), 56, 56)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (57, N'Рулон зеленый 0x3', N'отсутствует', CAST(52323.00 AS Numeric(18, 2)), 57, 57)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (58, N'Рулон зеленый 1x0', N'не указано', CAST(41572.00 AS Numeric(18, 2)), 58, 58)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (59, N'Рулон зеленый 1x1', N'отсутствует', CAST(28235.00 AS Numeric(18, 2)), 59, 59)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (60, N'Рулон зеленый 1x3', N'нет', CAST(12393.00 AS Numeric(18, 2)), 60, 60)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (61, N'Рулон зеленый 2x2', N'отсутствует', CAST(7610.00 AS Numeric(18, 2)), 61, 61)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (62, N'Рулон зеленый 3x2', N'\materials\material_2.jpeg', CAST(40932.00 AS Numeric(18, 2)), 62, 62)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (63, N'Рулон серый 1x0', N'\materials\material_12.jpeg', CAST(1998.00 AS Numeric(18, 2)), 63, 63)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (64, N'Рулон серый 3x0', N'\materials\material_10.jpeg', CAST(39760.00 AS Numeric(18, 2)), 64, 64)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (65, N'Рулон синий 0x3', N'\materials\material_8.jpeg', CAST(47343.00 AS Numeric(18, 2)), 65, 65)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (66, N'Рулон синий 1x0', N'нет', CAST(49990.00 AS Numeric(18, 2)), 66, 66)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (67, N'Рулон синий 1x1', N'\materials\material_14.jpeg', CAST(40995.00 AS Numeric(18, 2)), 67, 67)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (68, N'Рулон синий 2x1', N'нет', CAST(32118.00 AS Numeric(18, 2)), 68, 68)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (69, N'Рулон синий 2x2', N'нет', CAST(16303.00 AS Numeric(18, 2)), 69, 69)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (70, N'Рулон синий 2x3', N'нет', CAST(15889.00 AS Numeric(18, 2)), 70, 70)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (71, N'Рулон цветной 1x3', N'не указано', CAST(45185.00 AS Numeric(18, 2)), 71, 71)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (72, N'Спрессованный пак белый 0x2', N'\materials\material_5.jpeg', CAST(36343.00 AS Numeric(18, 2)), 72, 72)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (73, N'Спрессованный пак белый 1x1', N'нет', CAST(16919.00 AS Numeric(18, 2)), 73, 73)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (74, N'Спрессованный пак белый 1x2', N'\materials\material_16.jpeg', CAST(21359.00 AS Numeric(18, 2)), 74, 74)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (75, N'Спрессованный пак белый 3x3', N'не указано', CAST(28510.00 AS Numeric(18, 2)), 75, 75)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (76, N'Спрессованный пак зеленый 0x3', N'отсутствует', CAST(18848.00 AS Numeric(18, 2)), 76, 76)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (77, N'Спрессованный пак зеленый 1x0', N'\materials\material_17.jpeg', CAST(18413.00 AS Numeric(18, 2)), 77, 77)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (78, N'Спрессованный пак зеленый 1x1', N'нет', CAST(13911.00 AS Numeric(18, 2)), 78, 78)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (79, N'Спрессованный пак зеленый 1x2', N'\materials\material_3.jpeg', CAST(35304.00 AS Numeric(18, 2)), 79, 79)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (80, N'Спрессованный пак зеленый 2x0', N'нет', CAST(25974.00 AS Numeric(18, 2)), 80, 80)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (81, N'Спрессованный пак зеленый 3x2', N'не указано', CAST(18071.00 AS Numeric(18, 2)), 81, 81)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (82, N'Спрессованный пак серый 0x2', N'нет', CAST(2540.00 AS Numeric(18, 2)), 82, 82)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (83, N'Спрессованный пак серый 0x3', N'нет', CAST(40699.00 AS Numeric(18, 2)), 83, 83)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (84, N'Спрессованный пак серый 1x3', N'отсутствует', CAST(375.00 AS Numeric(18, 2)), 84, 84)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (85, N'Спрессованный пак серый 3x0', N'не указано', CAST(35304.00 AS Numeric(18, 2)), 85, 85)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (86, N'Спрессованный пак серый 3x1', N'нет', CAST(10763.00 AS Numeric(18, 2)), 86, 86)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (87, N'Спрессованный пак синий 0x2', N'\materials\material_24.jpeg', CAST(47443.00 AS Numeric(18, 2)), 87, 87)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (88, N'Спрессованный пак синий 0x3', N'не указано', CAST(29128.00 AS Numeric(18, 2)), 88, 88)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (89, N'Спрессованный пак синий 2x0', N'\materials\material_22.jpeg', CAST(53857.00 AS Numeric(18, 2)), 89, 89)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (90, N'Спрессованный пак синий 2x1', N'отсутствует', CAST(31625.00 AS Numeric(18, 2)), 90, 90)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (91, N'Спрессованный пак цветной 0x1', N'не указано', CAST(21081.00 AS Numeric(18, 2)), 91, 91)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (92, N'Спрессованный пак цветной 0x2', N'отсутствует', CAST(24205.00 AS Numeric(18, 2)), 92, 92)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (93, N'Спрессованный пак цветной 0x3', N'не указано', CAST(10544.00 AS Numeric(18, 2)), 93, 93)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (94, N'Спрессованный пак цветной 1x2', N'\materials\material_15.jpeg', CAST(1382.00 AS Numeric(18, 2)), 94, 94)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (95, N'Спрессованный пак цветной 2x0', N'\materials\material_13.jpeg', CAST(17965.00 AS Numeric(18, 2)), 95, 95)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (96, N'Спрессованный пак цветной 2x1', N'не указано', CAST(20404.00 AS Numeric(18, 2)), 96, 96)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (97, N'Спрессованный пак цветной 2x3', N'нет', CAST(4347.00 AS Numeric(18, 2)), 97, 97)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (98, N'Спрессованный пак цветной 3x0', N'отсутствует', CAST(36740.00 AS Numeric(18, 2)), 98, 98)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (99, N'Спрессованный пак цветной 3x1', N'отсутствует', CAST(45318.00 AS Numeric(18, 2)), 99, 99)
INSERT [dbo].[Material] ([id], [NameMaterials], [Image], [Price], [IDWarehouse], [IDTypeMaterial]) VALUES (100, N'Спрессованный пак цветной 3x3', N'отсутствует', CAST(18048.00 AS Numeric(18, 2)), 100, 100)
GO
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (1, 2, 1)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (2, 2, 22)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (3, 2, 28)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (4, 2, 47)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (5, 5, 19)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (6, 7, 11)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (7, 13, 7)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (8, 13, 50)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (9, 14, 26)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (10, 14, 50)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (11, 15, 29)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (12, 15, 43)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (13, 16, 4)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (14, 18, 5)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (15, 18, 6)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (16, 18, 45)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (17, 19, 28)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (18, 19, 35)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (19, 19, 43)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (20, 19, 44)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (21, 23, 20)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (22, 24, 13)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (23, 24, 20)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (24, 24, 23)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (25, 24, 23)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (26, 24, 31)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (27, 24, 40)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (28, 26, 10)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (29, 27, 11)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (30, 27, 28)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (31, 27, 35)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (32, 30, 1)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (33, 30, 14)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (34, 30, 20)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (35, 30, 21)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (36, 30, 24)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (37, 30, 38)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (38, 33, 17)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (39, 33, 40)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (40, 35, 15)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (41, 35, 16)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (42, 40, 4)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (43, 40, 12)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (44, 40, 20)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (45, 41, 40)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (46, 42, 44)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (47, 42, 44)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (48, 42, 47)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (49, 44, 4)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (50, 44, 17)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (51, 44, 36)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (52, 44, 40)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (53, 47, 7)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (54, 47, 25)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (55, 47, 27)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (56, 50, 15)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (57, 50, 18)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (58, 50, 22)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (59, 50, 34)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (60, 50, 36)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (61, 50, 44)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (62, 52, 23)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (63, 54, 30)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (64, 54, 45)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (65, 56, 46)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (66, 61, 46)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (67, 61, 50)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (68, 62, 24)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (69, 64, 11)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (70, 64, 45)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (71, 65, 15)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (72, 65, 37)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (73, 67, 20)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (74, 72, 25)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (75, 73, 27)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (76, 73, 28)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (77, 73, 47)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (78, 77, 6)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (79, 77, 11)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (80, 77, 39)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (81, 77, 41)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (82, 79, 16)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (83, 79, 24)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (84, 80, 14)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (85, 80, 47)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (86, 83, 1)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (87, 87, 12)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (88, 87, 30)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (89, 87, 39)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (90, 87, 45)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (91, 88, 24)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (92, 89, 39)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (93, 90, 30)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (94, 90, 31)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (95, 95, 41)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (96, 95, 46)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (97, 97, 16)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (98, 97, 28)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (99, 97, 39)
INSERT [dbo].[MaterialSupplier] ([id], [IDMaterial], [IDSupplier]) VALUES (100, 99, 46)
GO
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (1, N'АлмазМикроМобайлПром', 41, CAST(1664868343 AS Numeric(10, 0)), 41, CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (2, N'БухИнфо', 28, CAST(2192138211 AS Numeric(10, 0)), 28, CAST(N'2017-12-17' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (3, N'Вектор', 36, CAST(1009676137 AS Numeric(10, 0)), 36, CAST(N'2012-06-20' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (4, N'Вод', 33, CAST(1492095710 AS Numeric(10, 0)), 33, CAST(N'2017-12-21' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (5, N'ВодОбл', 49, CAST(1987741499 AS Numeric(10, 0)), 49, CAST(N'2019-04-25' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (6, N'Глав', 31, CAST(1859167660 AS Numeric(10, 0)), 31, CAST(N'2012-05-24' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (7, N'ГлавСерви', 19, CAST(2112058447 AS Numeric(10, 0)), 19, CAST(N'2016-11-05' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (8, N'ГлавСтрой', 13, CAST(1107467048 AS Numeric(10, 0)), 13, CAST(N'2014-05-01' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (9, N'ГорТверьЛифт', 39, CAST(1865606765 AS Numeric(10, 0)), 39, CAST(N'2015-04-01' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (10, N'ДизайнТекстил', 5, CAST(2093683523 AS Numeric(10, 0)), 5, CAST(N'2012-12-16' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (11, N'ЖелДорСтройВекторКомплекс', 32, CAST(2004254497 AS Numeric(10, 0)), 32, CAST(N'2019-05-12' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (12, N'ЖелДорХ', 48, CAST(2004002859 AS Numeric(10, 0)), 48, CAST(N'2015-05-03' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (13, N'ИнжСофт', 14, CAST(2209210168 AS Numeric(10, 0)), 14, CAST(N'2019-07-21' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (14, N'Инфо', 6, CAST(1272826845 AS Numeric(10, 0)), 6, CAST(N'2011-12-28' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (15, N'Компания МорКаза', 37, CAST(1177669508 AS Numeric(10, 0)), 37, CAST(N'2016-05-28' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (16, N'Компания Нефть', 21, CAST(2173203619 AS Numeric(10, 0)), 21, CAST(N'2010-08-09' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (17, N'Компания ТелекомРосКрепПром', 25, CAST(1124623718 AS Numeric(10, 0)), 25, CAST(N'2012-06-17' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (18, N'Компания ТомскТверьТ', 42, CAST(1341807682 AS Numeric(10, 0)), 42, CAST(N'2015-12-25' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (19, N'КрепМетизВектор', 47, CAST(1209084074 AS Numeric(10, 0)), 47, CAST(N'2016-06-04' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (20, N'Лифт', 16, CAST(1226636245 AS Numeric(10, 0)), 16, CAST(N'2013-12-02' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (21, N'МонтажНефтьОрион', 3, CAST(1298208597 AS Numeric(10, 0)), 3, CAST(N'2014-12-13' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (22, N'МонтажОр', 17, CAST(1687338212 AS Numeric(10, 0)), 17, CAST(N'2015-01-18' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (23, N'ОблВектор', 1, CAST(1385540089 AS Numeric(10, 0)), 1, CAST(N'2014-11-01' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (24, N'Омск', 26, CAST(1567184813 AS Numeric(10, 0)), 26, CAST(N'2016-12-01' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (25, N'ОрионБухМетал', 7, CAST(2193222008 AS Numeric(10, 0)), 7, CAST(N'2012-04-09' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (26, N'Радио', 23, CAST(1104637210 AS Numeric(10, 0)), 23, CAST(N'2016-08-21' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (27, N'РечСофтРе', 24, CAST(1155044386 AS Numeric(10, 0)), 24, CAST(N'2012-08-08' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (28, N'РечТранс', 29, CAST(2237035085 AS Numeric(10, 0)), 29, CAST(N'2019-10-12' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (29, N'РосЮпитер', 27, CAST(2100448888 AS Numeric(10, 0)), 27, CAST(N'2013-07-21' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (30, N'РыбВостокХоз', 22, CAST(1311161756 AS Numeric(10, 0)), 22, CAST(N'2017-09-09' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (31, N'РыбИнфо', 8, CAST(1418660803 AS Numeric(10, 0)), 8, CAST(N'2013-05-23' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (32, N'РыбОбл', 18, CAST(2097643775 AS Numeric(10, 0)), 18, CAST(N'2016-03-05' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (33, N'СервисБашкирКазТраст', 20, CAST(1549832431 AS Numeric(10, 0)), 20, CAST(N'2018-03-19' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (34, N'Строй', 2, CAST(2255810682 AS Numeric(10, 0)), 2, CAST(N'2010-04-06' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (35, N'Тверь', 43, CAST(1860530128 AS Numeric(10, 0)), 43, CAST(N'2017-06-25' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (36, N'ТверьЛайт', 45, CAST(1499654365 AS Numeric(10, 0)), 45, CAST(N'2015-02-09' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (37, N'ТверьМор', 34, CAST(2013469587 AS Numeric(10, 0)), 34, CAST(N'2017-01-08' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (38, N'ТелекомМетизХмель', 15, CAST(1001436679 AS Numeric(10, 0)), 15, CAST(N'2013-06-14' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (39, N'ТелекомТра', 30, CAST(1144555605 AS Numeric(10, 0)), 30, CAST(N'2010-08-26' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (40, N'Тех', 9, CAST(2148577794 AS Numeric(10, 0)), 9, CAST(N'2010-12-15' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (41, N'ТрансМясМясКомплекс', 12, CAST(1184923897 AS Numeric(10, 0)), 12, CAST(N'2019-07-14' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (42, N'Урал', 38, CAST(1439263529 AS Numeric(10, 0)), 38, CAST(N'2013-05-06' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (43, N'УралТексти', 44, CAST(1705799898 AS Numeric(10, 0)), 44, CAST(N'2018-04-28' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (44, N'ФинансСервис', 11, CAST(1499914719 AS Numeric(10, 0)), 11, CAST(N'2016-05-27' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (45, N'ХозБашкирГла', 4, CAST(1708759159 AS Numeric(10, 0)), 4, CAST(N'2010-09-07' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (46, N'ХозСервис', 46, CAST(1656715446 AS Numeric(10, 0)), 46, CAST(N'2015-11-13' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (47, N'ЦементИнфоМонтаж', 35, CAST(1389100819 AS Numeric(10, 0)), 35, CAST(N'2014-06-19' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (48, N'ЦементОрион', 10, CAST(1536344749 AS Numeric(10, 0)), 10, CAST(N'2016-02-06' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (49, N'Электро', 50, CAST(1827769521 AS Numeric(10, 0)), 50, CAST(N'2015-05-03' AS Date))
INSERT [dbo].[Supplier] ([id], [SupplierName], [IDTypeSupplier], [INN], [IDSupplierOfRetion], [StartDateSupplier]) VALUES (50, N'ЭлектроВод', 40, CAST(1521101623 AS Numeric(10, 0)), 40, CAST(N'2017-05-27' AS Date))
GO
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (1, 40)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (2, 54)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (3, 45)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (4, 10)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (5, 69)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (6, 33)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (7, 52)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (8, 71)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (9, 28)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (10, 43)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (11, 21)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (12, 78)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (13, 77)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (14, 99)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (15, 67)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (16, 26)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (17, 6)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (18, 80)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (19, 20)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (20, 36)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (21, 97)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (22, 47)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (23, 27)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (24, 77)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (25, 71)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (26, 90)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (27, 23)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (28, 91)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (29, 22)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (30, 31)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (31, 87)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (32, 97)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (33, 63)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (34, 61)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (35, 46)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (36, 22)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (37, 6)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (38, 21)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (39, 50)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (40, 16)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (41, 94)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (42, 26)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (43, 17)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (44, 54)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (45, 14)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (46, 99)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (47, 64)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (48, 65)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (49, 38)
INSERT [dbo].[SupplierOfRating] ([id], [SupplierRating]) VALUES (50, 86)
GO
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (1, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (2, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (3, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (4, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (5, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (6, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (7, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (8, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (9, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (10, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (11, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (12, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (13, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (14, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (15, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (16, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (17, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (18, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (19, N'Гранулы')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (20, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (21, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (22, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (23, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (24, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (25, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (26, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (27, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (28, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (29, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (30, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (31, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (32, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (33, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (34, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (35, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (36, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (37, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (38, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (39, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (40, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (41, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (42, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (43, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (44, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (45, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (46, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (47, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (48, N'Нарезка')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (49, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (50, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (51, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (52, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (53, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (54, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (55, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (56, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (57, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (58, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (59, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (60, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (61, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (62, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (63, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (64, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (65, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (66, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (67, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (68, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (69, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (70, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (71, N'Рулон')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (72, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (73, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (74, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (75, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (76, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (77, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (78, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (79, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (80, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (81, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (82, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (83, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (84, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (85, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (86, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (87, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (88, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (89, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (90, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (91, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (92, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (93, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (94, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (95, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (96, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (97, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (98, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (99, N'Пресс')
INSERT [dbo].[TypeOfMaterial] ([id], [TypeMaterial]) VALUES (100, N'Пресс')
GO
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (1, N' МКК      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (2, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (3, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (4, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (5, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (6, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (7, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (8, N' МФО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (9, N' МФО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (10, N' МКК      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (11, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (12, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (13, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (14, N' МФО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (15, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (16, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (17, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (18, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (19, N' ПАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (20, N' МФО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (21, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (22, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (23, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (24, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (25, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (26, N' МКК      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (27, N' МФО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (28, N' МКК      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (29, N' МФО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (30, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (31, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (32, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (33, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (34, N' МКК      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (35, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (36, N' МКК      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (37, N' ПАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (38, N' МФО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (39, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (40, N' ЗАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (41, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (42, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (43, N' ООО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (44, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (45, N' ЗАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (46, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (47, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (48, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (49, N' ОАО      ')
INSERT [dbo].[TypeSupplier] ([id], [TypeOfSupplier]) VALUES (50, N' ПАО      ')
GO
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (1, 1, 1, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (2, 2, 2, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (3, 3, 3, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (4, 4, 4, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (5, 5, 5, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (6, 6, 6, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (7, 7, 7, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (8, 8, 8, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (9, 9, 9, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (10, 10, 10, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (11, 11, 11, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (12, 12, 12, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (13, 13, 13, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (14, 14, 14, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (15, 15, 15, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (16, 16, 16, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (17, 17, 17, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (18, 18, 18, N'л')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (19, 19, 19, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (20, 20, 20, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (21, 21, 21, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (22, 22, 22, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (23, 23, 23, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (24, 24, 24, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (25, 25, 25, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (26, 26, 26, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (27, 27, 27, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (28, 28, 28, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (29, 29, 29, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (30, 30, 30, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (31, 31, 31, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (32, 32, 32, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (33, 33, 33, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (34, 34, 34, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (35, 35, 35, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (36, 36, 36, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (37, 37, 37, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (38, 38, 38, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (39, 39, 39, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (40, 40, 40, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (41, 41, 41, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (42, 42, 42, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (43, 43, 43, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (44, 44, 44, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (45, 45, 45, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (46, 46, 46, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (47, 47, 47, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (48, 48, 48, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (49, 49, 49, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (50, 50, 50, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (51, 51, 51, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (52, 52, 52, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (53, 53, 53, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (54, 54, 54, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (55, 55, 55, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (56, 56, 56, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (57, 57, 57, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (58, 58, 58, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (59, 59, 59, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (60, 60, 60, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (61, 61, 61, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (62, 62, 62, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (63, 63, 63, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (64, 64, 64, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (65, 65, 65, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (66, 66, 66, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (67, 67, 67, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (68, 68, 68, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (69, 69, 69, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (70, 70, 70, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (71, 71, 71, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (72, 72, 72, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (73, 73, 73, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (74, 74, 74, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (75, 75, 75, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (76, 76, 76, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (77, 77, 77, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (78, 78, 78, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (79, 79, 79, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (80, 80, 80, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (81, 81, 81, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (82, 82, 82, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (83, 83, 83, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (84, 84, 84, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (85, 85, 85, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (86, 86, 86, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (87, 87, 87, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (88, 88, 88, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (89, 89, 89, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (90, 90, 90, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (91, 91, 91, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (92, 92, 92, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (93, 93, 93, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (94, 94, 94, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (95, 95, 95, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (96, 96, 96, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (97, 97, 97, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (98, 98, 98, N'кг')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (99, 99, 99, N'м')
INSERT [dbo].[UnitMeasurementMaterial] ([id], [IDMaterial], [IdTypeMaterial], [UnitOfMeasurement]) VALUES (100, 100, 100, N'м')
GO
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (1, 265, 10, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (2, 437, 40, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (3, 232, 22, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (4, 732, 50, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (5, 787, 40, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (6, 937, 31, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (7, 2, 29, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (8, 603, 5, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (9, 708, 11, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (10, 848, 18, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (11, 185, 22, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (12, 705, 34, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (13, 579, 12, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (14, 641, 35, 3)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (15, 20, 23, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (16, 309, 15, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (17, 757, 5, 1)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (18, 151, 25, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (19, 44, 45, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (20, 368, 16, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (21, 444, 27, 5)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (22, 924, 33, 5)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (23, 248, 27, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (24, 614, 7, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (25, 439, 50, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (26, 502, 36, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (27, 943, 25, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (28, 883, 42, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (29, 339, 8, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (30, 345, 30, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (31, 172, 20, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (32, 302, 41, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (33, 858, 37, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (34, 2, 50, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (35, 476, 5, 3)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (36, 149, 18, 5)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (37, 353, 5, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (38, 899, 9, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (39, 82, 44, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (40, 845, 42, 3)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (41, 44, 5, 5)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (42, 696, 42, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (43, 631, 27, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (44, 311, 9, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (45, 118, 22, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (46, 168, 40, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (47, 326, 34, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (48, 498, 45, 3)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (49, 99, 8, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (50, 960, 35, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (51, 599, 18, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (52, 613, 13, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (53, 608, 5, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (54, 371, 32, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (55, 60, 14, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (56, 35, 10, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (57, 913, 13, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (58, 124, 5, 3)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (59, 884, 5, 1)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (60, 20, 17, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (61, 94, 6, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (62, 111, 37, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (63, 811, 26, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (64, 34, 17, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (65, 243, 41, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (66, 972, 40, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (67, 22, 37, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (68, 859, 5, 3)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (69, 426, 17, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (70, 775, 42, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (71, 423, 48, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (72, 601, 49, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (73, 547, 35, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (74, 27, 28, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (75, 158, 34, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (76, 966, 7, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (77, 560, 17, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (78, 577, 28, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (79, 1, 12, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (80, 215, 25, 6)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (81, 890, 5, 5)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (82, 497, 27, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (83, 386, 34, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (84, 805, 50, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (85, 391, 29, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (86, 429, 22, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (87, 881, 14, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (88, 349, 41, 4)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (89, 744, 50, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (90, 921, 18, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (91, 175, 50, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (92, 474, 30, 7)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (93, 610, 41, 2)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (94, 189, 31, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (95, 211, 46, 5)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (96, 549, 21, 9)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (97, 746, 27, 10)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (98, 159, 42, 5)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (99, 146, 23, 8)
INSERT [dbo].[Warehouse] ([id], [QuantityInStock], [MinQuantity], [QuantityInThePackage]) VALUES (100, 932, 47, 5)
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_TypeOfMaterial] FOREIGN KEY([IDTypeMaterial])
REFERENCES [dbo].[TypeOfMaterial] ([id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_TypeOfMaterial]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Warehouse] FOREIGN KEY([IDWarehouse])
REFERENCES [dbo].[Warehouse] ([id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Warehouse]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([id])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([IDMaterial])
REFERENCES [dbo].[Material] ([id])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([IDSupplier])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([id])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Product] FOREIGN KEY([ID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_SupplierOfRating] FOREIGN KEY([IDSupplierOfRetion])
REFERENCES [dbo].[SupplierOfRating] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_SupplierOfRating]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_TypeSupplier] FOREIGN KEY([IDTypeSupplier])
REFERENCES [dbo].[TypeSupplier] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_TypeSupplier]
GO
ALTER TABLE [dbo].[UnitMeasurementMaterial]  WITH CHECK ADD  CONSTRAINT [FK_UnitMeasurementMaterial_Material] FOREIGN KEY([IDMaterial])
REFERENCES [dbo].[Material] ([id])
GO
ALTER TABLE [dbo].[UnitMeasurementMaterial] CHECK CONSTRAINT [FK_UnitMeasurementMaterial_Material]
GO
ALTER TABLE [dbo].[UnitMeasurementMaterial]  WITH CHECK ADD  CONSTRAINT [FK_UnitMeasurementMaterial_TypeOfMaterial] FOREIGN KEY([IdTypeMaterial])
REFERENCES [dbo].[TypeOfMaterial] ([id])
GO
ALTER TABLE [dbo].[UnitMeasurementMaterial] CHECK CONSTRAINT [FK_UnitMeasurementMaterial_TypeOfMaterial]
GO
USE [master]
GO
ALTER DATABASE [User04] SET  READ_WRITE 
GO
