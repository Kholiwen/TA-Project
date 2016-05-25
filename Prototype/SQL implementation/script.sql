USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 5/25/2016 11:02:12 PM ******/
CREATE DATABASE [CSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CSS.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CSS_log.ldf' , SIZE = 2880KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CSS] SET COMPATIBILITY_LEVEL = 120
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
USE [CSS]
GO
/****** Object:  Table [dbo].[clusterResult]    Script Date: 5/25/2016 11:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clusterResult](
	[clusterIndex] [smallint] NOT NULL,
	[recencyCentroid] [float] NOT NULL,
	[frequencyCentroid] [float] NOT NULL,
	[monetaryCentroid] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[custClass]    Script Date: 5/25/2016 11:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custClass](
	[cType] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dataTable]    Script Date: 5/25/2016 11:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataTable](
	[CID] [nchar](10) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Frequency] [int] NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NULL,
	[Cluster] [int] NULL,
	[Segment] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prepTable]    Script Date: 5/25/2016 11:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prepTable](
	[CID] [nchar](10) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Frequency] [int] NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NULL,
	[Cluster] [int] NULL,
	[Segment] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid]) VALUES (1, 1, 0.522221236635783, 1)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid]) VALUES (2, 1, 1, 1)
INSERT [dbo].[custClass] ([cType]) VALUES (N'Superstar')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Golden Customer')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Typical Customer')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Occational Customer')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Everyday Shopper')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Dormant Customer')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000001   ', N'ABDUL HADI,  MR - JL. MERBABU NO', 39, 21000000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000002   ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 2, 4000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000003   ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 34, 3000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000004   ', N'ABDUL KADIR,  MR - DUSUN II DESA', 45, 2000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000005   ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 34, 1000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000006   ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 45, 550000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000007   ', N'ABDUL RAUF,  MR. - PERUM PESONA', 32, 950000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000008   ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 31, 8800000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000009   ', N'ABDUL WAHID MAKTUB,  MR. - ,', 28, 17000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000010   ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 28, 12000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000011   ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 27, 12500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000012   ', N'ABIYEN,  MR - ,', 25, 13000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000013   ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 23, 14000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000014   ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 23, 14500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000015   ', N'ACUN / DEVIA,  MR. - ,', 19, 15000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000016   ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 15, 15500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000017   ', N'ADANG,  MR. - ,', 16, 13500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000018   ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 17, 2500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000019   ', N'ADE PUSPITA DEWI,  MS. - ,', 10, 2850000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000020   ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 2, 5750000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000021   ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 5, 9500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000022   ', N'ADHITYA PRATAMA,  MR. - REF BY W', 3, 19000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000023   ', N'ADI / ANGGA,   - ,', 2, 24500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000024   ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 1, 8500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000025   ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 1, 18000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000026   ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 24, 17000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000027   ', N'ADIPRANA PAWENANG / RPT,  MR - J', 5, 5000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000028   ', N'DEASY HERLIANTY PERMANA M.,  MR.', 20, 9854050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000029   ', N'A . SOFYAN RASAD,  MR.', 30, 12869500, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000030   ', N'A DARMAWAN ACHMAD,  MR.', 10, 23622050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000031   ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 5, 5868500, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000032   ', N'ABDILLAH, MR.', 11, 875500, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000033   ', N'ABDUL BASIT DALIMUNTHE,  MR.', 20, 9850000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000034   ', N'ABDUL GANI,  MR.', 40, 9553330, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000035   ', N'ABDUL HADI,  MR.', 50, 50365120, CAST(N'2016-05-09 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000036   ', N'ABDUL HAMID,  MR.', 55, 18637500, CAST(N'2016-05-08 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000037   ', N'ABDUL KADIR,  MR.', 15, 2586500, CAST(N'2016-05-07 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000038   ', N'ABDURRAHMAN ASSYURA,  MR.', 75, 9550037, CAST(N'2016-05-06 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000039   ', N'ACAI/KHAW TIEW CHAI,  MR.', 12, 5520030, CAST(N'2016-05-05 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000040   ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 15, 820000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000041   ', N'ADIPRANA PAWENANG / RPT,  MR.', 4, 8503350, CAST(N'2016-05-03 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000042   ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 2, 8598895, CAST(N'2016-05-02 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000043   ', N'CINDY SARI DUHA,  MS.', 15, 8960000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000044   ', N'DADANG PURNAMA,  MR.', 8, 7500056, CAST(N'2016-04-30 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000045   ', N'DANIEL GUANARDY,  MR.', 9, 5600035, CAST(N'2016-04-29 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000046   ', N'DAVID TAMBUNAN,  MR.', 40, 7850699, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000047   ', N'DEDY SUWANDI,  MR.', 49, 8500665, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000048   ', N'DESI MAHANANI RAHAYU,  MRS.', 99, 7850000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000049   ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 23, 5600050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000050   ', N'DR DONALD PARDEDE,  MR.', 4, 4589005, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000051   ', N'DRG KUSMALA DEWI,  MRS.', 34, 8506050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000052   ', N'EDDY SANTOSO,  MR.', 35, 7850000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000053   ', N'ELENE LIM,  MRS.', 55, 5000000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000054   ', N'DEASY HERLIANTY PERMANA M.,  MR', 21, 4000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000055   ', N'A . SOFYAN RASAD,  MR - JL MELAT', 23, 3000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000056   ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 32, 2000000, CAST(N'2016-05-09 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000057   ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 38, 1000000, CAST(N'2016-05-08 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000058   ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 29, 10000000, CAST(N'2016-05-07 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000059   ', N'ABDILLAH,   - ,', 29, 11000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000060   ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 10, 12000000, CAST(N'2016-05-05 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000061   ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 10, 13000000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000062   ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 22, 15000000, CAST(N'2016-05-03 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000063   ', N'ABDUL GANI,   - ,', 33, 16000000, CAST(N'2016-05-02 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000064   ', N'ABDUL HADI,  MR - JL. MERBABU NO', 49, 17000000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000065   ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 85, 18000000, CAST(N'2016-04-30 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000066   ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 34, 19000000, CAST(N'2016-04-29 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000067   ', N'ABDUL KADIR,  MR - DUSUN II DESA', 55, 20000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000068   ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 44, 9500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000069   ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 33, 10500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000070   ', N'ABDUL RAUF,  MR. - PERUM PESONA', 22, 11500000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000071   ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 11, 12500000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000072   ', N'ABDUL WAHID MAKTUB,  MR. - ,', 34, 13500000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000073   ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 43, 14500000, CAST(N'2016-04-01 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000074   ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 45, 15500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000075   ', N'ABIYEN,  MR - ,', 46, 16500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000076   ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 32, 17500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000077   ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 31, 18500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000078   ', N'ACUN / DEVIA,  MR. - ,', 33, 19500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000079   ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 48, 20500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000080   ', N'ADANG,  MR. - ,', 39, 21500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000081   ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 8, 22500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000082   ', N'ADE PUSPITA DEWI,  MS. - ,', 3, 23500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000083   ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 9, 24500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000084   ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 6, 25500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000085   ', N'ADHITYA PRATAMA,  MR. - REF BY W', 3, 26500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000086   ', N'ADI / ANGGA,   - ,', 20, 27500000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000087   ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 9, 35000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000088   ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 30, 34000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000089   ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 39, 33000000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000090   ', N'ADIPRANA PAWENANG / RPT,  MR - J', 49, 32000000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000091   ', N'DEASY HERLIANTY PERMANA M.,  MR', 48, 31000000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000092   ', N'A . SOFYAN RASAD,  MR - JL MELAT', 47, 30000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000093   ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 28, 29000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000094   ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 23, 28000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000095   ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 22, 5600000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000096   ', N'ABDILLAH,   - ,', 23, 6500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000097   ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 5, 7500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000098   ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7, 7700000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000099   ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 23, 7800000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 1, N'Superstar 8')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000100   ', N'ABDUL GANI,   - ,', 35, 9000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 2, N'Dormant Customer 8')
GO
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000074   ', N'ABDUL HADI,  MR - JL. MERBABU NO', 39, 21000000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000075   ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 2, 4000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000076   ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 34, 3000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000077   ', N'ABDUL KADIR,  MR - DUSUN II DESA', 45, 2000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000078   ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 34, 1000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000079   ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 45, 550000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000080   ', N'ABDUL RAUF,  MR. - PERUM PESONA', 32, 950000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000081   ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 31, 8800000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000082   ', N'ABDUL WAHID MAKTUB,  MR. - ,', 28, 17000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000083   ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 28, 12000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000084   ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 27, 12500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000085   ', N'ABIYEN,  MR - ,', 25, 13000000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000086   ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 23, 14000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000087   ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 23, 14500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000088   ', N'ACUN / DEVIA,  MR. - ,', 19, 15000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000089   ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 15, 15500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000090   ', N'ADANG,  MR. - ,', 16, 13500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000091   ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 17, 2500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000092   ', N'ADE PUSPITA DEWI,  MS. - ,', 10, 2850000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000093   ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 2, 5750000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000094   ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 5, 9500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000095   ', N'ADHITYA PRATAMA,  MR. - REF BY W', 3, 19000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000096   ', N'ADI / ANGGA,   - ,', 2, 24500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000097   ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 1, 8500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000098   ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 1, 18000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000099   ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 24, 17000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000100   ', N'ADIPRANA PAWENANG / RPT,  MR - J', 5, 5000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000001   ', N'DEASY HERLIANTY PERMANA M.,  MR.', 20, 9854050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000002   ', N'A . SOFYAN RASAD,  MR.', 30, 12869500, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000003   ', N'A DARMAWAN ACHMAD,  MR.', 10, 23622050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000004   ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 5, 5868500, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000005   ', N'ABDILLAH, MR.', 11, 875500, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000006   ', N'ABDUL BASIT DALIMUNTHE,  MR.', 20, 9850000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000007   ', N'ABDUL GANI,  MR.', 40, 9553330, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000008   ', N'ABDUL HADI,  MR.', 50, 50365120, CAST(N'2016-05-09 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000009   ', N'ABDUL HAMID,  MR.', 55, 18637500, CAST(N'2016-05-08 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000010   ', N'ABDUL KADIR,  MR.', 15, 2586500, CAST(N'2016-05-07 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000011   ', N'ABDURRAHMAN ASSYURA,  MR.', 75, 9550037, CAST(N'2016-05-06 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000012   ', N'ACAI/KHAW TIEW CHAI,  MR.', 12, 5520030, CAST(N'2016-05-05 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000013   ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 15, 820000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000014   ', N'ADIPRANA PAWENANG / RPT,  MR.', 4, 8503350, CAST(N'2016-05-03 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000015   ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 2, 8598895, CAST(N'2016-05-02 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000016   ', N'CINDY SARI DUHA,  MS.', 15, 8960000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000017   ', N'DADANG PURNAMA,  MR.', 8, 7500056, CAST(N'2016-04-30 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000018   ', N'DANIEL GUANARDY,  MR.', 9, 5600035, CAST(N'2016-04-29 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000019   ', N'DAVID TAMBUNAN,  MR.', 40, 7850699, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000020   ', N'DEDY SUWANDI,  MR.', 49, 8500665, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000021   ', N'DESI MAHANANI RAHAYU,  MRS.', 99, 7850000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000022   ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 23, 5600050, CAST(N'2016-05-16 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000023   ', N'DR DONALD PARDEDE,  MR.', 4, 4589005, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000024   ', N'DRG KUSMALA DEWI,  MRS.', 34, 8506050, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000025   ', N'EDDY SANTOSO,  MR.', 35, 7850000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000026   ', N'ELENE LIM,  MRS.', 55, 5000000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000027   ', N'DEASY HERLIANTY PERMANA M.,  MR', 21, 4000000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000028   ', N'A . SOFYAN RASAD,  MR - JL MELAT', 23, 3000000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000029   ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 32, 2000000, CAST(N'2016-05-09 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000030   ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 38, 1000000, CAST(N'2016-05-08 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000031   ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 29, 10000000, CAST(N'2016-05-07 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000032   ', N'ABDILLAH,   - ,', 29, 11000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000033   ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 10, 12000000, CAST(N'2016-05-05 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000034   ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 10, 13000000, CAST(N'2016-05-04 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000035   ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 22, 15000000, CAST(N'2016-05-03 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000036   ', N'ABDUL GANI,   - ,', 33, 16000000, CAST(N'2016-05-02 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000037   ', N'ABDUL HADI,  MR - JL. MERBABU NO', 49, 17000000, CAST(N'2016-05-01 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000038   ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 85, 18000000, CAST(N'2016-04-30 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000039   ', N'ABDUL HAMID,  MR - JL PUKAT BANT', 34, 19000000, CAST(N'2016-04-29 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000040   ', N'ABDUL KADIR,  MR - DUSUN II DESA', 55, 20000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000041   ', N'ABDUL MUIS,  MR - JL PINANG BLOK', 44, 9500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000042   ', N'ABDUL RAHMAN / ARIF,  MR. - ,', 33, 10500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000043   ', N'ABDUL RAUF,  MR. - PERUM PESONA', 22, 11500000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000044   ', N'ABDUL RAZAQ LUBIS,  MR / RPT - J', 11, 12500000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000045   ', N'ABDUL WAHID MAKTUB,  MR. - ,', 34, 13500000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000046   ', N'ABDURRAHMAN ASSYURA,  MR. - KP C', 43, 14500000, CAST(N'2016-04-01 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000047   ', N'ABIDIN,  MR - JL LAGOA TRS GG II', 45, 15500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000048   ', N'ABIYEN,  MR - ,', 46, 16500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000049   ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 32, 17500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000050   ', N'ACAI/KHAW TIEW CHAI,  MR. - ,', 31, 18500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000051   ', N'ACUN / DEVIA,  MR. - ,', 33, 19500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000052   ', N'ADAM YUDHISTIRA / ELVIS MANAHAN,', 48, 20500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000053   ', N'ADANG,  MR. - ,', 39, 21500000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000054   ', N'ADE FIRMAN /BAGUS RAHMA,   - ,', 8, 22500000, CAST(N'2016-05-14 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000055   ', N'ADE PUSPITA DEWI,  MS. - ,', 3, 23500000, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000056   ', N'ADE SUTARMAN,  MR - JL.ISKANDAR', 9, 24500000, CAST(N'2016-05-12 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000057   ', N'ADENAN TAMPUBOLON,  MR. - JL. PA', 6, 25500000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000058   ', N'ADHITYA PRATAMA,  MR. - REF BY W', 3, 26500000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000059   ', N'ADI / ANGGA,   - ,', 20, 27500000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000060   ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 9, 35000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000061   ', N'ADI NUGROHO,  MR - JL.BENGKALIS', 30, 34000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000062   ', N'ADI SOBARI / ANTON NOVIANTO,  MR', 39, 33000000, CAST(N'2016-04-04 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000063   ', N'ADIPRANA PAWENANG / RPT,  MR - J', 49, 32000000, CAST(N'2016-04-03 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000064   ', N'DEASY HERLIANTY PERMANA M.,  MR', 48, 31000000, CAST(N'2016-04-02 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000065   ', N'A . SOFYAN RASAD,  MR - JL MELAT', 47, 30000000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000066   ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 28, 29000000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000067   ', N'A DARMAWAN ACHMAD,  MR. - BUMI A', 23, 28000000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000068   ', N'A SAAD,   - JL.ABDULLAH LUBIS, M', 22, 5600000, CAST(N'2016-04-28 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000069   ', N'ABDILLAH,   - ,', 23, 6500000, CAST(N'2016-04-27 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000070   ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 5, 7500000, CAST(N'2016-04-26 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000071   ', N'ABDUL BASIT DALIMUNTHE,  MR - JL', 7, 7700000, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000072   ', N'ABDUL BASIT,  MR - PETAMBURAN NO', 23, 7800000, CAST(N'2016-05-10 00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[prepTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase], [Cluster], [Segment]) VALUES (N'C000073   ', N'ABDUL GANI,   - ,', 35, 9000000, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 0, N'')
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT]    Script Date: 5/25/2016 11:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERT]
 @NAME VARCHAR(MAX),
 @FRQ INT,
 @TOTAL FLOAT,
 @DT DATETIME,
 @CL INT,
 @SGMT VARCHAR(50)
AS
BEGIN
 /* Logic for Getting New ID as Per the NAME with PRE FIX */
 DECLARE @NEWID VARCHAR(7);
 DECLARE @PREFIX VARCHAR(1);
 SET @PREFIX = 'C'
 SELECT @NEWID = (@PREFIX + replicate('0', 6 - len(CONVERT(VARCHAR,N.OID + 1))) + CONVERT(VARCHAR,N.OID + 1)+ CONVERT(VARCHAR,N.OID + 1)+ CONVERT(VARCHAR,N.OID + 1)) FROM (
  SELECT CASE WHEN MAX(T.TID) IS null then 0 else MAX(T.TID) end as OID FROM (
   SELECT SUBSTRING(CID, 1, 1) as PRE_FIX,SUBSTRING(CID, 2, LEN(CID)) as TID FROM dataTable
  ) AS T WHERE T.PRE_FIX = @PREFIX
 ) AS N

 /* INSERT QUERY FOR NEW RECORD */
 INSERT INTO dataTable VALUES (@NEWID,@NAME,@FRQ,@TOTAL,@DT,@CL,@SGMT)

END


GO
USE [master]
GO
ALTER DATABASE [CSS] SET  READ_WRITE 
GO
