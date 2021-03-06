/*USE [master]
GO
/****** Object:  Database [PruebaCorta1]    Script Date: 2/12/2020 11:04:14:p. m. ******/
CREATE DATABASE [PruebaCorta1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaCorta1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebaCorta1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaCorta1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebaCorta1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PruebaCorta1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaCorta1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaCorta1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaCorta1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaCorta1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaCorta1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaCorta1] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaCorta1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebaCorta1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaCorta1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaCorta1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaCorta1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaCorta1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaCorta1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaCorta1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaCorta1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaCorta1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PruebaCorta1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaCorta1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaCorta1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaCorta1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaCorta1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaCorta1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaCorta1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaCorta1] SET RECOVERY FULL 
GO
ALTER DATABASE [PruebaCorta1] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaCorta1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaCorta1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaCorta1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaCorta1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaCorta1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PruebaCorta1', N'ON'
GO
ALTER DATABASE [PruebaCorta1] SET QUERY_STORE = OFF
GO
USE [PruebaCorta1]*/
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[precioUnitario] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[idArticulo] [int] NOT NULL,
	[idProveedor] [int] NOT NULL,
	[Cantidad] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vArticulos]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vArticulos] AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Articulos.id, Articulos.precioUnitario, Inventario.idProveedor FROM articulos
INNER JOIN Inventario on Articulos.id=Inventario.idArticulo
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[idFactura] [int] NOT NULL,
	[idArticulo] [int] NOT NULL,
	[Cantidad] [decimal](18, 2) NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vFactura]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vFactura] AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Factura.Total, factura.Fecha, DetalleFactura.Monto FROM Factura
