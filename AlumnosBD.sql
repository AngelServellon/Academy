USE [master]
GO
/****** Object:  Database [AlumnosBD]    Script Date: 21/2/2021 22:43:54 ******/
CREATE DATABASE [AlumnosBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlumnosBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AlumnosBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlumnosBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AlumnosBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AlumnosBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlumnosBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlumnosBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlumnosBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlumnosBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlumnosBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlumnosBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlumnosBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlumnosBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlumnosBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlumnosBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlumnosBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlumnosBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlumnosBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlumnosBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlumnosBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlumnosBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlumnosBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlumnosBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlumnosBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlumnosBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlumnosBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlumnosBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlumnosBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlumnosBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AlumnosBD] SET  MULTI_USER 
GO
ALTER DATABASE [AlumnosBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlumnosBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlumnosBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlumnosBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlumnosBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlumnosBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AlumnosBD] SET QUERY_STORE = OFF
GO
USE [AlumnosBD]
GO
/****** Object:  User [alumnosa]    Script Date: 21/2/2021 22:43:55 ******/
CREATE USER [alumnosa] FOR LOGIN [alumnosa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [alumnosa]
GO
ALTER ROLE [db_datareader] ADD MEMBER [alumnosa]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [alumnosa]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 21/2/2021 22:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](250) NOT NULL,
	[Apellidos] [nvarchar](250) NOT NULL,
	[Edad] [int] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[FechaRegistr] [datetime] NOT NULL,
	[CodCiudad] [int] NOT NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 21/2/2021 22:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[Id_Calificacion] [int] IDENTITY(1,1) NOT NULL,
	[Nota1] [float] NOT NULL,
	[Nota2] [float] NOT NULL,
	[Nota3] [float] NOT NULL,
	[Nota4] [float] NOT NULL,
	[id_alumno] [int] NOT NULL,
	[id_materia] [int] NOT NULL,
 CONSTRAINT [PK_Calificacion] PRIMARY KEY CLUSTERED 
