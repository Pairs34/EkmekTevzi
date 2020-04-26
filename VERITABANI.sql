/****** Object:  Database [AskidaEkmek]    Script Date: 19.04.2020 18:50:19 ******/
CREATE DATABASE [AskidaEkmek]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AskidaEkmek', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AskidaEkmek.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AskidaEkmek_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AskidaEkmek_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'AskidaEkmek', N'ON'
GO
ALTER DATABASE [AskidaEkmek] SET QUERY_STORE = OFF
GO
/****** Object:  Table [dbo].[hareket]    Script Date: 19.04.2020 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hareket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KartId] [varchar](50) NULL,
	[IslemZamani] [datetime] NULL,
	[BagisTuru] [varchar](50) NULL,
	[AdSoyad] [varchar](50) NULL,
 CONSTRAINT [hareket_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetLastAction]    Script Date: 19.04.2020 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetLastAction] as
SELECT KartId,IslemZamani,BagisTuru,AdSoyad
FROM hareket
WHERE IslemZamani= (SELECT MAX(IslemZamani) FROM hareket AS T1 WHERE T1.KartId =hareket.KartId and MONTH(IslemZamani) = MONTH(GETDATE()))
GO
/****** Object:  Table [dbo].[mazeretler]    Script Date: 19.04.2020 18:50:19 ******/
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
	[EkmekAlacagiTarih] [datetime] NULL,
 CONSTRAINT [mazeretler_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 19.04.2020 18:50:19 ******/
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
	[SonIslemTipi] [varchar](50) NULL,
 CONSTRAINT [users_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetMazeretList]    Script Date: 19.04.2020 18:50:19 ******/
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
/****** Object:  View [dbo].[GetMazeretliEkmekAdedi]    Script Date: 19.04.2020 18:50:19 ******/
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
/****** Object:  Table [dbo].[bagisturu]    Script Date: 19.04.2020 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bagisturu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BagisAdi] [varchar](50) NULL,
 CONSTRAINT [bagisturu_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personals]    Script Date: 19.04.2020 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [personals_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reports]    Script Date: 19.04.2020 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Date] [text] NULL,
	[File] [varchar](50) NULL,
 CONSTRAINT [reports_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 19.04.2020 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UKey] [varchar](50) NULL,
	[UVal] [varchar](50) NULL,
 CONSTRAINT [settings_PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[bagis_listesi]    Script Date: 19.04.2020 18:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bagis_listesi] @yil SMALLINT ,@ay SMALLINT,@kartid varchar(100),@bagisturu varchar(50)
AS
DECLARE @AyGun SMALLINT,@i SMALLINT,@gun DATETIME
DECLARE @tarih DATETIME
DECLARE @Mystr VARCHAR(1000)
DECLARE @BagisTipi varchar(50)
BEGIN
	
		SELECT @tarih= STR(@yil)+'-'+STR(@ay)+'-01 00:00:00.000',@i=1
		SELECT @AyGun=DAY(EOMONTH(@tarih)) --Ayın kaç gun çektigi bulunuyor

		SELECT Id,AdSoyad,KartId INTO #Result FROM Users
		where ((@kartid = 'null' and 1 = 1) or (KartId in (select TRIM(value) from string_split(@kartid,','))))

		SELECT * INTO #Hareketler FROM hareket WHERE YEAR(IslemZamani)=@yil AND MONTH(IslemZamani)=@ay and KartId = @kartid
		SELECT a.* INTO #Mazeretli FROM mazeretler a ,Users  b WHERE a.KartID=b.KartId

		ALTER TABLE #Result	ADD [BagisTuru] varchar(50)

		SET @BagisTipi = IIF(@bagisturu = '','Çoklu Bağış',@bagisturu);

		exec('UPDATE #Result Set BagisTuru = '''+ @BagisTipi +'''')

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
/****** Object:  StoredProcedure [dbo].[other_bagis_listesi]    Script Date: 19.04.2020 18:50:19 ******/
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

		SELECT * INTO #Hareketler FROM hareket WHERE YEAR(IslemZamani)=@yil AND MONTH(IslemZamani)=@ay and BagisTuru = @BagisTuru
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
ALTER DATABASE [AskidaEkmek] SET  READ_WRITE 
GO
