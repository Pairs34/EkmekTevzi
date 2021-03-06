USE [master]
GO
/****** Object:  Database [AskidaEkmek]    Script Date: 21.06.2020 19:46:53 ******/
CREATE DATABASE [AskidaEkmek]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AskidaEkmek', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AskidaEkmek.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AskidaEkmek_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AskidaEkmek_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AskidaEkmek] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AskidaEkmek].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AskidaEkmek] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AskidaEkmek] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AskidaEkmek] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AskidaEkmek] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AskidaEkmek] SET ARITHABORT OFF 
GO
ALTER DATABASE [AskidaEkmek] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AskidaEkmek] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AskidaEkmek] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AskidaEkmek] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AskidaEkmek] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AskidaEkmek] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AskidaEkmek] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AskidaEkmek] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AskidaEkmek] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AskidaEkmek] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AskidaEkmek] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AskidaEkmek] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AskidaEkmek] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AskidaEkmek] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AskidaEkmek] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AskidaEkmek] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AskidaEkmek] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AskidaEkmek] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AskidaEkmek] SET  MULTI_USER 
GO
ALTER DATABASE [AskidaEkmek] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AskidaEkmek] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AskidaEkmek] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AskidaEkmek] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AskidaEkmek] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AskidaEkmek] SET QUERY_STORE = OFF
GO
USE [AskidaEkmek]
GO
/****** Object:  Table [dbo].[hareket]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hareket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KartId] [varchar](50) NULL,
	[IslemZamani] [datetime] NULL,
	[BagisTuru] [varchar](50) NULL,
	[AdSoyad] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetLastAction]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetLastAction] as
SELECT KartId,IslemZamani,BagisTuru,AdSoyad
FROM hareket
WHERE IslemZamani= (SELECT MAX(IslemZamani) FROM hareket AS T1 WHERE T1.KartId =hareket.KartId and MONTH(IslemZamani) = MONTH(GETDATE()))
GO
/****** Object:  Table [dbo].[mazeretler]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mazeretler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KartID] [varchar](50) NULL,
	[MazeretGun] [int] NULL,
	[IslemTarihi] [datetime] NULL,
	[GelecegiTarih] [datetime] NULL,
	[EkmekAlacagiTarih] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Nufus] [int] NULL,
	[Aktif] [varchar](50) NULL,
	[Aciklama] [varchar](250) NULL,
	[KartId] [varchar](50) NULL,
	[TelNo] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
	[Adet] [int] NULL,
	[SonIslemTarihi] [datetime] NULL,
	[SonIslemTipi] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetMazeretList]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetMazeretList]
AS
SELECT        m.Id, m.KartID, u.AdSoyad, m.IslemTarihi, m.GelecegiTarih, m.MazeretGun, DATEDIFF(day, GETDATE(), m.GelecegiTarih) AS Kalan, m.EkmekAlacagiTarih
FROM            dbo.mazeretler AS m INNER JOIN
                         dbo.users AS u ON u.KartId = m.KartID
GO
/****** Object:  View [dbo].[GetMazeretliEkmekAdedi]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetMazeretliEkmekAdedi]
AS
SELECT        SUM(u.Adet) AS Adet
FROM            dbo.mazeretler AS m INNER JOIN
                         dbo.users AS u ON m.KartID = u.KartId
WHERE        (GETDATE() BETWEEN m.IslemTarihi AND m.GelecegiTarih)
GO
/****** Object:  Table [dbo].[bagisturu]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bagisturu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BagisAdi] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personals]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reports]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Date] [text] NULL,
	[File] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UKey] [varchar](50) NULL,
	[UVal] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bagisturu] ON 

INSERT [dbo].[bagisturu] ([Id], [BagisAdi]) VALUES (8, N'Un')
INSERT [dbo].[bagisturu] ([Id], [BagisAdi]) VALUES (9, N'Kurban')
SET IDENTITY_INSERT [dbo].[bagisturu] OFF
SET IDENTITY_INSERT [dbo].[personals] ON 

INSERT [dbo].[personals] ([Id], [Username], [Password]) VALUES (9, N'selcuk', N'1234')
INSERT [dbo].[personals] ([Id], [Username], [Password]) VALUES (10, N'fındıklı', N'1')
SET IDENTITY_INSERT [dbo].[personals] OFF
SET IDENTITY_INSERT [dbo].[settings] ON 

INSERT [dbo].[settings] ([Id], [UKey], [UVal]) VALUES (1, N'CCDay', N'7')
SET IDENTITY_INSERT [dbo].[settings] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (20, N'DÜRDANE ALTUNER', 5, N'Aktif', N'', N'b001166CB6A', N'5417286270', N'GAZİ MUSTAFA KEMAL CD. N:94 İÇ KAPI:7 FINDIKLI MAL', 5, CAST(N'2019-08-31T07:31:52.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (21, N'KUDRET AĞIRGÖL', 7, N'Aktif', N' ', N'b00C17ECE6A', N'999', N'İNÖNÜ CD. BÜYÜKDEREBOYU SK. NO:92 İÇ KAPI:1 ATAŞEH', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (22, N'DİLEK AKBABA', 4, N'Aktif', N' ', N'b007138CE6A', N'5363841236', N'İNÖNÜ MH. ULUSU CD. KANAT BLOK NO:22 İÇKAPI:3 ATAŞ', 4, CAST(N'2019-11-14T06:13:25.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (23, N'GÖKHAN ACAR', 5, N'Pasif', N'MEHMT ACARLA BİRLŞİ', N'A', N'5376144538', N'NÜFUS KAYIT ÖRNEĞİ DE ADRES YOK', 5, CAST(N'2019-09-19T07:15:44.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (24, N'KASIM AKGÜN', 14, N'Pasif', N'7 GÜNDE FAZA GELMEDİĞİNDEN PASİF', N'b00913BD76A', N'5354145393', N'NKÖ DE ADRES YOK
27 sıdıka akgünle birleşti', 12, CAST(N'2019-12-19T08:00:38.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (25, N'VAHİDE AKGÜN', 4, N'Aktif', N'', N'b0051C16F6A', N'5377964920', N'FINDIKLI SERİN SK. NO:65 İÇ KAPI:1 MALTEPE', 4, CAST(N'2019-08-31T07:06:47.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (26, N'MAHMUT AKGÜN', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00C162D541', N'5316320007', N'FINDIKLI MH SERİN SK. NO:65 İÇ KAPI:2 MALTEPE', 4, CAST(N'2020-01-19T11:56:08.413' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (27, N'SIDIKA AKGÜN', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'a', N'5319887702', N'FINDIKLI MAH. KAYISI SK. NO:11 İÇ KAPI: 1 MATEPE', 5, CAST(N'2019-09-12T08:03:51.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (28, N'REMZİYE AKİCİ', 9, N'Aktif', N' ', N'b00F180B262', N'5416708925', N'FINDIKLI MH. MENEŞECİ SK. MENEŞE BLOK:16 İÇ KAPI:2', 9, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (29, N'CEMAL AKKOYUN', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b009100E56A', N'5392707464', N'FINDIKLI MAH. GAZİ MUSTAFA KEMAL CD. NO.207-209', 4, CAST(N'2020-01-19T11:56:08.423' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (30, N'ÇİMEN AKSAKALLI', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00B2C52D23', N'9', N'NKÖ DE ADRES YOKTUR', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (31, N'AYTEN AKSOY', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0092488C23', N'5368452966', N'FINDIKLI MAH. EVREN CD. ŞEN YUVA APT. NO:218İÇ KAP', 5, CAST(N'2020-01-19T11:56:08.427' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (32, N'MEHMET ACAR', 8, N'Aktif', N'', N'b00A2DD4F23', N'5459371446', N'nkö de adres yok
GÖKHAN ACARLA BİRLŞTİ', 8, CAST(N'2019-09-19T07:15:02.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (33, N'CEYLAN AKGÜL', 5, N'Aktif', N'', N'b00A50A1A2C', N'5336587754', N'NKÖ DE ADRES YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (34, N'HAVA AKGÜL', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b009243B923', N'5345747737', N'NKÖ DE ADRES YOK', 4, CAST(N'2019-09-12T08:03:49.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (35, N'ŞÜKRAN ALTUN', 7, N'Aktif', N' ', N'b00B291F323', N'9', N'FINDIKLI MH. FIRAT SK. AZAKLI BLOK NO:31 İÇ KAPI:1', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (36, N'HAVVA ALTUN', 8, N'Aktif', N'', N'b00B2B73423', N'5353856990', N'NÜFUS KAYITTA ADRES YAZMIYOR.', 8, CAST(N'2019-09-12T07:20:19.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (37, N'NURHAN ALTUNÇ', 6, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0082CB3B23', N'99', N'FINDIKLI MAH. İPEK SK. KARDEŞLER APT. NO:164 İÇ KA', 6, CAST(N'2020-01-16T22:23:35.797' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (38, N'AYŞE ALTUNTERİN', 5, N'Aktif', N' ', N'b00FD6A1AC5', N'5376586190', N'FINDIKLI MAH. ATAMAN CD. NO:37 İÇ KAPI:2 MALTEPE
', 5, CAST(N'2019-10-03T07:23:26.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (39, N'AYTEN AMEDİ', 7, N'Aktif', N' ', N'b00B239AE23', N'5343609811', N'FINDIKLI MAH. EVREN CD. SARAY BLOK NO.106 İÇ KAPI:', 7, CAST(N'2019-09-07T07:04:59.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (40, N'ALAATTİN ARAZ', 6, N'Aktif', N'', N'b00923ED123', N'9', N'NKÖ DE ADRES YOK', 6, CAST(N'2019-09-21T06:55:35.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (41, N'NEJDET ARAZ', 10, N'Aktif', N'', N'b008339F026', N'5349857422', N'FINDIKLI MAH. GAZI MUSTAFA KEMAL. CAD NO 21/10 MAL', 10, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (42, N'İHSAN AÇAR', 8, N'Aktif', N' ', N'b0082F6F423', N'5330223249', N'FINDIKLI MH. SARMAŞIK SK. N:98N İÇ KAPI:1 MALTEPE', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (43, N'GÜLSÜM ALTAŞ', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00925CFC23', N'9', N'NKÖ DE ADRES YOK', 4, CAST(N'2020-01-16T22:23:35.807' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (44, N'ALEV ALTAŞ', 4, N'Aktif', N'', N'b00B2AB1F23', N'9', N'NKÖ DE ADRES YOK', 4, CAST(N'2019-09-12T07:24:25.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (45, N'HAZİME ARAZ', 10, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00B28F5623', N'5399816985', N'FINDIKLI MH. SERİN SK. N:27 İÇ KAPI.3 MALTEPE', 9, CAST(N'2020-01-19T11:56:08.460' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (46, N'NURCAN ALTUNER', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0082EB5023', N'9', N'NKÖ DE ADRES YOK', 4, CAST(N'2020-01-19T11:56:08.463' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (47, N'HÜLYA ARSLAN', 5, N'Aktif', N'', N'b008294A723', N'414635554', N'FINDIKLI MAH. SENEM SK. NO:27 İÇ KAPI:5 MALTEPE', 5, CAST(N'2019-12-12T07:55:11.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (48, N'SULTAN ALTAN', 6, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi - NKÖ YOK', N'b009247F823', N'5309336832', N'NÜFUS KAYIT ÖRNEĞİ YOK', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (49, N'SALİHA AŞIK', 5, N'Pasif', N'NKÖ YOK', N'A', N'5458269623', N'NÜFUS KAYIT ÖRNEĞİ YOK', 5, CAST(N'2019-09-14T08:43:19.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (50, N'MEHMET AYDEMİR', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0082AAE423', N'5384210914', N'NÜFUS KAYITTA ADRES YOK', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (51, N'NEVİN ANAZ', 4, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b0082DABC23', N'5376912346', N'NKÖ DE ADRES YOK', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (52, N'DİLAVER AYDIN', 6, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0082CBDD23', N'544457657', N'NKÖ DE ADRES YOK', 6, CAST(N'2020-01-16T22:23:35.820' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (53, N'EMİNE AYDIN', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00829A6223', N'5304198647', N'NKÖ DE ADRES YOK', 4, CAST(N'2020-01-19T11:56:08.470' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (54, N'EMİNE AYDOĞMUŞ', 4, N'Pasif', N'NKÖ  YOK', N'A', N'9', N'NKÖ  YOK', 4, CAST(N'2019-09-14T08:43:34.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (55, N'FİKRET AYDINOĞLU', 7, N'Aktif', N' ', N'b0083B48926', N'5378643729', N'FINDIKLI MH. SENEM SK. NO:8-10 İÇ KAPI:8 MALTEPE', 5, CAST(N'2019-10-10T07:38:09.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (56, N'ŞULE ATICI', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00932B2A26', N'5318821218', N'NÜFUS KAYIT ÖRNEĞİ YOK', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (57, N'ATA AYKUT', 2, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0082D57223', N'9', N'NKÖ DE ADRES YOK', 3, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (58, N'TÜRKAN ALTUNER', 6, N'Aktif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0082F1B623', N'53704914956', N'FINDIKLI MH. SARMAŞIK SK. NO:119-121 İÇ KAPI:7 MAL', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (59, N'RABİYE AYDIN', 3, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00739FDD26', N'9', N'NÜFUS KAYIT ÖRNEĞİ YOK', 3, CAST(N'2020-01-19T11:56:08.480' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (60, N'BİRGÜL AYMAZ', 7, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00931A3426', N'5374917955', N'FINDIKLI MH. EVREN CD. ÇINAR BLOK NO:138 İÇ KAPI:1', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (61, N'SELMAN AYAS', 4, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi - NKÖ YOK', N'A', N'5078223272', N'NKÖ YOK', 4, CAST(N'2019-09-14T08:35:27.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (62, N'ARİFE ALTUN', 7, N'Aktif', N'', N'b0083B6DC26', N'5427685821', N'NKÖ DE ARES YOK', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (63, N'İSMAİL ARAZ', 5, N'Aktif', N'', N'b0055A49422', N'5423632891', N'NKÖ de adres ok', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (64, N'HEVİ AYDIN', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00B2A80323', N'5538842121', N'NÜFUS ÖRNEĞİNDE ADRES YOK', 5, CAST(N'2020-01-16T22:23:35.837' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (65, N'DİDEM AZAKLI', 3, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi, NKÖ YOK', N'bb', N'5523200353', N'NKÖ YOK', 3, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (66, N'SONGÜL BABAYİĞİT', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0083137726', N'5558989449', N'NKÖ DE ADRES YOK', 5, CAST(N'2020-01-19T11:56:08.490' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (67, N'LİMON BAŞGÖNÜK', 5, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b0083884226', N'5382765732', N'NKÖ ADRES YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (68, N'BÜŞRA BAŞARAN', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b003189C36A', N'9', N'FINFIKLI MAH. IŞILTI SK. TELİOĞLU BLOK NO:25 İÇ KA', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (69, N'SEVİM BİŞGEN', 2, N'Aktif', N'', N'b00F1DCD86A', N'9', N'FINDIKLI M. İPEK SK. COŞKUN BLK NO:70 İÇ KAPI:9 MA', 5, CAST(N'2019-12-26T06:10:57.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (70, N'MEHMET BOĞUŞ', 6, N'Aktif', N'', N'b00A1D7AA62', N'5319525713', N'NKÖ DE ADRES YOK', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (71, N'FERHAN BÖYÜK', 5, N'Aktif', N' ', N'b0073A88126', N'5355234465', N'NKÖ DE ADRES BULUNMAMAKTADIR', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (72, N'GAZALİ BUDAK', 7, N'Aktif', N'', N'b0083F33826', N'535613247', N'FINDIKLI MH. APARTMAN SİTESİ NO:16 İÇ KAPI:2 MALTE', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (73, N'NEVZAT BARUT', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0083099326', N'9', N'İNÖNÜ MH. ÇAMAŞIRCI DERESİ NO:115 İÇKAPI:1 ATAŞEHİ', 5, CAST(N'2020-01-19T11:56:08.507' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (74, N'TÜRKAN CEVİZCİ', 8, N'Aktif', N' ', N'b008395CA26', N'5302917347', N'NKÖ DE ADRES YOK', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (75, N'TUBA ÇEVİK', 7, N'Aktif', N' ', N'b00A186DF6A', N'5357636709', N'FINDIKLI MH. HANCIOĞLU CD. İRVE BLOK NO:114 İÇ KAP', 7, CAST(N'2019-10-16T21:11:21.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (76, N'GÜLTEN ÇAKIR', 8, N'Aktif', N'', N'b00C1259C62', N'5372807699', N'FINDIKLI MH. YALÇIN SK. SAADET BLOK NO:12 İÇ KAPI:', 8, CAST(N'2019-12-26T06:46:08.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (77, N'ZARİFE ÇALIŞKAN', 4, N'Aktif', N'', N'b0071939E62', N'2165763420', N'FINDIKLI MH. SENEM SK. NO:21 İÇ KAPI:3 MALTEPE', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (78, N'CEMİLE CAMCI', 1, N'Aktif', N'', N'b00A1B5CE6A', N'9', N'NKÖ GETİREMİYOR VAKIF BİR ADET EKMEK ALMASINI KARA', 1, CAST(N'2019-09-07T07:09:24.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (79, N'HİLAL ÇAYIR', 6, N'Aktif', N' ', N'b00413AD56A', N'5342926265', N'NKÖ DE ADRES YOK', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (80, N'PERİZADE ÇELİK', 10, N'Aktif', N' ', N'b002149DB6A', N'5419526225', N'FINDIKLI MH. IŞILTI SK. NO:108 İÇ KAPI:9 MALTEPE', 9, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (81, N'HACİRE ÇELİK', 7, N'Aktif', N' ', N'b0071B1E06A', N'5369621821', N'FINFIKLI MH. ERMİŞ SK. GÖÇ APT. NO:16 İÇ KAPI:2 MA', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (82, N'KADRİYE ÇELİK', 8, N'Aktif', N' ', N'b0071659762', N'9', N'FINDIKLI MH. YALIN SOKAK KEKLİK BLOK NO:16-18 MALT', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (83, N'NAZDAR ÇELİK', 8, N'Aktif', N'', N'b00717CDB6A', N'5453779684', N'FINDIKLI MH. EVREN CD. HACI ÇİÇEK BLOK NO:159 İÇ K', 9, CAST(N'2019-09-19T07:27:54.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (84, N'ADALET ÇELİK', 8, N'Aktif', N' ', N'b0051ADA462', N'5393964114', N'FINDIKLI MH. SARMAŞIK SK. N:119-121 İÇ KAPI:10 MAL', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (85, N'EMİNE ÇINAR', 7, N'Pasif', N' 7 GÜNDEN FAZLA GELMEDİĞİNDEN PAİF', N'b00F157E76A', N'9', N'FINDIKLI MH. LİMON SK. NO:37 İÇ KAPI:9 MALTEPE/İST', 7, CAST(N'2019-12-19T08:02:02.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (86, N'MÜNA ÇINAR', 6, N'Aktif', N' ', N'b0083797726', N'5376967098', N'NKÖ DE ADRES YOK', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (87, N'NAZİME ÇİÇEK', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b004171D06A', N'9', N'FINDIKLI MAH. SARMAŞIK SK. AYÇİÇEĞİ BLK NO:11 İÇ K', 4, CAST(N'2020-01-19T11:56:08.547' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (88, N'MEHMET ÇEVİK', 8, N'Aktif', N'', N'b00C10BA962', N'536268292', N'FIRAT SK. ÜSTÜN BLOK NO:44 İÇ KAPI:4  MALTEPE - İS', 10, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (89, N'SELİME COŞKUN', 5, N'Aktif', N' ', N'b001118CD6A', N'5355416789', N'FINDIKLI MH. SENEM SK. CEVİZLİ BLK NO:30-32 Ç KAPI', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (90, N'VAHİDE DAĞYARAN', 6, N'Aktif', N' ', N'b00B133AC62', N'535414333', N'FINDIKLI MH. SERİN SK. EREN AP. NO:86 İÇ KAPI:1 MA', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (91, N'KERZİBAN DALCI', 6, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00212AB162', N'9', N'NKÖ YOK', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (92, N'MİHRİBAN BÜYÜR', 8, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00C1E39F62', N'9', N'NKÖ YOK', 8, CAST(N'2020-01-16T22:23:35.873' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (93, N'CUMALİ DEMİR', 9, N'Aktif', N'', N'b00E1C0B262', N'5363637692', N'NKÖ YOK ??', 9, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (95, N'SİYASET DEMİR', 4, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b0011CEE46A', N'5352312656', N'NKÖ DE ADRES YOK', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (96, N'DUDU DEMİRAL', 4, N'Pasif', N'ekmek almayı bıraktı', N'aa', N'5446021211', N'EKMAK ALMAY BIRAKTI', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (97, N'NEVRİYE DEMİRCİ', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'a', N'9', N'NKÖ YOK', 5, CAST(N'2019-09-12T08:03:51.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (98, N'NURCAN DEVELİ', 8, N'Aktif', N' ', N'b009170D16A', N'5397330244', N'FINDIKLI MH. SERİN SK. N:8 İÇ KAPI:7 MALTEPE', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (99, N'SALİH DEVELİ', 7, N'Aktif', N'', N'b0011DAE06A', N'9', N'NKÖ YOK', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (100, N'HÜSNA DEVELİ', 5, N'Aktif', N' 7 GÜNDEN FAZLA GELMEDİ', N'b006145C56A', N'5367161970', N'FINDIKLI MAH. ATATÜRK CD. YALIN SK. NO:33 D:2 MALT', 5, CAST(N'2019-12-28T06:46:49.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (101, N'ZARİF DEVELİ', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00D15EDB6A', N'9', N'NKÖ ADRES YOK', 5, CAST(N'2020-01-16T22:23:35.960' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (102, N'CEMİLE DOĞRU', 7, N'Aktif', N'', N'b0041D7A462', N'5394596873', N'NKÖ DE ADRES YOK', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (103, N'NEDİFE DURGUN', 8, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi - NKÖ YOK', N'b00D149C46A', N'9', N'NKÖ YOK', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (104, N'NAİLE DURMAZ', 7, N'Aktif', N' ', N'b006105A162', N'9', N'FINDIKLI MAH. GAZİ MUSTAFA KEMAL CD. FIRAT SK. NO:', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (105, N'BİRGÜL DURMAZ', 5, N'Aktif', N'', N'b0061B29B62', N'9', N'FINDIKLI MH. FIRAT SK. ÖZCAN LOK NO:79 İÇ KAPI:5 M', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (107, N'KUDBETTİN DEMİR', 11, N'Aktif', N' ', N'b0071ABAD62', N'9', N'NKÖ DE ADRES YOKTUR. siyaset demir kartıyla birleş', 11, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (108, N'CEMİLE DUMURCUK', 8, N'Aktif', N'', N'b00010BD16A', N'9', N'NKÖ DE ADRES YOKTUR. ', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (109, N'EMİN EĞEN', 6, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b00A1C9DD6A', N'5353417244', N'FINDIKLI MAH. GAZİ MUSTAFA KEMAL CD. NO:113 İÇ KAP', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (110, N'YILDIZ ERBAŞ', 4, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi - NKÖ YOK', N'a', N'9', N'NKÖ YOK', 4, CAST(N'2019-09-19T07:45:54.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (111, N'SENEM EKMEKÇİ', 4, N'Aktif', N' ', N'b008143DC6A', N'5354080841', N'FINDIKLI MAH. FIRAT SK. ARBA BLOK NO:99 İÇ KAPI:1 ', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (112, N'SERPİL ELMA', 8, N'Pasif', N'kart birleşii nedeniyle', N'a', N'9', N'NKÖ YOK', 8, CAST(N'2019-09-14T08:21:51.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (113, N'ZELİHA ELMA', 16, N'Aktif', N'', N'b00D1B6546A', N'9', N'NKÖ YOK', 16, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (114, N'HATUN ERDEM', 8, N'Aktif', N'', N'b0011126F6A', N'5353346347', N'FINDIKLI MAH. SERİN SK. N:41 İÇ KAPI:1 MALTEPE', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (115, N'HALİME ERDOĞAN', 6, N'Pasif', N'7 GÜNDEN FAZLA GLMEDİĞNDEN ', N'b0051ABDA6A', N'5413752646', N'FINDIKLI MH. HANCIOĞLU CD. AKPOLAT BLOK :121 İÇ KA', 6, CAST(N'2019-12-19T07:55:29.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (116, N'MELEK ERGÜL', 6, N'Aktif', N' ', N'b00C102716A', N'5366534355', N'FINDIKLI MAH. SENE SK. NO:16 İÇ KAPI:12 MALTEPE', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (117, N'GÜLŞEN ERDEM', 11, N'Aktif', N' ', N'b00C1C2DD6A', N'5396816709', N'NKÖ DE ADRES YOKTUR.', 11, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (118, N'NERGİZ FİDAN', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b004166D06A', N'5397126597', N'NKÖ DE ADRES YOK 4 KİŞİ OTURYOR', 5, CAST(N'2020-01-19T11:56:08.593' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (119, N'ŞEVKİ FİLİZOĞLU', 1, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b008162DF6A', N'5375544613', N'İÇERENKÖY MAH. MAGSA SK. ERMİŞLİ BLOK NO:47 İÇ KAP', 1, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (120, N'KERİM FİLİZ', 6, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00312DC96A', N'9', N'FINDIKLI MH. GÜVEN SK. NO:5 İÇ KAPI:1 MALTEPE', 6, NULL, NULL)
GO
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (121, N'ŞEVKET GENÇ', 4, N'Aktif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00E13FDF6A', N'9', N'FINDIKLI MH. SARMAŞIK SK. ELİF BLOK NO:75 İÇ KAPI:', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (122, N'GERDAN B.AYMAZ', 5, N'Aktif', N' ', N'b00B1A3D46A', N'5368833127', N'NKÖ DE ADRES YOKTUR.', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (123, N'HATİCE GÖKMEN', 7, N'Aktif', N'', N'b00018BD56A', N'9', N'HAFTADA 2-3 GELİR TOPLU ALIR. NK DE ADRES YOK', 7, CAST(N'2019-09-12T07:25:39.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (124, N'FİLİZ GÖKALP', 9, N'Pasif', N'NKÖ YOK', N'b00B1FEC26A', N'9', N'NKÖ YOK', 9, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (125, N'EMİNE GÜLÇEK', 7, N'Aktif', N' ', N'b006160DF6A', N'5464382274', N'NKÖ DE ADRES YOK.', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (126, N'AYTEN GÖKAY', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00A186DF6Az', N'5422780514', N'GÜLTEKİN GÖKAYLA BİRLEŞTİ BU KART İPTAL', 4, CAST(N'2019-10-16T21:11:51.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (127, N'GÜZEL GÜNAY', 6, N'Aktif', N' ', N'b00B1A1C66A', N'5373064527', N'NKÖ DE ADRES YOK', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (128, N'RUKİYE GÜMÜŞ', 7, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b00B1CDC76A', N'5389721370', N'FINDIKLI MH. FIRAT SK. NO:68 İÇ KAPI:7 MALTEPE', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (129, N'FEYZİ GÜNEŞ', 15, N'Aktif', N' ', N'b00F1E0C96A', N'9', N'FINDIKLI MH. SENEM SK. NO:7-9 İÇ KAPI:1 MALTEPE', 15, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (130, N'SAİLE GÜNEŞ', 13, N'Aktif', N' ', N'b0011BFA662', N'9', N'FINDIKLI MH. SENEM SK. 7-9 İÇ KAPI:1 MALTEPE', 13, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (131, N'YÜZGÜL GÜNEŞ', 5, N'Aktif', N' ', N'b00018DE16A', N'9', N'NKÖ DE ADRES YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (132, N'PEYRUZE GÜNEŞ', 3, N'Aktif', N'', N'b00A104DC6A', N'9', N'FINDIKLI MAH. ATAMAN CD. YILMAZ KARDEŞLER BLK NO:3', 2, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (133, N'GÜLTEKİN GÖKAY', 8, N'Aktif', N' ', N'b0021D2E26A', N'5422780514', N'NKÖ DE ADRES YOK ', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (134, N'GÖNÜL HOROZ', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00516FCC6A', N'5369506527', N'İNÖNÜ MH. BÜYÜKDEREBOYU SK. NO:78 İÇ KAPI:1 ATAŞEH', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (135, N'FATMA İLDEŞ', 6, N'Pasif', N'kart birleşimi nedeniyle', N'b00E198E66A', N'5386627177', N'İNÖNÜ MH. ÜZÜM SK. 4-2 ATAŞEHİR', 8, CAST(N'2019-09-14T08:22:32.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (136, N'NAİLE İNCE', 5, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b00C13D626A', N'5357222912', N'NKÖ DE ADRES YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (137, N'TÜRKİYE İLHAN', 6, N'Aktif', N' ', N'b0011F3E26A', N'5349220187', N'NKÖ DE ADRES YOK. ', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (138, N'HAVA KAÇMAK', 3, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00A19B596A', N'5386885664', N'NKÖ DE ADRES YOK
kartını kaybetti yeni kart veril', 3, CAST(N'2020-01-19T11:56:08.630' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (139, N'YÜKSEL KAÇMAZ', 6, N'Aktif', N' 7 GÜNDEN FAZLA GELMDİ', N'b0045BBC522', N'5394237789', N'FINDIKLI MH. YEŞİM SK. NO:66-68 İÇ KAPI:10 MALTEPE', 6, CAST(N'2019-12-28T06:42:07.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (140, N'HATİCE KANAL', 3, N'Aktif', N'', N'b005596FA22', N'5337004189', N'İNÖNÜ MH. ORKİDEM SK. NO:26 İÇ KAPI:2 ATAŞEHİR', 3, CAST(N'2019-09-12T07:03:44.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (141, N'DURSUNE KARA', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0045D84122', N'9', N'nkö de adres yok
26.09.2019 aktif edildi ara sıra', 6, CAST(N'2020-01-16T22:23:36.003' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (142, N'AVAZBEK KAICHKROV', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0055237022', N'9', N'YABANCI UYRK NKÖ VEREMİYOR
KART PASİF DEN AKTİE G', 5, CAST(N'2020-01-19T11:56:08.640' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (143, N'CEMİLE KARADENİZ', 5, N'Pasif', N'Köyden gelince aktif olacak', N'b005542A322', N'5327882175', N'FINDIKLI MH. FIRAT SK. APARTMAN BLOK NO:81 İÇ KAPI', 5, CAST(N'2019-11-02T06:55:56.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (144, N'MUKADDES KARADENİZ', 5, N'Aktif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00D186C86A', N'5349282029', N'NKÖ DE ADRES BULUNMAMAKTADIR', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (145, N'FATMA KAÇMAZ', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0031FFCC6A', N'5349683957', N'FINDIKLI MAH. SENEM SK. NO:27 İÇ KAPI:2 MALTEPE
2', 5, CAST(N'2020-01-16T22:23:36.010' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (146, N'FATMA KARTAL', 8, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00555B5D22', N'5315714057', N'FINDIKLI MH. SARMAŞIK SK. MEVSİM BLOK NO:149-151 N', 8, CAST(N'2020-01-19T11:56:08.647' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (147, N'FİLİZ KAÇMAZ', 7, N'Aktif', N' ', N'b00F195CF32', N'5384835645', N'FINDIKLI MAH. İPEK SK. NO:95 İÇ API:2 MALTEPE', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (148, N'MENEVŞE KAYA', 7, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00F1C4CB32', N'5333492485', N'FINDIKLI MH. YASEMİN SK. NO:5-1 D:2 BİRLİK APT. MA', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (149, N'SUNA KAYA', 6, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'w33', N'5373297504', N'NKÖ DE ADRES YOK', 8, CAST(N'2019-09-12T08:03:50.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (150, N'HATİCE KARA', 7, N'Aktif', N'nkö yok', N'b00E197DD6A', N'5348392385', N'NKÖ YOK', 7, CAST(N'2019-11-30T07:25:32.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (151, N'FAİDE KAYAALP', 4, N'Aktif', N' ', N'b00551E3022', N'5352338976', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (152, N'SALİME KAZMACI', 6, N'Aktif', N' ', N'b00553B0122', N'524167004', N'NKÖ D ADRES YOK.', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (153, N'ZİNNET KELEŞ', 7, N'Aktif', N' ', N'b0055694022', N'5353412365', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (156, N'NURAN KILIÇDERE', 6, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0045F4F022', N'5300378680', N'NKÖ DE ADRES YOK', 6, CAST(N'2020-01-19T11:56:08.667' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (157, N'MUKADDES KOÇ', 5, N'Aktif', N'7 GÜNDE FAZLA GEMEDİ', N'b00A12ADC6A', N'9', N'FINDIKLI MH.EVREN CD. NO:142-144 İÇ KAPI:10 MALTEP', 5, CAST(N'2019-12-28T06:27:08.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (158, N'MUSTAFA KOÇAK', 3, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0055B32C22', N'5386340150', N'FINDIKLI MH. FIRAT SK. AYNA BLOK NO:89 İÇ KAPI:2 M', 3, CAST(N'2020-01-19T11:56:08.673' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (159, N'SEVİN KÖSE', 6, N'Aktif', N' ', N'b0045B87422', N'5339240486', N'İNÖNÜ MH. BÜYÜKDEREBOYU SK. NO:100-1 İÇ KAPI 10 MA', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (160, N'GÜNNUR KOÇAK', 4, N'Aktif', N'', N'b0045C79422', N'9', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 4, CAST(N'2019-09-05T07:39:07.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (161, N'GÜLLÜ KÜZHAN', 5, N'Aktif', N' 7 GÜN GELMEDİĞİNDEN PASİF', N'b0005F65922', N'9', N'NKÖ DE ADRES BULUNMAMAKTADIR.
pasiftn aktife 2.12', 5, CAST(N'2019-12-26T06:18:29.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (162, N'YETER KAHRAMAN', 5, N'Aktif', N'', N'b00F1C61632', N'5367695560', N'FINDIKLI MAH. GAZİ MUSTAFA KEMAL CD. NO:96 İÇ KAPI', 5, CAST(N'2019-08-31T07:24:44.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (163, N'MEHMET MERİÇ', 5, N'Aktif', N'', N'b00555B6922', N'536316534', N'FINDIKLI MH. SARMAŞIK SK. YILDIZ BLOK N:98 İÇ KAPI', 5, CAST(N'2019-09-14T08:24:59.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (164, N'GÜLTOK NACAK', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'A', N'5364762180', N'NKÖ YOK', 4, CAST(N'2019-09-14T08:46:01.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (165, N'KİBAR NAZ', 9, N'Aktif', N'', N'b00A2E19C23', N'5364976157', N'FINDIKLI MH. SARMAŞIK SK. NO:110-121 İÇ KAPI:1 MAL', 9, CAST(N'2019-09-14T08:36:00.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (166, N'HAMDİYE OKAY', 6, N'Aktif', N' ', N'b00E154D76A', N'5354214232', N'FINDIKLI MAH. FIRAT SK. BLOK NO:81 İÇ KAPI:8 MALTE', 6, CAST(N'2019-09-26T07:19:35.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (167, N'SİNAN ORTAK', 3, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00D3C84831', N'5393108390', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 3, CAST(N'2020-01-19T11:56:08.697' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (168, N'RAHŞAN OYANIKER', 0, N'Pasif', N' brleşi', N'q', N'5368436431', N'FINDIKLI MH. EVRENCD. ŞAHİN HEKİM OĞLU BLK NO:77-9', 0, CAST(N'2019-09-07T07:05:33.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (169, N'FİLİZ ÖZDEMİR', 7, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b00D3CED231', N'5356058089', N'FINDIKLI MH. IŞILTI SK. NO:35 İÇ KP:4 MALTEPE', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (170, N'KOÇERİ ÖKEN', 7, N'Aktif', N' ', N'b0045A43722', N'5073119726', N'FINDKLI MH. HANCIOĞLU CD. NO:103 İÇ KAPI:1 MALTEPE', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (171, N'ŞENAY ÖZERİ', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00F15D4D32', N'5302866025', N'FINDIKLI MH. YEŞİM SK. NO:16 İÇKAPI:1 MALTEPE', 4, CAST(N'2020-01-16T22:23:36.043' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (172, N'ŞEMSİYE ÖTÜN', 6, N'Aktif', N' ', N'b005505C622', N'5348421425', N'NKÖ DE ADRES BULUNMAMAKTADIR', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (174, N'HANİFE ÖZCAN', 3, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0055403322', N'9', N'FINDIKLI MH. SARMAŞIK SK. GÜLTKİN İKİLAR BLOK N:11', 3, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (175, N'SATI ÖZEN', 5, N'Pasif', N'nkö yok', N'b0045E48122', N'5313949193', N'NKÖ YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (176, N'MEHTAP ÖZCAN', 3, N'Pasif', N'nkö yok', N'Q', N'5316234681', N'NKÖ YOK', 3, CAST(N'2019-08-31T01:25:16.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (177, N'HÜLYA PARLAR', 6, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b0055630522', N'5358895358', N'NKÖ DE ADRES YOK', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (178, N'SELVİ SAKARYA', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b005563AB22', N'5327927794', N'FINDIKLI MH. EVREN CD. NO:163 İÇ KAPI: MALTEPE
pa', 4, CAST(N'2020-01-19T11:56:08.707' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (179, N'AYŞE SANTOR', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00D3BD3731', N'5312581004', N'FINDIKLI MH. SENEM SK. NO:50 İÇ KAPI:2 MALTEPE', 4, CAST(N'2020-01-16T22:23:36.053' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (181, N'SELİME SANTOR', 4, N'Aktif', N'', N'b00552D6D22', N'530718143', N'FINDIKLI MH. SENEM SK. N:27 İÇ KAP:3 MALTEPE', 4, CAST(N'2019-09-12T07:47:25.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (182, N'AZİZ SEVİ', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00554FC122', N'9', N'NKÖ''de adres yok', 4, CAST(N'2020-01-16T22:23:36.057' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (183, N'PERİ SÖNMEZ', 5, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi-nkö yok', N'AAAS', N'5425416034', N'NKÖ YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (184, N'YAŞAR SÖZCÜ', 4, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi-nkö yok', N'11', N'9', N'NKÖ YOK', 4, CAST(N'2019-11-02T06:53:36.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (185, N'EMİNE SÜSLÜ', 9, N'Aktif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b002A1F3F7F', N'5418487367', N'nkö de adres yok', 9, CAST(N'2019-10-16T21:09:01.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (186, N'ERGÜL SÜSLÜ', 6, N'Aktif', N'', N'b00616CE36A', N'5349139165', N'FINDIKLI MH. SERİN SK. NO:21 İÇ KAPI:7 MALTEPE', 6, CAST(N'2019-08-31T07:21:39.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (187, N'HÜLYA SUBAŞI', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00F1DF646A', N'5538863472', N'NKÖ ADRES YOK', 4, CAST(N'2020-01-16T22:23:36.063' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (188, N'YASEMİN ŞAKAR', 5, N'Aktif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b0045B69A22', N'5370592376', N'FINDIKLI MAH. SIŞILTI SK. NO:33 İÇ KAPI:7 MALTEPE', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (189, N'AYSEL ŞENGÜL', 3, N'Aktif', N' ', N'b005165C46A', N'9', N'FINDIKLI MAH. SENEM SK. N:7-9 İÇ KAPI:21 MALTEPE', 3, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (190, N'HAİBE TUNCER', 5, N'Aktif', N' ', N'b0051F8DB6A', N'5367611573', N'FINDIKLI MH. EVREN CD. N:140 İÇ KAPI:9 MALTEPE', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (191, N'HEDİYE TALAY', 8, N'Aktif', N' ', N'b00117BC66A', N'5426362496', N'FINDIKLI MAH. SARAY BLOK N:106 İ KAPI:9 MALTEPE', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (192, N'SANİYE TAŞDEMİR', 7, N'Aktif', N' ', N'b00C1B3CA6A', N'5356846709', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (193, N'SEDEF TAŞTAN', 3, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'a', N'5433582431', N'İNÖNÜ MH. ULUBATLI HASAN SK. CAMLUK BLK NO:18 İÇ K', 3, CAST(N'2019-09-26T07:19:10.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (194, N'GÜLÜZAR TEMEL', 4, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b006196E36A', N'9', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 4, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (195, N'MEHMET TORUN', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b002124D66A', N'9', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (196, N'FERRAHDİBA TOSUN', 8, N'Pasif', N'NKÖ YOK', N'b0051A0716A', N'9', N'NKÖ YOK', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (197, N'TANSEL UĞUR', 8, N'Aktif', N'', N'b005136D56A', N'5375754355', N'FINDIKLI MH. SENE SK. NO:27 İÇ KAPI:4 MALTEPE', 8, CAST(N'2019-12-05T06:22:43.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (198, N'SEVGİ UKAN', 7, N'Aktif', N'', N'b006102D76A', N'5322468993', N'NKÖ DE ADRES YOK- İKİ AİLE KALIYOR', 7, CAST(N'2019-08-31T07:45:14.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (199, N'FENZİLE URAL', 5, N'Pasif', N'NKÖ YOK', N'b00C1C99962', N'5531304041', N'NKÖ YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (200, N'FADİME USTA', 5, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi - nkö yok', N'b', N'5398392242', N'NKÖ YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (201, N'YAHYA UYGUR', 7, N'Aktif', N'', N'b00B1CB6B6A', N'5372518763', N'NKÖ DE ADRES YOK', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (202, N'FATO UYGUR', 12, N'Aktif', N' ', N'b0051FADF6A', N'5312506706', N'FINDIKLI MH. EVREN CD. KIZIL BAKIR BLOK N:161 İÇ K', 12, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (203, N'GÜLBEYAZ UÇUR', 5, N'Aktif', N'', N'b00D1359662', N'5374146614', N'NKÖ DE ADRES YK. ', 5, CAST(N'2019-08-31T07:14:27.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (204, N'MELEK UKAN', 5, N'Aktif', N' ', N'b00311AC76A', N'5331281818', N'FINDIKLI MH. SERİN SK. N:40 İÇ KAPI:9 MALTEPE', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (205, N'PINAR UĞUR', 3, N'Pasif', N'kart tansl uğurla birleşti', N'q', N'5313077803', N'FINDIKLI MH. SENEM SK. N:27 İÇ KAPI:5 MALTEPE', 3, CAST(N'2019-12-05T06:23:09.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (206, N'ERGÜL VURGUN', 8, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b001144C96A', N'9', N'FINDIKLI MH. ÇİĞDEMCİ SK. N:6 İÇ KAPI:15 MALTEPE', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (207, N'ZİYAEDDİN YILDIZ', 7, N'Pasif', N'Bu kart 30 gün hareket görmediği için kapatılmıştır.', N'b0091769862', N'5417173020', N'NKÖ DE ADRES YOK', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (208, N'VESİM YILDIRIM', 6, N'Aktif', N'7 GÜNDEN FAZLA GELEDİĞİNDEN', N'b005166D56A', N'5549793390', N'fındıklı mh. İPEK SK. ELİF BLOK NO:116 İÇ KAPI:2 M', 6, CAST(N'2019-12-28T06:40:26.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (209, N'FAYSAL YAŞAR', 7, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi- NKÖ YOK', N'b007161E46A', N'5366731431', N'NKÖ YOK', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (210, N'MİHRİBAN YILDIRIM', 12, N'Aktif', N' ', N'b008171716A', N'9', N'İNÖNÜ MH. DENİZATI SK. 2-1 İÇ KAPI:1 ATAŞEHİR', 12, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (211, N'AYŞE YILDIRIM', 10, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00117D6D6A', N'5376054487', N'FNDIKLI MH. HANCIOĞLU CD. NO:28 İÇ KAPI:11 MALTPE', 10, CAST(N'2020-01-16T22:23:36.087' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (212, N'SEYRO YILDIRIM', 10, N'Aktif', N' ', N'b00F156CC6A', N'5308846847', N'FINDIKLI MH. IŞILTI SK. BAHAR BLK NO:31 İÇ KAPI:2 ', 10, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (213, N'ZÜHRE YILMAZ', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00C192C36A', N'9', N'FINDIKLI MH. İPEK SK. APARTMAN SİTESİ N:141-143 MA', 4, CAST(N'2020-01-16T22:23:36.090' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (214, N'GÜLNAZ YORGUN', 6, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00713BCD6A', N'5432850869', N'FINDIKLI MH. ERDEM SK. NO:58 İÇ KAPI:6 MALTEPE', 6, CAST(N'2020-01-16T22:23:36.097' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (215, N'MAKBULE YİĞİT', 11, N'Aktif', N' ', N'b00FDC62DC5', N'5449281610', N'İNÖNÜ MH. BÜYÜKDEREBOYU CD. ÜLKER APT. N:55 ATAŞEH', 11, CAST(N'2019-11-16T06:16:48.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (216, N'FATMA YÜCE', 6, N'Aktif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0001EB726A', N'5368510636', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 6, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (217, N'RUKİYE YÜCE', 4, N'Pasif', N'Bu Kart 7 Günden Fazla gelmedi- NKÖ YOK', N'a', N'5384927366', N'NKÖ YOK', 4, CAST(N'2019-09-14T08:26:50.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (218, N'KİBAR ZAN', 12, N'Aktif', N' ', N'b00E168D46A', N'9', N'FINDIKLI MH. İPEK SK. APARTMAN SİTESİ NO:88 İÇ KAP', 12, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (219, N'CİHAN ZAN', 5, N'Pasif', N'KİBAR ZANLA BİRLEŞTİ', N'aaa', N'9', N'NKÖ YOK', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (220, N'NİHAT ALBAYRAK', 7, N'Aktif', N' ', N'b00018BE16A', N'5388267775', N'FINDIKLI MH. YALÇIN SK. SAADET BLOK NO:12 İÇ KAPI:', 7, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (221, N'FATMA B.AYMAZ', 8, N'Aktif', N' ', N'b0081FED16A', N'5372825547', N'NKÖ DE ADRES BULUNMAMAKTADIR.', 8, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (222, N'HAVVA GENÇ', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'a', N'9', N'NKÖ YOK', 5, CAST(N'2019-09-12T08:03:51.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (223, N'FİDAN TİLKİ', 5, N'Aktif', N'', N'b002188A662', N'9', N'NKÖ ADRES YOK', 5, CAST(N'2019-09-14T08:32:56.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (224, N'ŞENEL MERSİN', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b000122E76A', N'5425748669', N'FINDIKLI MH. IŞILTI SK. ÇALIŞKAN BLOK NO:68 İÇ KAP', 4, CAST(N'2020-01-16T22:23:36.107' AS DateTime), N'Kart Kapatıldı')
GO
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (225, N'DERYA TAŞDEMİR', 6, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b006111E46A', N'5349281142', N'FINDIKLI MH. SENEM SK.NO:7-9 İÇ KAPI:1 MALTEPE
10', 6, CAST(N'2020-01-16T22:23:36.110' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (226, N'ZEYNEP ÇERİKAN', 5, N'Aktif', N'', N'b009184C36A', N'5438044393', N'FINDIKLI MH. HANCIOĞLU CD. BİRİK BLOK NO:50 İÇ KAP', 5, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (227, N'ESAT DURMAZ', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0091B7E46A', N'9', N'FINDIKLI MH. FIRAT SK. NO:79/5 MALTEPE', 5, CAST(N'2019-09-12T08:03:52.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (228, N'ASYE ADANIR', 9, N'Aktif', N'', N'b00837C4726', N'5445108518', N'NKÖ DE ADR YOKTUR.
ALİ ADANIR VE ASYE ADANIR BİRL', 9, CAST(N'2019-10-03T07:11:35.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (229, N'MERYEM YILDIRIM', 3, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0045A7B722', N'9', N'NKÖ DE ADRES YOK
PASİF GLMEDİĞİNDEN AKTİF OLDU 19', 3, CAST(N'2020-01-16T22:23:36.117' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (230, N'PERİZADE ÇİTO', 6, N'Aktif', N'', N'b00737E2E26', N'5342892636', N'FINDILI MH. SARMŞIK SK. NO:92 İÇ KAPI:4 MALTEPE İS', 5, CAST(N'2019-08-31T07:30:27.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (231, N'SALİÇ YALMAN', 2, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0045BA8322', N'5384364975', N'FINDIKLI MH. GAZİ MUSTAFA KEMAL CD. NO:1-7 İÇ KAPI', 2, NULL, NULL)
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (234, N'ÖZLEM ÖZTÜRK', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b003158646A', N'5393659056', N'FUNDIKLI', 4, CAST(N'2020-01-19T11:56:08.777' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (235, N'SEVİL KILIÇ', 4, N'Aktif', N'', N'b00116D6F6A', N'5398354674', N'FINDIKLI', 4, CAST(N'2019-09-19T07:32:02.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (236, N'İPEK DEMİR', 3, N'Pasif', N'7 GÜNDEN FAZLA GELMEDİ', N'b0045B6B622', N'5415462815', N'NKÖ DE ADRES YOK', 3, CAST(N'2019-12-26T06:55:51.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (237, N'MURAT YAPALIAL', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b004199E46A', N'5534372770', N'NÖ DE ADRES YO', 5, CAST(N'2019-09-12T08:03:53.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (238, N'NECLA CEBE KAHRIMAN', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0055963022', N'5352676026', N'FIDIKLI MAH. SEEM SK. NO:23 MALTEPE', 5, CAST(N'2019-09-12T08:03:53.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (239, N'Eyüp Öztaş', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00F1700D32', N'0553091999', N'NKÖ''DE ADRES YOK', 3, CAST(N'2019-09-12T08:03:53.000' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (240, N'GÜLÇİÇEK GÜL', 5, N'Aktif', N'', N'b00C199D36A', N'5344178868', N'NKÖ DE ADR YOK', 5, CAST(N'2019-09-19T06:56:48.000' AS DateTime), N'Kayıt Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (241, N'ZIYAADDİN YILDİZ', 7, N'Aktif', N'', N'b006DD439C5', N'5417173020', N'FINDIKLI MAHALLEİ GÖKSOY SOKAK NO6 DAİE 7', 7, CAST(N'2019-09-28T07:38:13.000' AS DateTime), N'Kayıt Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (242, N'Yaşar Sözcü', 3, N'Aktif', N'', N'b00C112636A', N'05435463377', N'NKÖ''de adres yok.', 3, CAST(N'2019-10-02T20:37:50.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (243, N'Gülten Sönmez', 5, N'Aktif', N'', N'b00F18BD06A', N'05383820585', N'NKÖ''de adres yok.', 5, CAST(N'2019-11-02T06:54:06.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (244, N'Şengül Demir', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00119C546A', N'05350188746', N'NKÖ''de adres yok. ', 4, CAST(N'2020-01-19T11:56:08.800' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (245, N'Gülbeyaz Şahin', 8, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00F1E7746A', N'05344115349', N'NKÖ''de adres yok.', 7, CAST(N'2020-01-16T22:23:36.140' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (246, N'Esmer Ulusoy', 5, N'Aktif', N'', N'b008178556A', N'05380705551', N'NKÖ''de adres yok.', 5, CAST(N'2019-09-30T20:27:25.000' AS DateTime), N'Kayıt Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (247, N'A', 6, N'Pasif', N'A', N'A', N'89', N'FF', 6, CAST(N'2019-10-03T07:10:24.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (248, N'Gülsüm Demir', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00DDFB21C5', N'89', N'NKÖ ve telefon bilgisi yok. Bekleniyor 1 ay içeris', 5, CAST(N'2020-01-16T22:23:36.147' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (249, N'ATİLLA UĞUR', 7, N'Aktif', N'', N'b006D632DC5', N'5324516902', N'NKÖ DE ADRE YOK', 7, CAST(N'2019-11-21T06:24:43.000' AS DateTime), N'Kayıt Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (250, N'ŞENGÜL DEMİR', 4, N'Pasif', N'7 GÜN GELMEDİĞİNDEN PSİF', N'b002D6C1BC5', N'5350188746', N'NÖ DE ADRES YOK', 4, CAST(N'2019-12-19T07:15:12.000' AS DateTime), N'Aktif Edildi')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (251, N'SEVDA NAZ', 4, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b006DE62FC5', N'5424192604', N'FFINDIKLI MH. SERİN SK NO:113 İÇ KPI:6 MALTEPE', 4, CAST(N'2020-01-16T22:23:36.153' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (252, N'ESMER ULUBAY', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b0041A2616A', N'5380705551', N'NKÖ DE ADRES YOK', 5, CAST(N'2020-01-16T22:23:36.157' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (253, N'NEVRİYE DEMİRCİ', 3, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b007162706A', N'1', N'NKÖ DE ADRES YOK', 4, CAST(N'2020-01-16T22:23:36.160' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (254, N'HALİS AYDIN', 5, N'Pasif', N'Bu kart 7 gün hareket görmediği için kapatılmıştır.', N'b00113E626A', N'0', N'FINDIKLI MH. SERİN K. ÇINAR APT. NO:40-3', 5, CAST(N'2020-01-16T22:23:36.167' AS DateTime), N'Kart Kapatıldı')
INSERT [dbo].[users] ([Id], [AdSoyad], [Nufus], [Aktif], [Aciklama], [KartId], [TelNo], [Adres], [Adet], [SonIslemTarihi], [SonIslemTipi]) VALUES (255, N'İPEK İLKAN', 4, N'Aktif', N'', N'b0021776E6A', N'05342412887', N'A', 4, CAST(N'2020-01-02T06:38:00.000' AS DateTime), N'Kayıt Edildi')
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Index [bagisturu_PRIMARY]    Script Date: 21.06.2020 19:46:53 ******/
ALTER TABLE [dbo].[bagisturu] ADD  CONSTRAINT [bagisturu_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [hareket_PRIMARY]    Script Date: 21.06.2020 19:46:53 ******/
ALTER TABLE [dbo].[hareket] ADD  CONSTRAINT [hareket_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [mazeretler_PRIMARY]    Script Date: 21.06.2020 19:46:53 ******/
ALTER TABLE [dbo].[mazeretler] ADD  CONSTRAINT [mazeretler_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [personals_PRIMARY]    Script Date: 21.06.2020 19:46:53 ******/
ALTER TABLE [dbo].[personals] ADD  CONSTRAINT [personals_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [reports_PRIMARY]    Script Date: 21.06.2020 19:46:53 ******/
ALTER TABLE [dbo].[reports] ADD  CONSTRAINT [reports_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [settings_PRIMARY]    Script Date: 21.06.2020 19:46:53 ******/
ALTER TABLE [dbo].[settings] ADD  CONSTRAINT [settings_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_PRIMARY]    Script Date: 21.06.2020 19:46:53 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [users_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hareket] ADD  CONSTRAINT [DF__hareket__IslemZa__4222D4EF]  DEFAULT ('00-00-00 00:00:00') FOR [IslemZamani]
GO
ALTER TABLE [dbo].[hareket] ADD  CONSTRAINT [DF__hareket__BagisTu__4316F928]  DEFAULT ('') FOR [BagisTuru]
GO
ALTER TABLE [dbo].[mazeretler] ADD  CONSTRAINT [DF__mazeretle__Mazer__45F365D3]  DEFAULT ((0)) FOR [MazeretGun]
GO
ALTER TABLE [dbo].[mazeretler] ADD  CONSTRAINT [DF__mazeretle__Islem__46E78A0C]  DEFAULT ('00-00-00 00:00:00') FOR [IslemTarihi]
GO
ALTER TABLE [dbo].[mazeretler] ADD  CONSTRAINT [DF__mazeretle__Gelec__47DBAE45]  DEFAULT ('00-00-00 00:00:00') FOR [GelecegiTarih]
GO
ALTER TABLE [dbo].[mazeretler] ADD  CONSTRAINT [DF__mazeretle__Ekmek__48CFD27E]  DEFAULT ('00-00-00 00:00:00') FOR [EkmekAlacagiTarih]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__SonIslemT__3F466844]  DEFAULT ('00-00-00 00:00:00') FOR [SonIslemTarihi]
GO
/****** Object:  StoredProcedure [dbo].[bagis_listesi]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bagis_listesi] @yil SMALLINT ,@ay SMALLINT,@kartid varchar(100)
AS
DECLARE @AyGun SMALLINT,@i SMALLINT,@gun DATETIME
DECLARE @tarih DATETIME
DECLARE @Mystr VARCHAR(1000)
BEGIN
	
		SELECT @tarih= STR(@yil)+'-'+STR(@ay)+'-01 00:00:00.000',@i=1
		SELECT @AyGun=DAY(EOMONTH(@tarih)) --Ayın kaç gun çektigi bulunuyor

		print 'KartId ler ' + @kartid

		SELECT Id,AdSoyad,KartId INTO #Result FROM Users
		where ((@kartid = 'null' and 1 = 1) or (KartId in (select TRIM(value) from string_split(@kartid,','))))

		SELECT * INTO #Hareketler FROM hareket WHERE YEAR(IslemZamani)=@yil AND MONTH(IslemZamani)=@ay
		SELECT a.* INTO #Mazeretli FROM mazeretler a ,Users  b WHERE a.KartID=b.KartId

		WHILE @i<=@AyGun
		BEGIN			
			SELECT @Mystr='ALTER TABLE #Result	ADD ['+CONVERT(VARCHAR(2),@i)+'] VARCHAR(1)'
			EXEC(@Mystr)		
			

			--Geldigi gunler guncelleniyor
			SELECT @Mystr=' UPDATE a SET ['+CONVERT(VARCHAR(2),@i)+']=''X''  FROM #Result a ,#Hareketler b WHERE a.KartId=b.KartId	AND DAY(IslemZamani)='''+CONVERT(VARCHAR(2),@i)+''' '
			EXEC(@Mystr)


			--Mazaretli oldugu gunler guncelleniyor
			SELECT @gun=CONVERT(VARCHAR(4),@yil)+'-'+CONVERT(VARCHAR(2),@ay)+'-'+CONVERT(VARCHAR(2),@i)+' 00:00:00.000'
			SELECT @Mystr=' UPDATE a SET ['+CONVERT(VARCHAR(2),@i)+']=''M''  FROM #Result a ,#Mazeretli b WHERE a.KartId=b.KartId	
					AND  '''+CONVERT(VARCHAR(30),@gun)+''' between DATEADD(day,-1,IslemTarihi) AND GelecegiTarih '  
			EXEC(@Mystr)

			SELECT @i=@i+1
		END
 
	 
		SELECT * FROM  #Result   ORDER BY AdSoyad ASC

END
GO
/****** Object:  StoredProcedure [dbo].[other_bagis_listesi]    Script Date: 21.06.2020 19:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[other_bagis_listesi] @yil SMALLINT ,@ay SMALLINT,@BagisTuru varchar(50)
AS
DECLARE @AyGun SMALLINT,@i SMALLINT,@gun DATETIME
DECLARE @tarih DATETIME
DECLARE @Mystr VARCHAR(1000)
BEGIN
	
		SELECT @tarih= STR(@yil)+'-'+STR(@ay)+'-01 00:00:00.000',@i=1
		SELECT @AyGun=DAY(EOMONTH(@tarih)) --Ayın kaç gun çektigi bulunuyor

		SELECT Id,AdSoyad,KartId INTO #Result FROM Users

		SELECT * INTO #Hareketler FROM hareket WHERE YEAR(IslemZamani)=@yil AND MONTH(IslemZamani)=@ay
		SELECT a.* INTO #Mazeretli FROM mazeretler a ,Users  b WHERE a.KartID=b.KartId

		ALTER TABLE #Result	ADD [BagisTuru] varchar(50)

		exec('UPDATE #Result Set BagisTuru = '''+@BagisTuru+'''')

		WHILE @i<=@AyGun
		BEGIN			
			SELECT @Mystr='ALTER TABLE #Result	ADD ['+CONVERT(VARCHAR(2),@i)+'] VARCHAR(1)'
			EXEC(@Mystr)		
			

			--Geldigi gunler guncelleniyor
			SELECT @Mystr=' UPDATE a SET ['+CONVERT(VARCHAR(2),@i)+']=''X''  FROM #Result a ,#Hareketler b WHERE a.KartId=b.KartId	AND DAY(IslemZamani)='''+CONVERT(VARCHAR(2),@i)+''' '
			EXEC(@Mystr)


			--Mazaretli oldugu gunler guncelleniyor
			SELECT @gun=CONVERT(VARCHAR(4),@yil)+'-'+CONVERT(VARCHAR(2),@ay)+'-'+CONVERT(VARCHAR(2),@i)+' 00:00:00.000'
			SELECT @Mystr=' UPDATE a SET ['+CONVERT(VARCHAR(2),@i)+']=''M''  FROM #Result a ,#Mazeretli b WHERE a.KartId=b.KartId	
					AND  '''+CONVERT(VARCHAR(30),@gun)+''' between DATEADD(day,-1,IslemTarihi) AND GelecegiTarih '  
			EXEC(@Mystr)

			SELECT @i=@i+1
		END
 
	 
		SELECT * FROM  #Result   ORDER BY AdSoyad ASC

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 136
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetMazeretliEkmekAdedi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetMazeretliEkmekAdedi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 252
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 271
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetMazeretList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetMazeretList'
GO
USE [master]
GO
ALTER DATABASE [AskidaEkmek] SET  READ_WRITE 
GO