(
	[Id_Calificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 21/2/2021 22:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Docente]    Script Date: 21/2/2021 22:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Docente](
	[Id_Docente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[Edad] [int] NOT NULL,
	[Sexo] [char](1) NOT NULL,
 CONSTRAINT [PK_Docente] PRIMARY KEY CLUSTERED 
(
	[Id_Docente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 21/2/2021 22:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[Id_Materia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[id_docente] [int] NOT NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[Id_Materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([id], [Nombre], [Apellidos], [Edad], [Sexo], [FechaRegistr], [CodCiudad]) VALUES (3, N'Micaela', N'Neyra', 28, N'F', CAST(N'2021-02-10T09:11:56.477' AS DateTime), 1)
INSERT [dbo].[Alumno] ([id], [Nombre], [Apellidos], [Edad], [Sexo], [FechaRegistr], [CodCiudad]) VALUES (5, N'Pedro', N'Ramirez', 21, N'M', CAST(N'2021-02-10T13:54:52.620' AS DateTime), 2)
INSERT [dbo].[Alumno] ([id], [Nombre], [Apellidos], [Edad], [Sexo], [FechaRegistr], [CodCiudad]) VALUES (6, N'Martin', N'Valdez', 17, N'M', CAST(N'2021-02-10T16:36:29.753' AS DateTime), 3)
INSERT [dbo].[Alumno] ([id], [Nombre], [Apellidos], [Edad], [Sexo], [FechaRegistr], [CodCiudad]) VALUES (7, N'Angel', N'Servellon', 19, N'M', CAST(N'2021-02-10T18:13:11.390' AS DateTime), 2)
INSERT [dbo].[Alumno] ([id], [Nombre], [Apellidos], [Edad], [Sexo], [FechaRegistr], [CodCiudad]) VALUES (1005, N'David', N'Mendoza', 22, N'M', CAST(N'2021-02-11T07:43:04.430' AS DateTime), 1)
INSERT [dbo].[Alumno] ([id], [Nombre], [Apellidos], [Edad], [Sexo], [FechaRegistr], [CodCiudad]) VALUES (3005, N'Hector Roberto', N'Rodriguez', 18, N'M', CAST(N'2021-02-21T21:30:56.630' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Calificacion] ON 

INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (1, 7, 9.5, 8.4, 7.1, 5, 6)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (3, 5.3, 8, 7, 6.4, 3, 1)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (4, 9, 8.4, 3.3, 6.7, 6, 5)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (5, 10, 6.4, 8.7, 7.2, 7, 7)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (6, 8.4, 9.4, 9.8, 9.2, 1005, 8)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (7, 8.7, 2.1, 6.4, 5, 3, 5)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (8, 7.4, 9.6, 8.7, 9.7, 5, 5)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (9, 2.7, 9.4, 7.6, 8.9, 6, 6)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (10, 9.4, 8.6, 7.4, 8.5, 7, 8)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (11, 10, 7, 6.4, 8, 1005, 7)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (1002, 5, 6, 8, 7, 6, 7)
INSERT [dbo].[Calificacion] ([Id_Calificacion], [Nota1], [Nota2], [Nota3], [Nota4], [id_alumno], [id_materia]) VALUES (1003, 8, 9.6, 10, 6, 7, 6)
SET IDENTITY_INSERT [dbo].[Calificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 

INSERT [dbo].[Ciudad] ([id], [Nombre]) VALUES (1, N'Piura')
INSERT [dbo].[Ciudad] ([id], [Nombre]) VALUES (2, N'Trujillo')
INSERT [dbo].[Ciudad] ([id], [Nombre]) VALUES (3, N'Lima')
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Docente] ON 

INSERT [dbo].[Docente] ([Id_Docente], [Nombres], [Apellidos], [Edad], [Sexo]) VALUES (1, N'Fernanda', N'Alfaro', 35, N'F')
INSERT [dbo].[Docente] ([Id_Docente], [Nombres], [Apellidos], [Edad], [Sexo]) VALUES (3, N'Rene', N'Alvarado', 47, N'M')
INSERT [dbo].[Docente] ([Id_Docente], [Nombres], [Apellidos], [Edad], [Sexo]) VALUES (4, N'Henry', N'Portillo', 31, N'M')
INSERT [dbo].[Docente] ([Id_Docente], [Nombres], [Apellidos], [Edad], [Sexo]) VALUES (5, N'Maria', N'Campos', 28, N'F')
INSERT [dbo].[Docente] ([Id_Docente], [Nombres], [Apellidos], [Edad], [Sexo]) VALUES (7, N'Eduardo', N'Velazquez', 34, N'M')
SET IDENTITY_INSERT [dbo].[Docente] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 

INSERT [dbo].[Materia] ([Id_Materia], [Nombre], [id_docente]) VALUES (1, N'Programacion de Algoritmos', 4)
INSERT [dbo].[Materia] ([Id_Materia], [Nombre], [id_docente]) VALUES (5, N'Base de Datos', 3)
INSERT [dbo].[Materia] ([Id_Materia], [Nombre], [id_docente]) VALUES (6, N'Lenguaje de marcado y estilo web', 1)
INSERT [dbo].[Materia] ([Id_Materia], [Nombre], [id_docente]) VALUES (7, N'Redes de comunicacion', 5)
INSERT [dbo].[Materia] ([Id_Materia], [Nombre], [id_docente]) VALUES (8, N'Desarrollo de servidores', 7)
SET IDENTITY_INSERT [dbo].[Materia] OFF
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Ciudad] FOREIGN KEY([CodCiudad])
REFERENCES [dbo].[Ciudad] ([id])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Ciudad]
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Alumno] FOREIGN KEY([id_alumno])
REFERENCES [dbo].[Alumno] ([id])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_Calificacion_Alumno]
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Materia] FOREIGN KEY([id_materia])
REFERENCES [dbo].[Materia] ([Id_Materia])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_Calificacion_Materia]
GO
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Docente] FOREIGN KEY([id_docente])
REFERENCES [dbo].[Docente] ([Id_Docente])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Docente]
GO
USE [master]
GO
ALTER DATABASE [AlumnosBD] SET  READ_WRITE 
GO
