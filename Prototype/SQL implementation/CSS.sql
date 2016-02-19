USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 19-02-16 9:34:57 PM ******/
CREATE DATABASE [CSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CSS.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CSS_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[custClass]    Script Date: 19-02-16 9:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custClass](
	[cType] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dataTable]    Script Date: 19-02-16 9:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataTable](
	[CID] [nchar](10) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Frequency] [int] NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[custClass] ([cType]) VALUES (N'Superstar')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Golden Customer')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Typical Customer')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Occational Customer')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Everyday Shopper')
INSERT [dbo].[custClass] ([cType]) VALUES (N'Dormant Customer')
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C001      ', N'DEASY HERLIANTY PERMANA M.,  MR.', 57, 98540500, CAST(N'2016-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C002      ', N'A . SOFYAN RASAD,  MR.', 89, 128695000, CAST(N'2016-01-20 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C003      ', N'A DARMAWAN ACHMAD,  MR.', 56, 236220500, CAST(N'2016-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C004      ', N'A SAAD,   - JL.ABDULLAH LUBIS, MR.', 78, 5868500, CAST(N'2016-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C005      ', N'ABDILLAH, MR.', 73, 875500, CAST(N'2016-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C006      ', N'ABDUL BASIT DALIMUNTHE,  MR.', 112, 98500000, CAST(N'2016-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C007      ', N'ABDUL GANI,  MR.', 78, 955333050, CAST(N'2016-01-20 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C008      ', N'ABDUL HADI,  MR.', 69, 503651200, CAST(N'2016-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C009      ', N'ABDUL HAMID,  MR.', 948, 1863750000, CAST(N'2016-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C010      ', N'ABDUL KADIR,  MR.', 25, 2586500, CAST(N'2016-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C011      ', N'ABDURRAHMAN ASSYURA,  MR.', 753, 955003750, CAST(N'2016-01-19 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C012      ', N'ACAI/KHAW TIEW CHAI,  MR.', 126, 55200300, CAST(N'2016-01-18 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C013      ', N'ADI SOBARI / ANTON NOVIANTO,  MR.', 8, 820000, CAST(N'2016-01-12 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C014      ', N'ADIPRANA PAWENANG / RPT,  MR.', 69, 8503350, CAST(N'2016-01-12 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C015      ', N'CHRISTINE VICTORIA SIREGAR/UTAMI', 23, 85988950, CAST(N'2016-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C016      ', N'CINDY SARI DUHA,  MS.', 27, 89600000, CAST(N'2016-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C017      ', N'DADANG PURNAMA,  MR.', 99, 750005680, CAST(N'2016-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C018      ', N'DANIEL GUANARDY,  MR.', 48, 560003520, CAST(N'2016-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C019      ', N'DAVID TAMBUNAN,  MR.', 71, 785069900, CAST(N'2016-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C020      ', N'DEDY SUWANDI,  MR.', 129, 850066500, CAST(N'2016-01-03 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C021      ', N'DESI MAHANANI RAHAYU,  MRS.', 568, 7850000000, CAST(N'2016-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C022      ', N'DONNY SEPTIANTO KURNIAWAN,  MR.', 578, 5600050060, CAST(N'2016-01-16 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C023      ', N'DR DONALD PARDEDE,  MR.', 54, 45890050, CAST(N'2016-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C024      ', N'DRG KUSMALA DEWI,  MRS.', 15, 85060500, CAST(N'2016-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C025      ', N'EDDY SANTOSO,  MR.', 78, 78500000, CAST(N'2016-01-09 00:00:00.000' AS DateTime))
INSERT [dbo].[dataTable] ([CID], [Customer Name], [Frequency], [Total purchase], [Last purchase]) VALUES (N'C026      ', N'ELENE LIM,  MRS.', 24, 9800000, CAST(N'2016-01-27 00:00:00.000' AS DateTime))
/****** Object:  StoredProcedure [dbo].[SP_INSERT]    Script Date: 19-02-16 9:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERT]
 @NAME VARCHAR(MAX),
 @FRQ INT,
 @TOTAL FLOAT,
 @DT DATETIME
AS
BEGIN
 /* Logic for Getting New ID as Per the NAME with PRE FIX */
 DECLARE @NEWID VARCHAR(5);
 DECLARE @PREFIX VARCHAR(1);
 SET @PREFIX = 'C'
 SELECT @NEWID = (@PREFIX + replicate('0', 3 - len(CONVERT(VARCHAR,N.OID + 1))) + CONVERT(VARCHAR,N.OID + 1)) FROM (
  SELECT CASE WHEN MAX(T.TID) IS null then 0 else MAX(T.TID) end as OID FROM (
   SELECT SUBSTRING(CID, 1, 1) as PRE_FIX,SUBSTRING(CID, 2, LEN(CID)) as TID FROM dataTable
  ) AS T WHERE T.PRE_FIX = @PREFIX
 ) AS N

 /* INSERT QUERY FOR NEW RECORD */
 INSERT INTO dataTable VALUES (@NEWID,@NAME,@FRQ,@TOTAL,@DT)

END

GO
USE [master]
GO
ALTER DATABASE [CSS] SET  READ_WRITE 
GO
