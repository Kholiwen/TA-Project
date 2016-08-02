USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 03-Aug-16 3:08:44 AM ******/
CREATE DATABASE [CSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XLW_MSSQLSERVER\MSSQL\DATA\CSS.mdf' , SIZE = 8384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XLW_MSSQLSERVER\MSSQL\DATA\CSS_log.ldf' , SIZE = 36288KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CSS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CSS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CSS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CSS] SET  MULTI_USER 
GO
ALTER DATABASE [CSS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CSS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CSS', N'ON'
GO
USE [CSS]
GO
/****** Object:  Table [dbo].[clusterResult]    Script Date: 03-Aug-16 3:08:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clusterResult](
	[clusterIndex] [smallint] NOT NULL,
	[recencyDOM] [float] NOT NULL,
	[frequencyDOM] [float] NOT NULL,
	[monetaryDOM] [float] NOT NULL,
	[rfmScore] [float] NOT NULL,
	[clusterSegment] [nvarchar](50) NOT NULL,
	[segmentID] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 03-Aug-16 3:08:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[CID] [nchar](16) NOT NULL,
	[customerName] [nvarchar](max) NOT NULL,
	[Frequency] [int] NOT NULL,
	[totalPurchase] [float] NOT NULL,
	[lastPurchase] [datetime] NOT NULL,
	[clusterIndex] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historyDetail]    Script Date: 03-Aug-16 3:08:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historyDetail](
	[historyID] [nchar](5) NOT NULL,
	[clusterIndex] [smallint] NOT NULL,
	[recencyCentroid] [float] NOT NULL,
	[frequencyCentroid] [float] NOT NULL,
	[monetaryCentroid] [float] NOT NULL,
	[recencyDOM] [float] NOT NULL,
	[frequencyDOM] [float] NOT NULL,
	[monetaryDOM] [float] NOT NULL,
	[rfmScore] [float] NULL,
	[clusterSegment] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historyIndex]    Script Date: 03-Aug-16 3:08:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historyIndex](
	[historyID] [nchar](5) NOT NULL,
	[processDate] [datetime] NOT NULL,
	[clusterSize] [int] NOT NULL,
	[totalRecord] [int] NOT NULL,
	[period] [int] NOT NULL,
	[fuzzyProcessTime] [time](7) NULL,
	[MPCScore] [float] NULL,
	[fuzzyRFMTime] [time](7) NULL,
 CONSTRAINT [PK_historyIndex] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[segmentStrategy]    Script Date: 03-Aug-16 3:08:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[segmentStrategy](
	[segmentID] [smallint] NOT NULL,
	[segmentName] [nvarchar](50) NOT NULL,
	[Strategy] [text] NULL,
 CONSTRAINT [PK_segmentStrategy] PRIMARY KEY CLUSTERED 
(
	[segmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transaction]    Script Date: 03-Aug-16 3:08:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[TID] [nchar](8) NOT NULL,
	[customerName] [nvarchar](max) NOT NULL,
	[purchaseAmount] [float] NOT NULL,
	[purchaseDate] [datetime] NOT NULL,
	[CID] [nchar](16) NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (1, 1, 0.803468477549389, 1, 0.8963640318249, N'Dormant Customer 15', 6)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (2, 1, 0.591194249000534, 1, 0.768891571679996, N'Dormant Customer 9', 6)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (3, 1, 0.749870323172898, 1, 0.865950531596868, N'Typical Customer 11', 3)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (4, 0.788799363372107, 1, 0.803962085158706, 0.796344637043848, N'Typical Customer 13', 3)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (5, 1, 0.569287571067841, 1, 0.754511478420203, N'Dormant Customer 15', 6)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 1, 13.7371755516688, 1.19653152245061, 67032.3913943742, 1, 0.803468477549389, 1, 0.8963640318249, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 2, 12.268304203859, 1.59119424900053, 621128.416907882, 1, 0.591194249000534, 1, 0.768891571679996, N'Dormant Customer 9')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 3, 9.46933275664708, 3.2501296768271, 2360778.40902668, 1, 0.749870323172898, 1, 0.865950531596868, N'Typical Customer 11')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 4, 11.2112006366279, 2.08974241046293, 1196037.91484129, 0.788799363372107, 1, 0.803962085158706, 0.796344637043848, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 5, 12.5297147252242, 1.43071242893216, 276491.921592597, 1, 0.569287571067841, 1, 0.754511478420203, N'Dormant Customer 15')
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0001', CAST(N'2016-08-03 03:05:06.997' AS DateTime), 5, 2999, 1, CAST(N'00:00:21.0352031' AS Time), 0.76801110935481, CAST(N'00:00:00.9270530' AS Time))
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (1, N'Superstar', N'Give reward & recognition for excellent customer|Special discount offer monthly|Special treatment at the store|
Priority updates on new product released')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (2, N'Golden', N'Special discount offer every month|Special treatment at the store|Priority updates on new product')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (3, N'Typical', N'Upselling & cross-selling with similar item')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (4, N'Occasional', N'Extra discount after certain amount of purchase|Give updates of products daily')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (5, N'Everyday Shopper', N'Upselling & cross-selling with item bought daily')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (6, N'Dormant', N'Inform customer for new promotion by phone or email')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000001 ', N'DEASY HERLIANTY PERMANA M.,  MR.', 9854050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C001            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000002 ', N'A . SOFYAN RASAD,  MR.', 12869500, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C002            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000003 ', N'A DARMAWAN ACHMAD,  MR.', 23622050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C003            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000004 ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 5868500, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C004            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000005 ', N'ABDILLAH, MR.', 875500, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C005            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000006 ', N'ABDUL BASIT DALIMUNTHE,  MR.', 9850000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C006            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000007 ', N'ABDUL GANI,  MR.', 9553330, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C007            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000008 ', N'ABDUL HADI,  MR.', 50365120, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C008            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000009 ', N'ABDUL HAMID,  MR.', 18637500, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C009            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000010 ', N'ABDUL KADIR,  MR.', 2586500, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C010            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000011 ', N'ABDURRAHMAN ASSYURA,  MR.', 9550037, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C011            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000012 ', N'ACAI/KHAW TIEW CHAI,  MR.', 5520030, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C012            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000013 ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 820000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C013            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000014 ', N'ADIPRANA PAWENANG / RPT,  MR.', 8503350, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C014            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000015 ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 8598895, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C015            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000016 ', N'CINDY SARI DUHA,  MS.', 8960000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C016            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000017 ', N'DADANG PURNAMA,  MR.', 7500056, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C017            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000018 ', N'DANIEL GUANARDY,  MR.', 5600035, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C018            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000019 ', N'DAVID TAMBUNAN,  MR.', 7850699, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C019            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000020 ', N'DEDY SUWANDI,  MR.', 8500665, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C020            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000021 ', N'DESI MAHANANI RAHAYU,  MRS.', 7850000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C021            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000022 ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 5600050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C022            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000023 ', N'DR DONALD PARDEDE,  MR.', 4589005, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C023            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000024 ', N'DRG KUSMALA DEWI,  MRS.', 8506050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C024            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000025 ', N'EDDY SANTOSO,  MR.', 7850000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C025            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000026 ', N'ELENE LIM,  MRS.', 5000000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C026            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000027 ', N'DEASY HERLIANTY PERMANA M.,  MR', 4000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C027            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000028 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 3000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C028            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000029 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 2000000, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C029            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000030 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 1000000, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C030            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000031 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 10000000, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C031            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000032 ', N'ABDILLAH,   - ,', 11000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C032            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000033 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 12000000, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C033            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000034 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 13000000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C034            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000035 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 15000000, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C035            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000036 ', N'ABDUL GANI,   - ,', 16000000, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C036            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000037 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 17000000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C037            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000038 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 18000000, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C038            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000039 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 19000000, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C039            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000040 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 20000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C040            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000041 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 9500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C041            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000042 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 10500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C042            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000043 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 11500000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C043            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000044 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 12500000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C044            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000045 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 13500000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C045            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000046 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 14500000, CAST(N'2016-04-01 00:00:00.000' AS DateTime), N'C046            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000047 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 15500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C047            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000048 ', N'ABIYEN,  MR - ,', 16500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C048            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000049 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 17500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C049            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000050 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 18500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C050            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000051 ', N'ACUN / DEVIA,  MR. - ,', 19500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C051            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000052 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 20500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C052            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000053 ', N'ADANG,  MR. - ,', 21500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C053            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000054 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 22500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C054            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000055 ', N'ADE PUSPITA DEWI,  MS. - ,', 23500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C055            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000056 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 24500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C056            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000057 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 25500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C057            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000058 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 26500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C058            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000059 ', N'ADI / ANGGA,   - ,', 27500000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C059            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000060 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 35000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C060            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000061 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 34000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C061            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000062 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 33000000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C062            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000063 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 32000000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C063            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000064 ', N'DEASY HERLIANTY PERMANA M.,  MR', 31000000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C064            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000065 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 30000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C065            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000066 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 29000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C066            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000067 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 28000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C067            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000068 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 5600000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C068            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000069 ', N'ABDILLAH,   - ,', 6500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C069            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000070 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C070            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000071 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7700000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C071            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000072 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 7800000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C072            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000073 ', N'ABDUL GANI,   - ,', 9000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C073            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000074 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 21000000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C074            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000075 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 4000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C075            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000076 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 3000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C076            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000077 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 2000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C077            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000078 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 1000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C078            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000079 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 550000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C079            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000080 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 950000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C080            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000081 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 8800000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C081            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000082 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 17000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C082            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000083 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 12000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C083            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000084 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 12500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C084            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000085 ', N'ABIYEN,  MR - ,', 13000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C085            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000086 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C086            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000087 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C087            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000088 ', N'ACUN / DEVIA,  MR. - ,', 15000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C088            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000089 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 15500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C089            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000090 ', N'ADANG,  MR. - ,', 13500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C090            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000091 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 2500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C091            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000092 ', N'ADE PUSPITA DEWI,  MS. - ,', 2850000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C092            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000093 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 5750000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C093            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000094 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 9500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C094            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000095 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 19000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C095            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000096 ', N'ADI / ANGGA,   - ,', 24500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C096            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000097 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 8500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C097            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000098 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 18000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C098            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000099 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 17000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C099            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000100 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 5000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C100            ')
GO
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000101 ', N'DEASY HERLIANTY PERMANA M.,  MR.', 9854050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C001            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000102 ', N'A . SOFYAN RASAD,  MR.', 12869500, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C002            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000103 ', N'A DARMAWAN ACHMAD,  MR.', 23622050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C003            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000104 ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 5868500, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C004            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000105 ', N'ABDILLAH, MR.', 875500, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C005            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000106 ', N'ABDUL BASIT DALIMUNTHE,  MR.', 9850000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C006            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000107 ', N'ABDUL GANI,  MR.', 9553330, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C007            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000108 ', N'ABDUL HADI,  MR.', 50365120, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C008            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000109 ', N'ABDUL HAMID,  MR.', 18637500, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C009            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000110 ', N'ABDUL KADIR,  MR.', 2586500, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C010            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000111 ', N'ABDURRAHMAN ASSYURA,  MR.', 9550037, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C011            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000112 ', N'ACAI/KHAW TIEW CHAI,  MR.', 5520030, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C012            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000113 ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 820000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C013            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000114 ', N'ADIPRANA PAWENANG / RPT,  MR.', 8503350, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C014            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000115 ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 8598895, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C015            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000116 ', N'CINDY SARI DUHA,  MS.', 8960000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C016            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000117 ', N'DADANG PURNAMA,  MR.', 7500056, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C017            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000118 ', N'DANIEL GUANARDY,  MR.', 5600035, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C018            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000119 ', N'DAVID TAMBUNAN,  MR.', 7850699, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C019            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000120 ', N'DEDY SUWANDI,  MR.', 8500665, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C020            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000121 ', N'DESI MAHANANI RAHAYU,  MRS.', 7850000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C021            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000122 ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 5600050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C022            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000123 ', N'DR DONALD PARDEDE,  MR.', 4589005, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C023            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000124 ', N'DRG KUSMALA DEWI,  MRS.', 8506050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C024            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000125 ', N'EDDY SANTOSO,  MR.', 7850000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C025            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000126 ', N'ELENE LIM,  MRS.', 5000000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C026            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000127 ', N'DEASY HERLIANTY PERMANA M.,  MR', 4000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C027            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000128 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 3000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C028            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000129 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 2000000, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C029            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000130 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 1000000, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C030            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000131 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 10000000, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C031            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000132 ', N'ABDILLAH,   - ,', 11000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C032            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000133 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 12000000, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C033            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000134 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 13000000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C034            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000135 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 15000000, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C035            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000136 ', N'ABDUL GANI,   - ,', 16000000, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C036            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000137 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 17000000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C037            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000138 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 18000000, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C038            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000139 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 19000000, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C039            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000140 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 20000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C040            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000141 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 9500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C041            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000142 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 10500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C042            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000143 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 11500000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C043            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000144 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 12500000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C044            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000145 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 13500000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C045            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000146 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 14500000, CAST(N'2016-04-01 00:00:00.000' AS DateTime), N'C046            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000147 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 15500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C047            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000148 ', N'ABIYEN,  MR - ,', 16500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C048            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000149 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 17500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C049            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000150 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 18500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C050            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000151 ', N'ACUN / DEVIA,  MR. - ,', 19500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C051            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000152 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 20500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C052            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000153 ', N'ADANG,  MR. - ,', 21500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C053            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000154 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 22500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C054            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000155 ', N'ADE PUSPITA DEWI,  MS. - ,', 23500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C055            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000156 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 24500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C056            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000157 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 25500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C057            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000158 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 26500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C058            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000159 ', N'ADI / ANGGA,   - ,', 27500000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C059            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000160 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 35000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C060            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000161 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 34000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C061            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000162 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 33000000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C062            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000163 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 32000000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C063            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000164 ', N'DEASY HERLIANTY PERMANA M.,  MR', 31000000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C064            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000165 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 30000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C065            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000166 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 29000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C066            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000167 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 28000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C067            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000168 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 5600000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C068            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000169 ', N'ABDILLAH,   - ,', 6500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C069            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000170 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C070            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000171 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7700000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C071            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000172 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 7800000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C072            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000173 ', N'ABDUL GANI,   - ,', 9000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C073            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000174 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 21000000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C074            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000175 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 4000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C075            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000176 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 3000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C076            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000177 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 2000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C077            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000178 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 1000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C078            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000179 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 550000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C079            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000180 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 950000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C080            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000181 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 8800000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C081            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000182 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 17000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C082            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000183 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 12000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C083            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000184 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 12500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C084            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000185 ', N'ABIYEN,  MR - ,', 13000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C085            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000186 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C086            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000187 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C087            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000188 ', N'ACUN / DEVIA,  MR. - ,', 15000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C088            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000189 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 15500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C089            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000190 ', N'ADANG,  MR. - ,', 13500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C090            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000191 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 2500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C091            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000192 ', N'ADE PUSPITA DEWI,  MS. - ,', 2850000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C092            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000193 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 5750000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C093            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000194 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 9500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C094            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000195 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 19000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C095            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000196 ', N'ADI / ANGGA,   - ,', 24500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C096            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000197 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 8500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C097            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000198 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 18000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C098            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000199 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 17000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C099            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000200 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 5000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C100            ')
GO
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000201 ', N'DEASY HERLIANTY PERMANA M.,  MR.', 9854050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C001            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000202 ', N'A . SOFYAN RASAD,  MR.', 12869500, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C002            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000203 ', N'A DARMAWAN ACHMAD,  MR.', 23622050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C003            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000204 ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 5868500, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C004            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000205 ', N'ABDILLAH, MR.', 875500, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C005            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000206 ', N'ABDUL BASIT DALIMUNTHE,  MR.', 9850000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C006            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000207 ', N'ABDUL GANI,  MR.', 9553330, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C007            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000208 ', N'ABDUL HADI,  MR.', 50365120, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C008            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000209 ', N'ABDUL HAMID,  MR.', 18637500, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C009            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000210 ', N'ABDUL KADIR,  MR.', 2586500, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C010            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000211 ', N'ABDURRAHMAN ASSYURA,  MR.', 9550037, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C011            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000212 ', N'ACAI/KHAW TIEW CHAI,  MR.', 5520030, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C012            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000213 ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 820000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C013            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000214 ', N'ADIPRANA PAWENANG / RPT,  MR.', 8503350, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C014            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000215 ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 8598895, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C015            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000216 ', N'CINDY SARI DUHA,  MS.', 8960000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C016            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000217 ', N'DADANG PURNAMA,  MR.', 7500056, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C017            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000218 ', N'DANIEL GUANARDY,  MR.', 5600035, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C018            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000219 ', N'DAVID TAMBUNAN,  MR.', 7850699, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C019            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000220 ', N'DEDY SUWANDI,  MR.', 8500665, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C020            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000221 ', N'DESI MAHANANI RAHAYU,  MRS.', 7850000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C021            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000222 ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 5600050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C022            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000223 ', N'DR DONALD PARDEDE,  MR.', 4589005, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C023            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000224 ', N'DRG KUSMALA DEWI,  MRS.', 8506050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C024            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000225 ', N'EDDY SANTOSO,  MR.', 7850000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C025            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000226 ', N'ELENE LIM,  MRS.', 5000000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C026            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000227 ', N'DEASY HERLIANTY PERMANA M.,  MR', 4000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C027            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000228 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 3000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C028            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000229 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 2000000, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C029            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000230 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 1000000, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C030            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000231 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 10000000, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C031            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000232 ', N'ABDILLAH,   - ,', 11000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C032            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000233 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 12000000, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C033            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000234 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 13000000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C034            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000235 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 15000000, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C035            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000236 ', N'ABDUL GANI,   - ,', 16000000, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C036            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000237 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 17000000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C037            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000238 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 18000000, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C038            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000239 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 19000000, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C039            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000240 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 20000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C040            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000241 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 9500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C041            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000242 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 10500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C042            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000243 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 11500000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C043            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000244 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 12500000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C044            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000245 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 13500000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C045            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000246 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 14500000, CAST(N'2016-04-01 00:00:00.000' AS DateTime), N'C046            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000247 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 15500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C047            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000248 ', N'ABIYEN,  MR - ,', 16500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C048            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000249 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 17500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C049            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000250 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 18500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C050            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000251 ', N'ACUN / DEVIA,  MR. - ,', 19500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C051            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000252 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 20500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C052            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000253 ', N'ADANG,  MR. - ,', 21500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C053            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000254 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 22500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C054            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000255 ', N'ADE PUSPITA DEWI,  MS. - ,', 23500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C055            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000256 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 24500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C056            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000257 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 25500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C057            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000258 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 26500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C058            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000259 ', N'ADI / ANGGA,   - ,', 27500000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C059            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000260 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 35000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C060            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000261 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 34000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C061            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000262 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 33000000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C062            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000263 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 32000000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C063            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000264 ', N'DEASY HERLIANTY PERMANA M.,  MR', 31000000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C064            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000265 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 30000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C065            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000266 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 29000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C066            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000267 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 28000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C067            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000268 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 5600000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C068            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000269 ', N'ABDILLAH,   - ,', 6500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C069            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000270 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C070            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000271 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7700000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C071            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000272 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 7800000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C072            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000273 ', N'ABDUL GANI,   - ,', 9000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C073            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000274 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 21000000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C074            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000275 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 4000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C075            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000276 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 3000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C076            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000277 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 2000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C077            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000278 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 1000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C078            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000279 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 550000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C079            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000280 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 950000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C080            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000281 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 8800000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C081            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000282 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 17000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C082            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000283 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 12000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C083            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000284 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 12500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C084            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000285 ', N'ABIYEN,  MR - ,', 13000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C085            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000286 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C086            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000287 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C087            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000288 ', N'ACUN / DEVIA,  MR. - ,', 15000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C088            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000289 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 15500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C089            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000290 ', N'ADANG,  MR. - ,', 13500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C090            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000291 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 2500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C091            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000292 ', N'ADE PUSPITA DEWI,  MS. - ,', 2850000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C092            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000293 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 5750000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C093            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000294 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 9500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C094            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000295 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 19000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C095            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000296 ', N'ADI / ANGGA,   - ,', 24500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C096            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000297 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 8500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C097            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000298 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 18000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C098            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000299 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 17000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C099            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000300 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 5000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C100            ')
GO
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000301 ', N'DEASY HERLIANTY PERMANA M.,  MR.', 9854050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C001            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000302 ', N'A . SOFYAN RASAD,  MR.', 12869500, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C002            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000303 ', N'A DARMAWAN ACHMAD,  MR.', 23622050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C003            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000304 ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 5868500, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C004            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000305 ', N'ABDILLAH, MR.', 875500, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C005            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000306 ', N'ABDUL BASIT DALIMUNTHE,  MR.', 9850000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C006            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000307 ', N'ABDUL GANI,  MR.', 9553330, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C007            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000308 ', N'ABDUL HADI,  MR.', 50365120, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C008            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000309 ', N'ABDUL HAMID,  MR.', 18637500, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C009            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000310 ', N'ABDUL KADIR,  MR.', 2586500, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C010            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000311 ', N'ABDURRAHMAN ASSYURA,  MR.', 9550037, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C011            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000312 ', N'ACAI/KHAW TIEW CHAI,  MR.', 5520030, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C012            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000313 ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 820000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C013            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000314 ', N'ADIPRANA PAWENANG / RPT,  MR.', 8503350, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C014            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000315 ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 8598895, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C015            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000316 ', N'CINDY SARI DUHA,  MS.', 8960000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C016            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000317 ', N'DADANG PURNAMA,  MR.', 7500056, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C017            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000318 ', N'DANIEL GUANARDY,  MR.', 5600035, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C018            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000319 ', N'DAVID TAMBUNAN,  MR.', 7850699, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C019            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000320 ', N'DEDY SUWANDI,  MR.', 8500665, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C020            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000321 ', N'DESI MAHANANI RAHAYU,  MRS.', 7850000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C021            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000322 ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 5600050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C022            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000323 ', N'DR DONALD PARDEDE,  MR.', 4589005, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C023            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000324 ', N'DRG KUSMALA DEWI,  MRS.', 8506050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C024            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000325 ', N'EDDY SANTOSO,  MR.', 7850000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C025            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000326 ', N'ELENE LIM,  MRS.', 5000000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C026            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000327 ', N'DEASY HERLIANTY PERMANA M.,  MR', 4000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C027            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000328 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 3000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C028            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000329 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 2000000, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C029            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000330 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 1000000, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C030            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000331 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 10000000, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C031            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000332 ', N'ABDILLAH,   - ,', 11000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C032            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000333 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 12000000, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C033            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000334 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 13000000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C034            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000335 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 15000000, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C035            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000336 ', N'ABDUL GANI,   - ,', 16000000, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C036            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000337 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 17000000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C037            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000338 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 18000000, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C038            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000339 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 19000000, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C039            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000340 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 20000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C040            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000341 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 9500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C041            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000342 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 10500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C042            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000343 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 11500000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C043            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000344 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 12500000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C044            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000345 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 13500000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C045            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000346 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 14500000, CAST(N'2016-04-01 00:00:00.000' AS DateTime), N'C046            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000347 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 15500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C047            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000348 ', N'ABIYEN,  MR - ,', 16500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C048            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000349 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 17500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C049            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000350 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 18500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C050            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000351 ', N'ACUN / DEVIA,  MR. - ,', 19500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C051            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000352 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 20500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C052            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000353 ', N'ADANG,  MR. - ,', 21500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C053            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000354 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 22500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C054            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000355 ', N'ADE PUSPITA DEWI,  MS. - ,', 23500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C055            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000356 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 24500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C056            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000357 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 25500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C057            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000358 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 26500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C058            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000359 ', N'ADI / ANGGA,   - ,', 27500000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C059            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000360 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 35000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C060            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000361 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 34000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C061            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000362 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 33000000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C062            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000363 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 32000000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C063            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000364 ', N'DEASY HERLIANTY PERMANA M.,  MR', 31000000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C064            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000365 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 30000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C065            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000366 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 29000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C066            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000367 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 28000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C067            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000368 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 5600000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C068            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000369 ', N'ABDILLAH,   - ,', 6500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C069            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000370 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C070            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000371 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7700000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C071            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000372 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 7800000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C072            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000373 ', N'ABDUL GANI,   - ,', 9000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C073            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000374 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 21000000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C074            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000375 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 4000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C075            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000376 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 3000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C076            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000377 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 2000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C077            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000378 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 1000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C078            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000379 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 550000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C079            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000380 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 950000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C080            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000381 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 8800000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C081            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000382 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 17000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C082            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000383 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 12000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C083            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000384 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 12500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C084            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000385 ', N'ABIYEN,  MR - ,', 13000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C085            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000386 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C086            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000387 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C087            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000388 ', N'ACUN / DEVIA,  MR. - ,', 15000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C088            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000389 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 15500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C089            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000390 ', N'ADANG,  MR. - ,', 13500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C090            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000391 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 2500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C091            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000392 ', N'ADE PUSPITA DEWI,  MS. - ,', 2850000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C092            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000393 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 5750000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C093            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000394 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 9500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C094            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000395 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 19000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C095            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000396 ', N'ADI / ANGGA,   - ,', 24500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C096            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000397 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 8500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C097            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000398 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 18000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C098            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000399 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 17000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C099            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000400 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 5000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C100            ')
GO
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000401 ', N'DEASY HERLIANTY PERMANA M.,  MR.', 9854050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C001            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000402 ', N'A . SOFYAN RASAD,  MR.', 12869500, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C002            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000403 ', N'A DARMAWAN ACHMAD,  MR.', 23622050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C003            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000404 ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 5868500, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C004            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000405 ', N'ABDILLAH, MR.', 875500, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C005            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000406 ', N'ABDUL BASIT DALIMUNTHE,  MR.', 9850000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C006            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000407 ', N'ABDUL GANI,  MR.', 9553330, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C007            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000408 ', N'ABDUL HADI,  MR.', 50365120, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C008            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000409 ', N'ABDUL HAMID,  MR.', 18637500, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C009            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000410 ', N'ABDUL KADIR,  MR.', 2586500, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C010            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000411 ', N'ABDURRAHMAN ASSYURA,  MR.', 9550037, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C011            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000412 ', N'ACAI/KHAW TIEW CHAI,  MR.', 5520030, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C012            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000413 ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 820000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C013            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000414 ', N'ADIPRANA PAWENANG / RPT,  MR.', 8503350, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C014            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000415 ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 8598895, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C015            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000416 ', N'CINDY SARI DUHA,  MS.', 8960000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C016            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000417 ', N'DADANG PURNAMA,  MR.', 7500056, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C017            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000418 ', N'DANIEL GUANARDY,  MR.', 5600035, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C018            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000419 ', N'DAVID TAMBUNAN,  MR.', 7850699, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C019            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000420 ', N'DEDY SUWANDI,  MR.', 8500665, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C020            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000421 ', N'DESI MAHANANI RAHAYU,  MRS.', 7850000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C021            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000422 ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 5600050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C022            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000423 ', N'DR DONALD PARDEDE,  MR.', 4589005, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C023            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000424 ', N'DRG KUSMALA DEWI,  MRS.', 8506050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C024            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000425 ', N'EDDY SANTOSO,  MR.', 7850000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C025            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000426 ', N'ELENE LIM,  MRS.', 5000000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C026            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000427 ', N'DEASY HERLIANTY PERMANA M.,  MR', 4000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C027            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000428 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 3000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C028            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000429 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 2000000, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C029            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000430 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 1000000, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C030            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000431 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 10000000, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C031            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000432 ', N'ABDILLAH,   - ,', 11000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C032            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000433 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 12000000, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C033            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000434 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 13000000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C034            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000435 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 15000000, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C035            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000436 ', N'ABDUL GANI,   - ,', 16000000, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C036            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000437 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 17000000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C037            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000438 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 18000000, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C038            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000439 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 19000000, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C039            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000440 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 20000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C040            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000441 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 9500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C041            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000442 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 10500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C042            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000443 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 11500000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C043            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000444 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 12500000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C044            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000445 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 13500000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C045            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000446 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 14500000, CAST(N'2016-04-01 00:00:00.000' AS DateTime), N'C046            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000447 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 15500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C047            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000448 ', N'ABIYEN,  MR - ,', 16500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C048            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000449 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 17500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C049            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000450 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 18500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C050            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000451 ', N'ACUN / DEVIA,  MR. - ,', 19500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C051            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000452 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 20500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C052            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000453 ', N'ADANG,  MR. - ,', 21500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C053            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000454 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 22500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C054            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000455 ', N'ADE PUSPITA DEWI,  MS. - ,', 23500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C055            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000456 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 24500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C056            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000457 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 25500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C057            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000458 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 26500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C058            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000459 ', N'ADI / ANGGA,   - ,', 27500000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C059            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000460 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 35000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C060            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000461 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 34000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C061            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000462 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 33000000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C062            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000463 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 32000000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C063            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000464 ', N'DEASY HERLIANTY PERMANA M.,  MR', 31000000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C064            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000465 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 30000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C065            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000466 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 29000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C066            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000467 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 28000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C067            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000468 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 5600000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C068            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000469 ', N'ABDILLAH,   - ,', 6500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C069            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000470 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C070            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000471 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7700000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C071            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000472 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 7800000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C072            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000473 ', N'ABDUL GANI,   - ,', 9000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C073            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000474 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 21000000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C074            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000475 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 4000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C075            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000476 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 3000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C076            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000477 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 2000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C077            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000478 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 1000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C078            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000479 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 550000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C079            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000480 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 950000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C080            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000481 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 8800000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C081            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000482 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 17000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C082            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000483 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 12000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C083            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000484 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 12500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C084            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000485 ', N'ABIYEN,  MR - ,', 13000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C085            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000486 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C086            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000487 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 14500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C087            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000488 ', N'ACUN / DEVIA,  MR. - ,', 15000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C088            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000489 ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 15500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C089            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000490 ', N'ADANG,  MR. - ,', 13500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C090            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000491 ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 2500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C091            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000492 ', N'ADE PUSPITA DEWI,  MS. - ,', 2850000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C092            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000493 ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 5750000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C093            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000494 ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 9500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C094            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000495 ', N'ADHITYA PRATAMA,  MR. - REF BY W', 19000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C095            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000496 ', N'ADI / ANGGA,   - ,', 24500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C096            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000497 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 8500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C097            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000498 ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 18000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C098            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000499 ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 17000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C099            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000500 ', N'ADIPRANA PAWENANG / RPT,  MR - J', 5000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C100            ')
GO
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000501 ', N'DEASY HERLIANTY PERMANA M.,  MR.', 9854050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C001            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000502 ', N'A . SOFYAN RASAD,  MR.', 12869500, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C002            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000503 ', N'A DARMAWAN ACHMAD,  MR.', 23622050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C003            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000504 ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 5868500, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C004            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000505 ', N'ABDILLAH, MR.', 875500, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C005            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000506 ', N'ABDUL BASIT DALIMUNTHE,  MR.', 9850000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C006            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000507 ', N'ABDUL GANI,  MR.', 9553330, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C007            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000508 ', N'ABDUL HADI,  MR.', 50365120, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C008            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000509 ', N'ABDUL HAMID,  MR.', 18637500, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C009            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000510 ', N'ABDUL KADIR,  MR.', 2586500, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C010            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000511 ', N'ABDURRAHMAN ASSYURA,  MR.', 9550037, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C011            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000512 ', N'ACAI/KHAW TIEW CHAI,  MR.', 5520030, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C012            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000513 ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 820000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C013            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000514 ', N'ADIPRANA PAWENANG / RPT,  MR.', 8503350, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C014            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000515 ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 8598895, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C015            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000516 ', N'CINDY SARI DUHA,  MS.', 8960000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C016            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000517 ', N'DADANG PURNAMA,  MR.', 7500056, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C017            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000518 ', N'DANIEL GUANARDY,  MR.', 5600035, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C018            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000519 ', N'DAVID TAMBUNAN,  MR.', 7850699, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C019            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000520 ', N'DEDY SUWANDI,  MR.', 8500665, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C020            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000521 ', N'DESI MAHANANI RAHAYU,  MRS.', 7850000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C021            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000522 ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 5600050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), N'C022            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000523 ', N'DR DONALD PARDEDE,  MR.', 4589005, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C023            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000524 ', N'DRG KUSMALA DEWI,  MRS.', 8506050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C024            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000525 ', N'EDDY SANTOSO,  MR.', 7850000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C025            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000526 ', N'ELENE LIM,  MRS.', 5000000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), N'C026            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000527 ', N'DEASY HERLIANTY PERMANA M.,  MR', 4000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), N'C027            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000528 ', N'A . SOFYAN RASAD,  MR - JL MELAT', 3000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), N'C028            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000529 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 2000000, CAST(N'2016-05-09 00:00:00.000' AS DateTime), N'C029            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000530 ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 1000000, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'C030            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000531 ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 10000000, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'C031            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000532 ', N'ABDILLAH,   - ,', 11000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'C032            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000533 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 12000000, CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'C033            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000534 ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 13000000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'C034            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000535 ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 15000000, CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'C035            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000536 ', N'ABDUL GANI,   - ,', 16000000, CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'C036            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000537 ', N'ABDUL HADI,  MR - JL. MERBABU NO', 17000000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'C037            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000538 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 18000000, CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'C038            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000539 ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 19000000, CAST(N'2016-04-29 00:00:00.000' AS DateTime), N'C039            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000540 ', N'ABDUL KADIR,  MR - DUSUN II DESA', 20000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), N'C040            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000541 ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 9500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), N'C041            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000542 ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 10500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), N'C042            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000543 ', N'ABDUL RAUF,  MR. - PERUM PESONA', 11500000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'C043            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000544 ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 12500000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'C044            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000545 ', N'ABDUL WAHID MAKTUB,  MR. - ,', 13500000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'C045            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000546 ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 14500000, CAST(N'2016-04-01 00:00:00.000' AS DateTime), N'C046            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000547 ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 15500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), N'C047            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000548 ', N'ABIYEN,  MR - ,', 16500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), N'C048            ')
INSERT [dbo].[transaction] ([TID], [customerName], [purchaseAmount], [purchaseDate], [CID]) VALUES (N'T000549 ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 17500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), N'C049            ')
/****** Object:  StoredProcedure [dbo].[SP_insertHistory]    Script Date: 03-Aug-16 3:08:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_insertHistory]
 @PROCDT DATETIME,
 @CLTR INT,
 @TOTAL INT,
 @PERIOD INT,
 @FUZZYCTIME TIME,
 @MPCSCORE FLOAT,
 @FUZZYRFMTIME TIME
AS
BEGIN
 /* Logic for Getting New ID as Per the NAME with PRE FIX */
 DECLARE @NEWID VARCHAR(5);
 DECLARE @PREFIX VARCHAR(1);
 SET @PREFIX = 'H'
 SELECT @NEWID = (@PREFIX + replicate('0', 4 - len(CONVERT(VARCHAR,N.OID + 1))) + CONVERT(VARCHAR,N.OID + 1)) FROM (
  SELECT CASE WHEN MAX(T.HID) IS null then 0 else MAX(T.HID) end as OID FROM (
   SELECT SUBSTRING(historyID, 1, 1) as PRE_FIX,SUBSTRING(historyID, 2, LEN(historyID)) as HID FROM historyIndex
  ) AS T WHERE T.PRE_FIX = @PREFIX
 ) AS N

 /* INSERT QUERY FOR NEW RECORD */
 INSERT INTO historyIndex VALUES (@NEWID,@PROCDT,@CLTR,@TOTAL,@PERIOD,@FUZZYCTIME,@MPCSCORE,@FUZZYRFMTIME)

END










GO
/****** Object:  StoredProcedure [dbo].[SP_insertTransaction]    Script Date: 03-Aug-16 3:08:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_insertTransaction]
 @NAME VARCHAR(MAX),
 @TOTAL FLOAT,
 @DT DATETIME,
 @CID NCHAR(16)
AS
BEGIN
 /* Logic for Getting New ID as Per the NAME with PRE FIX */
 DECLARE @NEWID VARCHAR(7);
 DECLARE @PREFIX VARCHAR(1);
 SET @PREFIX = 'T'
 SELECT @NEWID = (@PREFIX + replicate('0', 6 - len(CONVERT(VARCHAR,N.OID + 1))) + CONVERT(VARCHAR,N.OID + 1)+ CONVERT(VARCHAR,N.OID + 1)+ CONVERT(VARCHAR,N.OID + 1)) FROM (
  SELECT CASE WHEN MAX(T.TID) IS null then 0 else MAX(T.TID) end as OID FROM (
   SELECT SUBSTRING(TID, 1, 1) as PRE_FIX,SUBSTRING(TID, 2, LEN(TID)) as TID FROM [transaction]
  ) AS T WHERE T.PRE_FIX = @PREFIX
 ) AS N

 /* INSERT QUERY FOR NEW RECORD */
 INSERT INTO [transaction] VALUES (@NEWID,@NAME,@TOTAL,@DT,@CID)

END










GO
USE [master]
GO
ALTER DATABASE [CSS] SET  READ_WRITE 
GO
