USE [master]
GO
/****** Object:  Database [elecciones]    Script Date: 29/6/2023 15:44:12 ******/
CREATE DATABASE [elecciones]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'elecciones', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\elecciones.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'elecciones_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\elecciones_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [elecciones] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [elecciones].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [elecciones] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [elecciones] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [elecciones] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [elecciones] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [elecciones] SET ARITHABORT OFF 
GO
ALTER DATABASE [elecciones] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [elecciones] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [elecciones] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [elecciones] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [elecciones] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [elecciones] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [elecciones] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [elecciones] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [elecciones] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [elecciones] SET  DISABLE_BROKER 
GO
ALTER DATABASE [elecciones] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [elecciones] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [elecciones] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [elecciones] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [elecciones] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [elecciones] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [elecciones] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [elecciones] SET RECOVERY FULL 
GO
ALTER DATABASE [elecciones] SET  MULTI_USER 
GO
ALTER DATABASE [elecciones] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [elecciones] SET DB_CHAINING OFF 
GO
ALTER DATABASE [elecciones] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [elecciones] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [elecciones] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'elecciones', N'ON'
GO
ALTER DATABASE [elecciones] SET QUERY_STORE = OFF
GO
USE [elecciones]
GO
/****** Object:  User [alumno]    Script Date: 29/6/2023 15:44:12 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Candidato]    Script Date: 29/6/2023 15:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidato](
	[IdCandidato] [int] NOT NULL,
	[IdPartido] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Foto] [varchar](50) NOT NULL,
	[Postulación] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Candidato] PRIMARY KEY CLUSTERED 
(
	[IdCandidato] ASC,
	[IdPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 29/6/2023 15:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[IdPartido] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Logo] [varchar](max) NOT NULL,
	[SitioWeb] [varchar](max) NOT NULL,
	[FechaFundacion] [datetime] NOT NULL,
	[CantidadDiputados] [int] NOT NULL,
	[CantidadSenadores] [int] NOT NULL,
 CONSTRAINT [PK_Partido] PRIMARY KEY CLUSTERED 
(
	[IdPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (1, N'Juntos por el cambio', N'https://i.imgur.com/kscdiBT.png', N'https://pro.com.ar/', CAST(N'2019-06-12T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (2, N'Libertad', N'https://i.imgur.com/v68GaD7.png', N'https://lalibertadavanza.com.ar/', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (3, N'Frente de todos', N'https://i.imgur.com/mLbXpeh.png', N'https://www.frentedetodos.org/', CAST(N'2019-06-12T00:00:00.000' AS DateTime), 0, 1)
GO
ALTER TABLE [dbo].[Candidato]  WITH CHECK ADD  CONSTRAINT [FK_Candidato_Partido] FOREIGN KEY([IdPartido])
REFERENCES [dbo].[Partido] ([IdPartido])
GO
ALTER TABLE [dbo].[Candidato] CHECK CONSTRAINT [FK_Candidato_Partido]
GO
USE [master]
GO
ALTER DATABASE [elecciones] SET  READ_WRITE 
GO
