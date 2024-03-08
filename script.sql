USE [master]
GO
CREATE DATABASE [TimeshareAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_aa4588_timeshare_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_aa4588_timeshare_DATA.mdf' , SIZE = 8192KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'db_aa4588_timeshare_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_aa4588_timeshare_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_aa4588_timeshare] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_aa4588_timeshare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_aa4588_timeshare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_aa4588_timeshare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_aa4588_timeshare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_aa4588_timeshare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_aa4588_timeshare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_aa4588_timeshare] SET  MULTI_USER 
GO
ALTER DATABASE [db_aa4588_timeshare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_aa4588_timeshare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_aa4588_timeshare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_aa4588_timeshare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_aa4588_timeshare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_aa4588_timeshare] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_aa4588_timeshare] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_aa4588_timeshare] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_aa4588_timeshare]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/7/2024 1:52:05 PM ******/
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
/****** Object:  Table [dbo].[Booking]    Script Date: 3/7/2024 1:52:05 PM ******/
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
/****** Object:  Table [dbo].[Exchange]    Script Date: 3/7/2024 1:52:05 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/7/2024 1:52:05 PM ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 3/7/2024 1:52:05 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Realestate]    Script Date: 3/7/2024 1:52:05 PM ******/
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
/****** Object:  Table [dbo].[Timeshare]    Script Date: 3/7/2024 1:52:05 PM ******/
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
/****** Object:  Table [dbo].[Voucher]    Script Date: 3/7/2024 1:52:05 PM ******/
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
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Account] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Account]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Booking] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Booking]
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
ALTER DATABASE [db_aa4588_timeshare] SET  READ_WRITE 
GO
