USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 1/12/2024 6:40:44 PM ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[QualaOffice]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QualaOffice](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Identification] [varchar](50) NOT NULL,
	[CreationDate] [date] NULL,
	[Money] [int] NULL,
 CONSTRAINT [PK_QualaOffice] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeMoney]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMoney](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeMoney] [varchar](25) NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_TypeMoney] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_QualaOffice]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[V_QualaOffice] as
SELECT QO.Code
      ,QO.Description as OfficeDescription
      ,QO.Address
      ,QO.Identification
      ,QO.CreationDate
      ,TM.Id
	  ,TM.TypeMoney
	  ,TM.Description as MoneyDescription
  FROM [dbo].[QualaOffice] QO
  inner join [dbo].[TypeMoney] TM on TM.Id = QO.Money
GO
ALTER TABLE [dbo].[QualaOffice]  WITH CHECK ADD  CONSTRAINT [FK_QualaOffice_TypeMoney] FOREIGN KEY([Money])
REFERENCES [dbo].[TypeMoney] ([Id])
GO
ALTER TABLE [dbo].[QualaOffice] CHECK CONSTRAINT [FK_QualaOffice_TypeMoney]
GO
/****** Object:  StoredProcedure [dbo].[BD_QualaOffice]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Eduardo Parra Vinasco
-- Create date: 01 - 12 - 2024
-- Description: Borrado de datos  la tabla QualaOffice 
-- =============================================
CREATE PROCEDURE [dbo].[BD_QualaOffice]
  @Code int

AS
BEGIN

	SET NOCOUNT ON;

	DELETE [dbo].[QualaOffice] 
	WHERE Code = @Code

END
GO
/****** Object:  StoredProcedure [dbo].[BD_TypeMoney]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Eduardo Parra
-- Create date: 12 - 01 - 2023
-- Description:	Borrar datos de la tabla TypeMoney
-- =============================================
CREATE PROCEDURE [dbo].[BD_TypeMoney]
	
	@Id int

AS
BEGIN

	SET NOCOUNT ON;

	DELETE [dbo].[TypeMoney]
	WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[BI_QualaOffice]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Eduardo Parra Vinasco
-- Create date: 01 - 12 - 2024
-- Description: Inserción de datos  la tabla QualaOffice 
-- =============================================
CREATE PROCEDURE [dbo].[BI_QualaOffice]
  @Description varchar(250),
  @Address varchar(250),
  @Identification varchar(250),
  @Money int
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO [dbo].[QualaOffice]
           ([Description]
           ,[Address]
           ,[Identification]
           ,[CreationDate]
           ,[Money])
     VALUES
           (@Description
           ,@Address
           ,@Identification
           ,GETDATE()
           ,@Money)

END
GO
/****** Object:  StoredProcedure [dbo].[BI_TypeMoney]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Eduardo Parra
-- Create date: 12 - 01 - 2023
-- Description:	Insertar datos de la tabla TypeMoney
-- =============================================
CREATE PROCEDURE [dbo].[BI_TypeMoney]
	
	@TypeMoney varchar(25),
	@Description varchar(250)

AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO [dbo].[TypeMoney]
           ([TypeMoney]
           ,[Description])
     VALUES
           (@TypeMoney
           ,@Description)

END
GO
/****** Object:  StoredProcedure [dbo].[BU_QualaOffice]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Eduardo Parra Vinasco
-- Create date: 01 - 12 - 2024
-- Description: Actualización de datos  la tabla QualaOffice 
-- =============================================
CREATE PROCEDURE [dbo].[BU_QualaOffice]
  @Code int,
  @Description varchar(250),
  @Address varchar(250),
  @Identification varchar(250),
  @Money int
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE [dbo].[QualaOffice] 
	SET [Description] = @Description
       ,[Address] = @Address
       ,[Identification] = @Identification
       ,[Money] = @Money
	WHERE Code = @Code

END
GO
/****** Object:  StoredProcedure [dbo].[BU_TypeMoney]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Eduardo Parra
-- Create date: 12 - 01 - 2023
-- Description:	Actualizar datos de la tabla TypeMoney
-- =============================================
CREATE PROCEDURE [dbo].[BU_TypeMoney]
	
	@Id int,
	@TypeMoney varchar(25),
	@Description varchar(250)

AS
BEGIN

	SET NOCOUNT ON;

	Update [dbo].[TypeMoney]
	SET [TypeMoney] = @TypeMoney
       ,[Description] = @Description
	WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[Get_QualaOffice]    Script Date: 1/12/2024 6:40:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Eduardo Parra
-- Create date: 01 - 12 - 2024
-- Description:	Obtención de datos de la vista V_QualaOffice
-- =============================================
CREATE PROCEDURE [dbo].[Get_QualaOffice]

AS
BEGIN

	SET NOCOUNT ON;

	SELECT [Code]
      ,[OfficeDescription]
      ,[Address]
      ,[Identification]
      ,[CreationDate]
      ,[Id]
      ,[TypeMoney]
      ,[MoneyDescription]
  FROM [TestDB].[dbo].[V_QualaOffice]

END
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
