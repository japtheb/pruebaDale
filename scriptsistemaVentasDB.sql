USE [master]
GO
/****** Object:  Database [Sistema_Ventas]    Script Date: 12/17/2021 9:03:02 AM ******/
CREATE DATABASE [Sistema_Ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistema_Ventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER17\MSSQL\DATA\Sistema_Ventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sistema_Ventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER17\MSSQL\DATA\Sistema_Ventas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sistema_Ventas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistema_Ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistema_Ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_Ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistema_Ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sistema_Ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistema_Ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET RECOVERY FULL 
GO
ALTER DATABASE [Sistema_Ventas] SET  MULTI_USER 
GO
ALTER DATABASE [Sistema_Ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistema_Ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistema_Ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistema_Ventas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sistema_Ventas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sistema_Ventas', N'ON'
GO
ALTER DATABASE [Sistema_Ventas] SET QUERY_STORE = OFF
GO
USE [Sistema_Ventas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/17/2021 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Id_Tipo_Documento] [int] NOT NULL,
	[Documento] [nvarchar](20) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Apellido] [nvarchar](30) NOT NULL,
	[Telefono] [nvarchar](10) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 12/17/2021 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[Id_Inventario] [int] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Cantidad_Producto] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[Id_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 12/17/2021 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Producto] [varchar](20) NOT NULL,
	[Valor_Unidad] [bigint] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Documento]    Script Date: 12/17/2021 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Documento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](5) NOT NULL,
	[valor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipos_Documento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 12/17/2021 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Cantidad_Venta] [int] NOT NULL,
	[Valor_Total] [bigint] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Tipos_Documento] FOREIGN KEY([Id_Tipo_Documento])
REFERENCES [dbo].[Tipos_Documento] ([Id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Tipos_Documento]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Productos] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id_Producto])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Productos]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Clientes] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Productos] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id_Producto])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Productos]
GO
USE [master]
GO
ALTER DATABASE [Sistema_Ventas] SET  READ_WRITE 
GO