INNER JOIN DetalleFactura on Factura.id=DetalleFactura.idFactura
GO
/****** Object:  Table [dbo].[PagosCliente]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagosCliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_PagosCliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroPagos]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroPagos](
	[idPago] [int] NOT NULL,
	[idCliente] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vRegistroPagos]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vRegistroPagos] AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Cliente.id, Cliente.nombre, PagosCliente.Cantidad, PagosCliente.Fecha FROM Cliente
INNER JOIN RegistroPagos on Cliente.id=RegistroPagos.idCliente
INNER JOIN PagosCliente on RegistroPagos.idPago=PagosCliente.id
GO
/****** Object:  Table [dbo].[DetalleCompraProveedor]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompraProveedor](
	[idCompra] [int] NOT NULL,
	[idArticulo] [int] NOT NULL,
	[Cantidad] [decimal](18, 2) NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vCompraProveedor]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vCompraProveedor] AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Proveedor.id, Proveedor.Nombre, DetalleCompraProveedor.Cantidad, DetalleCompraProveedor.Monto FROM Proveedor
INNER JOIN Inventario on Proveedor.id=Inventario.idProveedor
INNER JOIN Articulos on Inventario.idArticulo=Articulos.id
INNER JOIN DetalleCompraProveedor on Articulos.id=DetalleCompraProveedor.idArticulo
GO
/****** Object:  Table [dbo].[CompraProveedor]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraProveedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_CompraProveedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[idCliente] [int] NOT NULL,
	[idFactura] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (1, N'Articulo 1', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (2, N'Articulo 2', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (3, N'Articulo 3', CAST(95.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (4, N'Articulo 4', CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (5, N'Articulo 5', CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (6, N'Articulo 6', CAST(35.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (8, N'Articulo 7', CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (9, N'Articulo 8', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (10, N'Articulo 9', CAST(92.00 AS Decimal(18, 2)))
INSERT [dbo].[Articulos] ([id], [Descripcion], [precioUnitario]) VALUES (11, N'Articulo 10', CAST(10.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (1, N'Cliente 1')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (2, N'Cliente 2')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (3, N'Cliente 3')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (4, N'Cliente 4')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (5, N'Cliente 5')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (6, N'Cliente 6')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (7, N'Cliente 7')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (8, N'Cliente 8')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (9, N'Cliente 9')
INSERT [dbo].[Cliente] ([id], [nombre]) VALUES (10, N'Cliente 10')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[CompraProveedor] ON 

INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (1, CAST(300 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (2, CAST(320 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (3, CAST(230 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (4, CAST(440 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (5, CAST(120 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (7, CAST(442 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (8, CAST(321 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (9, CAST(121 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (10, CAST(980 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
INSERT [dbo].[CompraProveedor] ([id], [Total], [Date]) VALUES (11, CAST(1204 AS Decimal(18, 0)), CAST(N'2020-11-24' AS Date))
SET IDENTITY_INSERT [dbo].[CompraProveedor] OFF
GO
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (1, 2, CAST(3.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (2, 1, CAST(4.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (3, 4, CAST(44.00 AS Decimal(18, 2)), CAST(1240.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (4, 5, CAST(32.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (5, 3, CAST(12.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (7, 6, CAST(1.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (8, 8, CAST(32.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (9, 9, CAST(2.00 AS Decimal(18, 2)), CAST(480.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (10, 9, CAST(3.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompraProveedor] ([idCompra], [idArticulo], [Cantidad], [Monto]) VALUES (11, 11, CAST(1.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (1, 1, CAST(5.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (2, 2, CAST(2.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (3, 3, CAST(1.50 AS Decimal(18, 2)), CAST(685.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (4, 4, CAST(1.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (5, 5, CAST(2.00 AS Decimal(18, 2)), CAST(230.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (6, 6, CAST(3.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (7, 8, CAST(1.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (8, 9, CAST(2.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (9, 10, CAST(1.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([idFactura], [idArticulo], [Cantidad], [Monto]) VALUES (10, 11, CAST(4.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (1, 600.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (2, 300.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (3, 150.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (4, 900.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (5, 1000.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (6, 200.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (7, 150.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (8, 690.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (9, 550.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Factura] ([id], [Total], [Fecha]) VALUES (10, 245.0000, CAST(N'2020-11-24' AS Date))
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (1, 2, CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (2, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (3, 1, CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (4, 6, CAST(66.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (5, 1, CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (6, 3, CAST(43.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (8, 8, CAST(44.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (9, 3, CAST(32.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (10, 10, CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[Inventario] ([idArticulo], [idProveedor], [Cantidad]) VALUES (11, 1, CAST(44.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[PagosCliente] ON 

INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (1, 150.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (2, 200.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (3, 133.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (4, 200.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (5, 150.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (6, 600.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (7, 100.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (8, 150.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (9, 200.0000, CAST(N'2020-11-24' AS Date))
INSERT [dbo].[PagosCliente] ([id], [Cantidad], [Fecha]) VALUES (10, 140.0000, CAST(N'2020-11-24' AS Date))
SET IDENTITY_INSERT [dbo].[PagosCliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (1, N'Proveedor 1')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (2, N'Proveedor 2')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (3, N'Proveedor 3')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (4, N'Proveedor 4')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (5, N'Proveedor 5')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (6, N'Proveedor 6')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (7, N'Proveedor 7')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (8, N'Proveedor 8')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (9, N'Proveedor 9')
INSERT [dbo].[Proveedor] ([id], [Nombre]) VALUES (10, N'Proveedor 10')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (1, 1)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (2, 2)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (3, 3)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (4, 4)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (5, 5)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (6, 6)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (7, 7)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (8, 8)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (9, 9)
INSERT [dbo].[RegistroPagos] ([idPago], [idCliente]) VALUES (10, 10)
GO
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (1, 1)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (2, 2)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (3, 3)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (4, 4)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (5, 5)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (6, 6)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (7, 7)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (8, 8)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (9, 9)
INSERT [dbo].[Ventas] ([idCliente], [idFactura]) VALUES (10, 10)
GO
ALTER TABLE [dbo].[DetalleCompraProveedor]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompraProveedor_Articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[Articulos] ([id])
GO
ALTER TABLE [dbo].[DetalleCompraProveedor] CHECK CONSTRAINT [FK_DetalleCompraProveedor_Articulos]
GO
ALTER TABLE [dbo].[DetalleCompraProveedor]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompraProveedor_CompraProveedor] FOREIGN KEY([idCompra])
REFERENCES [dbo].[CompraProveedor] ([id])
GO
ALTER TABLE [dbo].[DetalleCompraProveedor] CHECK CONSTRAINT [FK_DetalleCompraProveedor_CompraProveedor]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[Articulos] ([id])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Articulos]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Factura] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([id])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Factura]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[Articulos] ([id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Articulos]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Proveedor] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Proveedor]
GO
ALTER TABLE [dbo].[RegistroPagos]  WITH CHECK ADD  CONSTRAINT [FK_RegistroPagos_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[RegistroPagos] CHECK CONSTRAINT [FK_RegistroPagos_Cliente]
GO
ALTER TABLE [dbo].[RegistroPagos]  WITH CHECK ADD  CONSTRAINT [FK_RegistroPagos_PagosCliente] FOREIGN KEY([idPago])
REFERENCES [dbo].[PagosCliente] ([id])
GO
ALTER TABLE [dbo].[RegistroPagos] CHECK CONSTRAINT [FK_RegistroPagos_PagosCliente]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Cliente]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Factura] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Factura]
GO
/****** Object:  StoredProcedure [dbo].[SP_Facturas]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Facturas] AS
SELECT Factura.id, Factura.Fecha, Factura.Total, DetalleFactura.idArticulo from Factura
INNER JOIN DetalleFactura on Factura.id=DetalleFactura.idFactura
ORDER BY Factura.Total DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_Proveedores]    Script Date: 2/12/2020 11:04:14:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Proveedores] AS
SELECT Inventario.idArticulo, Inventario.Cantidad, Proveedor.Nombre from Inventario
INNER JOIN Proveedor on Inventario.idProveedor=proveedor.id
ORDER BY Inventario.Cantidad DESC
GO
/*USE [master]
GO
ALTER DATABASE [PruebaCorta1] SET  READ_WRITE 
GO*/
