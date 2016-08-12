USE [master]
GO
/****** Object:  Database [CSS]    Script Date: 08/12/16 10:52:15 PM ******/
CREATE DATABASE [CSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XLW_MSSQLSERVER\MSSQL\DATA\CSS.mdf' , SIZE = 9408KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XLW_MSSQLSERVER\MSSQL\DATA\CSS_log.ldf' , SIZE = 48384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[clusterResult]    Script Date: 08/12/16 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 08/12/16 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[historyDetail]    Script Date: 08/12/16 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[historyIndex]    Script Date: 08/12/16 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[segmentStrategy]    Script Date: 08/12/16 10:52:15 PM ******/
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
/****** Object:  Table [dbo].[transaction]    Script Date: 08/12/16 10:52:15 PM ******/
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
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (1, 1, 1, 1, 1, N'Dormant Customer 15', 6)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (2, 1, 0.832128374908814, 0.918473367420446, 0.874235523545344, N'Everyday Shopper 9', 5)
INSERT [dbo].[clusterResult] ([clusterIndex], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment], [segmentID]) VALUES (3, 1, 0.739877642081869, 1, 0.860161404668838, N'Typical Customer 13', 3)
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 1, 18.7362053044908, 12.8092758038726, 5871377.41095044, 1, 0.595362098063696, 1, 0.771597108641353, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 2, 18.1688576734048, 6.01384207532772, 1678925.1986709, 1, 0.996539481168069, 1, 0.998268241089573, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0002', 3, 26.0096993610244, 2.20267701709637, 267491.926610783, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 1, 26.7279194168126, 1.95097373964473, 202432.348802512, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 2, 19.9194139874215, 4.71829525595331, 1019865.20904225, 1, 0.640852372023343, 1, 0.800532555255152, N'Typical Customer 14')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 3, 19.9050260082822, 14.4165991671134, 7731307.42366647, 1, 1, 0.865653711833236, 0.93040513317223, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0003', 4, 17.2002352887644, 7.66493278355595, 2922749.45873096, 1, 0.583766804111012, 0.538625270634518, 0.560741966372895, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0004', 1, 19.7396804983332, 14.4887095769413, 8495695.95454066, 1, 1, 1, 1, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0004', 2, 16.27896727837, 9.54324226803342, 3992322.89077279, 1, 0.885810567008356, 0.996161445386394, 0.939366986203787, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0004', 3, 27.2148713088196, 1.81440882032655, 169634.652633306, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0004', 4, 20.7470327856714, 4.06373768845236, 772516.934809117, 1, 0.96813115577382, 1, 0.983936560848219, N'Typical Customer 14')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0004', 5, 17.3832930377414, 6.52908924386975, 1946950.08255879, 1, 0.867727689032563, 1, 0.931519022367532, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0005', 1, 18.3072303230181, 7.21300263370513, 2534049.98939739, 1, 0.696749341573718, 0.732975005301304, 0.71463266951188, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0005', 2, 27.7928477943505, 1.68338022764367, 139306.645869367, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0005', 3, 18.4667578348117, 5.43386965229548, 1299273.96028776, 1, 0.716934826147739, 1, 0.846720040005986, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0005', 4, 21.9809206422868, 3.46920206294186, 577250.657769605, 1, 1, 1, 1, N'Typical Customer 14')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0005', 5, 19.6332065461467, 11.2027149593822, 4560026.64386234, 1, 1, 1, 1, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0005', 6, 20.0073057334584, 14.5116870310445, 8837267.45123066, 1, 1, 1, 1, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0006', 1, 27.8298603851978, 1.66533201890678, 135102.173251429, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0006', 2, 18.6489446641322, 10.3979706213684, 4264906.87928867, 1, 1, 1, 1, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0006', 3, 22.1550242216229, 3.3860847753578, 553603.786327139, 0.92248788918856, 1, 1, 0.960462330957628, N'Typical Customer 14')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0006', 4, 22.0269335255738, 14.0910144314216, 8029192.98123059, 0.986533237213123, 1, 1, 0.993243795456646, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0006', 5, 9.63498759756894, 40.8073505397102, 18799645.4053513, 0.817493798784469, 1, 1, 0.904153636714728, N'Superstar 3')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0006', 6, 18.8861945206431, 5.26297296667454, 1235327.30626283, 1, 0.631486483337271, 1, 0.794661238099148, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0006', 7, 18.3758824635524, 7.10210198980514, 2398055.01248067, 1, 0.724474502548716, 0.800972493759667, 0.761763840682753, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0007', 1, 16.3729039276285, 11.4315843017306, 4616891.89250684, 1, 1, 1, 1, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0007', 2, 20.0132648961092, 4.51951698217179, 936995.620884263, 1, 0.740241508914107, 1, 0.860372889457883, N'Typical Customer 14')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0007', 3, 28.2854094286499, 1.57405923676141, 114444.901367342, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0007', 4, 16.9845533466694, 6.24677354314812, 1712204.84140278, 1, 0.938306614212971, 1, 0.968662280783644, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0007', 5, 13.6178698902147, 42.5316656332642, 19046504.1149164, 1, 1, 1, 1, N'Superstar 3')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0007', 6, 17.9867284186486, 14.1958938326293, 8275055.51800169, 1, 1, 1, 1, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0007', 7, 16.6382346069401, 7.3354361212134, 2855907.88934911, 1, 0.666140969696651, 0.572046055325445, 0.617303259351217, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0007', 8, 22.7136473622881, 2.9653196355714, 440549.590573085, 0.64317631885597, 1, 1, 0.801982742243229, N'Typical Customer 14')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0009', 1, 10.336830887797, 3.52024471642044, 977472.360478526, 1, 0.739877641789778, 1, 0.86016140449905, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0009', 2, 14.123171126012, 1.74257166340924, 183598.05729307, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0009', 3, 6.9919127364381, 6.83212837691537, 3081526.63387774, 1, 0.83212837691537, 0.918473366122263, 0.874235523981561, N'Everyday Shopper 9')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0010', 1, 11.4540134640887, 3.0463108251128, 706505.805335545, 0.545986535911284, 0.976844587443601, 1, 0.730304041082904, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0010', 2, 14.3517000151472, 1.64427946247195, 151298.981559232, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0010', 3, 8.75378698221239, 4.73019867803702, 1893177.29116035, 1, 0.865099339018509, 0.893177291160346, 0.879026213607511, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0010', 4, 5.22627600799375, 8.60985510082855, 4416849.85487326, 1, 1, 1, 1, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0008', 1, 13.7464207085137, 1.92809497078795, 257271.873650015, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0008', 2, 8.47704744138132, 4.94267492273419, 1955003.16866449, 1, 0.971337461367093, 0.955003168664492, 0.963135687973453, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 1, 17.6910394314619, 8.11273128176501, 3109100.39717294, 1, 0.528182820441253, 0.554550198586469, 0.541205957067786, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0001', 2, 25.3584880746628, 2.48316458403684, 353611.668535717, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0011', 1, 9.04228958331078, 3.96599846983107, 1188206.67659205, 1, 0.517000765084466, 0.811793323407947, 0.64784085182425, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0011', 2, 6.95277102673402, 8.59907694765892, 6219326.95026018, 1, 1, 1, 1, N'Golden Customer 3')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0011', 3, 12.1353628581982, 2.66783523421832, 506257.368526533, 1, 0.667835234218318, 1, 0.817211866175668, N'Dormant Customer 9')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0011', 4, 14.6174098576134, 1.54257822407304, 122133.872042089, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0011', 5, 7.70069430310064, 6.06313653076773, 2532760.29898415, 1, 0.936863469232265, 1, 0.967917077663301, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0012', 1, 10.0303434533525, 3.58880091787881, 978807.900256519, 1, 0.705599541060595, 1, 0.839999726821738, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0012', 2, 8.92751552323993, 4.71708894070395, 1942413.26889381, 1, 0.858544470351977, 0.942413268893815, 0.899501918172005, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0012', 3, 5.89676903490511, 7.70387230311353, 3512439.32512932, 1, 1, 0.512439325129318, 0.715848674741609, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0012', 4, 14.7369072272952, 1.50024247477336, 109803.041082706, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0012', 5, 12.3140159691548, 2.52850213336267, 435671.194113322, 1, 0.528502133362672, 1, 0.726981522022858, N'Dormant Customer 9')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0012', 6, 7.37749288264805, 8.58551792682233, 6945971.80286239, 1, 1, 1, 1, N'Golden Customer 3')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0013', 1, 7.38205167110502, 8.52160220417569, 6947074.70809347, 1, 1, 1, 1, N'Golden Customer 3')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0013', 2, 12.768045228646, 2.24519993376319, 322716.616600194, 1, 0.754800066236808, 1, 0.868792303278987, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0013', 3, 8.74576550121875, 5.07083362327488, 2098186.67314265, 1, 1, 1, 1, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0013', 4, 14.9399355455154, 1.4265979395604, 88568.9942726365, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0013', 5, 5.60680824465144, 7.85038975674339, 3600637.18094167, 1, 1, 0.600637180941674, 0.775007858632204, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0013', 6, 11.8261622482442, 2.97254861075611, 670430.61720656, 0.826162248244206, 0.972548610756115, 1, 0.896372102861892, N'Dormant Customer 9')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0013', 7, 8.6251754304991, 4.09166232290081, 1199304.72636006, 1, 0.545831161450406, 0.800695273639944, 0.66109336041042, N'Everyday Shopper 12')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0014', 1, 7.35221319293747, 8.48113078124131, 6963577.74740804, 1, 1, 1, 1, N'Golden Customer 3')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0014', 2, 13.0684574173075, 2.10281267421701, 280752.967175182, 1, 0.89718732578299, 1, 0.947199728559394, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0014', 3, 8.81136665933382, 4.1794422393102, 1544422.34116727, 1, 0.589721119655102, 0.544422341167269, 0.56661923069943, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0014', 4, 12.0875642628832, 2.77099596867847, 562894.139623509, 1, 0.770995968678465, 1, 0.878063761169122, N'Dormant Customer 9')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0014', 5, 10.0972407196733, 3.54930593717852, 966225.670438871, 1, 0.725347031410742, 1, 0.851673077777348, N'Typical Customer 13')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0014', 6, 5.209223058464, 8.04748473809103, 3709798.16836306, 1, 1, 0.709798168363057, 0.842495203762643, N'Everyday Shopper 7')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0014', 7, 15.0110453971875, 1.39340562095416, 79708.6068189477, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0014', 8, 8.03418399540317, 5.70155491747023, 2300095.09250951, 1, 1, 1, 1, N'Everyday Shopper 10')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0015', 1, 14.1231711262586, 1.74257166329473, 183598.05725405, 1, 1, 1, 1, N'Dormant Customer 15')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0015', 2, 6.99191273834038, 6.83212837490881, 3081526.63257955, 1, 0.832128374908814, 0.918473367420446, 0.874235523545344, N'Everyday Shopper 9')
INSERT [dbo].[historyDetail] ([historyID], [clusterIndex], [recencyCentroid], [frequencyCentroid], [monetaryCentroid], [recencyDOM], [frequencyDOM], [monetaryDOM], [rfmScore], [clusterSegment]) VALUES (N'H0015', 3, 10.3368308891662, 3.52024471583626, 977472.360121444, 1, 0.739877642081869, 1, 0.860161404668838, N'Typical Customer 13')
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0001', CAST(N'2016-08-12 20:25:07.620' AS DateTime), 2, 41220, 2, CAST(N'00:00:24.4173966' AS Time), 0.884917467636869, CAST(N'00:00:07.1794107' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0002', CAST(N'2016-08-12 20:35:11.463' AS DateTime), 3, 41220, 2, CAST(N'00:00:46.1686407' AS Time), 0.846988479174728, CAST(N'00:00:06.7383854' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0003', CAST(N'2016-08-12 20:38:00.053' AS DateTime), 4, 41220, 2, CAST(N'00:01:15.0332917' AS Time), 0.8137403914289, CAST(N'00:00:06.7973888' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0004', CAST(N'2016-08-12 21:19:37.257' AS DateTime), 5, 41220, 2, CAST(N'00:01:42.2368476' AS Time), 0.795844121312915, CAST(N'00:00:06.8073893' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0005', CAST(N'2016-08-12 21:22:13.400' AS DateTime), 6, 41220, 2, CAST(N'00:02:24.7902815' AS Time), 0.773858779277636, CAST(N'00:00:06.9323965' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0006', CAST(N'2016-08-12 21:25:10.263' AS DateTime), 7, 41220, 2, CAST(N'00:05:26.4326709' AS Time), 0.776572543080932, CAST(N'00:00:06.9193958' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0007', CAST(N'2016-08-12 21:38:02.090' AS DateTime), 8, 41220, 2, CAST(N'00:09:05.7922175' AS Time), 0.760157104587303, CAST(N'00:00:07.6824394' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0008', CAST(N'2016-08-12 21:59:50.120' AS DateTime), 2, 21460, 1, CAST(N'00:00:11.7136700' AS Time), 0.864927878039079, CAST(N'00:00:04.4322535' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0009', CAST(N'2016-08-12 22:00:36.363' AS DateTime), 3, 21460, 1, CAST(N'00:00:36.2930758' AS Time), 0.817654248587815, CAST(N'00:00:04.4332536' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0010', CAST(N'2016-08-12 22:01:42.913' AS DateTime), 4, 21460, 1, CAST(N'00:00:51.8619663' AS Time), 0.802300813607247, CAST(N'00:00:04.6802677' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0011', CAST(N'2016-08-12 22:09:38.557' AS DateTime), 5, 21460, 1, CAST(N'00:01:41.6288128' AS Time), 0.776117319026987, CAST(N'00:00:04.4292533' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0012', CAST(N'2016-08-12 22:11:59.733' AS DateTime), 6, 21460, 1, CAST(N'00:01:40.8077659' AS Time), 0.774505083543769, CAST(N'00:00:04.6722672' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0013', CAST(N'2016-08-12 22:20:36.413' AS DateTime), 7, 21460, 1, CAST(N'00:03:48.4720679' AS Time), 0.750261670977855, CAST(N'00:00:04.6832679' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0014', CAST(N'2016-08-12 22:25:10.573' AS DateTime), 8, 21460, 1, CAST(N'00:03:11.9969816' AS Time), 0.749152324008012, CAST(N'00:00:04.7462714' AS Time))
INSERT [dbo].[historyIndex] ([historyID], [processDate], [clusterSize], [totalRecord], [period], [fuzzyProcessTime], [MPCScore], [fuzzyRFMTime]) VALUES (N'H0015', CAST(N'2016-08-12 22:46:06.370' AS DateTime), 3, 21460, 1, CAST(N'00:00:35.4770291' AS Time), 0.817654248545836, CAST(N'00:00:04.6742674' AS Time))
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (1, N'Superstar', N'Give reward & recognition for excellent customer|Special discount offer monthly|Special treatment at the store|
Priority updates on new product released')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (2, N'Golden', N'Special discount offer every month|Special treatment at the store|Priority updates on new product')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (3, N'Typical', N'Upselling & cross-selling with similar item')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (4, N'Occasional', N'Extra discount after certain amount of purchase|Give updates of products daily')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (5, N'Everyday Shopper', N'Upselling & cross-selling with item bought daily')
INSERT [dbo].[segmentStrategy] ([segmentID], [segmentName], [Strategy]) VALUES (6, N'Dormant', N'Inform customer for new promotion by phone or email')
/****** Object:  StoredProcedure [dbo].[SP_insertHistory]    Script Date: 08/12/16 10:52:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_insertTransaction]    Script Date: 08/12/16 10:52:15 PM ******/
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
