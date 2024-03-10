USE [master]
GO
/****** Object:  Database [TimeshareAPI]    Script Date: 3/10/2024 5:25:57 PM ******/
CREATE DATABASE [TimeshareAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeshareAPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeshareAPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeshareAPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeshareAPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TimeshareAPI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeshareAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeshareAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeshareAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeshareAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeshareAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeshareAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeshareAPI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimeshareAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeshareAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeshareAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeshareAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeshareAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeshareAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeshareAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeshareAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeshareAPI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TimeshareAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeshareAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeshareAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeshareAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeshareAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeshareAPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeshareAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeshareAPI] SET RECOVERY FULL 
GO
ALTER DATABASE [TimeshareAPI] SET  MULTI_USER 
GO
ALTER DATABASE [TimeshareAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeshareAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeshareAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeshareAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeshareAPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimeshareAPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeshareAPI', N'ON'
GO
ALTER DATABASE [TimeshareAPI] SET QUERY_STORE = OFF
GO
USE [TimeshareAPI]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[sex] [bit] NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[isPremium] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [nvarchar](50) NOT NULL,
	[timeshareID] [nvarchar](50) NULL,
	[start_day] [datetime] NULL,
	[end_day] [datetime] NULL,
	[memberID] [nvarchar](50) NULL,
	[amount] [int] NULL,
	[adult] [int] NULL,
	[children] [int] NULL,
	[room] [int] NULL,
	[status] [nvarchar](50) NULL,
	[create_day] [datetime] NULL,
	[phone] [nvarchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[paymentID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exchange]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exchange](
	[Id] [nvarchar](50) NOT NULL,
	[memberID1] [nvarchar](50) NOT NULL,
	[memberID2] [nvarchar](50) NOT NULL,
	[timeshareID1] [nvarchar](50) NOT NULL,
	[timeshareID2] [nvarchar](50) NOT NULL,
	[start_day] [datetime] NULL,
	[end_day] [datetime] NULL,
	[exchange_day] [datetime] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Exchange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[memberID] [nvarchar](50) NOT NULL,
	[id] [nvarchar](50) NOT NULL,
	[text] [nvarchar](50) NULL,
	[rate] [int] NULL,
	[realestateID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [nvarchar](50) NOT NULL,
	[Amount] [decimal](20, 2) NULL,
	[PaymentDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[MemberId] [nvarchar](50) NULL,
	[BookingId] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[payoutRequestID] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayoutRequest]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayoutRequest](
	[id] [nvarchar](50) NOT NULL,
	[memberid] [nvarchar](50) NULL,
	[amount] [decimal](18, 0) NULL,
	[createAt] [datetime] NULL,
	[paypalD] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_payoutRequest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Realestate]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realestate](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[location] [nvarchar](50) NULL,
	[facility] [nvarchar](50) NULL,
	[feedbackId] [nvarchar](50) NULL,
	[photo] [nvarchar](500) NULL,
	[status] [nvarchar](50) NULL,
	[price] [decimal](18, 0) NULL,
	[description] [nvarchar](50) NULL,
	[memberId] [nvarchar](50) NOT NULL,
	[create_day] [datetime] NULL,
 CONSTRAINT [PK_Realestate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeshare]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timeshare](
	[ID] [nvarchar](50) NOT NULL,
	[realestateID] [nvarchar](50) NOT NULL,
	[memberID] [nvarchar](50) NOT NULL,
	[start_day] [datetime] NULL,
	[end_day] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[create_day] [datetime] NULL,
	[price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Timeshare] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 3/10/2024 5:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[amount] [int] NULL,
	[type] [nvarchar](50) NULL,
	[end_day] [datetime] NULL,
	[start_day] [datetime] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password], [isPremium]) VALUES (N'138e4c88-384e-4b71-b81a-80058cdfd554', N'Trương Sỹ Quảng', 1, N'Hồ Chí Minh', N'0888509298', 1, N'meokool2', N'123', 0)
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password], [isPremium]) VALUES (N'1ac005a2-6d51-4a25-8b71-8cbc42e22a43', N'Trương Sỹ Quảng', 1, N'Hồ Chí Minh', N'0888509298', 1, N'meokool1', N'123', 0)
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password], [isPremium]) VALUES (N'2a4e05de-e62e-4298-ba89-a8e4082ee861', N'Tong Truong Thanh', 1, N'Long Thanh My, Thu Duc, TP HCM', N'0967992202', 1, N'truongthanh002', N'123', 0)
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password], [isPremium]) VALUES (N'd6203f64-1384-4345-9b6c-f49cc0a8df8e', N'Huu Phuoc', 1, N'Q9, Thành Phố Thủ Đức', N'0123456789', 1, N'user22', N'123', 0)
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password], [isPremium]) VALUES (N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'Trương Sỹ Quảng', 1, N'Hồ Chí Minh', N'0888509299', 1, N'meokool', N'123', 1)
GO
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'0131455c-ee0c-42de-a2a8-7e2da07684fc', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-14T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 3, 1, NULL, N'1', CAST(N'2024-03-08T08:32:58.697' AS DateTime), N'123', N'Truong Sy Wang', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'05068556-8eb7-496d-8cda-5e30f6249650', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'2', CAST(N'2024-03-02T01:45:48.483' AS DateTime), N'0888509298', N'Thanh113', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'0958d8e3-35db-4f67-b82b-cf775186353e', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-21T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 30000, 4, 0, NULL, N'2', CAST(N'2024-03-06T21:53:51.333' AS DateTime), N'3213213', N'QQQQ', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'0dc9bb3f-142c-4ceb-9e93-b5818297ae5b', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 450000, 2, 1, NULL, N'2', CAST(N'2024-03-02T00:47:15.017' AS DateTime), N'', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'0ddd8c0d-c453-4ed2-b293-2f9ace7cf57a', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 2, NULL, N'3', CAST(N'2024-03-02T01:34:43.387' AS DateTime), N'0889509142', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'1002bb7b-20b7-4df0-994f-df50b4fcd7ce', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-20T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 1307811, 2, 0, NULL, N'2', CAST(N'2024-03-06T21:46:53.200' AS DateTime), N'0888509299', N'Quanr', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'16a4bc5a-b725-4cc5-a2fd-f98a09421d1e', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:17.603' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'16af19ea-26e3-44c0-be7e-cb7d3d1adef1', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-08T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 3, 2, NULL, N'1', CAST(N'2024-03-02T02:30:39.460' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'18fefbaf-a7da-489c-9376-994ffb2b5bfe', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-02-28T00:00:00.000' AS DateTime), CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'138e4c88-384e-4b71-b81a-80058cdfd554', 1453123, 2, 0, NULL, N'3', CAST(N'2024-03-03T23:49:46.250' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'1947e65c-560b-48d2-aa2b-c15431b3d434', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-04T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'138e4c88-384e-4b71-b81a-80058cdfd554', 1307811, 3, 1, NULL, N'1', CAST(N'2024-03-04T06:45:03.443' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'1ea56839-219b-46cb-9577-840528d28890', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-17T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 0, NULL, N'1', CAST(N'2024-03-02T00:54:46.253' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'2027f979-4dfb-445d-8b79-19ab14fa60ce', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-05T00:00:00.000' AS DateTime), CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'138e4c88-384e-4b71-b81a-80058cdfd554', 1307811, 2, 1, NULL, N'2', CAST(N'2024-03-04T11:39:35.603' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'20bc9d44-74cd-42d5-9f41-acbbfa49d288', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-16T00:00:00.000' AS DateTime), CAST(N'2024-03-24T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 3, 2, NULL, N'1', CAST(N'2024-03-02T02:30:22.963' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'22c37152-09e7-483a-8aa8-3397f8556f11', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:46:35.633' AS DateTime), N'0888509298', N'Thanh113', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'23a9537f-982c-4656-946f-d99de6fd7bee', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:55:45.893' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'28aabd44-802e-49bb-a88c-b699d5ed6224', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-29T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 3, 1, NULL, N'1', CAST(N'2024-03-02T02:22:22.747' AS DateTime), N'0889509142', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'2a326f91-87d8-4700-ac45-b4e414e1d2ee', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-06T00:00:00.000' AS DateTime), CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 3, 1, NULL, N'1', CAST(N'2024-03-03T08:04:40.850' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'2ae5bb6d-6750-45ca-ab4d-a0769efa6c40', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 3, 2, NULL, N'1', CAST(N'2024-03-02T02:27:56.527' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'2af76da3-1367-477e-a5bb-c4e1e77bd05d', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-22T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 3, 0, NULL, N'2', CAST(N'2024-03-02T01:49:28.807' AS DateTime), N'0888509298', N'2', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'2b9d0041-0709-4895-a2fa-0d79b8ec9689', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:15.657' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'2ca708e8-846c-4b89-95f0-dd669915bb61', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-02T02:21:54.380' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'2e91f83a-946c-448d-a305-140fe7d6ccda', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-17T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 0, NULL, N'1', CAST(N'2024-03-02T00:54:33.420' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'313a4f5f-6fd1-45f3-8c80-bd408a29a831', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 450000, 2, 1, NULL, N'1', CAST(N'2024-03-02T01:22:15.097' AS DateTime), N'', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'36aa0d46-a021-401e-9cdb-5c543afcae0a', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:42:42.183' AS DateTime), N'0888509298', N'Thanh113', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'3ada1141-b3eb-4c6f-9a11-8db300e9432d', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:55:44.257' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'3e9ac869-e11c-4d0a-8f0a-86800b12e3e4', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-04T00:00:00.000' AS DateTime), CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'1ac005a2-6d51-4a25-8b71-8cbc42e22a43', 1307811, 1, 0, NULL, N'2', CAST(N'2024-03-03T13:14:44.113' AS DateTime), N'0889509142', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'3f428a7a-8f4b-4bf4-88bc-252c7f86ac0f', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 450000, 2, 1, NULL, N'1', CAST(N'2024-03-02T00:52:49.787' AS DateTime), N'', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'3f90d11a-c854-483a-827d-3bc4a8820d24', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 3, 0, NULL, N'1', CAST(N'2024-03-02T02:27:38.590' AS DateTime), N'0889509142', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'495b3573-5718-4cd7-8c0e-bdc1e26eef84', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:19.960' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'4981925d-1ee4-4d68-b50c-cb55a11bccac', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:55:48.517' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'4a248518-1f5b-42de-9119-cd832e85d543', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:17.737' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'4df4ba8f-5a7a-4b7d-882a-34e0f6995e25', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:14.797' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'4f4b829b-dcb9-4404-a724-aeb1a71c8f56', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 2, NULL, N'1', CAST(N'2024-03-02T02:10:59.877' AS DateTime), N'0889509142', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'61788c78-ae81-4553-85c2-2bb88e403824', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-21T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 1453123, 3, 1, NULL, N'2', CAST(N'2024-03-06T21:50:39.927' AS DateTime), N'111213213213', N'QQQQ', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'68458c8f-162c-4727-bab6-20021a3e2301', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:16.860' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'6a8b5b53-b4d3-43ed-9ffa-f36ab4e03f2d', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-06T00:00:00.000' AS DateTime), CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 1453123, 3, 1, NULL, N'1', CAST(N'2024-03-06T21:47:15.767' AS DateTime), N'0967992202', N'Tong Truong Thanh', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'6ae7253d-f459-4bac-9771-b6fdd5e35619', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-16T00:00:00.000' AS DateTime), CAST(N'2024-03-24T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 450000, 2, 0, NULL, N'1', CAST(N'2024-03-02T02:11:52.730' AS DateTime), N'0888509298', N'Thanh1111', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'6b9d3cc5-c7ad-4832-887b-c0c68e9963d8', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:40:41.390' AS DateTime), N'0888509298', N'Thanh1111', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'6f11f143-998e-4ef1-853e-ddb4d5e38705', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:24:30.127' AS DateTime), N'0888509298', N'Quảng Thanh', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'746936b2-bf9d-4f38-b6cf-9620d2508a50', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 270000, 3, 1, NULL, N'1', CAST(N'2024-03-08T07:59:18.163' AS DateTime), N'012345677889', N'Truong Sy Wang', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'75298017-299d-4cfa-8d84-2853455dfec8', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-17T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 0, NULL, N'1', CAST(N'2024-03-02T00:54:56.977' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'7640cd17-8ad2-4893-8ae1-7018f60ba12e', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:17.450' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'7bd5fe81-9ed4-4419-ab20-92632d990d94', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-17T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 0, NULL, N'1', CAST(N'2024-03-02T00:52:46.317' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'7e28a9b5-794c-4d0a-80c0-2abdb4cec338', N'56379ef8-0425-451b-ab94-fb6ec9bb6a6b', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-20T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 245000, 4, 2, NULL, N'2', CAST(N'2024-03-07T23:00:43.697' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'7f67631b-ab45-43db-bdf6-82decee29a6e', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 2, NULL, N'1', CAST(N'2024-03-02T01:33:22.610' AS DateTime), N'0889509142', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'806e85ec-dfe7-4d44-aa08-450a0028fb17', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:43:46.577' AS DateTime), N'0888509298', N'Thanh113', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'8211d6ce-9974-4103-9e46-8ac8054da1c0', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:17.903' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'8556bf67-ace1-47bd-8ccc-4ac858cdbe60', N'42b80374-6285-446e-b142-418b2237cf01', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 4500000, 4, 2, NULL, N'2', CAST(N'2024-03-06T22:42:17.653' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'8cd47ac7-abf7-46f0-9350-3cc3eb0b27dd', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:46:28.070' AS DateTime), N'0888509298', N'Thanh113', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'8e966820-be42-4d35-abe3-490841c4844d', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:53:14.810' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'8f6588ea-b886-446e-a44c-2ffe56a29daf', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-04T00:00:00.000' AS DateTime), CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'1ac005a2-6d51-4a25-8b71-8cbc42e22a43', 450000, 1, 0, NULL, N'2', CAST(N'2024-03-03T12:17:20.040' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'9077857e-c0b4-471c-a376-ba705f478c04', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-13T00:00:00.000' AS DateTime), CAST(N'2024-03-26T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 3, 1, NULL, N'1', CAST(N'2024-03-08T09:07:25.483' AS DateTime), N'0967992202', N'Tong Truong Thanh', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'90822624-c798-4dbe-984f-6508de2b39d8', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:25:08.203' AS DateTime), N'0888509298', N'Quảng Thanh', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'9301e69e-e083-4da2-9fae-fb9638f9507a', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:19:05.887' AS DateTime), N'0888509298', N'Trương Sỹ Thanh', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'9309621e-622a-4050-8139-a27d22482a83', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-27T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 4, 2, NULL, N'1', CAST(N'2024-03-07T22:19:10.947' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'944d11cd-58ab-444a-bcfc-b60e4ddab090', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-29T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 450000, 2, 1, NULL, N'1', CAST(N'2024-03-03T11:49:41.223' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'9c7361d2-4184-4dc7-a62b-a74b0d665223', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-16T00:00:00.000' AS DateTime), CAST(N'2024-03-24T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 3, 2, NULL, N'1', CAST(N'2024-03-02T02:28:52.153' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'a2f18823-2d22-4bdc-b309-6ed94fed1bbe', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:24:08.117' AS DateTime), N'0888509298', N'Trương Sỹ Thanh', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'a302eeb2-7473-4266-994f-57628a743d33', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-19T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 4, 1, NULL, N'1', CAST(N'2024-03-07T21:56:18.563' AS DateTime), N'3213213213', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'a3d94346-c137-4e96-9b15-455fa0d88847', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-02T01:40:13.457' AS DateTime), N'0888509298', N'Trương Sỹ dsadsada', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'a7150898-a295-42e0-a37b-61f35a92374d', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 30000, 3, 1, NULL, N'2', CAST(N'2024-03-06T22:27:36.127' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'a75597e1-7002-4c9a-b46b-829af7edd114', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-29T00:00:00.000' AS DateTime), CAST(N'2024-03-27T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 4, 2, NULL, N'1', CAST(N'2024-03-08T21:56:05.743' AS DateTime), N'0889509142', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'b59f534d-dec8-45b6-872e-a4a045e49e1f', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-05T00:00:00.000' AS DateTime), CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 2, 1, NULL, N'1', CAST(N'2024-03-08T09:33:22.150' AS DateTime), N'0967992201', N'Tong Truong Thanhas', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'b8674d8c-e306-4883-9a9a-8b591a9f47e0', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:44:15.120' AS DateTime), N'0888509298', N'Thanh113', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'b8eb5007-efd8-4c2f-b410-6d199b280f5e', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 450000, 4, 2, NULL, N'3', CAST(N'2024-03-02T00:59:24.297' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'bd4a23bc-18fe-4f90-8ae9-643b5b42d1fc', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:18:03.510' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'bd8a1168-5076-49ee-8ee4-9be105fad5cc', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-04T00:00:00.000' AS DateTime), CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 1453123, 4, 1, NULL, N'1', CAST(N'2024-03-03T22:03:28.353' AS DateTime), N'0967992209', N'Tong Truong kakaaaa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'c65bf672-6600-4a28-b921-147b350290a2', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-21T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 4, 1, NULL, N'1', CAST(N'2024-03-07T22:20:13.617' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'c88bd7db-b78d-4627-8d8b-813f415551c8', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-06T00:00:00.000' AS DateTime), CAST(N'2024-03-07T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 1453123, 4, 2, NULL, N'1', CAST(N'2024-03-03T22:25:16.057' AS DateTime), N'0967992209', N'Tong Truong kakaaaa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'ca22053b-63ec-4c2f-a69d-156b6d78980d', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:59:03.973' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'd176ca77-af47-4c1a-8860-8f32ad1b9f62', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:55:41.617' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'd346731b-5d31-461d-97ad-1af498dfddef', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-14T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 210000, 3, 1, NULL, N'1', CAST(N'2024-03-07T21:30:10.100' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'd3f4bda1-f86d-44ab-b32e-e517ece09a1d', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-15T00:00:00.000' AS DateTime), CAST(N'2024-03-14T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 4, 2, NULL, N'2', CAST(N'2024-03-08T22:19:03.007' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'd6fb08dc-4853-4d6e-80b9-9c4a3e60d356', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'2a4e05de-e62e-4298-ba89-a8e4082ee861', 500000, 2, 1, NULL, N'1', CAST(N'2024-03-03T07:56:14.193' AS DateTime), N'0967992201', N'Tong TruongKAKAKAa', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'da4dfd52-a47a-45a4-9237-dceef5fcc7a3', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-20T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 30000, 4, 0, NULL, N'1', CAST(N'2024-03-06T22:13:10.190' AS DateTime), N'23213', N'QQQ', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'e6044f74-372d-438a-a92b-fc1668d10f2c', N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', CAST(N'2024-03-05T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'138e4c88-384e-4b71-b81a-80058cdfd554', 1307811, 4, 0, NULL, N'2', CAST(N'2024-03-03T23:21:38.893' AS DateTime), N'0888509298', N'Trương Sỹ Quảng', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'f51f0dd7-a854-4f58-ba02-bc61262c21a5', N'c6b6078c-354e-49f7-bacc-53951306b9f6', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-19T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 300000, 4, 2, NULL, N'1', CAST(N'2024-03-07T21:57:01.637' AS DateTime), N'23213', N'Trương Sỹ Quảng213', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'f7f1341e-9c9b-4aca-9196-541b5c4d0436', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:43:18.907' AS DateTime), N'0888509298', N'Thanh113', NULL)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [amount], [adult], [children], [room], [status], [create_day], [phone], [fullName], [paymentID]) VALUES (N'ffe42974-22dd-41e5-af42-f8df13d20ec8', N'f75f035e-6fe2-4693-9a9d-252becf43d28', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', 500000, 4, 1, NULL, N'1', CAST(N'2024-03-02T01:45:04.707' AS DateTime), N'0888509298', N'Thanh113', NULL)
GO
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'000a7473-f838-4b5c-bcac-cdd1e81c8905', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', N'6d2ce909-9d91-4c97-a09c-0385b59f04a2', CAST(N'2024-03-06T03:00:05.990' AS DateTime), CAST(N'2024-03-20T03:00:05.990' AS DateTime), CAST(N'2024-03-05T19:00:53.827' AS DateTime), N'2')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'2994e437-bfc5-49e4-adaf-a03ba8d7e48f', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'6d2ce909-9d91-4c97-a09c-0385b59f04a2', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime), CAST(N'2024-03-06T07:24:37.780' AS DateTime), N'2')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'3676d81b-b7d7-4d39-aca9-ea53da225b8e', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-06T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime), CAST(N'2024-03-05T22:23:18.920' AS DateTime), N'2')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'41fd0160-04b9-4045-8a88-173c82121b48', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-06T00:00:00.000' AS DateTime), CAST(N'2024-03-29T00:00:00.000' AS DateTime), CAST(N'2024-03-05T22:49:51.597' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'4a11aab4-eca4-4424-9d1d-71e047f30af5', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'43226835-d975-4231-bf90-04726499dcb1', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'2024-03-06T21:17:06.067' AS DateTime), N'2')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'4af11ff1-be33-49f8-9b47-358d0036934b', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'6d2ce909-9d91-4c97-a09c-0385b59f04a2', N'a8ea4125-a781-4b30-9bc3-7684248a05da', CAST(N'2024-03-06T03:37:54.607' AS DateTime), CAST(N'2024-03-30T03:37:54.607' AS DateTime), CAST(N'2024-03-05T19:48:43.287' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'6fafdb69-0dad-4f55-82d9-428e296fbc59', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-16T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime), CAST(N'2024-03-05T23:10:05.720' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'71d3ffaa-661d-453e-9bff-22ec5f51dbb2', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-24T00:00:00.000' AS DateTime), CAST(N'2024-03-05T20:05:10.167' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'902b41ec-9565-441c-891c-0e3ee6536a5c', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-15T00:00:00.000' AS DateTime), CAST(N'2024-03-22T00:00:00.000' AS DateTime), CAST(N'2024-03-05T22:09:21.147' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'94c2a56d-014d-4ec7-b286-c6376cd746fb', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-06T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime), CAST(N'2024-03-06T05:53:10.827' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'aaf685ea-5ca4-445c-a5b4-3717971d74c0', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'd7934dab-5fcb-41eb-8089-da734a6f52bb', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-06T07:32:59.690' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'ae9c23c6-950e-450c-b309-918695316f41', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-14T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime), CAST(N'2024-03-05T22:24:16.943' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'b1e65c06-d926-4f44-ab32-a5d130647b42', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'6d2ce909-9d91-4c97-a09c-0385b59f04a2', CAST(N'2024-03-06T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime), CAST(N'2024-03-05T20:01:26.770' AS DateTime), N'1')
INSERT [dbo].[Exchange] ([Id], [memberID1], [memberID2], [timeshareID1], [timeshareID2], [start_day], [end_day], [exchange_day], [status]) VALUES (N'c7c7b45a-8573-4508-988f-aa6bd307a751', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'138e4c88-384e-4b71-b81a-80058cdfd554', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', CAST(N'2024-03-15T00:00:00.000' AS DateTime), CAST(N'2024-03-27T00:00:00.000' AS DateTime), CAST(N'2024-03-05T23:21:36.290' AS DateTime), N'2')
GO
INSERT [dbo].[Payments] ([PaymentId], [Amount], [PaymentDate], [Status], [MemberId], [BookingId], [type], [payoutRequestID], [title]) VALUES (N'219dd11d-d37d-4144-aa34-5636483c70a1', CAST(300000.00 AS Decimal(20, 2)), CAST(N'2024-03-07T22:19:11.437' AS DateTime), N'1', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'9309621e-622a-4050-8139-a27d22482a83', NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PaymentId], [Amount], [PaymentDate], [Status], [MemberId], [BookingId], [type], [payoutRequestID], [title]) VALUES (N'3847b7e2-e528-4f29-876a-4473741385eb', CAST(300000.00 AS Decimal(20, 2)), CAST(N'2024-03-08T21:56:06.643' AS DateTime), N'1', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'a75597e1-7002-4c9a-b46b-829af7edd114', NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PaymentId], [Amount], [PaymentDate], [Status], [MemberId], [BookingId], [type], [payoutRequestID], [title]) VALUES (N'9879095f-640a-445c-ada1-a89f03f57772', CAST(300000.00 AS Decimal(20, 2)), CAST(N'2024-03-07T22:20:14.147' AS DateTime), N'1', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'c65bf672-6600-4a28-b921-147b350290a2', NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PaymentId], [Amount], [PaymentDate], [Status], [MemberId], [BookingId], [type], [payoutRequestID], [title]) VALUES (N'9b531d2d-e0ca-4290-aa94-48bb4e5ead09', CAST(300000.00 AS Decimal(20, 2)), CAST(N'2024-03-08T22:19:03.457' AS DateTime), N'2', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'd3f4bda1-f86d-44ab-b32e-e517ece09a1d', NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PaymentId], [Amount], [PaymentDate], [Status], [MemberId], [BookingId], [type], [payoutRequestID], [title]) VALUES (N'd14456ad-5fbc-4698-8e46-07bedbfab06b', CAST(245000.00 AS Decimal(20, 2)), CAST(N'2024-03-07T23:00:44.260' AS DateTime), N'1', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'7e28a9b5-794c-4d0a-80c0-2abdb4cec338', NULL, NULL, NULL)
INSERT [dbo].[Payments] ([PaymentId], [Amount], [PaymentDate], [Status], [MemberId], [BookingId], [type], [payoutRequestID], [title]) VALUES (N'ee066696-275d-4b2d-934f-dbf6c14d9294', CAST(500000.00 AS Decimal(20, 2)), CAST(N'2024-03-07T22:15:38.540' AS DateTime), N'1', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', N'05068556-8eb7-496d-8cda-5e30f6249650', NULL, NULL, NULL)
GO
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status], [price], [description], [memberId], [create_day]) VALUES (N'43226835-d975-4231-bf90-04726499dcb1', NULL, NULL, NULL, NULL, N'Uploads\43226835-d975-4231-bf90-04726499dcb1.jpg,Uploads\43226835-d975-4231-bf90-04726499dcb1_1.jpg', N'1', NULL, NULL, N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-06T09:54:05.753' AS DateTime))
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status], [price], [description], [memberId], [create_day]) VALUES (N'57b7d563-b084-4005-bce1-51f27fca404e', N'sdfsdfsdf', NULL, NULL, NULL, N'', N'1', NULL, NULL, N'd6203f64-1384-4345-9b6c-f49cc0a8df8e', CAST(N'2024-03-09T06:22:49.213' AS DateTime))
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status], [price], [description], [memberId], [create_day]) VALUES (N'6d2ce909-9d91-4c97-a09c-0385b59f04a2', N'FPTU_1', N'Hồ Chí Minh', N'Ok', NULL, N'Uploads\6d2ce909-9d91-4c97-a09c-0385b59f04a2.jpg,Uploads\6d2ce909-9d91-4c97-a09c-0385b59f04a2.jpeg,Uploads\6d2ce909-9d91-4c97-a09c-0385b59f04a2_1.jpeg', N'1', CAST(900000 AS Decimal(18, 0)), N'Ok', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-01T23:42:58.390' AS DateTime))
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status], [price], [description], [memberId], [create_day]) VALUES (N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'Cen Hotel', N'Vũng Tàu', N'1000', NULL, N'Uploads\a8ea4125-a781-4b30-9bc3-7684248a05da.jpg,Uploads\a8ea4125-a781-4b30-9bc3-7684248a05da_1.jpg,Uploads\a8ea4125-a781-4b30-9bc3-7684248a05da_2.jpg,Uploads\a8ea4125-a781-4b30-9bc3-7684248a05da_3.jpg,Uploads\a8ea4125-a781-4b30-9bc3-7684248a05da_4.jpg,Uploads\a8ea4125-a781-4b30-9bc3-7684248a05da_5.jpg', N'2', CAST(500000 AS Decimal(18, 0)), N'Vũng Tàu trip', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-01T23:43:40.943' AS DateTime))
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status], [price], [description], [memberId], [create_day]) VALUES (N'd7934dab-5fcb-41eb-8089-da734a6f52bb', N'FPTU', N'Hồ Chí Minh', N'111', NULL, N'Uploads\d7934dab-5fcb-41eb-8089-da734a6f52bb.jpg,Uploads\d7934dab-5fcb-41eb-8089-da734a6f52bb.jpeg,Uploads\d7934dab-5fcb-41eb-8089-da734a6f52bb_1.jpeg', N'2', CAST(100000 AS Decimal(18, 0)), N'1111', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-01T10:24:06.220' AS DateTime))
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status], [price], [description], [memberId], [create_day]) VALUES (N'ed175aa6-39e5-4f08-a8f2-b280ff33b2be', N'HCM', N'HCM', N'HCM', NULL, N'Uploads\ed175aa6-39e5-4f08-a8f2-b280ff33b2be.jpg,Uploads\ed175aa6-39e5-4f08-a8f2-b280ff33b2be_1.jpg,Uploads\ed175aa6-39e5-4f08-a8f2-b280ff33b2be_2.jpg', N'1', CAST(45645153 AS Decimal(18, 0)), N'HCM', N'138e4c88-384e-4b71-b81a-80058cdfd554', CAST(N'2024-03-03T23:42:51.530' AS DateTime))
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status], [price], [description], [memberId], [create_day]) VALUES (N'f7fe4a25-928e-483a-b15c-a1c368932861', NULL, NULL, NULL, NULL, N'', N'1', NULL, NULL, N'138e4c88-384e-4b71-b81a-80058cdfd554', CAST(N'2024-03-08T08:51:46.073' AS DateTime))
GO
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'1bfa10a3-69af-4d2c-ab37-cae0df25be8b', N'd7934dab-5fcb-41eb-8089-da734a6f52bb', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime), N'true', CAST(N'2024-03-01T10:24:36.223' AS DateTime), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'2d55c7ad-b4fe-4a49-b683-730988610926', N'6d2ce909-9d91-4c97-a09c-0385b59f04a2', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'1', CAST(N'2024-03-06T22:09:45.610' AS DateTime), CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'42b80374-6285-446e-b142-418b2237cf01', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime), N'2', CAST(N'2024-03-03T08:50:39.173' AS DateTime), CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'56379ef8-0425-451b-ab94-fb6ec9bb6a6b', N'd7934dab-5fcb-41eb-8089-da734a6f52bb', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime), N'2', CAST(N'2024-03-07T23:00:24.530' AS DateTime), CAST(245000 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'6ef612d5-7c81-4b42-b0b0-d450c001a311', N'd7934dab-5fcb-41eb-8089-da734a6f52bb', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime), N'true', CAST(N'2024-03-01T10:46:38.807' AS DateTime), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'7d39d3e5-89d0-46b0-a26c-a84735684d82', N'43226835-d975-4231-bf90-04726499dcb1', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'1', CAST(N'2024-03-07T21:29:09.580' AS DateTime), CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'8d45a3d3-3d28-44a3-a4d3-60d2078c1f34', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'2024-03-24T00:00:00.000' AS DateTime), N'2', CAST(N'2024-03-03T08:20:36.463' AS DateTime), CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'a8c4a064-f08d-4d3a-b6c4-28adc65ee809', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-14T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime), N'2', CAST(N'2024-03-03T08:53:59.023' AS DateTime), CAST(1453123 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'c6b6078c-354e-49f7-bacc-53951306b9f6', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime), N'2', CAST(N'2024-03-07T21:29:30.687' AS DateTime), CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'edfbb91f-a3ce-429a-b179-6d1f7ca2b530', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-14T00:00:00.000' AS DateTime), CAST(N'2024-03-28T00:00:00.000' AS DateTime), N'2', CAST(N'2024-03-03T08:53:08.323' AS DateTime), CAST(1453123 AS Decimal(18, 0)))
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status], [create_day], [price]) VALUES (N'f75f035e-6fe2-4693-9a9d-252becf43d28', N'a8ea4125-a781-4b30-9bc3-7684248a05da', N'ecc56a9d-feff-47dd-9e87-61b86f5bdebb', CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime), N'2', CAST(N'2024-03-02T00:24:51.257' AS DateTime), CAST(30000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Voucher] ([id], [name], [amount], [type], [end_day], [start_day], [status]) VALUES (N'17fab8d0-b0f7-4f9f-861a-7770d17035ce', N'TimeShare', 25, N'discount', CAST(N'2024-03-31T00:00:00.000' AS DateTime), CAST(N'2024-03-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Voucher] ([id], [name], [amount], [type], [end_day], [start_day], [status]) VALUES (N'45c6edca-c6cb-4d8a-8709-ad9ed1f17098', N'FPT', 10, N'discount', CAST(N'2024-03-28T00:00:00.000' AS DateTime), CAST(N'2024-03-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Voucher] ([id], [name], [amount], [type], [end_day], [start_day], [status]) VALUES (N'8ce9d5ae-f7dd-4f9c-9909-adf7976dd576', N'FPT', 20, N'discount', CAST(N'2024-03-24T00:00:00.000' AS DateTime), CAST(N'2024-03-02T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Voucher] ([id], [name], [amount], [type], [end_day], [start_day], [status]) VALUES (N'becb4f0c-b49d-4a0b-bf5b-ff9d0adb4e0d', N'TimeShare1', 30, N'discount', CAST(N'2024-03-31T00:00:00.000' AS DateTime), CAST(N'2024-03-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Voucher] ([id], [name], [amount], [type], [end_day], [start_day], [status]) VALUES (N'f60c85b0-cbff-40a5-b9c6-3b40627006ac', N'TimeShare2', 30, N'discount', CAST(N'2024-03-24T00:00:00.000' AS DateTime), CAST(N'2024-03-08T00:00:00.000' AS DateTime), 0)
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Account] FOREIGN KEY([memberID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Account]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Timeshare] FOREIGN KEY([timeshareID])
REFERENCES [dbo].[Timeshare] ([ID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Timeshare]
GO
ALTER TABLE [dbo].[Exchange]  WITH CHECK ADD  CONSTRAINT [FK_Exchange_Account] FOREIGN KEY([memberID1])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Exchange] CHECK CONSTRAINT [FK_Exchange_Account]
GO
ALTER TABLE [dbo].[Exchange]  WITH CHECK ADD  CONSTRAINT [FK_Exchange_Account1] FOREIGN KEY([memberID2])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Exchange] CHECK CONSTRAINT [FK_Exchange_Account1]
GO
ALTER TABLE [dbo].[Exchange]  WITH CHECK ADD  CONSTRAINT [FK_Exchange_Realestate] FOREIGN KEY([timeshareID1])
REFERENCES [dbo].[Realestate] ([id])
GO
ALTER TABLE [dbo].[Exchange] CHECK CONSTRAINT [FK_Exchange_Realestate]
GO
ALTER TABLE [dbo].[Exchange]  WITH CHECK ADD  CONSTRAINT [FK_Exchange_Realestate1] FOREIGN KEY([timeshareID2])
REFERENCES [dbo].[Realestate] ([id])
GO
ALTER TABLE [dbo].[Exchange] CHECK CONSTRAINT [FK_Exchange_Realestate1]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account] FOREIGN KEY([memberID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Account1] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Account1]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Booking] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Booking]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_payoutRequest] FOREIGN KEY([payoutRequestID])
REFERENCES [dbo].[PayoutRequest] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_payoutRequest]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_payoutRequest1] FOREIGN KEY([payoutRequestID])
REFERENCES [dbo].[PayoutRequest] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_payoutRequest1]
GO
ALTER TABLE [dbo].[PayoutRequest]  WITH CHECK ADD  CONSTRAINT [FK_payoutRequest_Account] FOREIGN KEY([memberid])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[PayoutRequest] CHECK CONSTRAINT [FK_payoutRequest_Account]
GO
ALTER TABLE [dbo].[Realestate]  WITH CHECK ADD  CONSTRAINT [FK_Realestate_Feedback] FOREIGN KEY([feedbackId])
REFERENCES [dbo].[Feedback] ([id])
GO
ALTER TABLE [dbo].[Realestate] CHECK CONSTRAINT [FK_Realestate_Feedback]
GO
ALTER TABLE [dbo].[Timeshare]  WITH CHECK ADD  CONSTRAINT [FK_Timeshare_Account] FOREIGN KEY([memberID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Timeshare] CHECK CONSTRAINT [FK_Timeshare_Account]
GO
ALTER TABLE [dbo].[Timeshare]  WITH CHECK ADD  CONSTRAINT [FK_Timeshare_Realestate] FOREIGN KEY([realestateID])
REFERENCES [dbo].[Realestate] ([id])
GO
ALTER TABLE [dbo].[Timeshare] CHECK CONSTRAINT [FK_Timeshare_Realestate]
GO
USE [master]
GO
ALTER DATABASE [TimeshareAPI] SET  READ_WRITE 
GO
