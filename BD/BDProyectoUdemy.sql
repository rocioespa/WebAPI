USE [master]
GO
/****** Object:  Database [CursoWebAPINet6]    Script Date: 01/02/2024 11:43:09 ******/
CREATE DATABASE [CursoWebAPINet6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CursoWebAPINet6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CursoWebAPINet6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CursoWebAPINet6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CursoWebAPINet6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CursoWebAPINet6] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CursoWebAPINet6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CursoWebAPINet6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET ARITHABORT OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CursoWebAPINet6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CursoWebAPINet6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CursoWebAPINet6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CursoWebAPINet6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET RECOVERY FULL 
GO
ALTER DATABASE [CursoWebAPINet6] SET  MULTI_USER 
GO
ALTER DATABASE [CursoWebAPINet6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CursoWebAPINet6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CursoWebAPINet6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CursoWebAPINet6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CursoWebAPINet6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CursoWebAPINet6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CursoWebAPINet6', N'ON'
GO
ALTER DATABASE [CursoWebAPINet6] SET QUERY_STORE = ON
GO
ALTER DATABASE [CursoWebAPINet6] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CursoWebAPINet6]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](500) NOT NULL,
	[CodEmpleado] [nchar](4) NOT NULL,
	[Email] [nchar](255) NOT NULL,
	[Edad] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prueba]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prueba](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Prueba] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioApi]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioApi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](500) NOT NULL,
	[Password] [varbinary](500) NOT NULL,
	[Email] [varchar](500) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_UsuarioApi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 
