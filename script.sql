USE [master]
GO
/****** Object:  Database [careeer]    Script Date: 21.05.2025 16:54:17 ******/
CREATE DATABASE [careeer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'careeer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\careeer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'careeer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\careeer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [careeer] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [careeer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [careeer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [careeer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [careeer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [careeer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [careeer] SET ARITHABORT OFF 
GO
ALTER DATABASE [careeer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [careeer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [careeer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [careeer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [careeer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [careeer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [careeer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [careeer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [careeer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [careeer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [careeer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [careeer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [careeer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [careeer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [careeer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [careeer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [careeer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [careeer] SET RECOVERY FULL 
GO
ALTER DATABASE [careeer] SET  MULTI_USER 
GO
ALTER DATABASE [careeer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [careeer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [careeer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [careeer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [careeer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [careeer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'careeer', N'ON'
GO
ALTER DATABASE [careeer] SET QUERY_STORE = ON
GO
ALTER DATABASE [careeer] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [careeer]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	[ContactPhone] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentName] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SerialNumber] [nvarchar](50) NOT NULL,
	[PurchaseDate] [date] NOT NULL,
	[LastMaintenanceDate] [date] NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Extraction]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Extraction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MiningZoneID] [int] NOT NULL,
	[ExtractionDate] [date] NOT NULL,
	[Volume] [decimal](10, 2) NOT NULL,
	[Weight] [decimal](10, 2) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MineralType]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MineralType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[Density] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiningZone]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiningZone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [nvarchar](50) NOT NULL,
	[MineralTypeID] [int] NOT NULL,
	[EstimatedReserves] [decimal](12, 2) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processing]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExtractionID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProcessingDate] [datetime] NOT NULL,
	[InputAmount] [decimal](10, 2) NOT NULL,
	[OutputAmount] [decimal](10, 2) NOT NULL,
	[Efficiency] [decimal](5, 2) NULL,
	[EquipmentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[QualityStandard] [nvarchar](100) NULL,
	[ParticleSize] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[ShipmentDate] [datetime] NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[ContractNumber] [nvarchar](50) NULL,
	[TransportDetails] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[QualityCheckDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageAudit]    Script Date: 21.05.2025 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageAudit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StorageID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OldAmount] [decimal](10, 2) NULL,
	[NewAmount] [decimal](10, 2) NULL,
	[ChangeDate] [datetime] NOT NULL,
	[ChangeType] [varchar](10) NOT NULL,
	[ChangedBy] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (1, N'Иван', N'Петров', N'Operator', CAST(N'2018-05-10' AS Date), N'+79031234567', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (2, N'Алексей', N'Сидоров', N'Technician', CAST(N'2019-03-15' AS Date), N'+79042345678', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (3, N'Сергей', N'Иванов', N'Geologist', CAST(N'2017-11-20' AS Date), N'+79053456789', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (4, N'Ольга', N'Кузнецова', N'Manager', CAST(N'2016-08-05' AS Date), N'+79064567890', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (5, N'Дмитрий', N'Смирнов', N'Operator', CAST(N'2020-02-18' AS Date), N'+79075678901', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (6, N'Елена', N'Васильева', N'Technician', CAST(N'2019-07-22' AS Date), N'+79086789012', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (7, N'Андрей', N'Попов', N'Laborer', CAST(N'2021-01-30' AS Date), N'+79097890123', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (8, N'Наталья', N'Морозова', N'Geologist', CAST(N'2018-09-14' AS Date), N'+79108901234', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (9, N'Михаил', N'Новиков', N'Operator', CAST(N'2020-06-25' AS Date), N'+79119012345', 1)
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Position], [HireDate], [ContactPhone], [IsActive]) VALUES (10, N'Анна', N'Федорова', N'Manager', CAST(N'2017-04-03' AS Date), N'+79120123456', 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (1, N'Экскаватор CAT 349', N'Excavator', N'CAT-349-001', CAST(N'2020-05-15' AS Date), CAST(N'2023-10-01' AS Date), N'Active')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (2, N'Дробилка СМД-118', N'Crusher', N'SMD-118-005', CAST(N'2019-08-20' AS Date), CAST(N'2023-09-15' AS Date), N'Active')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (3, N'Погрузчик Volvo L350', N'Loader', N'VOL-L350-012', CAST(N'2021-03-10' AS Date), CAST(N'2023-11-05' AS Date), N'Active')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (4, N'Мельница МШЦ 4500х6000', N'Mill', N'MSHTS-4500-03', CAST(N'2018-11-25' AS Date), CAST(N'2023-07-20' AS Date), N'Maintenance')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (5, N'Буровая установка СБШ-250', N'Drill', N'SBSH-250-008', CAST(N'2022-02-18' AS Date), CAST(N'2023-10-30' AS Date), N'Active')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (6, N'Экскаватор Hitachi ZX470', N'Excavator', N'HIT-ZX470-007', CAST(N'2020-07-22' AS Date), CAST(N'2023-11-10' AS Date), N'Active')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (7, N'Дробилка КСД-2200', N'Crusher', N'KSD-2200-004', CAST(N'2019-05-14' AS Date), CAST(N'2023-08-25' AS Date), N'Active')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (8, N'Погрузчик Liebherr L586', N'Loader', N'LIE-L586-009', CAST(N'2021-09-03' AS Date), CAST(N'2023-11-01' AS Date), N'Active')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (9, N'Грохот ГИЛ-52', N'Crusher', N'GIL-52-002', CAST(N'2020-10-12' AS Date), CAST(N'2023-09-18' AS Date), N'Decommissioned')
INSERT [dbo].[Equipment] ([ID], [EquipmentName], [Type], [SerialNumber], [PurchaseDate], [LastMaintenanceDate], [Status]) VALUES (10, N'Бульдозер CAT D9', N'Loader', N'CAT-D9-011', CAST(N'2019-12-05' AS Date), CAST(N'2023-10-15' AS Date), N'Active')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Extraction] ON 

INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (1, 1, CAST(N'2023-11-01' AS Date), CAST(120.00 AS Decimal(10, 2)), CAST(324.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (2, 2, CAST(N'2023-11-02' AS Date), CAST(150.00 AS Decimal(10, 2)), CAST(390.00 AS Decimal(10, 2)), 5, 6)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (3, 3, CAST(N'2023-11-03' AS Date), CAST(80.00 AS Decimal(10, 2)), CAST(232.00 AS Decimal(10, 2)), 9, 5)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (4, 1, CAST(N'2023-11-04' AS Date), CAST(95.00 AS Decimal(10, 2)), CAST(256.50 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (5, 5, CAST(N'2023-11-05' AS Date), CAST(110.00 AS Decimal(10, 2)), CAST(308.00 AS Decimal(10, 2)), 7, 3)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (6, 2, CAST(N'2023-11-06' AS Date), CAST(130.00 AS Decimal(10, 2)), CAST(338.00 AS Decimal(10, 2)), 5, 6)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (7, 7, CAST(N'2023-11-07' AS Date), CAST(70.00 AS Decimal(10, 2)), CAST(154.00 AS Decimal(10, 2)), 3, 8)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (8, 8, CAST(N'2023-11-08' AS Date), CAST(90.00 AS Decimal(10, 2)), CAST(261.00 AS Decimal(10, 2)), 9, 5)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (9, 3, CAST(N'2023-11-09' AS Date), CAST(100.00 AS Decimal(10, 2)), CAST(290.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[Extraction] ([ID], [MiningZoneID], [ExtractionDate], [Volume], [Weight], [EmployeeID], [EquipmentID]) VALUES (10, 5, CAST(N'2023-11-10' AS Date), CAST(85.00 AS Decimal(10, 2)), CAST(238.00 AS Decimal(10, 2)), 7, 3)
SET IDENTITY_INSERT [dbo].[Extraction] OFF
GO
SET IDENTITY_INSERT [dbo].[MineralType] ON 

INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (1, N'Известняк', N'Осадочная горная порода органического происхождения', CAST(2.70 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (2, N'Гранит', N'Твердая магматическая горная порода', CAST(2.60 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (3, N'Базальт', N'Вулканическая горная порода', CAST(2.90 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (4, N'Доломит', N'Карбонатная горная порода', CAST(2.80 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (5, N'Песчаник', N'Осадочная горная порода', CAST(2.20 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (6, N'Гнейс', N'Метаморфическая горная порода', CAST(2.70 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (7, N'Мрамор', N'Кристаллическая горная порода', CAST(2.70 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (8, N'Габбро', N'Глубинная магматическая горная порода', CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (9, N'Кварцит', N'Метаморфическая горная порода', CAST(2.60 AS Decimal(10, 2)))
INSERT [dbo].[MineralType] ([ID], [TypeName], [Description], [Density]) VALUES (10, N'Андезит', N'Вулканическая горная порода', CAST(2.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[MineralType] OFF
GO
SET IDENTITY_INSERT [dbo].[MiningZone] ON 

INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (1, N'Северный склон', 1, CAST(500000.00 AS Decimal(12, 2)), N'Active')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (2, N'Восточный карьер', 2, CAST(1200000.00 AS Decimal(12, 2)), N'Active')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (3, N'Западный разрез', 3, CAST(750000.00 AS Decimal(12, 2)), N'Active')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (4, N'Центральная зона', 1, CAST(300000.00 AS Decimal(12, 2)), N'Depleted')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (5, N'Южный участок', 4, CAST(600000.00 AS Decimal(12, 2)), N'Active')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (6, N'Глубокий горизонт', 2, CAST(900000.00 AS Decimal(12, 2)), N'Planned')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (7, N'Верхний пласт', 5, CAST(200000.00 AS Decimal(12, 2)), N'Active')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (8, N'Нижний ярус', 3, CAST(400000.00 AS Decimal(12, 2)), N'Active')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (9, N'Новый разрез', 1, CAST(800000.00 AS Decimal(12, 2)), N'Planned')
INSERT [dbo].[MiningZone] ([ID], [ZoneName], [MineralTypeID], [EstimatedReserves], [Status]) VALUES (10, N'Резервная зона', 4, CAST(1000000.00 AS Decimal(12, 2)), N'Planned')
SET IDENTITY_INSERT [dbo].[MiningZone] OFF
GO
SET IDENTITY_INSERT [dbo].[Processing] ON 

INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (1, 1, 1, CAST(N'2023-01-11T14:30:00.000' AS DateTime), CAST(324.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (2, 2, 2, CAST(N'2023-02-11T15:45:00.000' AS DateTime), CAST(390.00 AS Decimal(10, 2)), CAST(360.00 AS Decimal(10, 2)), NULL, 7)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (3, 3, 3, CAST(N'2023-03-11T16:20:00.000' AS DateTime), CAST(232.00 AS Decimal(10, 2)), CAST(210.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (4, 4, 4, CAST(N'2023-04-11T11:10:00.000' AS DateTime), CAST(256.50 AS Decimal(10, 2)), CAST(240.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (5, 5, 5, CAST(N'2023-05-11T10:30:00.000' AS DateTime), CAST(308.00 AS Decimal(10, 2)), CAST(290.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (6, 6, 1, CAST(N'2023-06-11T14:15:00.000' AS DateTime), CAST(338.00 AS Decimal(10, 2)), CAST(315.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (7, 7, 6, CAST(N'2023-07-11T09:45:00.000' AS DateTime), CAST(154.00 AS Decimal(10, 2)), CAST(145.00 AS Decimal(10, 2)), NULL, 7)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (8, 8, 2, CAST(N'2023-08-11T13:20:00.000' AS DateTime), CAST(261.00 AS Decimal(10, 2)), CAST(240.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (9, 9, 3, CAST(N'2023-09-11T16:00:00.000' AS DateTime), CAST(290.00 AS Decimal(10, 2)), CAST(265.00 AS Decimal(10, 2)), NULL, 7)
INSERT [dbo].[Processing] ([ID], [ExtractionID], [ProductID], [ProcessingDate], [InputAmount], [OutputAmount], [Efficiency], [EquipmentID]) VALUES (10, 10, 7, CAST(N'2023-10-11T12:30:00.000' AS DateTime), CAST(238.00 AS Decimal(10, 2)), CAST(220.00 AS Decimal(10, 2)), NULL, 4)
SET IDENTITY_INSERT [dbo].[Processing] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (1, N'Щебень 5-20', N'Фракция 5-20 мм', N'ГОСТ 8267-93', N'5-20 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (2, N'Щебень 20-40', N'Фракция 20-40 мм', N'ГОСТ 8267-93', N'20-40 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (3, N'Щебень 40-70', N'Фракция 40-70 мм', N'ГОСТ 8267-93', N'40-70 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (4, N'Мука известняковая', N'Молотый известняк', N'ГОСТ 26826-86', N'< 0.1 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (5, N'Порошок минеральный', N'Для асфальтобетонных смесей', N'ГОСТ 52129-2003', N'< 0.071 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (6, N'Отсев 0-5', N'Фракция 0-5 мм', N'ГОСТ 8267-93', N'0-5 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (7, N'Щебень кубовидный', N'Лещадность до 15%', N'ГОСТ 8267-93', N'5-20 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (8, N'Песок из отсевов', N'Песок из отсевов дробления', N'ГОСТ 8736-2014', N'0-5 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (9, N'Щебень декоративный', N'Цветной щебень для ландшафта', N'ТУ 5711-002-04001508-99', N'5-20 мм')
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [QualityStandard], [ParticleSize]) VALUES (10, N'Доломитовая мука', N'Молотый доломит', N'ГОСТ 14050-93', N'< 0.1 мм')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipment] ON 

INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (1, 1, CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-05-11T10:00:00.000' AS DateTime), N'ООО "СтройДор"', N'Д-245/2023', N'Автопоезд Volvo, номер А123БВ456')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (2, 2, CAST(150.00 AS Decimal(10, 2)), CAST(N'2023-06-11T11:30:00.000' AS DateTime), N'ЗАО "АсфальтБетон"', N'АБ-178/2023', N'Автопоезд MAN, номер В234СВ789')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (3, 3, CAST(180.00 AS Decimal(10, 2)), CAST(N'2023-07-11T09:45:00.000' AS DateTime), N'ООО "Дорожник"', N'ДР-302/2023', N'Автопоезд Scania, номер С345ДЕ012')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (4, 4, CAST(50.00 AS Decimal(10, 2)), CAST(N'2023-05-11T14:20:00.000' AS DateTime), N'ООО "СтройМатериалы"', N'СМ-156/2023', N'Бортовой КамАЗ, номер Е456ФЖ345')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (5, 5, CAST(80.00 AS Decimal(10, 2)), CAST(N'2023-08-11T12:00:00.000' AS DateTime), N'ЗАО "АсфальтБетон"', N'АБ-179/2023', N'Автопоезд Volvo, номер Ж567ЗИ678')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (6, 6, CAST(100.00 AS Decimal(10, 2)), CAST(N'2023-06-11T16:30:00.000' AS DateTime), N'ООО "ДорСтрой"', N'ДС-210/2023', N'Бортовой КамАЗ, номер К678ЛМ901')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (7, 7, CAST(60.00 AS Decimal(10, 2)), CAST(N'2023-09-11T10:15:00.000' AS DateTime), N'ИП Смирнов А.А.', N'СМ-045/2023', N'Газель, номер М789НО234')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (8, 8, CAST(40.00 AS Decimal(10, 2)), CAST(N'2023-08-11T15:45:00.000' AS DateTime), N'ООО "ЛандшафтСтрой"', N'ЛС-078/2023', N'Бортовой КамАЗ, номер Н890ПР567')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (9, 1, CAST(120.00 AS Decimal(10, 2)), CAST(N'2023-10-11T11:00:00.000' AS DateTime), N'ООО "МостоСтрой"', N'МС-112/2023', N'Автопоезд MAN, номер П901РС890')
INSERT [dbo].[Shipment] ([ID], [ProductID], [Amount], [ShipmentDate], [CustomerName], [ContractNumber], [TransportDetails]) VALUES (10, 4, CAST(70.00 AS Decimal(10, 2)), CAST(N'2023-09-11T13:30:00.000' AS DateTime), N'ООО "СтройДор"', N'Д-246/2023', N'Бортовой КамАЗ, номер Р012СТ123')
SET IDENTITY_INSERT [dbo].[Shipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Storage] ON 

INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (41, 1, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Основной склад', CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (42, 2, CAST(800.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Основной склад', CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (43, 3, CAST(1200.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Основной склад', CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (44, 4, CAST(500.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Склад сыпучих материалов', CAST(N'2023-11-05' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (45, 5, CAST(700.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Склад сыпучих материалов', CAST(N'2023-11-05' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (46, 6, CAST(900.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Основной склад', CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (47, 7, CAST(400.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Склад готовой продукции', CAST(N'2023-11-08' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (48, 8, CAST(300.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Склад готовой продукции', CAST(N'2023-11-08' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (49, 9, CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Склад декоративных материалов', CAST(N'2023-11-03' AS Date))
INSERT [dbo].[Storage] ([ID], [ProductID], [Amount], [LastUpdate], [Location], [QualityCheckDate]) VALUES (50, 10, CAST(350.00 AS Decimal(10, 2)), CAST(N'2023-10-11T09:00:00.000' AS DateTime), N'Склад сыпучих материалов', CAST(N'2023-11-05' AS Date))
SET IDENTITY_INSERT [dbo].[Storage] OFF
GO
SET IDENTITY_INSERT [dbo].[StorageAudit] ON 

INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (1, 10, 1, NULL, CAST(300.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (2, 9, 2, NULL, CAST(360.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (3, 8, 3, NULL, CAST(210.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (4, 7, 4, NULL, CAST(240.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (5, 6, 5, NULL, CAST(290.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (6, 5, 1, NULL, CAST(315.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (7, 4, 6, NULL, CAST(145.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (8, 3, 2, NULL, CAST(240.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (9, 2, 3, NULL, CAST(265.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (10, 1, 7, NULL, CAST(220.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:03.547' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (11, 20, 10, NULL, CAST(350.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (12, 19, 9, NULL, CAST(200.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (13, 18, 8, NULL, CAST(300.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (14, 17, 7, NULL, CAST(400.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (15, 16, 6, NULL, CAST(900.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (16, 15, 5, NULL, CAST(700.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (17, 14, 4, NULL, CAST(500.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (18, 13, 3, NULL, CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (19, 12, 2, NULL, CAST(800.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (20, 11, 1, NULL, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:06.713' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (21, 30, 10, NULL, CAST(350.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (22, 29, 9, NULL, CAST(200.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (23, 28, 8, NULL, CAST(300.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (24, 27, 7, NULL, CAST(400.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (25, 26, 6, NULL, CAST(900.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (26, 25, 5, NULL, CAST(700.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (27, 24, 4, NULL, CAST(500.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (28, 23, 3, NULL, CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (29, 22, 2, NULL, CAST(800.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (30, 21, 1, NULL, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:24.693' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (31, 40, 10, NULL, CAST(350.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (32, 39, 9, NULL, CAST(200.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (33, 38, 8, NULL, CAST(300.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (34, 37, 7, NULL, CAST(400.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (35, 36, 6, NULL, CAST(900.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (36, 35, 5, NULL, CAST(700.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (37, 34, 4, NULL, CAST(500.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (38, 33, 3, NULL, CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (39, 32, 2, NULL, CAST(800.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (40, 31, 1, NULL, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:25.677' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (41, 40, 10, CAST(350.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (42, 39, 9, CAST(200.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (43, 38, 8, CAST(300.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (44, 37, 7, CAST(400.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (45, 36, 6, CAST(900.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (46, 35, 5, CAST(700.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (47, 34, 4, CAST(500.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (48, 33, 3, CAST(1200.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (49, 32, 2, CAST(800.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (50, 31, 1, CAST(1500.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (51, 30, 10, CAST(350.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (52, 29, 9, CAST(200.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (53, 28, 8, CAST(300.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (54, 27, 7, CAST(400.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (55, 26, 6, CAST(900.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (56, 25, 5, CAST(700.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (57, 24, 4, CAST(500.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (58, 23, 3, CAST(1200.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (59, 22, 2, CAST(800.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (60, 21, 1, CAST(1500.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (61, 20, 10, CAST(350.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (62, 19, 9, CAST(200.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (63, 18, 8, CAST(300.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (64, 17, 7, CAST(400.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (65, 16, 6, CAST(900.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (66, 15, 5, CAST(700.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (67, 14, 4, CAST(500.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (68, 13, 3, CAST(1200.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (69, 12, 2, CAST(800.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (70, 11, 1, CAST(1500.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (71, 10, 1, CAST(300.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (72, 9, 2, CAST(360.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (73, 8, 3, CAST(210.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (74, 7, 4, CAST(240.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (75, 6, 5, CAST(290.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (76, 5, 1, CAST(315.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (77, 4, 6, CAST(145.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (78, 3, 2, CAST(240.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (79, 2, 3, CAST(265.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (80, 1, 7, CAST(220.00 AS Decimal(10, 2)), NULL, CAST(N'2025-05-21T15:35:38.180' AS DateTime), N'DELETE', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (81, 50, 10, NULL, CAST(350.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (82, 49, 9, NULL, CAST(200.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (83, 48, 8, NULL, CAST(300.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (84, 47, 7, NULL, CAST(400.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (85, 46, 6, NULL, CAST(900.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (86, 45, 5, NULL, CAST(700.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (87, 44, 4, NULL, CAST(500.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (88, 43, 3, NULL, CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (89, 42, 2, NULL, CAST(800.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
INSERT [dbo].[StorageAudit] ([ID], [StorageID], [ProductID], [OldAmount], [NewAmount], [ChangeDate], [ChangeType], [ChangedBy]) VALUES (90, 41, 1, NULL, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-05-21T15:35:56.367' AS DateTime), N'INSERT', N'DESKTOP-F8S6BVI\nekit')
SET IDENTITY_INSERT [dbo].[StorageAudit] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Equipmen__048A0008D72A9700]    Script Date: 21.05.2025 16:54:18 ******/
ALTER TABLE [dbo].[Equipment] ADD UNIQUE NONCLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MineralT__D4E7DFA8EFA15C82]    Script Date: 21.05.2025 16:54:18 ******/
ALTER TABLE [dbo].[MineralType] ADD UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Product__DD5A978A68719F6F]    Script Date: 21.05.2025 16:54:18 ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Storage] ADD  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[StorageAudit] ADD  DEFAULT (getdate()) FOR [ChangeDate]
GO
ALTER TABLE [dbo].[StorageAudit] ADD  DEFAULT (suser_sname()) FOR [ChangedBy]
GO
ALTER TABLE [dbo].[Extraction]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Extraction]  WITH CHECK ADD FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([ID])
GO
ALTER TABLE [dbo].[Extraction]  WITH CHECK ADD FOREIGN KEY([MiningZoneID])
REFERENCES [dbo].[MiningZone] ([ID])
GO
ALTER TABLE [dbo].[MiningZone]  WITH CHECK ADD FOREIGN KEY([MineralTypeID])
REFERENCES [dbo].[MineralType] ([ID])
GO
ALTER TABLE [dbo].[Processing]  WITH CHECK ADD FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([ID])
GO
ALTER TABLE [dbo].[Processing]  WITH CHECK ADD FOREIGN KEY([ExtractionID])
REFERENCES [dbo].[Extraction] ([ID])
GO
ALTER TABLE [dbo].[Processing]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CHECK  (([Position]='Laborer' OR [Position]='Manager' OR [Position]='Geologist' OR [Position]='Technician' OR [Position]='Operator'))
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD CHECK  (([Status]='Decommissioned' OR [Status]='Maintenance' OR [Status]='Active'))
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD CHECK  (([Type]='Drill' OR [Type]='Loader' OR [Type]='Mill' OR [Type]='Crusher' OR [Type]='Excavator'))
GO
ALTER TABLE [dbo].[Extraction]  WITH CHECK ADD CHECK  (([Volume]>(0)))
GO
ALTER TABLE [dbo].[Extraction]  WITH CHECK ADD CHECK  (([Weight]>(0)))
GO
ALTER TABLE [dbo].[MiningZone]  WITH CHECK ADD CHECK  (([Status]='Depleted' OR [Status]='Planned' OR [Status]='Active'))
GO
ALTER TABLE [dbo].[Processing]  WITH CHECK ADD CHECK  (([InputAmount]>(0)))
GO
ALTER TABLE [dbo].[Processing]  WITH CHECK ADD CHECK  (([OutputAmount]>(0)))
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD CHECK  (([Amount]>(0)))
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD CHECK  (([Amount]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [careeer] SET  READ_WRITE 
GO
