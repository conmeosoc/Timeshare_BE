USE [master]
GO
/****** Object:  Database [TimeshareExchange]    Script Date: 2/1/2024 1:47:26 PM ******/
CREATE DATABASE [TimeshareExchange]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeshareExchange', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeshareExchange.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeshareExchange_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeshareExchange_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TimeshareExchange] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeshareExchange].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeshareExchange] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeshareExchange] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeshareExchange] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeshareExchange] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeshareExchange] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeshareExchange] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TimeshareExchange] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeshareExchange] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeshareExchange] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeshareExchange] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeshareExchange] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeshareExchange] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeshareExchange] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeshareExchange] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeshareExchange] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TimeshareExchange] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeshareExchange] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeshareExchange] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeshareExchange] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeshareExchange] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeshareExchange] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeshareExchange] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeshareExchange] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TimeshareExchange] SET  MULTI_USER 
GO
ALTER DATABASE [TimeshareExchange] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeshareExchange] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeshareExchange] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeshareExchange] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeshareExchange] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimeshareExchange] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeshareExchange', N'ON'
GO
ALTER DATABASE [TimeshareExchange] SET QUERY_STORE = ON
GO
ALTER DATABASE [TimeshareExchange] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TimeshareExchange]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/1/2024 1:47:26 PM ******/
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
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 2/1/2024 1:47:26 PM ******/
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
	[deposit] [money] NULL,
	[amount] [int] NULL,
	[adult] [int] NULL,
	[children] [int] NULL,
	[room] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exchange]    Script Date: 2/1/2024 1:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exchange](
	[memberID] [nvarchar](50) NULL,
	[timeshareID] [nvarchar](50) NULL,
	[start_day] [datetime] NULL,
	[end_day] [datetime] NULL,
	[exchange_day] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/1/2024 1:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[memberID] [nvarchar](50) NULL,
	[id] [nvarchar](50) NOT NULL,
	[text] [nvarchar](50) NULL,
	[rate] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2/1/2024 1:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payID] [nvarchar](50) NOT NULL,
	[memberID] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[money] [int] NULL,
	[bookingID] [nvarchar](50) NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[payID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 2/1/2024 1:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[realestateID] [nvarchar](50) NULL,
	[price] [money] NULL,
	[id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Realestate]    Script Date: 2/1/2024 1:47:26 PM ******/
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
	[photo] [binary](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Realestate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeshare]    Script Date: 2/1/2024 1:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timeshare](
	[ID] [nvarchar](50) NOT NULL,
	[realestateID] [nvarchar](50) NULL,
	[memberID] [nvarchar](50) NULL,
	[start_day] [datetime] NULL,
	[end_day] [datetime] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Timeshare] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 2/1/2024 1:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[id] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[amount] [int] NULL,
	[type] [nvarchar](50) NULL,
	[end_day] [datetime] NULL,
	[start_day] [datetime] NULL,
	[status] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password]) VALUES (N'664feaa4-db78-4b9a-8a14-3b45162d63fc', N'Hoàng Văn Khoa', 1, N'222 Đường Võ Văn Tần, Quận 3, TP.HCM', N'123456789', 0, N'hoangvankhoa', N'123123')
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password]) VALUES (N'85bb811b-0a73-472e-95c5-c3db9be12b99', N'Nguyễn Văn Huy', 1, N'123 Đường Lê Lợi, Quận 1, TP.HCM', N'222333444', 1, N'nguyenvanhuy', N'111111')
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password]) VALUES (N'9f67dd01-0241-4113-85c5-9d4f972e0d51', N'Lê Thị Dung', 0, N'101 Đường Hai Bà Trưng, Quận 10, TP.HCM', N'123123123', 1, N'lethidung', N'88888888')
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password]) VALUES (N'9fdf359c-70e3-4ab4-b44c-26ef19db803b', N'Phạm Văn Cao', 1, N'789 Đường Trần Hưng Đạo, Quận 5, TP.HCM', N'654654654', 1, N'phamvancao', N'345345345')
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password]) VALUES (N'a6256076-364b-42a1-9ce7-277c65e33d08', N'Trần Xuân Hậu', 1, N'721 Đường An Hạ, Quận 3, TP.HCM', N'347930112', 1, N'hautxse161237', N'Tranxuanhau0112')
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password]) VALUES (N'fb7fd06b-2734-44c5-9e95-0781b5b58ecb', N'Trần Thị Bích', 0, N'456 Đường Nguyễn Huệ, Quận 3, TP.HCM', N'147147147', 0, N'tranthibich123', N'hehehe123')
INSERT [dbo].[Account] ([Id], [fullName], [sex], [address], [phone], [status], [username], [password]) VALUES (N'string', N'Testtttttttttttt', 1, N'10435 Kha Van Can', N'645645', 1, N'trtert', N'1')
GO
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [deposit], [amount], [adult], [children], [room]) VALUES (N'577e0c59-a079-4f0a-9b2e-3720f91e64d4', N'48599f2b-0976-4a26-9afa-0f8f43760119', CAST(N'2024-11-22T00:00:00.000' AS DateTime), CAST(N'2024-11-29T00:00:00.000' AS DateTime), N'664feaa4-db78-4b9a-8a14-3b45162d63fc', 300000.0000, 3000000, 10, 5, 5)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [deposit], [amount], [adult], [children], [room]) VALUES (N'6e387a08-b4e8-4946-90e4-c33b88465246', N'74afc8ab-cb66-48e3-8c55-64b969988f1f', CAST(N'2024-09-12T00:00:00.000' AS DateTime), CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'85bb811b-0a73-472e-95c5-c3db9be12b99', 1000000.0000, 6000000, 12, 6, 6)
INSERT [dbo].[Booking] ([id], [timeshareID], [start_day], [end_day], [memberID], [deposit], [amount], [adult], [children], [room]) VALUES (N'b2043b97-dab8-4e9d-9603-6ce425d8b3af', N'0160082b-4f22-41b0-baa3-66347036730b', CAST(N'2024-10-25T00:00:00.000' AS DateTime), CAST(N'2024-10-29T00:00:00.000' AS DateTime), N'9f67dd01-0241-4113-85c5-9d4f972e0d51', 500000.0000, 4500000, 8, 4, 4)
GO
INSERT [dbo].[Feedback] ([memberID], [id], [text], [rate]) VALUES (N'664feaa4-db78-4b9a-8a14-3b45162d63fc', N'117340f0-4fc2-4de9-a87f-c70a8e198fbd', N'qua tuyet', 5)
INSERT [dbo].[Feedback] ([memberID], [id], [text], [rate]) VALUES (N'a6256076-364b-42a1-9ce7-277c65e33d08', N'b3d13915-e4b4-47dd-b9d6-44c3d9eed219', N'tuyet voi lam', 5)
GO
INSERT [dbo].[Payment] ([payID], [memberID], [date], [money], [bookingID]) VALUES (N'15104eae-1c03-4016-aa7c-095c83951338', N'85bb811b-0a73-472e-95c5-c3db9be12b99', CAST(N'2024-08-11T00:00:00.000' AS DateTime), 1000000, N'6e387a08-b4e8-4946-90e4-c33b88465246')
INSERT [dbo].[Payment] ([payID], [memberID], [date], [money], [bookingID]) VALUES (N'aa8fea16-bb95-4df9-b52b-5acb0e1b35b4', N'9f67dd01-0241-4113-85c5-9d4f972e0d51', CAST(N'2024-08-22T00:00:00.000' AS DateTime), 500000, N'b2043b97-dab8-4e9d-9603-6ce425d8b3af')
INSERT [dbo].[Payment] ([payID], [memberID], [date], [money], [bookingID]) VALUES (N'f207ab0a-d161-4ac3-b000-12663223edb5', N'9f67dd01-0241-4113-85c5-9d4f972e0d51', CAST(N'2024-11-21T00:00:00.000' AS DateTime), 300000, N'577e0c59-a079-4f0a-9b2e-3720f91e64d4')
GO
INSERT [dbo].[Post] ([realestateID], [price], [id]) VALUES (N'f926269b-382f-45a0-bba4-656bc0487cde', 2200000.0000, N'38a3a998-8da5-4e46-9004-ce7344bb4f5f')
INSERT [dbo].[Post] ([realestateID], [price], [id]) VALUES (N'95011fba-77bd-4fa4-94b6-e7ede79b943b', 1500000.0000, N'daaad212-5a24-4702-9618-df964b1dbf46')
GO
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status]) VALUES (N'0b6ec78e-6652-4eef-a673-9f2f4d001ca9', N'HCM', N'Hồ Chí Minh', N'asdasd', NULL, NULL, N'True')
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status]) VALUES (N'69969b28-0851-4813-add8-322317b7fd7e', N'HN', N'Hà Nội', N'xfdgfdg', NULL, NULL, N'True')
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status]) VALUES (N'95011fba-77bd-4fa4-94b6-e7ede79b943b', N'QN', N'Quy Nhơn', N'werwerwre', NULL, NULL, N'True')
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status]) VALUES (N'f926269b-382f-45a0-bba4-656bc0487cde', N'CT', N'Cần Thơ', N'uhgeurhgiuerhg', NULL, NULL, N'True')
INSERT [dbo].[Realestate] ([id], [name], [location], [facility], [feedbackId], [photo], [status]) VALUES (N'fb723082-7072-473e-9a9c-6dc018185ac3', N'DN', N'Đà Nẵng', N'urtwuefhwufw', NULL, NULL, N'True')
GO
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status]) VALUES (N'0160082b-4f22-41b0-baa3-66347036730b', N'95011fba-77bd-4fa4-94b6-e7ede79b943b', NULL, CAST(N'2024-10-25T00:00:00.000' AS DateTime), CAST(N'2024-10-29T00:00:00.000' AS DateTime), N'True')
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status]) VALUES (N'48599f2b-0976-4a26-9afa-0f8f43760119', N'fb723082-7072-473e-9a9c-6dc018185ac3', NULL, CAST(N'2024-11-22T00:00:00.000' AS DateTime), CAST(N'2024-11-29T00:00:00.000' AS DateTime), N'True')
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status]) VALUES (N'74afc8ab-cb66-48e3-8c55-64b969988f1f', N'0b6ec78e-6652-4eef-a673-9f2f4d001ca9', NULL, CAST(N'2024-09-12T00:00:00.000' AS DateTime), CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'False')
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status]) VALUES (N'7774d52d-022c-4b18-adba-39f27e7898eb', N'f926269b-382f-45a0-bba4-656bc0487cde', NULL, CAST(N'2024-08-25T00:00:00.000' AS DateTime), CAST(N'2024-08-30T00:00:00.000' AS DateTime), N'False')
INSERT [dbo].[Timeshare] ([ID], [realestateID], [memberID], [start_day], [end_day], [status]) VALUES (N'801306ea-cd52-454b-9c5b-95222064d993', N'69969b28-0851-4813-add8-322317b7fd7e', NULL, CAST(N'2024-09-12T00:00:00.000' AS DateTime), CAST(N'2024-09-18T00:00:00.000' AS DateTime), N'True')
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
ALTER TABLE [dbo].[Exchange]  WITH CHECK ADD  CONSTRAINT [FK_Exchange_Account] FOREIGN KEY([memberID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Exchange] CHECK CONSTRAINT [FK_Exchange_Account]
GO
ALTER TABLE [dbo].[Exchange]  WITH CHECK ADD  CONSTRAINT [FK_Exchange_Timeshare] FOREIGN KEY([timeshareID])
REFERENCES [dbo].[Timeshare] ([ID])
GO
ALTER TABLE [dbo].[Exchange] CHECK CONSTRAINT [FK_Exchange_Timeshare]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account] FOREIGN KEY([memberID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_Account] FOREIGN KEY([memberID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_payment_Account]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_post_Realestate] FOREIGN KEY([realestateID])
REFERENCES [dbo].[Realestate] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_post_Realestate]
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
ALTER DATABASE [TimeshareExchange] SET  READ_WRITE 
GO
