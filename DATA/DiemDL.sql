USE [master]
GO
/****** Object:  Database [DiemDL]    Script Date: 8/15/2017 7:16:06 PM ******/
CREATE DATABASE [DiemDL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiemDL', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiemDL.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiemDL_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiemDL_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiemDL] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiemDL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiemDL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiemDL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiemDL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiemDL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiemDL] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiemDL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiemDL] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiemDL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiemDL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiemDL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiemDL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiemDL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiemDL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiemDL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiemDL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiemDL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiemDL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiemDL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiemDL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiemDL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiemDL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiemDL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiemDL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiemDL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiemDL] SET  MULTI_USER 
GO
ALTER DATABASE [DiemDL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiemDL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiemDL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiemDL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiemDL]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Avatar] [nvarchar](250) NOT NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[AccountID] [bigint] NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[AccountID] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[CreateDate] [datetime] NULL,
	[AccountID] [bigint] NULL,
	[Status] [bit] NOT NULL,
	[ViewCount] [int] NULL,
	[Detail] [ntext] NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Images] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invest]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invest](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[AccountID] [bigint] NULL,
	[Status] [bit] NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Invest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Icon] [nvarchar](4000) NULL,
	[Text] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[AccountID] [bigint] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slider]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[AccountID] [bigint] NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticker]    Script Date: 8/15/2017 7:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticker](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[CreateDate] [datetime] NULL,
	[AccountID] [bigint] NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Ticker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Invest] ADD  CONSTRAINT [DF_Invest_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Invest] ADD  CONSTRAINT [DF_Invest_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Ticker] ADD  CONSTRAINT [DF_Ticker_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Ticker] ADD  CONSTRAINT [DF_Ticker_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Account]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Account]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Account]
GO
ALTER TABLE [dbo].[Invest]  WITH CHECK ADD  CONSTRAINT [FK_Invest_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Invest] CHECK CONSTRAINT [FK_Invest_Account]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Account]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_Account]
GO
ALTER TABLE [dbo].[Ticker]  WITH CHECK ADD  CONSTRAINT [FK_Ticker_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Ticker] CHECK CONSTRAINT [FK_Ticker_Account]
GO
USE [master]
GO
ALTER DATABASE [DiemDL] SET  READ_WRITE 
GO
