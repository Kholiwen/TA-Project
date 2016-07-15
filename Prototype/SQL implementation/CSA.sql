USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 15-Jul-16 11:36:15 PM ******/
CREATE DATABASE [CSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XLW_MSSQLSERVER\MSSQL\DATA\CSS.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XLW_MSSQLSERVER\MSSQL\DATA\CSS_log.ldf' , SIZE = 24704KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[clusterResult]    Script Date: 15-Jul-16 11:36:16 PM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 15-Jul-16 11:36:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[CID] [nvarchar](16) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Frequency] [int] NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NULL,
	[clusterIndex] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[segmentStrategy]    Script Date: 15-Jul-16 11:36:16 PM ******/
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
/****** Object:  Table [dbo].[transaction]    Script Date: 15-Jul-16 11:36:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[TID] [nchar](8) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NULL,
	[CID] [nchar](16) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (1, 1, 0.532562415114009, 1, 0.729768740844666, N'Superstar 1', 1)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (2, 1, 0.576750435967519, 1, 0.759440870619641, N'Superstar 1', 1)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (3, 0.931449941404865, 0.841906169736688, 1, 0.885546979256116, N'Superstar 2', 1)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (1, N'Superstar', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (2, N'Golden', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (3, N'Typical', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (4, N'Occasional', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (5, N'Everyday Shopper', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (6, N'Dormant', NULL)
/****** Object:  StoredProcedure [dbo].[SP_INSERT]    Script Date: 15-Jul-16 11:36:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERT]
 @NAME VARCHAR(MAX),
 @FRQ INT,
 @TOTAL FLOAT,
 @DT DATETIME,
 @CL INT
AS
BEGIN
 /* Logic for Getting New ID as Per the NAME with PRE FIX */
 DECLARE @NEWID VARCHAR(7);
 DECLARE @PREFIX VARCHAR(1);
 SET @PREFIX = 'C'
 SELECT @NEWID = (@PREFIX + replicate('0', 6 - len(CONVERT(VARCHAR,N.OID + 1))) + CONVERT(VARCHAR,N.OID + 1)+ CONVERT(VARCHAR,N.OID + 1)+ CONVERT(VARCHAR,N.OID + 1)) FROM (
  SELECT CASE WHEN MAX(T.TID) IS null then 0 else MAX(T.TID) end as OID FROM (
   SELECT SUBSTRING(CID, 1, 1) as PRE_FIX,SUBSTRING(CID, 2, LEN(CID)) as TID FROM customer
  ) AS T WHERE T.PRE_FIX = @PREFIX
 ) AS N

 /* INSERT QUERY FOR NEW RECORD */
 INSERT INTO customer VALUES (@NEWID,@NAME,@FRQ,@TOTAL,@DT,@CL)

END





GO
/****** Object:  StoredProcedure [dbo].[SP_insertTRANSACTION]    Script Date: 15-Jul-16 11:36:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_insertTRANSACTION]
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
