USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 8/13/2016 10:37:52 AM ******/
CREATE DATABASE [CSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CSS.mdf' , SIZE = 8384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CSS_log.ldf' , SIZE = 36288KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [CSS]
GO
/****** Object:  Table [dbo].[clusterResult]    Script Date: 8/13/2016 10:37:52 AM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 8/13/2016 10:37:52 AM ******/
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
/****** Object:  Table [dbo].[historyDetail]    Script Date: 8/13/2016 10:37:52 AM ******/
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
/****** Object:  Table [dbo].[historyIndex]    Script Date: 8/13/2016 10:37:52 AM ******/
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
/****** Object:  Table [dbo].[segmentStrategy]    Script Date: 8/13/2016 10:37:52 AM ******/
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
/****** Object:  Table [dbo].[transaction]    Script Date: 8/13/2016 10:37:52 AM ******/
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
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 1, 12.8220731765294, 1.63215469841024, 643903.307436669, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 2, 9.72621696912388, 3.25634339158621, 1877548.49334716, 1, 0.871828304206895, 0.877548493347162, 0.874683722733064, N'Typical Customer 11')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 3, 14.3364196461108, 1.27153654680546, 119764.09210457, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 1, 6.95277314466088, 8.59907657379825, 6219328.7452439, 1, 1, 1, 1, N'Golden Customer 3')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 2, 12.1353624017835, 2.66783559402605, 506257.561817096, 1, 0.667835594026048, 1, 0.81721208631912, N'Dormant Customer 9')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 4, 7.70069199007245, 6.06313872800543, 2532761.32421629, 1, 0.936861271994567, 1, 0.967915942628577, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 5, 14.6174095407332, 1.54257833895634, 122133.904615609, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 1, 7.51208435771957, 4.61959214227066, 2321133.52422862, 1, 0.80979607113533, 1, 0.89988669905457, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 2, 8.3962138002239, 11.0904972528733, 7017062.24223286, 1, 1, 0.982937757767138, 0.991432175071567, N'Golden Customer 3')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 3, 9.96283998725641, 3.14171510009806, 789251.813626257, 1, 0.929142449950969, 1, 0.963920354568244, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 4, 13.4060361978899, 1.68900411237403, 165218.102787627, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 3, 9.04228779729055, 3.96599929890502, 1188207.23391505, 1, 0.51700035054749, 0.81179276608495, 0.647840369719143, N'Typical Customer 13')
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0001', CAST(N'2016-08-13 09:30:55.830' AS DateTime), 3, 2999, 1, CAST(N'00:00:05.6459673' AS Time), 0.812268719537161, CAST(N'00:00:01.1173136' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0002', CAST(N'2016-08-13 09:59:41.897' AS DateTime), 5, 21460, 1, CAST(N'00:03:04.2818553' AS Time), 0.776117344982047, CAST(N'00:00:05.0522556' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0003', CAST(N'2016-08-13 10:22:30.213' AS DateTime), 4, 19760, 1, CAST(N'00:01:03.6548075' AS Time), 0.814630808065905, CAST(N'00:00:04.3094289' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0004', CAST(N'2016-08-13 10:31:59.770' AS DateTime), 3, 2999, 1, NULL, NULL, NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (1, N'Superstar', N'Give reward & recognition for excellent customer|Special discount offer monthly|Special treatment at the store|
Priority updates on new product released')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (2, N'Golden', N'Special discount offer every month|Special treatment at the store|Priority updates on new product')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (3, N'Typical', N'Upselling & cross-selling with similar item')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (4, N'Occasional', N'Extra discount after certain amount of purchase|Give updates of products daily')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (5, N'Everyday Shopper', N'Upselling & cross-selling with item bought daily')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (6, N'Dormant', N'Inform customer for new promotion by phone or email')
/****** Object:  StoredProcedure [dbo].[SP_insertHistory]    Script Date: 8/13/2016 10:37:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_insertTransaction]    Script Date: 8/13/2016 10:37:52 AM ******/
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
