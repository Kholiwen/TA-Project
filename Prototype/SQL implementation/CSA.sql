USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 01-May-16 1:50:13 AM ******/
CREATE DATABASE [CSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XLW_MSSQLSERVER\MSSQL\DATA\CSS.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XLW_MSSQLSERVER\MSSQL\DATA\CSS_log.ldf' , SIZE = 27200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[clusterResult]    Script Date: 01-May-16 1:50:13 AM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 01-May-16 1:50:13 AM ******/
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
/****** Object:  Table [dbo].[historyDetail]    Script Date: 01-May-16 1:50:13 AM ******/
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
	[clusterSegment] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historyIndex]    Script Date: 01-May-16 1:50:13 AM ******/
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
/****** Object:  Table [dbo].[segmentStrategy]    Script Date: 01-May-16 1:50:13 AM ******/
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
/****** Object:  Table [dbo].[transaction]    Script Date: 01-May-16 1:50:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[TID] [nchar](8) NOT NULL,
	[Customer Name] [nvarchar](max) NOT NULL,
	[Total purchase] [float] NOT NULL,
	[Last purchase] [datetime] NOT NULL,
	[CID] [nchar](16) NOT NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (1, 1, 1, 1, 1, N'Superstar 1', 1)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (2, 1, 1, 1, 1, N'Superstar 1', 1)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (3, 1, 1, 1, 1, N'Superstar 5', 1)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (4, 1, 1, 1, 1, N'Superstar 1', 1)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (5, 1, 1, 1, 1, N'Superstar 1', 1)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 1, 80.4725545495533, 5.53605785593057, 63076285.8650502, 1, 0.845352618643522, 1, 0.919430594794149, N'Occasional Customer 11')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 2, 79.3458071464473, 5.52219449914412, 17697166.2887043, 1, 0.840731499714705, 1, 0.916914117960186, N'Dormant Customer 11')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 3, 79.1903008919212, 5.36832414871252, 113418998.19997, 1, 0.789441382904173, 1, 0.888505139492267, N'Occasional Customer 11')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 1, 11.0434769295814, 5.08043749388616, 160388572.117728, 0.956523070418609, 0.919562506113845, 1, 0.937860731553382, N'Superstar 4')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 2, -8.67260039204207, 5.45209862820276, 111989468.995898, 1, 0.547901371797236, 1, 0.740203601583535, N'Superstar 2')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 4, -10.4331131300887, 5.46369605034108, 13362260.9767488, 1, 0.536303949658921, 1, 0.732327761087152, N'Everyday Shopper 2')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 5, -2.0795154585533, 5.55919819204505, 75246117.0048355, 1, 0.55919819204505, 1, 0.747795554978131, N'Superstar 1')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 1, -10.7269946395155, 72, 1729227507.99892, 1, 1, 1, 1, N'Superstar 1')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 2, -5.6339539090962, 71.9999999999999, 1138866353.64712, 1, 1, 1, 1, N'Superstar 1')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 3, 13.5537425731666, 72, 2383758466.89382, 1, 1, 1, 1, N'Superstar 5')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 4, -10.4800648684901, 72, 192956388.023946, 1, 1, 1, 1, N'Superstar 1')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 5, -5.29030564833316, 72, 640643958.666495, 1, 1, 1, 1, N'Superstar 1')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 3, -6.26465116583478, 5.64388972626969, 46622225.4939291, 1, 0.64388972626969, 1, 0.802427396260677, N'Superstar 1')
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period]) VALUES (N'H0001', CAST(N'2016-07-30 01:24:32.383' AS DateTime), 3, 549, 3)
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period]) VALUES (N'H0002', CAST(N'2016-05-01 01:25:31.420' AS DateTime), 5, 549, 1)
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period]) VALUES (N'H0003', CAST(N'2016-05-01 01:26:31.013' AS DateTime), 5, 7200, 2)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (1, N'Superstar', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (2, N'Golden', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (3, N'Typical', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (4, N'Occasional', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (5, N'Everyday Shopper', NULL)
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (6, N'Dormant', NULL)
/****** Object:  StoredProcedure [dbo].[SP_insertHistory]    Script Date: 01-May-16 1:50:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_insertTransaction]    Script Date: 01-May-16 1:50:13 AM ******/
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
