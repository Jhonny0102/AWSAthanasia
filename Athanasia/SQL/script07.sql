USE [master]
GO
/****** Object:  Database [ATHANASIA]    Script Date: 14/03/2024 14:09:42 ******/
CREATE DATABASE [ATHANASIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATHANASIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ATHANASIA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATHANASIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ATHANASIA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ATHANASIA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATHANASIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATHANASIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATHANASIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATHANASIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATHANASIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATHANASIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATHANASIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATHANASIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATHANASIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATHANASIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATHANASIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATHANASIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATHANASIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATHANASIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATHANASIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATHANASIA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATHANASIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATHANASIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATHANASIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATHANASIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATHANASIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATHANASIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATHANASIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATHANASIA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ATHANASIA] SET  MULTI_USER 
GO
ALTER DATABASE [ATHANASIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATHANASIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATHANASIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATHANASIA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATHANASIA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATHANASIA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ATHANASIA] SET QUERY_STORE = OFF
GO
USE [ATHANASIA]
GO
/****** Object:  UserDefinedFunction [dbo].[LIMPIAR]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[LIMPIAR] (@str nvarchar(MAX))
returns nvarchar(MAX)
as
begin
    set @str = REPLACE(@str, 'á', 'a')
    set @str = REPLACE(@str, 'é', 'e')
    set @str = REPLACE(@str, 'í', 'i')
    set @str = REPLACE(@str, 'ó', 'o')
    set @str = REPLACE(@str, 'ú', 'u')
    set @str = REPLACE(@str, 'Á', 'A')
    set @str = REPLACE(@str, 'É', 'E')
    set @str = REPLACE(@str, 'Í', 'I')
    set @str = REPLACE(@str, 'Ó', 'O')
    set @str = REPLACE(@str, 'Ú', 'U')
    set @str = REPLACE(@str, '&', '')
    set @str = REPLACE(@str, '-', '')
    set @str = REPLACE(@str, '_', '')
    set @str = REPLACE(@str, '+', '')
    set @str = REPLACE(@str, '"', '')
    set @str = REPLACE(@str, '''', '')
    set @str = REPLACE(@str, ',', '')
    set @str = REPLACE(@str, '.', '')
    set @str = REPLACE(@str, '?', '')
    set @str = REPLACE(@str, '`', '')
	set @str = REPLACE(@str, '!', '')
    set @str = REPLACE(@str, '¡', '')
    set @str = REPLACE(@str, '¿', '')
    set @str = REPLACE(@str, 'ñ', 'n')
    set @str = REPLACE(@str, 'Ñ', 'N')
    set @str = REPLACE(@str, 'ü', 'u')
    set @str = REPLACE(@str, 'Ü', 'U')
	set @str = REPLACE(@str, ' ', '')
	set @str = UPPER(@str)
    return @str
end
GO
/****** Object:  Table [dbo].[AUTOR]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTOR](
	[ID_AUTOR] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](1000) NULL,
	[IMAGEN] [nvarchar](255) NULL,
 CONSTRAINT [PK_AUTOR] PRIMARY KEY CLUSTERED 
(
	[ID_AUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[ID_CATEGORIA] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](255) NULL,
 CONSTRAINT [PK_GENEROS] PRIMARY KEY CLUSTERED 
(
	[ID_CATEGORIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GENERO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENERO](
	[ID_GENERO] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](255) NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[ID_GENERO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GENEROS_LIBROS]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENEROS_LIBROS](
	[ID_GENERO_LIBRO] [int] NOT NULL,
	[ID_GENERO] [int] NULL,
	[ID_LIBRO] [int] NULL,
 CONSTRAINT [PK_CATEGORIAS_LIBROS] PRIMARY KEY CLUSTERED 
(
	[ID_GENERO_LIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAGA]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAGA](
	[ID_SAGA] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](1000) NULL,
 CONSTRAINT [PK_SAGA] PRIMARY KEY CLUSTERED 
(
	[ID_SAGA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIBRO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIBRO](
	[ID_LIBRO] [int] NOT NULL,
	[TITULO] [nvarchar](255) NULL,
	[SINOPSIS] [nvarchar](2000) NULL,
	[FECHA_PUBLICACION] [date] NULL,
	[PORTADA] [nvarchar](255) NULL,
	[ID_AUTOR] [int] NULL,
	[ID_CATEGORIA] [int] NULL,
	[ID_SAGA] [int] NULL,
 CONSTRAINT [PK_LIBRO] PRIMARY KEY CLUSTERED 
(
	[ID_LIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EDITORIAL]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDITORIAL](
	[ID_EDITORIAL] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[LOGO] [nvarchar](255) NULL,
 CONSTRAINT [PK_EDITORIAL] PRIMARY KEY CLUSTERED 
(
	[ID_EDITORIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMATO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMATO](
	[ID_FORMATO] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](255) NULL,
 CONSTRAINT [PK_FORMATO] PRIMARY KEY CLUSTERED 
(
	[ID_FORMATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[ID_PRODUCTO] [int] NOT NULL,
	[ISBN] [nvarchar](50) NULL,
	[PRECIO] [float] NULL,
	[STOCK] [int] NULL,
	[ID_FORMATO] [int] NULL,
	[ID_LIBRO] [int] NULL,
	[ID_EDITORIAL] [int] NULL,
 CONSTRAINT [PK_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_PRODUCTO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[V_PRODUCTO] as
select
	  ISNULL(p.ID_PRODUCTO, - 1) ID_PRODUCTO,
    l.TITULO,
    l.SINOPSIS,
    l.FECHA_PUBLICACION,
    l.PORTADA,
    c.NOMBRE CATEGORIA,
    a.NOMBRE AUTOR,
    STRING_AGG(g.NOMBRE, ', ') GENEROS,
    s.NOMBRE SAGA,
    p.ISBN,
    f.NOMBRE FORMATO,
    p.PRECIO,
    e.NOMBRE EDITORIAL,
    e.LOGO LOGO
from LIBRO l 
left join CATEGORIA c on l.ID_CATEGORIA = c.ID_CATEGORIA and l.TITULO is not null
left join AUTOR a on l.ID_AUTOR = a.ID_AUTOR and a.NOMBRE is not null
left join SAGA s on s.ID_SAGA = l.ID_SAGA 
left join GENEROS_LIBROS gl on gl.ID_LIBRO = l.ID_LIBRO 
left join GENERO g on g.ID_GENERO = gl.ID_GENERO 
inner join PRODUCTO p on l.ID_LIBRO = p.ID_LIBRO and p.ISBN is not null and p.PRECIO is not null
left join EDITORIAL e on e.ID_EDITORIAL = p.ID_EDITORIAL
inner join FORMATO f on f.ID_FORMATO=p.ID_FORMATO
group by p.ID_PRODUCTO, l.TITULO, c.NOMBRE, a.NOMBRE,
s.NOMBRE, l.SINOPSIS, l.FECHA_PUBLICACION, l.PORTADA,
p.ISBN, p.PRECIO, e.NOMBRE, e.LOGO, f.NOMBRE
GO
/****** Object:  View [dbo].[V_PRODUCTO_SIMPLE]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[V_PRODUCTO_SIMPLE] as
select
    ISNULL(p.ID_PRODUCTO, -1) ID_PRODUCTO,
    l.TITULO,
    l.PORTADA,
    a.NOMBRE AUTOR,
    p.PRECIO,
    p.ID_FORMATO,
	CAST(1 AS INT) UNIDADES
from Libro l
left join AUTOR a on l.ID_AUTOR=a.ID_AUTOR and l.TITULO is not null and a.NOMBRE is not null
inner join PRODUCTO p on l.ID_LIBRO=p.ID_LIBRO and p.PRECIO is not null
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[ID_ESTADO] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](255) NULL,
 CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED 
(
	[ID_ESTADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO_PEDIDO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO_PEDIDO](
	[ID_ESTADO_PEDIDO] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](255) NULL,
 CONSTRAINT [PK_ESTADO_PEDIDO] PRIMARY KEY CLUSTERED 
(
	[ID_ESTADO_PEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INFORMACION_COMPRA]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INFORMACION_COMPRA](
	[ID_INFORMACION_COMPRA] [int] NOT NULL,
	[DIRECCION] [nvarchar](50) NULL,
	[INDICACIONES] [nvarchar](50) NULL,
	[ID_METODO_PAGO] [int] NULL,
	[ID_USUARIO] [int] NULL,
 CONSTRAINT [PK_PAGO] PRIMARY KEY CLUSTERED 
(
	[ID_INFORMACION_COMPRA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[METODO_PAGO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[METODO_PAGO](
	[ID_METODO_PAGO] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
 CONSTRAINT [PK_METODO_PAGO] PRIMARY KEY CLUSTERED 
(
	[ID_METODO_PAGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPINION]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPINION](
	[ID_OPINION] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[DESCRIPCION] [nvarchar](255) NULL,
 CONSTRAINT [PK_OPINION] PRIMARY KEY CLUSTERED 
(
	[ID_OPINION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPINIONES_LIBROS]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPINIONES_LIBROS](
	[ID_OPINIONE_LIBRO] [int] NOT NULL,
	[ID_OPINION] [int] NULL,
	[ID_LIBRO] [int] NULL,
	[ID_USUARIO] [int] NULL,
 CONSTRAINT [PK_OPINIONES_LIBROS] PRIMARY KEY CLUSTERED 
(
	[ID_OPINIONE_LIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDO](
	[ID_PEDIDO] [int] NOT NULL,
	[ID_USUARIO] [int] NULL,
	[FECHA_SOLICITUD] [date] NULL,
	[FECHA_ESTIMADA] [date] NULL,
	[FECHA_ENTREGA] [date] NULL,
	[ID_ESTADO_PEDIDO] [int] NULL,
 CONSTRAINT [PK_LISTAS_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[ID_PEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDOS_PRODUCTOS]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDOS_PRODUCTOS](
	[ID_PEDIDO_PRODUCTO] [int] NOT NULL,
	[UNIDADES] [int] NULL,
	[ID_PEDIDO] [int] NULL,
	[ID_PRODUCTO] [int] NULL,
 CONSTRAINT [PK_PEDIDOS_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[ID_PEDIDO_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[ID_ROL] [int] NOT NULL,
	[NOMBRE] [nchar](255) NULL,
	[DESCRIPCION] [nchar](255) NULL,
 CONSTRAINT [PK_ROL] PRIMARY KEY CLUSTERED 
(
	[ID_ROL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[ID_USUARIO] [int] NOT NULL,
	[NOMBRE] [nvarchar](255) NULL,
	[APELLIDO] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[PASSWORD] [nvarchar](255) NULL,
	[IMAGEN] [nvarchar](255) NULL,
	[PASS] [varbinary](4000) NULL,
	[SALT] [nvarchar](4000) NULL,
	[TOKEN] [nvarchar](4000) NULL,
	[ID_ROL] [int] NULL,
	[ID_ESTADO] [int] NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VALORACION]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VALORACION](
	[ID_VALORACION] [int] NOT NULL,
	[PUNTUACION] [int] NULL,
	[COMENTARIO] [nvarchar](4000) NULL,
	[FECHA_COMENTARIO] [datetime] NULL,
	[ID_USUARIO] [int] NULL,
 CONSTRAINT [PK_VALORACION] PRIMARY KEY CLUSTERED 
(
	[ID_VALORACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VALORACIONES_PRODUCTOS]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VALORACIONES_PRODUCTOS](
	[ID_VALORACION_PRODUCTO] [int] NOT NULL,
	[ID_VALORACION] [int] NULL,
	[ID_PRODUCTO] [int] NULL,
 CONSTRAINT [PK_VALORACIONES_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[ID_VALORACION_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (1, N'Brandon Sanderson', N'Prolífico autor de fantasía y ciencia ficción, famoso por sagas como Cosmere y Mistborn. Crea mundos mágicos complejos con sistemas de magia bien desarrollados. Sus historias son emocionantes, con personajes memorables y tramas llenas de acción.', N'brandon_sanderson.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (2, N'J.K. Rowling', N'Autora de la serie de Harry Potter, una de las más vendidas de la historia. Crea personajes entrañables y mundos mágicos llenos de aventuras. Sus obras exploran temas como la amistad, el valor y la lucha contra el mal.', N'jk_rowling.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (3, N'Stephen King', N'Maestro del terror, famoso por obras como "El resplandor" y "Carrie". Explora los miedos humanos con historias macabras y personajes perturbadores. Sus obras son a la vez aterradoras y reflexivas, con un toque de humor negro.', N'stephen_king.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (4, N'George R.R. Martin', N'Autor de la saga "Canción de hielo y fuego", conocida por su realismo y complejidad. Crea personajes multidimensionales y tramas llenas de intrigas políticas. Sus obras desafían las expectativas del género fantástico, con un enfoque en la guerra y las consecuencias de la violencia.', N'george_rr_martin.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (5, N'Agatha Christie', N'Escritora británica, conocida como la "Reina del Crimen" por sus novelas de misterio y detectives como "Asesinato en el Orient Express" y "Diez Negritos".', N'agatha_christie.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (6, N'Isabel Allende', N'Escritora chilena, autora de novelas como "La casa de los espíritus" y "Eva Luna", que exploran temas como la familia, el amor y la historia latinoamericana.', N'isabel_allende.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (7, N'Gabriel García Márquez', N'Escritor colombiano, ganador del Premio Nobel de Literatura en 1982. Famoso por su obra maestra "Cien años de soledad", una novela que combina el realismo mágico con la historia de Macondo.', N'gabriel_garcia_marquez.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (8, N'Paulo Coelho', N'Escritor brasileño, autor de bestsellers como "El Alquimista" y "Brida", que exploran temas como la búsqueda del sentido de la vida y el autodescubrimiento.', N'paulo_coelho.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (9, N'Haruki Murakami', N'Escritor japonés, conocido por su estilo surrealista y sus historias que exploran la soledad, el aislamiento y la búsqueda de la identidad.', N'haruki_murakami.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (10, N'Neil Gaiman', N'Escritor británico, autor de novelas como "American Gods" y "Coraline", que mezclan fantasía, mitología y temas contemporáneos.', N'neil_gaiman.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (11, N'Patrick Rothfuss', N'Autor estadounidense de fantasía épica, famoso por la trilogía "Crónica del Rey Matarreyes" y la novela "El nombre del viento". Sus obras se caracterizan por su complejo sistema de magia, sus personajes memorables y su prosa poética.', N'patrick_rothfuss.png')
INSERT [dbo].[AUTOR] ([ID_AUTOR], [NOMBRE], [DESCRIPCION], [IMAGEN]) VALUES (12, N'Robert Jordan', N'Autor estadounidense de fantasía épica, conocido por la saga "La rueda del tiempo". Crea un mundo extenso y complejo con una rica historia y personajes bien desarrollados. Sus obras son extensas y llenas de acción, con tramas que abarcan varios libros.', N'robert_jordan.png')
GO
INSERT [dbo].[CATEGORIA] ([ID_CATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Ficción', N'Narraciones inventadas, que no se basan en hechos reales.')
INSERT [dbo].[CATEGORIA] ([ID_CATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (2, N'No ficción', N'Narraciones que se basan en hechos reales, como biografías, libros de historia o documentales.')
INSERT [dbo].[CATEGORIA] ([ID_CATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Cómic', N'Historias ilustradas que se narran en viñetas, con o sin texto.')
INSERT [dbo].[CATEGORIA] ([ID_CATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (4, N'Manga', N'Cómic japonés, caracterizado por su estilo de dibujo y sus historias.')
INSERT [dbo].[CATEGORIA] ([ID_CATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (5, N'Juvenil', N'Literatura dirigida a jóvenes, generalmente entre 12 y 18 años.')
INSERT [dbo].[CATEGORIA] ([ID_CATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (6, N'Infantil', N'Literatura dirigida a niños, generalmente menores de 12 años.')
GO
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (1, N'Nova', N'nova.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (2, N'B de Bolsillo', N'b_bolsillo.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (3, N'Pottermore Publishing', N'pottermore_publishing.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (4, N'Salamandra', N'salamandra.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (5, N'DEBOLSILLO', N'debolsillo.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (6, N'PLAZA & JANÉS', N'plaza_janes.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (7, N'Gigamesh', N'gigamesh.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (8, N'Espasa', N'espasa.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (9, N'Molino', N'molino.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (10, N'Austral', N'austral.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (11, N'RANDOM HOUSE', N'random_hause.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (12, N'Booket', N'booket.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (13, N'Tusquets', N'tusquets.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (14, N'Roca', N'roca.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (15, N'Planeta', N'planeta.png')
INSERT [dbo].[EDITORIAL] ([ID_EDITORIAL], [NOMBRE], [LOGO]) VALUES (16, N'Minotauro', N'minotauro.png')
GO
INSERT [dbo].[ESTADO] ([ID_ESTADO], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Activo', N'Usuario activo')
INSERT [dbo].[ESTADO] ([ID_ESTADO], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Pendiente', N'Usuario pendiente de activación')
INSERT [dbo].[ESTADO] ([ID_ESTADO], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Eliminado', N'Usuario eliminado')
GO
INSERT [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO], [NOMBRE], [DESCRIPCION]) VALUES (1, N'En espera', N'El pedido ha sido recibido, pero aún no se ha procesado.')
INSERT [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Procesando', N'El pedido está siendo preparado para su envío.')
INSERT [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Enviado', N'El pedido ha sido enviado al cliente, pero aún no ha sido entregado.')
INSERT [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO], [NOMBRE], [DESCRIPCION]) VALUES (4, N'En ruta', N'El pedido está en camino hacia la dirección del cliente.')
INSERT [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO], [NOMBRE], [DESCRIPCION]) VALUES (5, N'Entregado', N'El pedido ha sido entregado al cliente.')
INSERT [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO], [NOMBRE], [DESCRIPCION]) VALUES (6, N'Devolución', N'El pedido ha sido devuelto al vendedor.')
INSERT [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO], [NOMBRE], [DESCRIPCION]) VALUES (7, N'Cancelado', N'El pedido ha sido cancelado por el vendedor o el cliente.')
INSERT [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO], [NOMBRE], [DESCRIPCION]) VALUES (8, N'Finalizado', N'El pedido ha sido completado con éxito.')
GO
INSERT [dbo].[FORMATO] ([ID_FORMATO], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Tapa Dura', N'Libro con tapa rígida')
INSERT [dbo].[FORMATO] ([ID_FORMATO], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Tapa Blanda', N'Libro con tapa blanda')
INSERT [dbo].[FORMATO] ([ID_FORMATO], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Ebook', N'Libro digital')
GO
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Fantasía', N'Historias que se desarrollan en mundos ficticios, a menudo con elementos mágicos o sobrenaturales.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Acción', N'Historias que se centran en la emoción, el suspense y la aventura.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Aventura', N'Historias que siguen a los personajes en viajes emocionantes y llenos de peligros.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (4, N'Distopía', N'Historias que se desarrollan en mundos futuros sombríos y opresivos.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (5, N'Cosmere', N'Es un universo ficticio creado por Brandon Sanderson. El Cosmere es el hogar de muchas novelas y series diferentes, todas las cuales están conectadas de alguna manera.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (6, N'Misterio', N'Historias que te invitan a sumergirte en un enigma, un crimen o un evento desconcertante que te desafiará a usar tu ingenio para descubrir la verdad.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (7, N'Magia', N'Historias llenas de hechizos, criaturas fantásticas, y sistemas mágicos.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (8, N'Política', N'Historias que que explora los sistemas políticos, las estructuras de poder y las relaciones entre el individuo y el Estado.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (9, N'Ciencia Ficción', N'Historias que exploran futuros tecnológicos y conceptos científicos avanzados.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (10, N'Horror', N'Historias diseñadas para provocar miedo y suspense en el lector.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (11, N'Drama', N'Narrativas centradas en conflictos emocionales y situaciones intensas.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (12, N'Romance', N'Historias de amor y relaciones románticas.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (13, N'Histórico', N'Historias que se desarrollan en contextos históricos reales o ficticios.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (14, N'Novela Negra', N'Historias de crimen y misterio, a menudo con detectives y tramas oscuras.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (15, N'Ciencia', N'Exploración de conceptos y avances científicos.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (16, N'Aventura', N'Emocionantes viajes y experiencias llenas de acción.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (17, N'Biografía', N'Relatos de la vida de personas reales.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (18, N'Ensayo', N'Textos que analizan, interpretan o argumentan sobre un tema específico.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (19, N'Poesía', N'Expresión artística a través de la palabra.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (20, N'Comedia', N'Narrativas diseñadas para provocar risas y entretenimiento.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (21, N'Autoayuda', N'Obras destinadas a mejorar el bienestar y el desarrollo personal.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (22, N'Música', N'Exploración de temas musicales y su influencia.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (23, N'Western', N'Historias ambientadas en el Viejo Oeste americano.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (24, N'Religión', N'Exploración de creencias espirituales y religiosas.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (25, N'Filosofía', N'Exploración de conceptos filosóficos y reflexiones sobre la existencia.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (26, N'Educativo', N'Material diseñado con propósitos educativos.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (27, N'Tecnología', N'Exploración de avances tecnológicos y su impacto en la sociedad.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (28, N'Salud', N'Información sobre el bienestar físico y mental.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (29, N'Memorias', N'Relatos personales de experiencias y recuerdos.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (30, N'Guerra', N'Historias ambientadas en contextos de guerra y conflicto.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (31, N'Política Social', N'Exploración de aspectos sociales y culturales.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (32, N'Policíaco', N'Historias centradas en crímenes y la labor policial.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (33, N'Epistolar', N'Narrativas presentadas en forma de cartas o correspondencia.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (34, N'Teatro', N'Obras escritas para ser representadas en el escenario.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (35, N'Mitología', N'Exploración de mitos y leyendas de diversas culturas.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (36, N'Cuentos', N'Narrativas cortas con tramas y personajes cautivadores.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (37, N'Cine', N'Exploración del mundo del cine y sus aspectos creativos.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (38, N'Cocina', N'Libro relacionado con el mundo de la gastronomía.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (39, N'Historieta', N'Narrativas gráficas con viñetas y diálogos.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (40, N'Clásico', N'Obras literarias que han resistido el paso del tiempo.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (41, N'Contemporáneo', N'Historias ambientadas en la actualidad.')
INSERT [dbo].[GENERO] ([ID_GENERO], [NOMBRE], [DESCRIPCION]) VALUES (42, N'Medieval', N'Historias ambientadas en la época medieval con elementos de caballería, castillos y batallas.')
GO
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (1, 1, 2)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (2, 2, 2)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (3, 3, 2)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (4, 4, 2)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (5, 5, 2)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (6, 1, 1)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (7, 3, 1)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (8, 5, 1)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (9, 6, 1)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (10, 7, 1)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (11, 7, 2)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (12, 1, 3)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (13, 2, 3)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (14, 4, 3)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (15, 5, 3)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (16, 7, 3)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (17, 8, 3)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (18, 1, 4)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (19, 2, 4)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (20, 4, 4)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (21, 5, 4)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (22, 7, 4)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (23, 1, 5)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (24, 2, 5)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (25, 5, 5)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (26, 7, 5)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (27, 42, 5)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (28, 1, 6)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (29, 2, 6)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (30, 5, 6)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (31, 7, 6)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (32, 42, 6)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (33, 8, 6)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (34, 1, 7)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (35, 2, 7)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (36, 5, 7)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (37, 7, 7)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (38, 8, 7)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (39, 42, 7)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (40, 1, 8)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (41, 2, 8)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (42, 5, 8)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (43, 7, 8)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (44, 42, 8)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (45, 1, 9)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (46, 3, 9)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (47, 7, 9)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (49, 1, 10)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (50, 3, 10)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (51, 7, 10)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (52, 1, 11)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (53, 3, 11)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (54, 7, 11)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (55, 1, 12)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (56, 3, 12)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (57, 7, 12)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (58, 1, 13)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (59, 3, 13)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (60, 7, 13)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (61, 10, 14)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (62, 6, 14)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (63, 13, 14)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (64, 10, 15)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (65, 6, 15)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (66, 13, 15)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (67, 10, 16)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (68, 6, 16)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (69, 41, 16)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (70, 10, 17)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (71, 29, 17)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (72, 41, 17)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (73, 10, 18)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (74, 33, 18)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (75, 41, 18)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (76, 2, 19)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (77, 3, 19)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (78, 8, 19)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (79, 11, 19)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (80, 15, 19)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (81, 35, 19)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (82, 2, 20)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (83, 3, 20)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (84, 8, 20)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (85, 11, 20)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (86, 15, 20)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (87, 35, 20)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (88, 2, 21)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (89, 3, 21)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (90, 8, 21)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (91, 11, 21)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (92, 15, 21)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (93, 35, 21)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (94, 2, 22)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (95, 8, 22)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (96, 11, 22)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (97, 15, 22)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (98, 35, 22)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (99, 2, 23)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (100, 3, 23)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (101, 8, 23)
GO
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (102, 11, 23)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (103, 15, 23)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (104, 35, 23)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (105, 6, 24)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (106, 11, 24)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (107, 14, 24)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (108, 6, 25)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (109, 11, 25)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (110, 14, 25)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (111, 6, 26)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (112, 11, 26)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (113, 14, 26)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (114, 6, 27)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (115, 11, 27)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (116, 14, 27)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (117, 6, 28)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (118, 11, 28)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (119, 14, 28)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (120, 13, 29)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (121, 11, 29)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (122, 41, 29)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (123, 13, 30)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (124, 11, 30)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (125, 41, 30)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (126, 13, 31)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (127, 11, 31)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (128, 41, 31)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (129, 11, 32)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (130, 41, 32)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (131, 29, 33)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (132, 11, 33)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (133, 13, 34)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (134, 40, 34)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (135, 13, 35)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (136, 32, 35)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (137, 11, 36)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (138, 40, 36)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (139, 6, 37)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (140, 32, 37)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (141, 13, 38)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (142, 36, 38)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (143, 12, 39)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (144, 21, 39)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (145, 41, 40)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (146, 19, 40)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (147, 41, 41)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (148, 22, 41)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (149, 41, 42)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (150, 26, 42)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (151, 41, 43)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (152, 25, 43)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (153, 11, 44)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (154, 13, 44)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (155, 41, 44)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (156, 6, 45)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (157, 12, 45)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (158, 41, 45)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (159, 6, 46)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (160, 42, 46)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (161, 11, 47)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (162, 36, 47)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (163, 41, 48)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (164, 15, 48)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (165, 6, 48)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (167, 1, 49)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (168, 7, 49)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (169, 11, 49)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (170, 1, 50)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (171, 6, 50)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (172, 11, 50)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (173, 1, 51)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (174, 11, 51)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (175, 1, 52)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (176, 11, 52)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (177, 1, 53)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (178, 6, 53)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (179, 11, 53)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (180, 1, 54)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (181, 3, 54)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (182, 6, 54)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (183, 7, 54)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (184, 11, 54)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (185, 1, 55)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (186, 3, 55)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (187, 6, 55)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (188, 7, 55)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (189, 11, 55)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (190, 1, 56)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (191, 3, 56)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (192, 7, 56)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (193, 11, 56)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (194, 40, 56)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (195, 1, 57)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (196, 3, 57)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (197, 7, 57)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (198, 11, 57)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (199, 40, 57)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (200, 1, 58)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (201, 3, 58)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (202, 7, 58)
GO
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (203, 11, 58)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (204, 40, 58)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (205, 1, 59)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (206, 3, 59)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (207, 7, 59)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (208, 11, 59)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (209, 40, 59)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (210, 1, 60)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (211, 3, 60)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (212, 7, 60)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (213, 11, 60)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (214, 40, 60)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (215, 1, 61)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (216, 3, 61)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (217, 7, 61)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (218, 11, 61)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (219, 40, 61)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (220, 1, 62)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (221, 3, 62)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (222, 7, 62)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (223, 11, 62)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (224, 40, 62)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (225, 1, 63)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (226, 3, 63)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (227, 7, 63)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (228, 11, 63)
INSERT [dbo].[GENEROS_LIBROS] ([ID_GENERO_LIBRO], [ID_GENERO], [ID_LIBRO]) VALUES (229, 40, 63)
GO
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (1, N'Elantris', N'Bienvenidos a la ciudad de Elantris, la poderosa y bella capital de Arelon llamada «la ciudad de los dioses». Antaño famosa sede de inmortales, lugar repleto de poderosa magia, Elantris ha caído en desgracia. Ahora solo acoge a los nuevos «muertos en vida», postrados en una insufrible «no-vida» tras una misteriosa y terrible transformación.

Un matrimonio de Estado destinado a unir los reinos de Arelon y Teod se frustra, ya que el novio, Raoden, el príncipe de Arelon, sufre inesperadamente la Transformación, se convierte en un «muerto en vida» y debe refugiarse en Elantris. Su reciente esposa, la princesa Sarene de Teod, creyéndolo muerto, se ve obligada a incorporarse a la vida de Arelon y su nueva capital, Kae. Mientras, el embajador y alto sacerdote de otro reino vecino, Fjordell, usará su habilidad política para intentar dominar Arelod y Teod con el propósito de someterlos a su emperador y su dios.', CAST(N'2005-08-01' AS Date), N'Elantris.png', 1, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (2, N'El imperio final (1)', N'Las brumas gobiernan la noche. El lord Legislador domina el mundo.

En otros tiempos, un héroe se alzó para salvar la humanidad. Fracasó.

Desde entonces, el mundo es un erial de ceniza y niebla gobernado por un emperador inmortal conocido como el lord Legislador.

Pero la esperanza perdura. Una nueva revuelta cobra forma cimentándose en la treta definitiva: la astucia de un brillante genio del crimen y la determinación de una heroína insólita, una joven ladrona callejera que deberá aprender a controlar el poder de los nacidos de la bruma.', CAST(N'2006-06-06' AS Date), N'ElImperioFinal.png', 1, 1, 1)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (3, N'El pozo de la ascensión (2)', N'El mal ha sido derrotado. Pero la guerra acaba de empezar.

Lograron lo imposible y pusieron fin al reinado milenario de lord Legislador. Ahora Vin, que ha pasado de ser una ladronzuela a una poderosa nacida de la bruma, y Elend Venture, el joven noble e idealista que la ama, deberán construir una sociedad nueva y próspera sobre las cenizas de ese imperio derrotado.

Mientras las tensiones siguen creciendo tras la revuelta, una antigua leyenda ofrece un atisbo de esperanza para el pueblo. Sin embargo, incluso si las habladurías son ciertas, nadie sabe dónde se encuentra el Pozo de la Ascensión ni qué clase de poder otorga.

Es muy posible que matar al lord Legislador fuera la parte fácil. Sobrevivir a las consecuencias de su caída será el verdadero desafío.', CAST(N'2007-06-05' AS Date), N'ElPozoDeLaAscension.png', 1, 1, 1)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (4, N'El héroe de las eras (3)', N'El apasionante cierre de la Trilogía Mistborn.

Vin cumplió la profecía y liberó el poder acumulado en el Pozo de la Ascensión. Sin embargo, todo resultó ser una trampa, y ahora el ser divino llamado Ruina campa a sus anchas por el mundo decidido a arrasarlo con terremotos y ríos de fuego.

Tras haber esquivado la muerte convirtiéndose en un nacido de la bruma, el emperador Elend Venture confía en que las pistas que dejó el lord Legislador les sirvan para contraatacar. Las profecías hablan de un héroe, pero ¿no estaban corrompidas? Vin deberá desenmarañar la verdad para compensar su error. Solo así llegará a ser el Héroe de las Eras antes de que Ruina aniquile toda la vida sobre el planeta.', CAST(N'2008-06-17' AS Date), N'ElHeroeDeLasEras.png', 1, 1, 1)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (5, N'El camino de los reyes (1)', N'Anhelo los días previos a la Última Desolación.

Los días en que los Heraldos nos abandonaron y los Caballeros Radiantes se giraron en nuestra contra. Un tiempo en que aún había magia en el mundo y honor en el corazón de los hombres.

El mundo fue nuestro, pero lo perdimos. Probablemente no hay nada más estimulante para las almas de los hombres que la victoria.

¿O tal vez fue la victoria una ilusión durante todo ese tiempo? ¿Comprendieron nuestros enemigos que cuanto más duramente luchaban, más resistíamos nosotros? Quizá vieron que el fuego y el martillo tan solo producían mejores espadas. Pero ignoraron el acero durante el tiempo suficiente para oxidarse.

Hay cuatro personas a las que observamos. La primera es el médico, quien dejó de curar para convertirse en soldado durante la guerra más brutal de nuestro tiempo. La segunda es el asesino, un homicida que llora siempre que mata. La tercera es la mentirosa, una joven que viste un manto de erudita sobre un corazón de ladrona. Por último está el alto príncipe, un guerrero que mira al pasado mientras languidece su sed de guerra.

El mundo puede cambiar. La potenciación y el uso de las esquirlas pueden aparecer de nuevo, la magia de los días pasados puede volver a ser nuestra. Esas cuatro personas son la clave.

Una de ellas nos redimirá. Y una de ellas nos destruirá.', CAST(N'2010-08-31' AS Date), N'ElCaminoDeLosReyes.png', 1, 1, 2)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (6, N'Palabras radiantes (2)', N'Los Caballeros Radiantes deben volver a alzarse.

Los antiguos juramentos por fin se han pronunciado. Los hombres buscan lo que se perdió. Temo que la búsqueda los destruya.

Es la naturaleza de la magia. Un alma rota tiene grietas donde puede colarse algo más. Las potencias, los poderes de la creación misma, pueden abrazar un alma rota, pero también pueden ampliar sus fisuras.

El Corredor del Viento está perdido en una tierra quebrada, en equilibro entre la venganza y el honor. La Tejedora de Luz, lentamente consumida por su pasado, busca la mentira en la que debe convertirse. El Forjador de Vínculos, nacido en la sangre y la muerte, se esfuerza ahora por reconstruir lo que fue destruido. La Exploradora, a caballo entre los destinos de dos pueblos, se ve obligada a elegir entre una muerte lenta y una terrible traición a todo en lo que cree.

Ya es hora de despertarlos, pues acecha la eterna tormenta.

Y el asesino ha llegado.', CAST(N'2014-03-04' AS Date), N'PalabrasRadiantes.png', 1, 1, 2)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (7, N'Juramentada (3)', N'La humanidad se enfrenta a una nueva Desolación con el regreso de los Portadores del Vacío, un enemigo tan grande en número como en sed de venganza. La victoria fugaz de los ejércitos alezi de Dalinar Kholin ha tenido consecuencias: el enemigo parshendi ha convocado la violenta tormenta eterna, que arrasa el mundo y hace que los hasta ahora pacíficos parshmenios descubran con horror que llevan un milenio esclavizados por los humanos. Al mismo tiempo, en una desesperada huida para alertar a su familia de la amenaza, Kaladin se pregunta si la repentina ira de los parshmenios está justificada.

Entretanto, en la torre de la ciudad de Urithiru, a salvo de la tormenta, Shallan Davar investiga las maravillas de la antigua fortaleza de los Caballeros Radiantes y desentierra oscuros secretos que acechan en las profundidades. Dalinar descubre entonces que su sagrada misión de unificar su tierra natal de Alezkar era corta de miras. A menos que todas las naciones sean capaces de unirse y dejar de lado el pasado sangriento de Dalinar, ni siquiera la restauración de los Caballeros Radiantes conseguirá impedir el fin de la civilización.', CAST(N'2017-11-14' AS Date), N'Juramentada.png', 1, 1, 2)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (8, N'El ritmo de la guerra (4)', N'Hay secretos que hemos guardado mucho tiempo. Vigilantes. Insomnes. Eternos. Y pronto dejarán de ser nuestros.

La Una que es Tres busca, sin saberlo, el alma capturada. El spren aprisionado, olvidado hace mucho tiempo. ¿Puede liberar su propia alma a tiempo de hallar el conocimiento que condena a todos los pueblos de Roshar?

El Soldado Caído acaricia y ama la lanza, incluso mientras el arma hiende su propia carne. Camina siempre hacia delante, siempre hacia la oscuridad, sin luz. No puede llevar consigo a nadie, salvo aquello que él mismo puede avivar.

La Hermana Derrumbada comprende sus errores y piensa que ella misma es un error. Parece muy alejada de sus antepasados, pero no comprende que son quienes la llevan a hombros. Hacia la victoria, y hacia ese silencio, el más importante de todos.

Y la Madre de Máquinas, la más crucial de todos ellos, danza con mentirosos en un gran baile. Debe desenmascararlos, alcanzar sus verdades ocultas y entregarlas al mundo. Tiene que reconocer que las peores mentiras son las que se cuenta a sí misma.

Si lo hace, nuestros secretos por fin se convertirán en verdades.', CAST(N'2020-11-17' AS Date), N'ElRitmoDeLaGuerra.png', 1, 1, 2)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (9, N'Harry Potter y la piedra filosofal (1)', N'«Con las manos temblorosas, Harry le dio la vuelta al sobre y vio un sello de lacre púrpura con un escudo de armas: un león, un águila, un tejón y una serpiente, que rodeaban una gran letra H.»

Harry Potter nunca ha oído hablar de Hogwarts hasta que empiezan a caer cartas en el felpudo del número 4 de Privet Drive. Llevan la dirección escrita con tinta verde en un sobre de pergamino amarillento con un sello de lacre púrpura, y sus horripilantes tíos se apresuran a confiscarlas. Más tarde, el día que Harry cumple once años, Rubeus Hagrid, un hombre gigantesco cuyos ojos brillan como escarabajos negros, irrumpe con una noticia extraordinaria: Harry Potter es un mago, y le han concedido una plaza en el Colegio Hogwarts de Magia y Hechicería. ¡Está a punto de comenzar una aventura increíble!', CAST(N'1997-06-26' AS Date), N'HarryPotterYLaPiedraFilosofal.png', 2, 5, 3)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (10, N'Harry Potter y la cámara secreta (2)', N'«Hay una conspiración, Harry Potter. Una conspiración para hacer que este año sucedan las cosas más terribles en el Colegio Hogwarts de Magia y Hechicería.»

El verano de Harry Potter ha incluido el peor cumpleaños de su vida, las funestas advertencias de un elfo doméstico llamado Dobby y el rescate de casa de los Dursley protagonizado por su amigo Ron Weasley al volante de un coche mágico volador. De vuelta en el Colegio Hogwarts de Magia y Hechicería, donde va a empezar su segundo curso, Harry oye unos extraños susurros que resuenan por los pasillos vacíos. Y entonces empiezan los ataques y varios alumnos aparecen petrificados... Por lo visto, las siniestras predicciones de Dobby se están cumpliendo....', CAST(N'1998-06-02' AS Date), N'HarryPotterYLaCamaraSecreta.png', 2, 5, 3)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (11, N'Harry Potter y el prisionero de Azkaban (3)', N'«Bienvenido al autobús noctámbulo, transporte de emergencia para el brujo abandonado a su suerte. Levante la varita, suba a bordo y lo llevaremos a donde quiera.»

Cuando el autobús noctámbulo irrumpe en una calle oscura y frena con fuertes chirridos delante de Harry, comienza para él un nuevo curso en Hogwarts, lleno de acontecimientos extraordinarios. Sirius Black, asesino y seguidor de lord Voldemort, se ha fugado, y dicen que va en busca de Harry. En su primera clase de Adivinación, la profesora Trelawney ve un augurio de muerte en las hojas de té de la taza de Harry... Pero quizá lo más aterrador sean los dementores que patrullan por los jardines del colegio, capaces de sorberte el alma con su beso...', CAST(N'1999-07-08' AS Date), N'HarryPotterYElPrisioneroDeAzkaban.png', 2, 5, 3)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (12, N'Harry Potter y el cáliz de fuego (4)', N'«Habrá tres pruebas, espaciadas en el curso escolar, que medirán a los campeones en muchos aspectos diferentes: sus habilidades mágicas, su osadía, sus dotes de deducción y, por supuesto, su capacidad para sortear el peligro.»

Se va a celebrar en Hogwarts el Torneo de los Tres Magos. Sólo los alumnos mayores de diecisiete años pueden participar en esta competición, pero, aun así, Harry sueña con ganarla. En Halloween, cuando el cáliz de fuego elige a los campeones, Harry se lleva una sorpresa al ver que su nombre es uno de los escogidos por el cáliz mágico. Durante el torneo deberá enfrentarse a desafíos mortales, dragones y magos tenebrosos, pero con la ayuda de Ron y Hermione, sus mejores amigos, ¡quizá logre salir con vida!', CAST(N'2001-03-02' AS Date), N'HarryPotterYElCalizDeFuego.png', 2, 5, 3)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (13, N'Harry Potter y la Orden del Fénix (5)', N'«El director cree que no es conveniente que eso continúe ocurriendo. Quiere que te enseñe a cerrar tu mente al Señor Tenebroso.»

Son malos tiempos para Hogwarts. Tras el ataque de los dementores a su primo Dudley, Harry Potter comprende que Voldemort no se detendrá ante nada para encontrarlo. Muchos niegan que el Señor Tenebroso haya regresado, pero Harry no está solo: una orden secreta se reúne en Grimmauld Place para luchar contra las fuerzas oscuras. Harry debe permitir que el profesor Snape le enseñe a protegerse de las brutales incursiones de Voldemort en su mente. Pero éstas son cada vez más potentes, y a Harry se le está agotando el tiempo...', CAST(N'2008-12-04' AS Date), N'HarryPotterYLaOrdenDelFenix.png', 2, 5, 3)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (14, N'IT', N'Un grupo de niños de Derry, Maine, se enfrenta a un monstruo que cambia de forma y se alimenta del miedo de los niños.', CAST(N'1986-09-01' AS Date), N'It.png', 3, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (15, N'El resplandor', N'Un escritor en apuros y su familia se instalan como guardeses en un hotel aislado, donde se ve afectado por fuerzas paranormales.', CAST(N'1977-01-01' AS Date), N'ElResplandor.png', 3, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (16, N'Misery', N'Un escritor famoso es secuestrado por una fan obsesiva que lo obliga a escribir una nueva novela.', CAST(N'1987-06-08' AS Date), N'Misery.png', 3, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (17, N'La milla verde', N'Un guardia de la prisión en el corredor de la muerte de una prisión de máxima seguridad forma una amistad con un recluso condenado por asesinato.', CAST(N'1996-08-06' AS Date), N'LaMillaVerde.png', 3, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (18, N'El cazador de sueños', N'Un grupo de amigos se reúne para cazar en el bosque y se encuentra con una criatura alienígena.', CAST(N'2003-09-02' AS Date), N'ElCazadorDeSuenos.png', 3, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (19, N'Juego de Tronos', N'En un mundo de intrigas y batallas, nueve familias nobles se disputan el control del Trono de Hierro.', CAST(N'1996-08-01' AS Date), N'JuegoDeTronos.png', 4, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (20, N'Choque de Reyes', N'Mientras la guerra civil se extiende por los Siete Reinos, Daenerys Targaryen navega hacia Poniente para reclamar su derecho al trono.', CAST(N'1998-11-17' AS Date), N'ChoqueDeReyes.png', 4, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (21, N'Tormenta de Espadas', N'Las alianzas se tambalean y las traiciones abundan mientras los Stark, los Lannister y los Targaryen se enfrentan por el destino de Westeros.', CAST(N'2000-11-08' AS Date), N'TormentaDeEspadas.png', 4, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (22, N'Festín de Cuervos', N'Con la guerra devastando el reino, nuevos personajes entran en escena mientras las viejas rivalidades se intensifican.', CAST(N'2005-10-17' AS Date), N'FestinDeCuervos.png', 4, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (23, N'Danza de Dragones', N'Daenerys finalmente llega a Poniente, pero su camino al trono está plagado de peligros y enemigos.', CAST(N'2011-07-12' AS Date), N'DanzaDeDragones.png', 4, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (24, N'El asesinato de Roger Ackroyd', N'Un detective retirado se enfrenta a un caso en el que todos parecen tener un motivo para asesinar a la víctima.', CAST(N'1926-06-01' AS Date), N'ElAsesinatoDeRogerAckroyd.png', 5, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (25, N'Muerte en el Nilo', N'Un crucero por el Nilo se convierte en una escena de crimen cuando una joven rica es asesinada.', CAST(N'1937-09-01' AS Date), N'MuerteEnElNilo.png', 5, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (26, N'Y no quedó ninguno', N'Diez personas son invitadas a una isla misteriosa, donde uno por uno comienzan a morir.', CAST(N'1939-08-01' AS Date), N'YNoQuedoNinguno.png', 5, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (27, N'Testigo de cargo', N'Un abogado defiende a un hombre acusado de asesinar a su esposa, pero la verdad puede ser más compleja de lo que parece.', CAST(N'1954-10-01' AS Date), N'TestigoDeCargo.png', 5, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (28, N'El misterio de la Guía de Ferrocarriles', N'Una joven pareja se ve envuelta en un misterio cuando encuentran un cuerpo sin vida en un tren.', CAST(N'1936-01-01' AS Date), N'ElMisterioDeLaGuiaDeFerrocarriles.png', 5, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (29, N'La casa de los espíritus', N'Una saga familiar que abarca varias generaciones en Chile, desde la época colonial hasta el siglo XX.', CAST(N'1982-01-01' AS Date), N'LaCasaDeLosEspiritus.png', 6, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (30, N'De amor y de sombra', N'La historia de Irene Beltrán, una mujer que lucha por encontrar el amor y la justicia en un contexto de violencia política.', CAST(N'1984-01-01' AS Date), N'DeAmorYDeSombra.png', 6, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (31, N'Eva Luna', N'La historia de una joven que busca su identidad y su lugar en el mundo.', CAST(N'1987-01-01' AS Date), N'EvaLuna.png', 6, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (32, N'El plan infinito', N'Un thriller que explora los límites del amor, la amistad y la familia.', CAST(N'1991-01-01' AS Date), N'ElPlanInfinito.png', 6, 2, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (33, N'Paula', N'Un relato autobiográfico sobre la muerte de la hija de Isabel Allende.', CAST(N'1994-01-01' AS Date), N'Paula.png', 6, 2, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (34, N'Cien años de soledad', N'Una novela épica sobre la familia Buendía y el Macondo ficticio', CAST(N'1967-05-30' AS Date), N'CienAnosDeSoledad.png', 7, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (35, N'El coronel no tiene quien le escriba', N'La historia de un coronel retirado que espera una carta que nunca llega', CAST(N'1961-08-01' AS Date), N'ElCoronelNoTieneQuienLeEscriba.png', 7, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (36, N'El amor en los tiempos del cólera', N'Un relato de amor apasionado entre Fermina Daza y Florentino Ariza', CAST(N'1985-11-01' AS Date), N'ElAmorEnLosTiemposDelColera.png', 7, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (37, N'Crónica de una muerte anunciada', N'Un asesinato anunciado y la búsqueda de los motivos', CAST(N'1981-04-01' AS Date), N'CronicaDeUnaMuerteAnunciada.png', 7, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (38, N'Los funerales de la Mamá Grande', N'Una novela sobre el poder y la decadencia de una familia', CAST(N'1962-01-01' AS Date), N'LosFuneralesDeLaMamaGrande.png', 7, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (39, N'El Alquimista', N'Un joven pastor andaluz llamado Santiago emprende un viaje en busca de un tesoro enterrado cerca de las Pirámides de Egipto.', CAST(N'1988-06-01' AS Date), N'ElAlquimista.png', 8, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (40, N'Brida', N'Una joven irlandesa llamada Brida viaja a España para aprender sobre la Tradición de la Diosa.', CAST(N'1990-01-01' AS Date), N'Brida.png', 8, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (41, N'Las Valkirias', N'Tres mujeres de diferentes edades y procedencias se reúnen en un pequeño pueblo de los Pirineos para descubrir los secretos de su pasado.', CAST(N'1992-01-01' AS Date), N'LasValkirias.png', 8, 2, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (42, N'Veronika decide morir', N'Una joven eslovena llamada Veronika decide suicidarse, pero en lugar de morir, se despierta en un hospital psiquiátrico.', CAST(N'1998-01-01' AS Date), N'VeronikaDecideMorir.png', 8, 2, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (43, N'El Zahir', N'Un escritor brasileño llamado Paulo Coelho emprende un viaje por el desierto en busca de un hombre que le enseñe sobre el amor.', CAST(N'2005-01-01' AS Date), N'ElZahir.png', 8, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (44, N'Tokio Blues', N'La historia de dos jóvenes que se enamoran en el Tokio de los años 60.', CAST(N'1979-04-01' AS Date), N'TokioBlues.png', 9, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (45, N'La caza del carnero salvaje', N'La historia comienza con un joven publicista sin nombre que, tras divorciarse y experimentar una profunda desolación, se embarca en una peculiar búsqueda. Una fotografía, aparentemente anodina, de un rebaño de ovejas con un carnero de características especiales, lo ha puesto en la mira de un poderoso grupo empresarial. Amenazado por este grupo, el joven decide huir y refugiarse en las montañas del norte de Japón.', CAST(N'1991-09-01' AS Date), N'LaCazaDelCarneroSalvaje.png', 9, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (46, N'Kafka en la Orilla', N'Un adolescente huye de casa y se embarca en un viaje surrealista.', CAST(N'2002-09-01' AS Date), N'KafkaEnLaOrilla.png', 9, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (47, N'Crónica del Pájaro Mecánico', N'Un joven busca a una chica desaparecida en un mundo distópico.', CAST(N'1997-06-01' AS Date), N'CronicaDelPajaroMecanico.png', 9, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (48, N'After Dark', N'Cerca de la medianoche, Mari, una joven estudiante, se encuentra en un café leyendo un libro. Un joven músico llamado Takahashi la interrumpe. Mari ha perdido el último tren a casa y planea pasar la noche leyendo. Takahashi se va a ensayar con su banda, pero promete regresar antes del amanecer.', CAST(N'2004-10-01' AS Date), N'AfterDark.png', 9, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (49, N'American Gods', N'Un ex convicto se embarca en un viaje por Estados Unidos para descubrir que los antiguos dioses están luchando contra los nuevos dioses, como la tecnología y los medios de comunicación.', CAST(N'2001-06-01' AS Date), N'AmericanGods.png', 10, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (50, N'Coraline', N'Una niña aventurera descubre una puerta secreta que la lleva a una versión alternativa de su casa, pero con algunos cambios inquietantes.', CAST(N'2002-01-01' AS Date), N'Coraline.png', 10, 5, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (51, N'Stardust', N'Un joven se embarca en una aventura para encontrar una estrella fugaz que ha caído en la tierra, solo para descubrir que es más de lo que esperaba.', CAST(N'1999-10-01' AS Date), N'Stardust.png', 10, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (52, N'Neverwhere', N'Un hombre común y corriente se ve envuelto en un mundo secreto de Londres, lleno de magia y peligro.', CAST(N'1996-09-01' AS Date), N'Neverwhere.png', 10, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (53, N'El oceano al final del camino', N'Un hombre regresa a su casa de la infancia y recuerda un verano mágico de su pasado, lleno de misterio y fantasía.', CAST(N'2013-06-01' AS Date), N'ElOceanoAlFinalDelCamino.png', 10, 1, NULL)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (54, N'El nombre del viento (1)', N'Kvothe, un joven de talento excepcional, narra su historia desde los duros años de su infancia hasta su ascenso como mago y músico sin igual.', CAST(N'2007-03-06' AS Date), N'ElNombreDelViento.png', 11, 1, 4)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (55, N'El temor de un hombre sabio (2)', N'Kvothe continúa su viaje épico, enfrentando nuevos desafíos y revelando secretos de su pasado.', CAST(N'2011-03-01' AS Date), N'ElTemorDeUnHombreSabio.png', 11, 1, 4)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (56, N'El Ojo del Mundo (1)', N'Rand al''Thor es un joven que vive en una aldea tranquila. Un día, un grupo de Aes Sedai, poderosas magas, llega a la aldea y le advierte que está en peligro. Rand debe huir con sus amigos y embarcarse en un viaje para descubrir su destino.', CAST(N'1990-01-01' AS Date), N'ElOjoDelMundo.png', 12, 1, 5)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (57, N'La Gran Cacería (2)', N'Rand y sus amigos continúan su viaje para encontrar el Ojo del Mundo. En el camino, se enfrentan a nuevos peligros y enemigos.', CAST(N'1990-11-01' AS Date), N'LaGranCaceria.png', 12, 1, 5)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (58, N'El Dragón Renacido (3)', N'Rand finalmente acepta su destino como el Dragón Renacido, el único que puede salvar al mundo del Oscuro. Debe reunir a sus fuerzas y prepararse para la batalla final.', CAST(N'1991-10-01' AS Date), N'ElDragonRenacido.png', 12, 1, 5)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (59, N'El Ascenso de la Sombra (4)', N'La guerra contra el Oscuro se intensifica. Rand y sus aliados deben luchar contra enemigos poderosos mientras intentan evitar que el Oscuro destruya el mundo.', CAST(N'1992-09-01' AS Date), N'ElAscensoDeLaSombra.png', 12, 1, 5)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (60, N'Cielo en Llamas (5)', N'Rand se enfrenta a una nueva amenaza: el Señor del Caos. Debe encontrar una manera de derrotarlo antes de que sea demasiado tarde.', CAST(N'1993-09-01' AS Date), N'CieloEnLlamas.png', 12, 1, 5)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (61, N'El Señor del Caos (6)', N'Rand continúa su lucha contra el Oscuro. Debe tomar decisiones difíciles que tendrán un impacto en el futuro del mundo.', CAST(N'1994-09-01' AS Date), N'ElSenorDelCaos.png', 12, 1, 5)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (62, N'La Corona de Espadas (7)', N'Rand se enfrenta a la traición de algunos de sus aliados. Debe descubrir quiénes son sus verdaderos enemigos y cómo derrotarlos.', CAST(N'1995-09-01' AS Date), N'CoronaDeEspadas.png', 12, 1, 5)
INSERT [dbo].[LIBRO] ([ID_LIBRO], [TITULO], [SINOPSIS], [FECHA_PUBLICACION], [PORTADA], [ID_AUTOR], [ID_CATEGORIA], [ID_SAGA]) VALUES (63, N'El Camino de Dagas (8)', N'Rand se acerca al final de su viaje. Debe tomar una decisión final que determinará el destino del mundo.', CAST(N'1996-09-01' AS Date), N'ElCaminoDeDagas.png', 12, 1, 5)
GO
INSERT [dbo].[METODO_PAGO] ([ID_METODO_PAGO], [NOMBRE]) VALUES (1, N'Visa')
INSERT [dbo].[METODO_PAGO] ([ID_METODO_PAGO], [NOMBRE]) VALUES (2, N'Visa Electron 4B')
INSERT [dbo].[METODO_PAGO] ([ID_METODO_PAGO], [NOMBRE]) VALUES (3, N'Euro6000')
INSERT [dbo].[METODO_PAGO] ([ID_METODO_PAGO], [NOMBRE]) VALUES (4, N'American Express')
INSERT [dbo].[METODO_PAGO] ([ID_METODO_PAGO], [NOMBRE]) VALUES (5, N'MasterCard')
INSERT [dbo].[METODO_PAGO] ([ID_METODO_PAGO], [NOMBRE]) VALUES (6, N'Maestro International')
INSERT [dbo].[METODO_PAGO] ([ID_METODO_PAGO], [NOMBRE]) VALUES (7, N'PayPal')
GO
INSERT [dbo].[OPINION] ([ID_OPINION], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Favorito', N'Libro que ha dejado una impresión profunda y que se considera especialmente valioso.')
INSERT [dbo].[OPINION] ([ID_OPINION], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Leído', N'Libro que se ha completado de leer.')
INSERT [dbo].[OPINION] ([ID_OPINION], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Pendiente', N'Libro que se desea leer en el futuro.')
INSERT [dbo].[OPINION] ([ID_OPINION], [NOMBRE], [DESCRIPCION]) VALUES (4, N'Descartado', N'Libro que no se ha completado de leer y que no se tiene intención de leer en el futuro.')
GO
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (1, N'978-8466658843', 30, 300, 1, 1, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (2, N'978-8413146041', 15, 300, 2, 1, 2)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (3, N'B01DKMR9DA', 5, NULL, 3, 1, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (4, N'978-8417347291', 30, 300, 1, 2, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (5, N'978-8419260246', 15, 300, 2, 2, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (6, N'B00AR07NXU', 5, NULL, 3, 2, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (7, N'978-8466658904', 30, 300, 1, 3, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (8, N'978-8419260253', 15, 300, 3, 3, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (9, N'B00AR07H9A', 5, NULL, 3, 3, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (10, N'978-8466658911', 30, 300, 1, 4, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (11, N'978-8419260260', 15, 300, 2, 4, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (12, N'B00CH2TR7Q', 5, NULL, 3, 4, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (13, N'978-8466657662', 30, 300, 1, 5, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (14, N'978-8413143941', 15, 300, 2, 5, 2)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (15, N'B014R3ODUI', 5, NULL, 3, 5, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (16, N'978-8466657549', 30, 300, 1, 6, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (17, N'978-8413143958', 15, 300, 2, 6, 2)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (18, N'B014R3O1CS', 5, NULL, 3, 6, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (19, N'978-8417347000', 30, 300, 1, 7, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (20, N'978-8413146591', 15, 300, 2, 7, 2)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (21, N'B07B6CLK7R', 5, NULL, 3, 7, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (22, N'978-8417347932', 30, 300, 1, 8, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (23, N'B08C357TP1', 5, NULL, 3, 8, 1)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (24, N'978-8417347932', 30, 300, 1, 9, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (25, N'978-8413146591', 15, 300, 2, 9, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (26, N'B08C357TP1', 5, NULL, 3, 9, 3)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (27, N'978-8417347932', 30, 300, 1, 10, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (28, N'978-8413146591', 15, 300, 2, 10, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (29, N'B08C357TP1', 5, NULL, 3, 10, 3)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (30, N'978-8417347932', 30, 300, 1, 11, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (31, N'978-8413146591', 15, 300, 2, 11, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (32, N'B08C357TP1', 5, NULL, 3, 11, 3)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (33, N'978-8417347932', 30, 300, 1, 12, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (34, N'978-8413146591', 15, 300, 2, 12, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (35, N'B08C357TP1', 5, NULL, 3, 12, 3)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (36, N'978-8417347932', 30, 300, 1, 13, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (37, N'978-8413146591', 15, 300, 2, 13, 4)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (38, N'B08C357TP1', 5, NULL, 3, 13, 3)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (39, N'978-8417347932', 30, 300, 1, 14, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (40, N'978-8413146591', 15, 300, 2, 14, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (41, N'B08C357TP1', 5, NULL, 3, 14, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (42, N'978-8417347932', 30, 300, 1, 15, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (43, N'978-8413146591', 15, 300, 2, 15, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (44, N'B08C357TP1', 5, NULL, 3, 15, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (45, N'978-8417347932', 30, 300, 1, 16, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (46, N'978-8413146591', 15, 300, 2, 16, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (47, N'B08C357TP1', 5, NULL, 3, 16, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (48, N'978-8417347932', 30, 300, 1, 17, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (49, N'978-8413146591', 15, 300, 2, 17, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (50, N'B08C357TP1', 5, NULL, 3, 17, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (51, N'978-8417347932', 30, 300, 1, 18, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (52, N'978-8413146591', 15, 300, 2, 18, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (53, N'B08C357TP1', 5, NULL, 3, 18, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (54, N'978-8417347932', 30, 300, 1, 19, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (55, N'978-8413146591', 15, 300, 2, 19, 7)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (56, N'B08C357TP1', 5, NULL, 3, 19, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (57, N'978-8417347932', 30, 300, 1, 20, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (58, N'978-8413146591', 15, 300, 2, 20, 7)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (59, N'B08C357TP1', 5, NULL, 3, 20, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (60, N'978-8417347932', 30, 300, 1, 21, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (61, N'978-8413146591', 15, 300, 2, 21, 7)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (62, N'B08C357TP1', 5, NULL, 3, 21, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (63, N'978-8417347932', 30, 300, 1, 22, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (64, N'978-8413146591', 15, 300, 2, 22, 7)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (65, N'B08C357TP1', 5, NULL, 3, 22, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (66, N'978-8417347932', 30, 300, 1, 23, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (67, N'978-8413146591', 15, 300, 2, 23, 7)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (68, N'B08C357TP1', 5, NULL, 3, 23, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (69, N'978-8417347932', 30, 300, 1, 24, 9)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (70, N'978-8413146591', 15, 300, 2, 24, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (71, N'B08C357TP1', 5, NULL, 3, 24, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (72, N'978-8417347932', 30, 300, 1, 25, 9)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (73, N'978-8413146591', 15, 300, 2, 25, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (74, N'B08C357TP1', 5, NULL, 3, 25, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (75, N'978-8417347932', 30, 300, 1, 26, 9)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (76, N'978-8413146591', 15, 300, 2, 26, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (77, N'B08C357TP1', 5, NULL, 3, 26, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (78, N'978-8417347932', 30, 300, 1, 27, 9)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (79, N'978-8413146591', 15, 300, 2, 27, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (80, N'B08C357TP1', 5, NULL, 3, 27, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (81, N'978-8417347932', 30, 300, 1, 28, 9)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (82, N'978-8413146591', 15, 300, 2, 28, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (83, N'B08C357TP1', 5, NULL, 3, 28, 8)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (84, N'978-8417347932', 30, 300, 1, 29, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (85, N'978-8413146591', 15, 300, 2, 29, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (86, N'B08C357TP1', 5, NULL, 3, 29, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (87, N'978-8417347932', 30, 300, 1, 30, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (88, N'978-8413146591', 15, 300, 2, 30, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (89, N'B08C357TP1', 5, NULL, 3, 30, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (90, N'978-8417347932', 30, 300, 1, 31, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (91, N'978-8413146591', 15, 300, 2, 31, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (92, N'B08C357TP1', 5, NULL, 3, 31, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (93, N'978-8417347932', 30, 300, 1, 32, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (94, N'978-8413146591', 15, 300, 2, 32, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (95, N'B08C357TP1', 5, NULL, 3, 32, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (96, N'978-8417347932', 30, 300, 1, 33, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (97, N'978-8413146591', 15, 300, 2, 33, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (98, N'B08C357TP1', 5, NULL, 3, 33, 10)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (99, N'978-8417347932', 30, 300, 1, 34, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (100, N'978-8413146591', 15, 300, 2, 34, 11)
GO
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (101, N'B08C357TP1', 5, NULL, 3, 34, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (102, N'978-8417347932', 30, 300, 1, 35, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (103, N'978-8413146591', 15, 300, 2, 35, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (104, N'B08C357TP1', 5, NULL, 3, 35, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (105, N'978-8417347932', 30, 300, 1, 36, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (106, N'978-8413146591', 15, 300, 2, 36, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (107, N'B08C357TP1', 5, NULL, 3, 36, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (108, N'978-8417347932', 30, 300, 1, 37, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (109, N'978-8413146591', 15, 300, 2, 37, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (110, N'B08C357TP1', 5, NULL, 3, 37, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (111, N'978-8417347932', 30, 300, 1, 38, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (112, N'978-8413146591', 15, 300, 2, 38, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (113, N'B08C357TP1', 5, NULL, 3, 38, 11)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (114, N'978-8417347932', 30, 300, 1, 39, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (115, N'978-8413146591', 15, 300, 2, 39, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (116, N'B08C357TP1', 5, NULL, 3, 39, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (117, N'978-8417347932', 30, 300, 1, 40, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (118, N'978-8413146591', 15, 300, 2, 40, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (119, N'B08C357TP1', 5, NULL, 3, 40, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (120, N'978-8417347932', 30, 300, 1, 41, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (121, N'978-8413146591', 15, 300, 2, 41, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (122, N'B08C357TP1', 5, NULL, 3, 41, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (123, N'978-8417347932', 30, 300, 1, 42, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (124, N'978-8413146591', 15, 300, 2, 42, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (125, N'B08C357TP1', 5, NULL, 3, 42, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (126, N'978-8417347932', 30, 300, 1, 43, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (127, N'978-8413146591', 15, 300, 2, 43, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (128, N'B08C357TP1', 5, NULL, 3, 43, 12)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (129, N'978-8417347932', 30, 300, 1, 44, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (130, N'978-8413146591', 15, 300, 2, 44, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (131, N'B08C357TP1', 5, NULL, 3, 44, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (132, N'978-8417347932', 30, 300, 1, 45, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (133, N'978-8413146591', 15, 300, 2, 45, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (134, N'B08C357TP1', 5, NULL, 3, 45, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (135, N'978-8417347932', 30, 300, 1, 46, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (136, N'978-8413146591', 15, 300, 2, 46, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (137, N'B08C357TP1', 5, NULL, 3, 46, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (138, N'978-8417347932', 30, 300, 1, 47, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (139, N'978-8413146591', 15, 300, 2, 47, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (140, N'B08C357TP1', 5, NULL, 3, 47, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (141, N'978-8417347932', 30, 300, 1, 48, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (142, N'978-8413146591', 15, 300, 2, 48, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (143, N'B08C357TP1', 5, NULL, 3, 48, 13)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (144, N'978-8417347932', 30, 300, 1, 49, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (145, N'978-8413146591', 15, 300, 2, 49, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (146, N'B08C357TP1', 5, NULL, 3, 49, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (147, N'978-8417347932', 30, 300, 1, 50, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (148, N'978-8413146591', 15, 300, 2, 50, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (149, N'B08C357TP1', 5, NULL, 3, 50, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (150, N'978-8417347932', 30, 300, 1, 51, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (151, N'978-8413146591', 15, 300, 2, 51, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (152, N'B08C357TP1', 5, NULL, 3, 51, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (153, N'978-8417347932', 30, 300, 1, 52, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (154, N'978-8413146591', 15, 300, 2, 52, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (155, N'B08C357TP1', 5, NULL, 3, 52, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (156, N'978-8417347932', 30, 300, 1, 53, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (157, N'978-8413146591', 15, 300, 2, 53, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (158, N'B08C357TP1', 5, NULL, 3, 53, 14)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (159, N'978-8466354028', 30, 300, 1, 54, 5)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (160, N'978-8401337208', 15, 300, 2, 54, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (161, N'B006BD4C2W', 5, NULL, 3, 54, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (162, N'978-8401352331', 30, 300, 1, 55, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (163, N'978-8401339639', 15, 300, 2, 55, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (164, N'B006BD49ZC', 5, NULL, 3, 55, 6)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (165, N'978-8445007006', 15, 300, 2, 56, 15)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (166, N'B07Z6SCP7Y', 5, NULL, 3, 56, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (167, N'978-8445007013', 15, 300, 2, 57, 15)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (168, N'B07Z29DYG1', 5, NULL, 3, 57, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (169, N'978-8445007020', 15, 300, 2, 58, 15)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (170, N'B082P8J6TS', 5, NULL, 3, 58, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (171, N'978-8445007037', 15, 300, 2, 59, 15)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (172, N'B0851TJLM5', 5, NULL, 3, 59, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (173, N'978-8445007044', 15, 300, 2, 60, 15)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (174, N'B086VTHYSG', 5, NULL, 3, 60, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (175, N'978-8445007068', 15, 300, 2, 61, 15)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (176, N'B0087SO40Y', 5, NULL, 3, 61, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (177, N'978-8445007068', 15, 300, 2, 62, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (178, N'B0087SO40Y', 5, NULL, 3, 62, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (179, N'978-8445007075', 15, 300, 2, 63, 16)
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [ISBN], [PRECIO], [STOCK], [ID_FORMATO], [ID_LIBRO], [ID_EDITORIAL]) VALUES (180, N'B0080K3PA4', 5, NULL, 3, 63, 16)
GO
INSERT [dbo].[ROL] ([ID_ROL], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Admin                                                                                                                                                                                                                                                          ', N'Administrador con todos los pribilegios.                                                                                                                                                                                                                       ')
INSERT [dbo].[ROL] ([ID_ROL], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Cliente                                                                                                                                                                                                                                                        ', N'Cliente común.                                                                                                                                                                                                                                                 ')
GO
INSERT [dbo].[SAGA] ([ID_SAGA], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Nacidos de la bruma', N'Nacidos de la bruma es una saga de literatura fantástica escrita por el autor estadounidense Brandon Sanderson. Ambientada en un mundo llamado Scadrial, la saga combina elementos de la alta fantasía, la intriga política y la magia única del sistema de alomancia.')
INSERT [dbo].[SAGA] ([ID_SAGA], [NOMBRE], [DESCRIPCION]) VALUES (2, N'El archivo de las tormentas', N'El archivo de las tormentas es una saga de literatura fantástica épica escrita por Brandon Sanderson. La historia se desarrolla en el desolado mundo de Roshar, donde una tormenta sin fin azota la tierra y la sociedad se divide en diferentes naciones que luchan por la supervivencia. La saga sigue a un grupo de personajes conocidos como los Caballeros Radiantes mientras intentan descubrir los secretos del pasado de Roshar y restaurar la paz en el mundo.')
INSERT [dbo].[SAGA] ([ID_SAGA], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Harry Potter', N'Harry Potter es una serie de siete novelas fantásticas escritas por la autora británica J.K. Rowling. La historia gira en torno a Harry Potter, un joven huérfano que descubre que es un mago en su undécimo cumpleaños.')
INSERT [dbo].[SAGA] ([ID_SAGA], [NOMBRE], [DESCRIPCION]) VALUES (4, N'Crónica del Asesino de Reyes', N'En ella se narra la vida de Kvothe, aventurero, arcanista y músico famoso. La trama está dividida en dos tiempos diferentes: el presente, en el que Kvothe le cuenta su historia a Devan Lochees, y el pasado, en el que se desarrolla la mayor parte de la historia.')
INSERT [dbo].[SAGA] ([ID_SAGA], [NOMBRE], [DESCRIPCION]) VALUES (5, N'La Rueda del Tiempo', N'La Rueda del Tiempo es una saga de fantasía épica compuesta por 14 libros, escrita por el autor estadounidense Robert Jordan y completada tras su fallecimiento por Brandon Sanderson. La historia se desarrolla en un mundo extenso y complejo, donde la magia, llamada el Poder Único, está presente en diferentes grados en hombres y mujeres. La Rueda del Tiempo, una fuerza cíclica que rige el destino del mundo, gira sin cesar, tejiendo la historia y trayendo consigo diferentes eras.')
GO
INSERT [dbo].[USUARIO] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EMAIL], [PASSWORD], [IMAGEN], [PASS], [SALT], [TOKEN], [ID_ROL], [ID_ESTADO]) VALUES (1, N'Administrador', N'Admin', N'admin@example.com', N'password123', N'usuario.png', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[USUARIO] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EMAIL], [PASSWORD], [IMAGEN], [PASS], [SALT], [TOKEN], [ID_ROL], [ID_ESTADO]) VALUES (2, N'Juan', N'Pérez', N'juan.perez@example.com', N'password123', N'usuario.png', NULL, NULL, NULL, 2, 1)
INSERT [dbo].[USUARIO] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EMAIL], [PASSWORD], [IMAGEN], [PASS], [SALT], [TOKEN], [ID_ROL], [ID_ESTADO]) VALUES (3, N'María', N'Gómez', N'maria.gomez@example.com', N'password123', N'usuario.png', NULL, NULL, NULL, 2, 1)
INSERT [dbo].[USUARIO] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EMAIL], [PASSWORD], [IMAGEN], [PASS], [SALT], [TOKEN], [ID_ROL], [ID_ESTADO]) VALUES (4, N'Pedro', N'López', N'pedro.lopez@example.com', N'password123', N'usuario.png', NULL, NULL, NULL, 2, 1)
INSERT [dbo].[USUARIO] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EMAIL], [PASSWORD], [IMAGEN], [PASS], [SALT], [TOKEN], [ID_ROL], [ID_ESTADO]) VALUES (5, N'asd', N'asd', N'hectormauricio.almaraz@tajamar365.com', N'asd', N'usuario.png', 0x1F4912135012F9D294950DFA268937FAD4EDAF0ECA74B6015D5C647F40522298079F169CD6D9C78547C8627369780D739A2E8AF1655F9E81928D6F70ED7C4512, N'M_ÞBQ­23­«ÛL×vÔÍGõ;ÛéÖjª#¯$u,', N'', 2, 1)
INSERT [dbo].[USUARIO] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EMAIL], [PASSWORD], [IMAGEN], [PASS], [SALT], [TOKEN], [ID_ROL], [ID_ESTADO]) VALUES (6, N'Mauricio', N'Alm', N'asd@gmail.com', N'asd', N'usuario.png', 0x2A7170FB12BF415FAEDCA311B150E166C0329BCC92BF99A7302E2DCE530054C72E64D8F04CE914747AF3AFEF3A11267EB15A9EEEEBE32555DA68DBB795C217A1, N'"çBäD£¤ÞÉ¸SµH
þÌí%Üg|Þ yM¬£h©ö', N'', 2, 1)
GO
ALTER TABLE [dbo].[GENEROS_LIBROS]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORIAS_LIBROS_CATEGORIA] FOREIGN KEY([ID_GENERO])
REFERENCES [dbo].[GENERO] ([ID_GENERO])
GO
ALTER TABLE [dbo].[GENEROS_LIBROS] CHECK CONSTRAINT [FK_CATEGORIAS_LIBROS_CATEGORIA]
GO
ALTER TABLE [dbo].[GENEROS_LIBROS]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORIAS_LIBROS_LIBRO] FOREIGN KEY([ID_LIBRO])
REFERENCES [dbo].[LIBRO] ([ID_LIBRO])
GO
ALTER TABLE [dbo].[GENEROS_LIBROS] CHECK CONSTRAINT [FK_CATEGORIAS_LIBROS_LIBRO]
GO
ALTER TABLE [dbo].[INFORMACION_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_PAGO_METODO_PAGO] FOREIGN KEY([ID_METODO_PAGO])
REFERENCES [dbo].[METODO_PAGO] ([ID_METODO_PAGO])
GO
ALTER TABLE [dbo].[INFORMACION_COMPRA] CHECK CONSTRAINT [FK_PAGO_METODO_PAGO]
GO
ALTER TABLE [dbo].[INFORMACION_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_PAGO_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[INFORMACION_COMPRA] CHECK CONSTRAINT [FK_PAGO_USUARIO]
GO
ALTER TABLE [dbo].[LIBRO]  WITH CHECK ADD  CONSTRAINT [FK_LIBRO_AUTOR] FOREIGN KEY([ID_AUTOR])
REFERENCES [dbo].[AUTOR] ([ID_AUTOR])
GO
ALTER TABLE [dbo].[LIBRO] CHECK CONSTRAINT [FK_LIBRO_AUTOR]
GO
ALTER TABLE [dbo].[LIBRO]  WITH CHECK ADD  CONSTRAINT [FK_LIBRO_GENEROS] FOREIGN KEY([ID_CATEGORIA])
REFERENCES [dbo].[CATEGORIA] ([ID_CATEGORIA])
GO
ALTER TABLE [dbo].[LIBRO] CHECK CONSTRAINT [FK_LIBRO_GENEROS]
GO
ALTER TABLE [dbo].[LIBRO]  WITH CHECK ADD  CONSTRAINT [FK_LIBRO_SAGA] FOREIGN KEY([ID_SAGA])
REFERENCES [dbo].[SAGA] ([ID_SAGA])
GO
ALTER TABLE [dbo].[LIBRO] CHECK CONSTRAINT [FK_LIBRO_SAGA]
GO
ALTER TABLE [dbo].[OPINIONES_LIBROS]  WITH CHECK ADD  CONSTRAINT [FK_OPINIONES_LIBROS_LIBRO] FOREIGN KEY([ID_LIBRO])
REFERENCES [dbo].[LIBRO] ([ID_LIBRO])
GO
ALTER TABLE [dbo].[OPINIONES_LIBROS] CHECK CONSTRAINT [FK_OPINIONES_LIBROS_LIBRO]
GO
ALTER TABLE [dbo].[OPINIONES_LIBROS]  WITH CHECK ADD  CONSTRAINT [FK_OPINIONES_LIBROS_OPINION] FOREIGN KEY([ID_OPINION])
REFERENCES [dbo].[OPINION] ([ID_OPINION])
GO
ALTER TABLE [dbo].[OPINIONES_LIBROS] CHECK CONSTRAINT [FK_OPINIONES_LIBROS_OPINION]
GO
ALTER TABLE [dbo].[OPINIONES_LIBROS]  WITH CHECK ADD  CONSTRAINT [FK_OPINIONES_LIBROS_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[OPINIONES_LIBROS] CHECK CONSTRAINT [FK_OPINIONES_LIBROS_USUARIO]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_LISTAS_USUARIOS_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [FK_LISTAS_USUARIOS_USUARIO]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDO_ESTADO_PEDIDO] FOREIGN KEY([ID_ESTADO_PEDIDO])
REFERENCES [dbo].[ESTADO_PEDIDO] ([ID_ESTADO_PEDIDO])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [FK_PEDIDO_ESTADO_PEDIDO]
GO
ALTER TABLE [dbo].[PEDIDOS_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDOS_PRODUCTOS_PEDIDO] FOREIGN KEY([ID_PEDIDO])
REFERENCES [dbo].[PEDIDO] ([ID_PEDIDO])
GO
ALTER TABLE [dbo].[PEDIDOS_PRODUCTOS] CHECK CONSTRAINT [FK_PEDIDOS_PRODUCTOS_PEDIDO]
GO
ALTER TABLE [dbo].[PEDIDOS_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDOS_PRODUCTOS_PRODUCTO] FOREIGN KEY([ID_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([ID_PRODUCTO])
GO
ALTER TABLE [dbo].[PEDIDOS_PRODUCTOS] CHECK CONSTRAINT [FK_PEDIDOS_PRODUCTOS_PRODUCTO]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_EDITORIAL] FOREIGN KEY([ID_EDITORIAL])
REFERENCES [dbo].[EDITORIAL] ([ID_EDITORIAL])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_EDITORIAL]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_FORMATO1] FOREIGN KEY([ID_FORMATO])
REFERENCES [dbo].[FORMATO] ([ID_FORMATO])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_FORMATO1]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_LIBRO1] FOREIGN KEY([ID_LIBRO])
REFERENCES [dbo].[LIBRO] ([ID_LIBRO])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_LIBRO1]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_ESTADO] FOREIGN KEY([ID_ESTADO])
REFERENCES [dbo].[ESTADO] ([ID_ESTADO])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_ESTADO]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_ROL] FOREIGN KEY([ID_ROL])
REFERENCES [dbo].[ROL] ([ID_ROL])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_ROL]
GO
ALTER TABLE [dbo].[VALORACION]  WITH CHECK ADD  CONSTRAINT [FK_VALORACION_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[VALORACION] CHECK CONSTRAINT [FK_VALORACION_USUARIO]
GO
ALTER TABLE [dbo].[VALORACIONES_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_VALORACIONES_PRODUCTOS_PRODUCTO] FOREIGN KEY([ID_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([ID_PRODUCTO])
GO
ALTER TABLE [dbo].[VALORACIONES_PRODUCTOS] CHECK CONSTRAINT [FK_VALORACIONES_PRODUCTOS_PRODUCTO]
GO
ALTER TABLE [dbo].[VALORACIONES_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_VALORACIONES_PRODUCTOS_VALORACION] FOREIGN KEY([ID_VALORACION])
REFERENCES [dbo].[VALORACION] ([ID_VALORACION])
GO
ALTER TABLE [dbo].[VALORACIONES_PRODUCTOS] CHECK CONSTRAINT [FK_VALORACIONES_PRODUCTOS_VALORACION]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PEDIDOS_PRODUCTOS]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_INSERT_PEDIDOS_PRODUCTOS]
(@unidades int, @idpedido int, @idproducto int)
as
	declare @maxid int
	select @maxid=MAX(ID_PEDIDO_PRODUCTO) from PEDIDOS_PRODUCTOS

	insert into PEDIDOS_PRODUCTOS values
	(@maxid, @unidades, @idpedido, @idproducto)

	select ID_PEDIDO_PRODUCTO, UNIDADES, ID_PEDIDO, ID_PRODUCTO 
	from PEDIDOS_PRODUCTOS
	where ID_PEDIDO_PRODUCTO=@maxid
GO
/****** Object:  StoredProcedure [dbo].[SP_PRODUCTO_SIMLE_PAGINACION]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_PRODUCTO_SIMLE_PAGINACION]
(@posicion int, @ndatos int, @nregistros int out)
as
	select ID_PRODUCTO, TITULO, PORTADA, AUTOR, PRECIO, ID_FORMATO, UNIDADES from
		(select 
			ID_PRODUCTO, TITULO, PORTADA, AUTOR, PRECIO, ID_FORMATO, UNIDADES,
			ROW_NUMBER() over (order by ID_PRODUCTO) POSICION
		from
			(select
			ID_PRODUCTO, TITULO, PORTADA, AUTOR, PRECIO, ID_FORMATO, UNIDADES,
			ROW_NUMBER() OVER(PARTITION BY TITULO ORDER BY ID_PRODUCTO) AS REPETICION
			from V_PRODUCTO_SIMPLE) QUERY
		where REPETICION=1) PRIMEROS
	where  POSICION>=@posicion and POSICION<@posicion+@ndatos
GO
/****** Object:  StoredProcedure [dbo].[SP_PRODUCTOS]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_PRODUCTOS]
as
SELECT ID_PRODUCTO, TITULO, PORTADA, AUTOR, PRECIO, ID_FORMATO, UNIDADES
FROM (
	SELECT ID_PRODUCTO, TITULO, PORTADA, AUTOR, PRECIO, ID_FORMATO, UNIDADES,
           ROW_NUMBER() OVER(PARTITION BY TITULO ORDER BY ID_PRODUCTO) AS REPETICION
    FROM V_PRODUCTO_SIMPLE) PRODUCTOS
WHERE REPETICION = 1
and TITULO is not null
and AUTOR is not null
order by ID_PRODUCTO
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_PRODUCTOS]    Script Date: 14/03/2024 14:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SEARCH_PRODUCTOS]
(@busqueda nvarchar(255))
as
SELECT ID_PRODUCTO, TITULO, PORTADA, AUTOR, PRECIO, ID_FORMATO, UNIDADES
FROM (
	SELECT ID_PRODUCTO, TITULO, PORTADA, AUTOR, PRECIO, ID_FORMATO, UNIDADES,
           ROW_NUMBER() OVER(PARTITION BY TITULO ORDER BY ID_PRODUCTO) AS REPETICION
    FROM V_PRODUCTO_SIMPLE) PRODUCTOS
WHERE REPETICION = 1
and TITULO is not null
and AUTOR is not null
and dbo.LIMPIAR(TITULO) like @busqueda
or dbo.LIMPIAR(AUTOR) like @busqueda
and REPETICION = 1
order by ID_PRODUCTO
GO
USE [master]
GO
ALTER DATABASE [ATHANASIA] SET  READ_WRITE 
GO
