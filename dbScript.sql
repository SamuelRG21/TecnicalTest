USE [master]
GO
/****** Object:  Database [db_flight]    Script Date: 06/04/2024 15:25:35 ******/
CREATE DATABASE [db_flight]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdflight', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS01\MSSQL\DATA\bdflight.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bdflight_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS01\MSSQL\DATA\bdflight_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [db_flight] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_flight].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_flight] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_flight] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_flight] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_flight] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_flight] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_flight] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_flight] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_flight] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_flight] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_flight] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_flight] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_flight] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_flight] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_flight] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_flight] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_flight] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_flight] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_flight] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_flight] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_flight] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_flight] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_flight] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_flight] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_flight] SET  MULTI_USER 
GO
ALTER DATABASE [db_flight] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_flight] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_flight] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_flight] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_flight] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_flight] SET QUERY_STORE = OFF
GO
USE [db_flight]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [db_flight]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 06/04/2024 15:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NULL,
	[city] [varchar](5) NULL,
	[lat] [float] NULL,
	[lon] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 06/04/2024 15:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[flight_num] [int] NULL,
	[airline] [varchar](15) NULL,
	[folio] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itinerary]    Script Date: 06/04/2024 15:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itinerary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Flight_id] [int] NOT NULL,
	[Airport_id] [int] NOT NULL,
	[journey] [smallint] NULL,
	[date] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 06/04/2024 15:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Flight_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_db]    Script Date: 06/04/2024 15:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_db](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[password_hash] [varchar](30) NULL,
	[auth_key] [varchar](50) NULL,
	[status_us] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weather_day]    Script Date: 06/04/2024 15:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weather_day](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Airport_id] [int] NOT NULL,
	[main] [varchar](70) NULL,
	[description] [varchar](100) NULL,
	[icon] [varchar](8) NULL,
	[temp] [float] NULL,
	[feels_like] [float] NULL,
	[temp_min] [float] NULL,
	[temp_max] [float] NULL,
	[pressure] [float] NULL,
	[humidity] [float] NULL,
	[visibility] [float] NULL,
	[wind_speed] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_06]    Script Date: 06/04/2024 15:25:36 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_06] ON [dbo].[Itinerary]
(
	[Flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_09]    Script Date: 06/04/2024 15:25:36 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_09] ON [dbo].[Itinerary]
(
	[Airport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Itinerary_FKIndex1]    Script Date: 06/04/2024 15:25:36 ******/
CREATE NONCLUSTERED INDEX [Itinerary_FKIndex1] ON [dbo].[Itinerary]
(
	[Airport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Itinerary_FKIndex2]    Script Date: 06/04/2024 15:25:36 ******/
CREATE NONCLUSTERED INDEX [Itinerary_FKIndex2] ON [dbo].[Itinerary]
(
	[Flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_07]    Script Date: 06/04/2024 15:25:36 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_07] ON [dbo].[Ticket]
(
	[Flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Ticket_FKIndex1]    Script Date: 06/04/2024 15:25:36 ******/
CREATE NONCLUSTERED INDEX [Ticket_FKIndex1] ON [dbo].[Ticket]
(
	[Flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_08]    Script Date: 06/04/2024 15:25:36 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_08] ON [dbo].[Weather_day]
(
	[Airport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Weather_day_FKIndex1]    Script Date: 06/04/2024 15:25:36 ******/
CREATE NONCLUSTERED INDEX [Weather_day_FKIndex1] ON [dbo].[Weather_day]
(
	[Airport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Itinerary]  WITH CHECK ADD FOREIGN KEY([Airport_id])
REFERENCES [dbo].[Airport] ([id])
GO
ALTER TABLE [dbo].[Itinerary]  WITH CHECK ADD FOREIGN KEY([Flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([Flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[Weather_day]  WITH CHECK ADD FOREIGN KEY([Airport_id])
REFERENCES [dbo].[Airport] ([id])
GO
/****** Object:  StoredProcedure [dbo].[resetDataSet]    Script Date: 06/04/2024 15:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      SamuelRG
-- Create Date: 04/04/2024
-- Description: Reset DB.
-- =============================================
CREATE PROCEDURE [dbo].[resetDataSet]
AS
BEGIN

    DELETE  from Weather_day;
	TRUNCATE TABLE ticket;
	TRUNCATE TABLE itinerary;
	DELETE  from Airport;
	DELETE  from Flight;
	DBCC CHECKIDENT(Weather_day , RESEED, 0);
	DBCC CHECKIDENT(Weather_day , RESEED, 0);
	DBCC CHECKIDENT(Airport , RESEED, 0);
	DBCC CHECKIDENT(Airport , RESEED, 0);
	DBCC CHECKIDENT(Flight , RESEED, 0);
	DBCC CHECKIDENT(Flight , RESEED, 0);
END
GO
USE [master]
GO
ALTER DATABASE [db_flight] SET  READ_WRITE 
GO
