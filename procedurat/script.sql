USE [master]
GO
/****** Object:  Database [FAI]    Script Date: 31.05.2019 22:12:51 ******/
CREATE DATABASE [FAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FAI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FAI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FAI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [FAI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FAI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FAI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FAI] SET  MULTI_USER 
GO
ALTER DATABASE [FAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FAI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FAI] SET QUERY_STORE = OFF
GO
USE [FAI]
GO
/****** Object:  Table [dbo].[Amortizim]    Script Date: 31.05.2019 22:12:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amortizim](
	[AmortizimID] [int] IDENTITY(1,1) NOT NULL,
	[AmortizimiVjetor] [float] NOT NULL,
	[AmortizimiAkumuluar] [float] NOT NULL,
	[GrupiID] [int] NULL,
	[Cmimi] [float] NULL,
	[Viti] [int] NULL,
	[ProduktiID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AmortizimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 31.05.2019 22:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[FaturaID] [int] IDENTITY(1,1) NOT NULL,
	[DataHyrjes] [date] NULL,
	[Koha] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[FaturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaturaDetails]    Script Date: 31.05.2019 22:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaDetails](
	[FaturaDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[cmimi] [float] NOT NULL,
	[ProduktiID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FaturaDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaturaKlienti]    Script Date: 31.05.2019 22:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaKlienti](
	[FaturaKlientiID] [int] IDENTITY(1,1) NOT NULL,
	[FaturaDetailsID] [int] NULL,
	[KlientiID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FaturaKlientiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaturaVendori]    Script Date: 31.05.2019 22:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaVendori](
	[FaturaVendoriID] [int] IDENTITY(1,1) NOT NULL,
	[FaturaDetailsID] [int] NULL,
	[VendoriID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FaturaVendoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupi]    Script Date: 31.05.2019 22:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupi](
	[GrupiID] [int] IDENTITY(1,1) NOT NULL,
	[Grupi] [varchar](30) NULL,
	[KategoriaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GrupiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hapsira]    Script Date: 31.05.2019 22:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hapsira](
	[HapsiraID] [int] NOT NULL,
	[LlojiID] [int] NOT NULL,
	[ObjektiID] [int] NULL,
	[Emri] [varchar](50) NULL,
 CONSTRAINT [PK__Hapsira__3B111E325A449C5B] PRIMARY KEY CLUSTERED 
(
	[HapsiraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoria]    Script Date: 31.05.2019 22:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoria](
	[KategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[VleraKategorise] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienti]    Script Date: 31.05.2019 22:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienti](
	[KlientiID] [int] IDENTITY(1,1) NOT NULL,
	[Emri] [varchar](20) NOT NULL,
	[Mbiemri] [varchar](20) NOT NULL,
	[NumriTelefonit] [int] NOT NULL,
	[Email] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[KlientiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LlojiHapsires]    Script Date: 31.05.2019 22:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LlojiHapsires](
	[LlojiID] [int] IDENTITY(1,1) NOT NULL,
	[Lloji] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[LlojiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 31.05.2019 22:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[PunetoriID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mirembajtja]    Script Date: 31.05.2019 22:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mirembajtja](
	[MirembajtjaID] [int] IDENTITY(1,1) NOT NULL,
	[ProduktiID] [int] NULL,
	[DataMirmbajtjes] [date] NULL,
	[Pershkrimi] [varchar](40) NULL,
	[PunetoriID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MirembajtjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objekti]    Script Date: 31.05.2019 22:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objekti](
	[ObjektiID] [int] IDENTITY(1,1) NOT NULL,
	[Lokacioni] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ObjektiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdukteHapsira]    Script Date: 31.05.2019 22:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdukteHapsira](
	[PdID] [int] IDENTITY(1,1) NOT NULL,
	[ProduktiID] [int] NULL,
	[HapsiraID] [int] NULL,
	[DataPH] [date] NULL,
 CONSTRAINT [PK__Produkte__A0023E5C8A46F3CD] PRIMARY KEY CLUSTERED 
(
	[PdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkti]    Script Date: 31.05.2019 22:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkti](
	[ProduktiID] [int] IDENTITY(1,1) NOT NULL,
	[Emri] [varchar](30) NOT NULL,
	[Pershkrimi] [varchar](100) NOT NULL,
	[Prodhuesi] [varchar](30) NOT NULL,
	[Modeli] [varchar](30) NULL,
	[Jetegjatesia] [int] NULL,
	[NrSerik] [varchar](15) NOT NULL,
	[Lloji] [varchar](50) NULL,
	[Data1] [date] NULL,
	[GrupiID] [int] NULL,
	[Cmimi] [money] NULL,
	[Statusi] [bit] NULL,
	[salvageValue] [money] NULL,
 CONSTRAINT [PK__Produkti__AC9B39095D61DAA5] PRIMARY KEY CLUSTERED 
(
	[ProduktiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Punetori]    Script Date: 31.05.2019 22:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Punetori](
	[PunetoriID] [int] IDENTITY(1,1) NOT NULL,
	[Emri] [varchar](20) NOT NULL,
	[Mbiemri] [varchar](20) NOT NULL,
	[Gjinia] [varchar](1) NOT NULL,
	[RoliID] [int] NULL,
	[NumriPersonal] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[PunetoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PunetoriProdukti]    Script Date: 31.05.2019 22:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PunetoriProdukti](
	[PPID] [int] IDENTITY(1,1) NOT NULL,
	[PunetoriID] [int] NULL,
	[ProduktiID] [int] NULL,
	[DataPP] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roli]    Script Date: 31.05.2019 22:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roli](
	[RoliID] [int] IDENTITY(1,1) NOT NULL,
	[Roli] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoliID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendori]    Script Date: 31.05.2019 22:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendori](
	[VendoriID] [int] IDENTITY(1,1) NOT NULL,
	[Emri] [varchar](20) NOT NULL,
	[Lokacioni] [varchar](20) NOT NULL,
	[NrKontaktues] [int] NOT NULL,
	[BankAccount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VendoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zhvlersimi]    Script Date: 31.05.2019 22:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zhvlersimi](
	[ZhvlersimiID] [int] IDENTITY(1,1) NOT NULL,
	[ProduktiID] [int] NULL,
	[GrupiID] [int] NULL,
	[Cmimi] [float] NULL,
	[CmimiZh] [float] NULL,
	[Viti] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZhvlersimiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Amortizim]  WITH CHECK ADD FOREIGN KEY([GrupiID])
REFERENCES [dbo].[Grupi] ([GrupiID])
GO
ALTER TABLE [dbo].[Amortizim]  WITH CHECK ADD  CONSTRAINT [FK__Amortizim__Produ__1D4655FB] FOREIGN KEY([ProduktiID])
REFERENCES [dbo].[Produkti] ([ProduktiID])
GO
ALTER TABLE [dbo].[Amortizim] CHECK CONSTRAINT [FK__Amortizim__Produ__1D4655FB]
GO
ALTER TABLE [dbo].[FaturaDetails]  WITH CHECK ADD  CONSTRAINT [FK__FaturaDet__Produ__3EA749C6] FOREIGN KEY([ProduktiID])
REFERENCES [dbo].[Produkti] ([ProduktiID])
GO
ALTER TABLE [dbo].[FaturaDetails] CHECK CONSTRAINT [FK__FaturaDet__Produ__3EA749C6]
GO
ALTER TABLE [dbo].[FaturaKlienti]  WITH CHECK ADD FOREIGN KEY([FaturaDetailsID])
REFERENCES [dbo].[FaturaDetails] ([FaturaDetailsID])
GO
ALTER TABLE [dbo].[FaturaKlienti]  WITH CHECK ADD FOREIGN KEY([KlientiID])
REFERENCES [dbo].[Klienti] ([KlientiID])
GO
ALTER TABLE [dbo].[FaturaVendori]  WITH CHECK ADD FOREIGN KEY([FaturaDetailsID])
REFERENCES [dbo].[FaturaDetails] ([FaturaDetailsID])
GO
ALTER TABLE [dbo].[FaturaVendori]  WITH CHECK ADD FOREIGN KEY([VendoriID])
REFERENCES [dbo].[Vendori] ([VendoriID])
GO
ALTER TABLE [dbo].[Grupi]  WITH CHECK ADD FOREIGN KEY([KategoriaID])
REFERENCES [dbo].[Kategoria] ([KategoriaID])
GO
ALTER TABLE [dbo].[Hapsira]  WITH CHECK ADD  CONSTRAINT [FK__Hapsira__LlojiID__2D7CBDC4] FOREIGN KEY([LlojiID])
REFERENCES [dbo].[LlojiHapsires] ([LlojiID])
GO
ALTER TABLE [dbo].[Hapsira] CHECK CONSTRAINT [FK__Hapsira__LlojiID__2D7CBDC4]
GO
ALTER TABLE [dbo].[Hapsira]  WITH CHECK ADD  CONSTRAINT [FK__Hapsira__Objekti__2E70E1FD] FOREIGN KEY([ObjektiID])
REFERENCES [dbo].[Objekti] ([ObjektiID])
GO
ALTER TABLE [dbo].[Hapsira] CHECK CONSTRAINT [FK__Hapsira__Objekti__2E70E1FD]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD FOREIGN KEY([PunetoriID])
REFERENCES [dbo].[Punetori] ([PunetoriID])
GO
ALTER TABLE [dbo].[Mirembajtja]  WITH CHECK ADD  CONSTRAINT [FK__Mirembajt__Produ__351DDF8C] FOREIGN KEY([ProduktiID])
REFERENCES [dbo].[Produkti] ([ProduktiID])
GO
ALTER TABLE [dbo].[Mirembajtja] CHECK CONSTRAINT [FK__Mirembajt__Produ__351DDF8C]
GO
ALTER TABLE [dbo].[Mirembajtja]  WITH CHECK ADD FOREIGN KEY([PunetoriID])
REFERENCES [dbo].[Punetori] ([PunetoriID])
GO
ALTER TABLE [dbo].[ProdukteHapsira]  WITH CHECK ADD  CONSTRAINT [FK__ProdukteH__Hapsi__314D4EA8] FOREIGN KEY([HapsiraID])
REFERENCES [dbo].[Hapsira] ([HapsiraID])
GO
ALTER TABLE [dbo].[ProdukteHapsira] CHECK CONSTRAINT [FK__ProdukteH__Hapsi__314D4EA8]
GO
ALTER TABLE [dbo].[ProdukteHapsira]  WITH CHECK ADD  CONSTRAINT [FK__ProdukteH__Produ__324172E1] FOREIGN KEY([ProduktiID])
REFERENCES [dbo].[Produkti] ([ProduktiID])
GO
ALTER TABLE [dbo].[ProdukteHapsira] CHECK CONSTRAINT [FK__ProdukteH__Produ__324172E1]
GO
ALTER TABLE [dbo].[Produkti]  WITH CHECK ADD  CONSTRAINT [FK__Produkti__GrupiI__1699586C] FOREIGN KEY([GrupiID])
REFERENCES [dbo].[Grupi] ([GrupiID])
GO
ALTER TABLE [dbo].[Produkti] CHECK CONSTRAINT [FK__Produkti__GrupiI__1699586C]
GO
ALTER TABLE [dbo].[Punetori]  WITH CHECK ADD FOREIGN KEY([RoliID])
REFERENCES [dbo].[Roli] ([RoliID])
GO
ALTER TABLE [dbo].[PunetoriProdukti]  WITH CHECK ADD  CONSTRAINT [FK__PunetoriP__Produ__26CFC035] FOREIGN KEY([ProduktiID])
REFERENCES [dbo].[Produkti] ([ProduktiID])
GO
ALTER TABLE [dbo].[PunetoriProdukti] CHECK CONSTRAINT [FK__PunetoriP__Produ__26CFC035]
GO
ALTER TABLE [dbo].[PunetoriProdukti]  WITH CHECK ADD FOREIGN KEY([PunetoriID])
REFERENCES [dbo].[Punetori] ([PunetoriID])
GO
ALTER TABLE [dbo].[Zhvlersimi]  WITH CHECK ADD FOREIGN KEY([GrupiID])
REFERENCES [dbo].[Grupi] ([GrupiID])
GO
ALTER TABLE [dbo].[Zhvlersimi]  WITH CHECK ADD  CONSTRAINT [FK__Zhvlersim__Produ__1A69E950] FOREIGN KEY([ProduktiID])
REFERENCES [dbo].[Produkti] ([ProduktiID])
GO
ALTER TABLE [dbo].[Zhvlersimi] CHECK CONSTRAINT [FK__Zhvlersim__Produ__1A69E950]
GO
/****** Object:  StoredProcedure [dbo].[GrupiDeleteRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GrupiDeleteRow]
@GrupiID int
AS
BEGIN
DELETE Grupi WHERE [GrupiID] = @GrupiID
END
GO
/****** Object:  StoredProcedure [dbo].[GrupiInsertRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GrupiInsertRow]
@Grupi varchar(50),
@KategoriaID int
AS
BEGIN
    INSERT INTO Grupi
        ([Grupi], [KategoriaID])
    VALUES
        (@Grupi, @KategoriaID)
END
GO
/****** Object:  StoredProcedure [dbo].[GrupiSelectAll]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GrupiSelectAll]
AS
BEGIN
SELECT * FROM Grupi 
END
GO
/****** Object:  StoredProcedure [dbo].[GrupiSelectRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GrupiSelectRow]
@GrupiID int
AS
BEGIN
SELECT * FROM Grupi s
WHERE [GrupiID]=@GrupiID
END
GO
/****** Object:  StoredProcedure [dbo].[GrupiUpdateRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GrupiUpdateRow]
@GrupiID int,
@Grupi varchar(50),
@KategoriaID int
AS
BEGIN
UPDATE Grupi SET 
[Grupi] = @Grupi, 
[KategoriaID] = @KategoriaID
WHERE [GrupiID] = @GrupiID
END
GO
/****** Object:  StoredProcedure [dbo].[KategoriaSelectAll]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[KategoriaSelectAll]
AS
BEGIN
SELECT * FROM Kategoria 
END
GO
/****** Object:  StoredProcedure [dbo].[ObjektiDeleteRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ObjektiDeleteRow]
@ObjektiID int
AS
BEGIN
DELETE Studenti WHERE [ObjektiID] = @ObjektiID
END
GO
/****** Object:  StoredProcedure [dbo].[ObjektiInsertRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ObjektiInsertRow]
@Lokacioni varchar(30)
AS
BEGIN
    INSERT INTO Objekti
        ([Lokacioni])
    VALUES
        (@Lokacioni)
END

GO
/****** Object:  StoredProcedure [dbo].[ObjektiSelectAll]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ObjektiSelectAll]
AS
BEGIN
SELECT * FROM Objekti 
END
GO
/****** Object:  StoredProcedure [dbo].[ObjektiSelectRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ObjektiSelectRow]
@ObjektiID int
AS
BEGIN
SELECT * FROM Objekti s
WHERE [ObjektiID]=@ObjektiID
END
GO
/****** Object:  StoredProcedure [dbo].[ObjektiUpdateRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ObjektiUpdateRow]
@ObjektiID int,
@Lokacioni varchar(50)
AS
BEGIN
UPDATE Objekti SET 
[Lokacioni] = @Lokacioni
WHERE [ObjektiID] = @ObjektiID
END
GO
/****** Object:  StoredProcedure [dbo].[ProduktiDeleteRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ProduktiDeleteRow]
@ProduktiID int
AS
BEGIN
DELETE Produkti WHERE [ProduktiID] = @ProduktiID
END
GO
/****** Object:  StoredProcedure [dbo].[ProduktiInsertRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ProduktiInsertRow]
@Emri varchar(50),
@Pershkrimi varchar(250),
@Prodhuesi varchar(50),
@Modeli varchar(50),
@Jetegjatesia int,
@Lloji varchar(50),
@GrupiID int,
@Statusi bit,
@NrSerik varchar(15),
@salvageValue float,
@Cmimi float,
@Data1 date
AS
BEGIN
    INSERT INTO Produkti
        ([Emri], [Pershkrimi], [Prodhuesi], [Modeli], [Jetegjatesia], [Lloji], [GrupiID], [Statusi], [NrSerik], [salvageValue], [Cmimi], [Data1])
    VALUES
        (@Emri, @Pershkrimi, @Prodhuesi, @Modeli, @Jetegjatesia, @Lloji, @GrupiID, @Statusi, @NrSerik, @salvageValue, @Cmimi, @Data1)
END
GO
/****** Object:  StoredProcedure [dbo].[ProduktiSelectAll]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ProduktiSelectAll]
AS
BEGIN
SELECT * FROM Produkti
END
GO
/****** Object:  StoredProcedure [dbo].[ProduktiSelectRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ProduktiSelectRow]
@ProduktiID int
AS
BEGIN
SELECT * FROM Produkti p
WHERE [ProduktiID]=@ProduktiID
END
GO
/****** Object:  StoredProcedure [dbo].[ProduktiUpdateRow]    Script Date: 31.05.2019 22:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ProduktiUpdateRow]
@ProduktiID int,
@Emri varchar(50),
@Pershkrimi varchar(250),
@Prodhuesi varchar(50),
@Modeli varchar(50),
@Jetegjatesia int,
@Lloji varchar(50),
@GrupiID int,
@Statusi bit,
@NrSerik varchar(15),
@salvageValue float,
@Cmimi float,
@Data1 date
AS
BEGIN
UPDATE Produkti SET 
[Emri] = @Emri,
[Pershkrimi] = @Pershkrimi,
[Prodhuesi] = @Prodhuesi,
[Modeli] = @Modeli,
[Jetegjatesia] = @Jetegjatesia,
[Lloji] = @Lloji,
[GrupiID] = @GrupiID,
[Statusi] = @Statusi,
[NrSerik] = @NrSerik,
[salvageValue] = @salvageValue,
[Cmimi] = @Cmimi,
[Data1] = @Data1
WHERE [ProduktiID] = @ProduktiID
END
GO
USE [master]
GO
ALTER DATABASE [FAI] SET  READ_WRITE 
GO