GO
INSERT [dbo].[Empleado] ([Id], [Nombre], [CodEmpleado], [Email], [Edad], [FechaAlta], [FechaBaja]) VALUES (2, N'rochi                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'A001', N'ro@example.com                                                                                                                                                                                                                                                 ', 25, CAST(N'2024-01-22T15:51:08.537' AS DateTime), CAST(N'2024-01-23T11:08:17.067' AS DateTime))
GO
INSERT [dbo].[Empleado] ([Id], [Nombre], [CodEmpleado], [Email], [Edad], [FechaAlta], [FechaBaja]) VALUES (3, N'Pepito                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'A002', N'pepito@example.com                                                                                                                                                                                                                                             ', 23, CAST(N'2024-01-23T11:06:45.570' AS DateTime), NULL)
GO
INSERT [dbo].[Empleado] ([Id], [Nombre], [CodEmpleado], [Email], [Edad], [FechaAlta], [FechaBaja]) VALUES (4, N'Manolo                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'A003', N'manolo@example.com                                                                                                                                                                                                                                             ', 36, CAST(N'2024-01-23T11:07:16.413' AS DateTime), NULL)
GO
INSERT [dbo].[Empleado] ([Id], [Nombre], [CodEmpleado], [Email], [Edad], [FechaAlta], [FechaBaja]) VALUES (5, N'Ana                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'A004', N'ana@example.com                                                                                                                                                                                                                                                ', 37, CAST(N'2024-01-23T11:07:31.790' AS DateTime), NULL)
GO
INSERT [dbo].[Empleado] ([Id], [Nombre], [CodEmpleado], [Email], [Edad], [FechaAlta], [FechaBaja]) VALUES (6, N'Laura                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'A008', N'laura@gmail.com                                                                                                                                                                                                                                                ', 444, CAST(N'2024-01-31T13:14:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Prueba] ON 
GO
INSERT [dbo].[Prueba] ([Id], [Nombre]) VALUES (1, N'Juan                                              ')
GO
INSERT [dbo].[Prueba] ([Id], [Nombre]) VALUES (2, N'Pedro                                             ')
GO
INSERT [dbo].[Prueba] ([Id], [Nombre]) VALUES (3, N'Ana                                               ')
GO
INSERT [dbo].[Prueba] ([Id], [Nombre]) VALUES (4, N'Manolo                                            ')
GO
INSERT [dbo].[Prueba] ([Id], [Nombre]) VALUES (10, N'XXXXX                                             ')
GO
INSERT [dbo].[Prueba] ([Id], [Nombre]) VALUES (11, N'XXXXX                                             ')
GO
INSERT [dbo].[Prueba] ([Id], [Nombre]) VALUES (12, N'XXXXX                                             ')
GO
INSERT [dbo].[Prueba] ([Id], [Nombre]) VALUES (13, N'XXXXX                                             ')
GO
SET IDENTITY_INSERT [dbo].[Prueba] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioApi] ON 
GO
INSERT [dbo].[UsuarioApi] ([Id], [Usuario], [Password], [Email], [FechaAlta], [FechaBaja]) VALUES (1, N'JAP', 0x02000000B94332D3DC65A0AC657A49F47374C8A934EE7D97BA436B4EB74520BCDD9227F7, N'jap@gmail.com', CAST(N'2024-01-24T17:23:59.660' AS DateTime), NULL)
GO
INSERT [dbo].[UsuarioApi] ([Id], [Usuario], [Password], [Email], [FechaAlta], [FechaBaja]) VALUES (4, N'JAP2', 0x020000009A56CE4A80C9604E15862EB42E4BD20FE16651AD905C6FD99B96306F306FFFD44F774A50E9A79ABB7ADBF2C66C217D5B, N'123456', CAST(N'2024-01-25T13:19:29.003' AS DateTime), NULL)
GO
INSERT [dbo].[UsuarioApi] ([Id], [Usuario], [Password], [Email], [FechaAlta], [FechaBaja]) VALUES (5, N'JAP3', 0x02000000481B041785C6F53F6D17029DD1D97421AD3BEBBBD3DCB19451667B8E40D8A391, N'jap3@gmail.com', CAST(N'2024-01-25T13:20:48.390' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[UsuarioApi] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Empleado]    Script Date: 01/02/2024 11:43:10 ******/
ALTER TABLE [dbo].[Empleado] ADD  CONSTRAINT [IX_Empleado] UNIQUE NONCLUSTERED 
(
	[CodEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsuarioApi]    Script Date: 01/02/2024 11:43:10 ******/
ALTER TABLE [dbo].[UsuarioApi] ADD  CONSTRAINT [IX_UsuarioApi] UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Ejemplo]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Ejemplo]
@id int=null
	
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM PRUEBA WHERE @Id is null OR id=@id

END
GO
/****** Object:  StoredProcedure [dbo].[EjemploInsert]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EjemploInsert]

@Nombre varchar(50)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	INSERT INTO dbo.Prueba(Nombre) VALUES (@Nombre)
END

GO
/****** Object:  StoredProcedure [dbo].[EmpleadoAlta]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpleadoAlta]
@Nombre varchar (500),
@CodEmpleado varchar(4),
@Email varchar(255),
@Edad int,
@FechaAlta datetime
AS
BEGIN

IF(SELECT count(*) FROM Empleado WHERE CodEmpleado=@CodEmpleado)>0
BEGIN
RAISERROR('Este codigo de empleado ya existe en nuestro sistema',16,1);
RETURN -1
END


	INSERT INTO dbo.Empleado(Nombre,CodEmpleado,Email,Edad,FechaAlta,FechaBaja)
     VALUES(@Nombre,@CodEmpleado,@Email,@Edad,@FechaAlta,null)
	

END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoBorrar]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpleadoBorrar]

@CodEmpleado varchar(4)

AS
BEGIN

IF(SELECT count(*) FROM Empleado WHERE CodEmpleado=@CodEmpleado)=0
BEGIN
RAISERROR('Este codigo de empleado no existe en nuestro sistema',16,1);
RETURN -1
END

UPDATE dbo.Empleado
SET FechaBaja = GETDATE()
WHERE CodEmpleado = @CodEmpleado

	

END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoModificar]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EmpleadoModificar]
@Nombre varchar (500),
@CodEmpleado varchar(4),
@Email varchar(255),
@Edad int
AS
BEGIN

IF(SELECT count(*) FROM Empleado WHERE CodEmpleado=@CodEmpleado AND FechaBaja IS NULL)=0
BEGIN
RAISERROR('Este codigo de empleado no existe en nuestro sistema',16,1);
RETURN -1
END


	UPDATE dbo.Empleado
	SET Nombre = @Nombre,
	Email = @Email,
	Edad = @Edad
	WHERE CodEmpleado = @CodEmpleado
	

END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoObtener]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EmpleadoObtener]

@CodEmpleado varchar(4)=NULL

AS
BEGIN

SELECT * FROM Empleado where FechaBaja IS NULL AND (@CodEmpleado IS NULL OR CodEmpleado=@CodEmpleado)


END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioApiAlta]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioApiAlta]

@UsuarioApi varchar(500),
@PassApi varchar (500),
@EmailUsuario varchar(500)

AS
BEGIN
IF(SELECT count(*)FROM UsuarioApi WHERE Usuario = @UsuarioAPI)>0
BEGIN
RAISERROR('El usuario ya existe en nuestro sistema',16,1)
RETURN -1
END

DECLARE @passEncriptada VarBinary(500)
SET @passEncriptada=ENCRYPTBYPASSPHRASE('Clave',@PassApi)

INSERT INTO dbo.UsuarioApi (Usuario,Password,Email,FechaAlta,FechaBaja)
     VALUES
           (@UsuarioApi,@passEncriptada,@EmailUsuario, GETDATE(),NULL)

END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioApiObtener]    Script Date: 01/02/2024 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioApiObtener]

@UsuarioApi varchar(500),
@PassApi varchar (500)

AS
BEGIN


DECLARE @passEncriptada VarBinary(500)
DECLARE @passDesEncriptada varchar(50)

SELECT * FROM UsuarioApi WHERE Usuario=@UsuarioApi AND FechaBaja IS NULL

SELECT @passEncriptada=Password FROM UsuarioApi WHERE Usuario = @UsuarioApi AND FechaBaja IS NULL

SET @passDesEncriptada=ENCRYPTBYPASSPHRASE('Clave',@passEncriptada)

IF(@PassApi=@passDesEncriptada)
BEGIN
SELECT Usuario,Email FROM UsuarioApi WHERE Usuario=@UsuarioApi AND FechaBaja IS NULL
END
ELSE
BEGIN
RAISERROR('Credenciales no validas',16,1)
RETURN -1
END

END 
GO
USE [master]
GO
ALTER DATABASE [CursoWebAPINet6] SET  READ_WRITE 
GO
