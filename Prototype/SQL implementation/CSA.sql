USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 6/3/2016 12:52:51 AM ******/
CREATE DATABASE [CSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CSS.mdf' , SIZE = 5312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CSS_log.ldf' , SIZE = 7040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[clusterResult]    Script Date: 6/3/2016 12:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clusterResult](
	[clusterIndex] [smallint] NOT NULL,
	[recencyDOM] [float] NOT NULL,
	[frequencyDOM] [float] NOT NULL,
	[monetaryDOM] [float] NOT NULL,
	[rfmScore] [float] NULL,
	[clusterSegment] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[processedTable]    Script Date: 6/3/2016 12:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[processedTable](
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
/****** Object:  Table [dbo].[segmentStrategy]    Script Date: 6/3/2016 12:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[segmentStrategy](
	[cType] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transactionTable]    Script Date: 6/3/2016 12:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionTable](
	[TID] [nchar](10) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NULL,
	[CID] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (1, 1, 1, 1, 1, N'Occasional Customer 11')
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (2, 1, 0.504291326872642, 1, 0.710134724452087, N'Occasional Customer 11')
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (3, 1, 0.907579782293752, 1, 0.952669818086913, N'Occasional Customer 12')
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (4, 1, 1, 1, 1, N'Occasional Customer 12')
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (5, 1, 1, 1, 1, N'Occasional Customer 12')
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (6, 1, 0.68592430910982, 1, 0.828205475174983, N'Occasional Customer 12')
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (7, 1, 1, 1, 1, N'Occasional Customer 11')
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (8, 1, 1, 1, 1, N'Occasional Customer 11')
INSERT [dbo].[segmentStrategy] ([cType]) VALUES (N'Superstar')
INSERT [dbo].[segmentStrategy] ([cType]) VALUES (N'Golden Customer')
INSERT [dbo].[segmentStrategy] ([cType]) VALUES (N'Typical Customer')
INSERT [dbo].[segmentStrategy] ([cType]) VALUES (N'Occational Customer')
INSERT [dbo].[segmentStrategy] ([cType]) VALUES (N'Everyday Shopper')
INSERT [dbo].[segmentStrategy] ([cType]) VALUES (N'Dormant Customer')
INSERT [dbo].[transactionTable] ([TID], [Customer Name], [Total purchase], [Last purchase], [CID]) VALUES (N'T000001   ', N'Raymond Natio', 15000000, CAST(N'2016-05-06 00:00:00.000' AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[SP_INSERT]    Script Date: 6/3/2016 12:52:52 AM ******/
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
   SELECT SUBSTRING(CID, 1, 1) as PRE_FIX,SUBSTRING(CID, 2, LEN(CID)) as TID FROM processedTable
  ) AS T WHERE T.PRE_FIX = @PREFIX
 ) AS N

 /* INSERT QUERY FOR NEW RECORD */
 INSERT INTO processedTable VALUES (@NEWID,@NAME,@FRQ,@TOTAL,@DT,@CL,@SGMT)

END


GO
/****** Object:  StoredProcedure [dbo].[SP_insertTRANSACTION]    Script Date: 6/3/2016 12:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_insertTRANSACTION]
 @NAME VARCHAR(MAX),
 @TOTAL FLOAT,
 @DT DATETIME,
 @CID NCHAR(10)
AS
BEGIN
 /* Logic for Getting New ID as Per the NAME with PRE FIX */
 DECLARE @NEWID VARCHAR(7);
 DECLARE @PREFIX VARCHAR(1);
 SET @PREFIX = 'T'
 SELECT @NEWID = (@PREFIX + replicate('0', 6 - len(CONVERT(VARCHAR,N.OID + 1))) + CONVERT(VARCHAR,N.OID + 1)+ CONVERT(VARCHAR,N.OID + 1)+ CONVERT(VARCHAR,N.OID + 1)) FROM (
  SELECT CASE WHEN MAX(T.TID) IS null then 0 else MAX(T.TID) end as OID FROM (
   SELECT SUBSTRING(TID, 1, 1) as PRE_FIX,SUBSTRING(TID, 2, LEN(TID)) as TID FROM transactionTable
  ) AS T WHERE T.PRE_FIX = @PREFIX
 ) AS N

 /* INSERT QUERY FOR NEW RECORD */
 INSERT INTO transactionTable VALUES (@NEWID,@NAME,@TOTAL,@DT,@CID)

END


GO
USE [master]
GO
ALTER DATABASE [CSS] SET  READ_WRITE 
GO
