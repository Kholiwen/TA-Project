USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 02-Aug-16 10:13:26 AM ******/
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
/****** Object:  Table [dbo].[clusterResult]    Script Date: 02-Aug-16 10:13:26 AM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 02-Aug-16 10:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[CID] [nvarchar](16) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Frequency] [int] NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NOT NULL,
	[clusterIndex] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historyDetail]    Script Date: 02-Aug-16 10:13:26 AM ******/
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
	[rfmScore] [float] NOT NULL,
	[clusterSegment] [nvarchar](50) NOT NULL,
	[mpcScore] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historyIndex]    Script Date: 02-Aug-16 10:13:26 AM ******/
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
 CONSTRAINT [PK_historyIndex] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[segmentStrategy]    Script Date: 02-Aug-16 10:13:26 AM ******/
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
/****** Object:  Table [dbo].[transaction]    Script Date: 02-Aug-16 10:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[TID] [nchar](8) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NOT NULL,
	[CID] [nchar](16) NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0004', 1, 107.207297244981, 1.25059349104534, 123751.082084291, 1, 1, 1, 1, N'Dormant Customer 18', 0.822608346289998)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0004', 2, 105.306215945936, 1.57076815990286, 692764.129534651, 1, 1, 1, 1, N'Dormant Customer 18', 0.822608346289998)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0004', 3, 103.710211134843, 3.50590163330906, 2016358.40838476, 1, 1, 1, 1, N'Dormant Customer 18', 0.822608346289998)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0001', 1, 107.297491428738, 1.25734157308358, 122443.815252128, 1, 1, 1, 1, N'Dormant Customer 18', 0.819304312844966)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0001', 2, 102.639513443794, 3.1741563286651, 1972937.18062832, 1, 1, 1, 1, N'Dormant Customer 18', 0.819304312844966)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0001', 3, 105.858402462479, 1.57129768320148, 683467.944407203, 1, 1, 1, 1, N'Dormant Customer 18', 0.819304312844966)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0002', 1, 104.634450524622, 1.82877321946129, 1031008.59640954, 1, 1, 1, 1, N'Dormant Customer 18', 0.783179116627873)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0002', 2, 104.391523334877, 3.57578154820439, 2289892.21415349, 1, 1, 1, 1, N'Dormant Customer 18', 0.783179116627873)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0002', 3, 105.671552794362, 1.47799074153977, 394057.218386422, 1, 1, 1, 1, N'Dormant Customer 18', 0.783179116627873)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0002', 4, 107.428047920003, 1.21040146943102, 86762.6540595561, 1, 1, 1, 1, N'Dormant Customer 18', 0.783179116627873)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0003', 1, 107.297491430225, 1.25734157289234, 122443.815073069, 1, 1, 1, 1, N'Dormant Customer 18', 0.819304312508635)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0003', 2, 102.63951344813, 3.17415632599252, 1972937.17661147, 1, 1, 1, 1, N'Dormant Customer 18', 0.819304312508635)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [mpcScore]) VALUES (N'H0003', 3, 105.858402460257, 1.57129768228689, 683467.942638486, 1, 1, 1, 1, N'Dormant Customer 18', 0.819304312508635)
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period]) VALUES (N'H0001', CAST(N'2016-08-02 10:03:50.227' AS DateTime), 3, 2999, 4)
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period]) VALUES (N'H0002', CAST(N'2016-08-02 10:05:01.627' AS DateTime), 4, 2999, 4)
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period]) VALUES (N'H0003', CAST(N'2016-08-02 10:06:46.480' AS DateTime), 3, 2999, 4)
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period]) VALUES (N'H0004', CAST(N'2016-08-02 10:09:05.550' AS DateTime), 3, 2999, 4)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (1, N'Superstar', N'Give reward & recognition for excellent customer|Special discount offer monthly|Special treatment at the store|
Priority updates on new product released')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (2, N'Golden', N'Special discount offer every month|Special treatment at the store|Priority updates on new product')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (3, N'Typical', N'Upselling & cross-selling with similar item')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (4, N'Occasional', N'Extra discount after certain amount of purchase|Give updates of products daily')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (5, N'Everyday Shopper', N'Upselling & cross-selling with item bought daily')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (6, N'Dormant', N'Inform customer for new promotion by phone or email')
/****** Object:  StoredProcedure [dbo].[SP_insertHistory]    Script Date: 02-Aug-16 10:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_insertHistory]
 @PROCDT DATETIME,
 @CLTR INT,
 @TOTAL INT,
 @PERIOD INT
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
 INSERT INTO historyIndex VALUES (@NEWID,@PROCDT,@CLTR,@TOTAL,@PERIOD)

END










GO
/****** Object:  StoredProcedure [dbo].[SP_insertTransaction]    Script Date: 02-Aug-16 10:13:26 AM ******/
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
