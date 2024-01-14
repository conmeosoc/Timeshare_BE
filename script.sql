USE [master]
GO
/****** Object:  Database [TimeshareExchange]    Script Date: 1/14/2024 9:18:55 PM ******/
CREATE DATABASE [TimeshareExchange]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeshareExchage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeshareExchage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeshareExchage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TimeshareExchage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [TimeshareExchange] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [TimeshareExchange] SET  DISABLE_BROKER 
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
ALTER DATABASE [TimeshareExchange] SET RECOVERY FULL 
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
ALTER DATABASE [TimeshareExchange] SET QUERY_STORE = OFF
GO
USE [TimeshareExchange]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/14/2024 9:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[sex] [bit] NULL,
	[address] [nvarchar](50) NULL,
	[phone] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 1/14/2024 9:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [nvarchar](50) NOT NULL,
	[realestateID] [nvarchar](50) NULL,
	[start_day] [datetime] NULL,
	[end_day] [datetime] NULL,
	[memberID] [nvarchar](50) NULL,
	[deposit] [money] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exchange]    Script Date: 1/14/2024 9:18:55 PM ******/
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
/****** Object:  Table [dbo].[payment]    Script Date: 1/14/2024 9:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payID] [nvarchar](50) NOT NULL,
	[memberID] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[money] [int] NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[payID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 1/14/2024 9:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[realestateID] [nvarchar](50) NULL,
	[price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Realestate]    Script Date: 1/14/2024 9:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realestate](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[location] [nvarchar](50) NULL,
	[facility] [nvarchar](50) NULL,
	[feedback] [nvarchar](50) NULL,
	[photo] [binary](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Realestate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeshare]    Script Date: 1/14/2024 9:18:55 PM ******/
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
/****** Object:  Table [dbo].[voucher]    Script Date: 1/14/2024 9:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[id] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[amount] [int] NULL,
	[type] [nvarchar](50) NULL,
	[end_day] [datetime] NULL,
	[start_day] [datetime] NULL,
	[status] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Realestate] FOREIGN KEY([realestateID])
REFERENCES [dbo].[Realestate] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Realestate]
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
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_Account] FOREIGN KEY([memberID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_Account]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_Realestate] FOREIGN KEY([realestateID])
REFERENCES [dbo].[Realestate] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_Realestate]
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
