object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Ayarlar'
  ClientHeight = 415
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object lblKayipGun: TLabel
    Left = 8
    Top = 8
    Width = 116
    Height = 16
    Caption = 'Kart Kapat'#305'lma G'#252'n'#252
  end
  object lblBagisTur: TLabel
    Left = 8
    Top = 114
    Width = 72
    Height = 16
    Caption = 'Ba'#287#305#351' T'#252'rleri'
  end
  object txtKayipGun: TEdit
    Left = 8
    Top = 30
    Width = 337
    Height = 24
    TabOrder = 0
    TextHint = 'Ka'#231' g'#252'n sonra kart kapat'#305'ls'#305'n'
  end
  object btnSaveKayipGun: TcxButton
    Left = 112
    Top = 60
    Width = 113
    Height = 41
    Caption = 'Kaydet'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C0000000B744558745469746C6500536176653BF9E8F909000000
      5249444154785EEDD1310AC0200C86D19CD7EB7810C74C39DBAF2D4A86188215
      3B397C82441E0109C056EF915391169EFA1D263B1305DC478ACEF03F006D0970
      8B81B87380AE1F7701D0915FE00F000F60AB0ABEAED30B0888EDC10000000049
      454E44AE426082}
    TabOrder = 1
    OnClick = btnSaveKayipGunClick
  end
  object txtBagisAdi: TEdit
    Left = 8
    Top = 136
    Width = 338
    Height = 24
    TabOrder = 2
    TextHint = 'Ba'#287#305#351' t'#252'r'#252
    OnKeyDown = txtBagisAdiKeyDown
  end
  object btnRefreshBagislar: TcxButton
    Left = 304
    Top = 361
    Width = 113
    Height = 41
    Caption = 'Yenile'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C00000027744558745469746C6500526566726573683B52657065
      61743B426172733B526962626F6E3B52656C6F6164CD4DF6E9000000B1494441
      54785EC593B10D02310C454162001688D8E0FA1BC2A2A3A14F895241CF128C40
      7B5DE86E1F96301FE947F249761A4EA2784DBEF3EC28C946557F623D81DC5F8D
      040AA8E04D2AD7126B42C1165C80064C608C047B2094DC40060792C16C24C913
      9C5920A683CD0723290B0137A941107A92CCBCB66CB1399230F3E8875FC1F5F9
      D8F59AD8F12A83EC8C1F1ED30A0A83190C8EC04AC4BB8504A62671AEF16424E1
      431A9B24E048C97A4FF9FFBFF103FFEC875AFFDCA9F30000000049454E44AE42
      6082}
    TabOrder = 3
    OnClick = btnRefreshBagislarClick
  end
  object txtUsername: TEdit
    Left = 368
    Top = 30
    Width = 338
    Height = 24
    TabOrder = 4
    TextHint = 'Kullan'#305'c'#305' Ad'#305
  end
  object txtPass: TEdit
    Left = 368
    Top = 60
    Width = 338
    Height = 24
    TabOrder = 5
    TextHint = #350'ifre'
  end
  object btnSaveUser: TcxButton
    Left = 480
    Top = 90
    Width = 113
    Height = 41
    Caption = 'Kaydet'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C0000000B744558745469746C6500536176653BF9E8F909000000
      5249444154785EEDD1310AC0200C86D19CD7EB7810C74C39DBAF2D4A86188215
      3B397C82441E0109C056EF915391169EFA1D263B1305DC478ACEF03F006D0970
      8B81B87380AE1F7701D0915FE00F000F60AB0ABEAED30B0888EDC10000000049
      454E44AE426082}
    TabOrder = 6
    OnClick = btnSaveUserClick
  end
  object lstUsers: TListView
    Left = 368
    Top = 137
    Width = 338
    Height = 216
    Columns = <
      item
        Caption = '#'
      end
      item
        Caption = 'Kullan'#305'c'#305' Ad'#305
        Width = 120
      end
      item
        Caption = 'Parola'
        Width = 120
      end>
    RowSelect = True
    PopupMenu = popupMenu
    TabOrder = 7
    ViewStyle = vsReport
  end
  object lstBagisTurleri: TListView
    Left = 8
    Top = 166
    Width = 338
    Height = 187
    Columns = <
      item
        Caption = '#'
      end
      item
        AutoSize = True
        Caption = 'Ba'#287#305#351' T'#252'r'#252
      end>
    RowSelect = True
    PopupMenu = popupMenu
    TabOrder = 8
    ViewStyle = vsReport
  end
  object popupMenu: TPopupMenu
    Left = 120
    Top = 360
    object btnSil: TMenuItem
      Caption = 'Sil'
      OnClick = btnSilClick
    end
  end
end
