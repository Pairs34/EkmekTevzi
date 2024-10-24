use [master]
GO
CREATE DATABASE [AskidaEkmek]
GO
use [AskidaEkmek]
GO
ALTER DATABASE [AskidaEkmek] SET COMPATIBILITY_LEVEL = 150
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
SET IDENTITY_INSERT [dbo].[settings] ON 
GO
INSERT [dbo].[settings] ([Id],[UKey], [UVal]) VALUES (1,N'CCDay', N'30')
GO
SET IDENTITY_INSERT [dbo].[settings] OFF
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

		SELECT Id,AdSoyad,KartId,Adet INTO #Result FROM Users

		SELECT * INTO #Hareketler FROM hareket WHERE YEAR(IslemZamani)=@yil AND MONTH(IslemZamani)=@ay and BagisTuru = @BagisTuru
		SELECT a.* INTO #Mazeretli FROM mazeretler a ,Users  b WHERE a.KartID=b.KartId

		ALTER TABLE #Result	ADD [BagisTuru] varchar(50)

		exec('UPDATE #Result Set BagisTuru = '''+@BagisTuru+'''')

		WHILE @i<=@AyGun
		BEGIN			
			SELECT @Mystr='ALTER TABLE #Result ADD ['+CONVERT(VARCHAR(2),@i)+'] VARCHAR(2)'			
			EXEC(@Mystr)

			SELECT @Mystr='UPDATE #Result SET ['+CONVERT(VARCHAR(2),@i)+'] = 0'	
			EXEC(@Mystr)
			

			SELECT @Mystr=' UPDATE a SET ['+CONVERT(VARCHAR(2),@i)+']=a.Adet  FROM #Result a ,#Hareketler b WHERE a.KartId=b.KartId	AND DAY(IslemZamani)='''+CONVERT(VARCHAR(2),@i)+''' '
			EXEC(@Mystr)


			SELECT @gun=CONVERT(VARCHAR(4),@yil)+'-'+CONVERT(VARCHAR(2),@ay)+'-'+CONVERT(VARCHAR(2),@i)+' 00:00:00.000'
			SELECT @Mystr=' UPDATE a SET ['+CONVERT(VARCHAR(2),@i)+']=''M''  FROM #Result a ,#Mazeretli b WHERE a.KartId=b.KartId	
					AND  '''+CONVERT(VARCHAR(30),@gun)+''' between DATEADD(day,-1,IslemTarihi) AND GelecegiTarih '  
			EXEC(@Mystr)

			SELECT @i=@i+1
		END
 
	 
		SELECT * FROM  #Result   ORDER BY AdSoyad ASC

END
GO
ALTER DATABASE [AskidaEkmek] SET  READ_WRITE 
GO
