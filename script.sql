
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
/****** Object:  Table [dbo].[Booking]    Script Date: 3/2/2024 1:04:25 AM ******/
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
/****** Object:  Table [dbo].[Exchange]    Script Date: 3/2/2024 1:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exchange](
	[Id] [nvarchar](50) NOT NULL,
	[memberID1] [nvarchar](50) NULL,
	[memberID2] [nvarchar](50) NULL,
	[timeshareID1] [nvarchar](50) NULL,
	[timeshareID2] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/2/2024 1:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[memberID] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[Payment]    Script Date: 3/2/2024 1:04:25 AM ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 3/2/2024 1:04:25 AM ******/
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
/****** Object:  Table [dbo].[Realestate]    Script Date: 3/2/2024 1:04:25 AM ******/
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
	[memberId] [nvarchar](50) NULL,
	[create_day] [datetime] NULL,
 CONSTRAINT [PK_Realestate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeshare]    Script Date: 3/2/2024 1:04:25 AM ******/
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
	[create_day] [datetime] NULL,
	[price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Timeshare] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 3/2/2024 1:04:25 AM ******/
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
