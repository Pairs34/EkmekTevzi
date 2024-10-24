object frmDb: TfrmDb
  Height = 415
  Width = 592
  object dbHelper: TUniConnection
    ProviderName = 'SQL Server'
    Port = 1433
    Database = 'AskidaEkmek'
    Username = 'sa'
    Server = '.'
    Connected = True
    LoginPrompt = False
    BeforeConnect = dbHelperBeforeConnect
    Left = 24
    Top = 16
    EncryptedPassword = 'A6FF93FF9BFF8DFF92FFDEFFCCFFCBFF'
  end
  object myQuery: TUniQuery
    Connection = dbHelper
    Left = 24
    Top = 88
  end
  object tblUser: TUniDataSource
    DataSet = qUserList
    Left = 360
    Top = 32
  end
  object qUserList: TUniQuery
    Connection = dbHelper
    SQL.Strings = (
      'select * from users')
    Left = 360
    Top = 88
  end
  object qKartKapat: TUniQuery
    Connection = dbHelper
    SQL.Strings = (
      
        'update users SET Aktif = '#39'Pasif'#39' , Aciklama = '#39'Bu kart '#39' || (sel' +
        'ect UVal from settings where UKey = '#39'CCDay'#39') || '#39' g'#252'n hareket g'#246 +
        'rmedi'#287'i i'#231'in kapat'#305'lm'#305#351't'#305'r.'#39' where KartId in (select KartId from' +
        ' KapatilacakKartlar);')
    Options.AutoPrepare = True
    Left = 520
    Top = 216
  end
  object qMazeretSil: TUniQuery
    Connection = dbHelper
    SQL.Strings = (
      
        'DECLARE @ToleransGun INT = (select UVal from settings where UKey' +
        ' = '#39'CCDay'#39');'
      'delete from mazeretler '
      
        'where ((DATEDIFF(day,GETDATE(),GelecegiTarih)) + @ToleransGun) <' +
        ' 0;')
    Left = 440
    Top = 216
  end
  object tblMazeretList: TUniDataSource
    DataSet = qMazeretList
    Left = 432
    Top = 32
  end
  object qMazeretList: TUniQuery
    Connection = dbHelper
    SQL.Strings = (
      'select * from GetMazeretList')
    Left = 432
    Top = 88
  end
  object AylikHareket: TUniQuery
    Connection = dbHelper
    SQL.Strings = (
      'select KartId,'
      
        '       (select AdSoyad from users where hareket.KartId = users.K' +
        'artId) as "Ad Soyad",'
      '       IslemZamani,'
      '       BagisTuru,'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'01'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "OCAK",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'02'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "'#350'UBAT",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'03'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "MART",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'04'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "N'#304'SAN",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'05'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "MAYIS",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'06'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "HAZ'#304'RAN",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'07'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "TEMMUZ",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'08'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "A'#286'USTOS",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'09'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "EYL'#220'L",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'10'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "EK'#304'M",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'11'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "KASIM",'
      '       SUM('
      '           case'
      '             when strftime('#39'%m'#39', IslemZamani) = '#39'12'#39' then'
      
        '               CAST((select users.Adet from users where users.Ka' +
        'rtId = hareket.KartId) as INTEGER) end'
      '         ) as "ARALIK"'
      'from hareket'
      'where strftime('#39'%Y'#39', IslemZamani) = :Yil'
      'group by KartId')
    Left = 32
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Yil'
        Value = nil
      end>
  end
  object tblAylikHareket: TUniDataSource
    DataSet = qUserList
    Left = 32
    Top = 168
  end
  object monthlyCount: TUniQuery
    Connection = dbHelper
    SQL.Strings = (
      'select SUM(Adet) as '#39'Adet'#39
      'from hareket h join users u on h.KartId = u.KartId'
      'where YEAR(IslemZamani) = :Yil and MONTH(IslemZamani) = :Ay')
    Left = 496
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Yil'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'Ay'
        Value = nil
      end>
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 136
    Top = 24
  end
  object GetAylikRapor: TUniStoredProc
    StoredProcName = 'bagis_listesi;1'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL bagis_listesi;1 (:yil, :ay, :kartid, :Bagi' +
        'sTuru)}')
    SQLRefresh.Strings = (
      '{:RETURN_VALUE = CALL bagis_listesi;1 (:yil, :ay, :kartid)}')
    Connection = dbHelper
    Left = 144
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'yil'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'ay'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'kartid'
        ParamType = ptInput
        Size = 100
        Value = nil
      end
      item
        DataType = ftString
        Name = 'BagisTuru'
        ParamType = ptInput
        Size = 50
        Value = nil
      end>
    CommandStoredProcName = 'bagis_listesi;1'
  end
  object tblAylikRapor: TUniDataSource
    DataSet = GetAylikRapor
    Left = 144
    Top = 184
  end
  object GetBagisList: TUniStoredProc
    StoredProcName = 'other_bagis_listesi;1'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL other_bagis_listesi;1 (:yil, :ay, :BagisTu' +
        'ru)}')
    SQLRefresh.Strings = (
      
        '{:RETURN_VALUE = CALL other_bagis_listesi;1 (:yil, :ay, :BagisTu' +
        'ru)}')
    Connection = dbHelper
    Left = 248
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'yil'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'ay'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'BagisTuru'
        ParamType = ptInput
        Size = 50
        Value = ''
      end>
    CommandStoredProcName = 'other_bagis_listesi;1'
  end
  object tblBagisList: TUniDataSource
    DataSet = GetBagisList
    Left = 248
    Top = 192
  end
  object dailyCount: TUniQuery
    Connection = dbHelper
    SQL.Strings = (
      'select SUM(u.Adet) as '#39'Adet'#39
      'from hareket h join users u on h.KartId = u.KartId'
      'where CAST(GETDATE() as DATE) = CAST(IslemZamani as DATE)')
    Left = 416
    Top = 344
  end
  object GetDailyBagis: TUniStoredProc
    StoredProcName = 'bagis_listesi_daily;1'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL bagis_listesi_daily;1 (:yil, :ay, :BagisTu' +
        'ru)}')
    SQLRefresh.Strings = (
      
        '{:RETURN_VALUE = CALL other_bagis_listesi;1 (:yil, :ay, :BagisTu' +
        'ru)}')
    Connection = dbHelper
    Left = 192
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'yil'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'ay'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'BagisTuru'
        ParamType = ptInput
        Size = 50
        Value = nil
      end>
    CommandStoredProcName = 'bagis_listesi_daily;1'
  end
  object tblDailyBagis: TUniDataSource
    DataSet = GetDailyBagis
    Left = 192
    Top = 288
  end
  object qHareketList: TUniQuery
    Connection = dbHelper
    SQL.Strings = (
      'select * from hareket')
    Left = 296
    Top = 88
  end
  object dbDumper: TUniDump
    Connection = dbHelper
    Options.QuoteNames = True
    Options.CompleteInsert = True
    Left = 32
    Top = 288
  end
end
