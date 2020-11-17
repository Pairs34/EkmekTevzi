object frmKisiEkle: TfrmKisiEkle
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Ki'#351'i Ekle'
  ClientHeight = 377
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object lblAdres: TLabel
    Left = 8
    Top = 168
    Width = 39
    Height = 16
    Caption = 'Adres'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAdSoyad: TLabel
    Left = 8
    Top = 8
    Width = 62
    Height = 16
    Caption = 'Ad Soyad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblEkmekAdedi: TLabel
    Left = 285
    Top = 8
    Width = 81
    Height = 16
    Caption = 'Ekmek Adedi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAciklama: TLabel
    Left = 8
    Top = 64
    Width = 57
    Height = 16
    Caption = 'A'#231#305'klama'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblKartId: TLabel
    Left = 285
    Top = 64
    Width = 45
    Height = 16
    Caption = 'Kart Id'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTelNo: TLabel
    Left = 8
    Top = 116
    Width = 110
    Height = 16
    Caption = 'Telefon Numaras'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNufus: TLabel
    Left = 285
    Top = 116
    Width = 77
    Height = 16
    Caption = 'Nufus Say'#305's'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtAdSoyad: TEdit
    Left = 8
    Top = 30
    Width = 271
    Height = 24
    TabOrder = 0
    TextHint = 'Ki'#351'i Ad Soyad'
  end
  object txtEkmekAdedi: TEdit
    Left = 285
    Top = 30
    Width = 271
    Height = 24
    NumbersOnly = True
    TabOrder = 1
    TextHint = 'Ekmek Adedi'
  end
  object btnKartIptal: TdxToggleSwitch
    Left = 393
    Top = 261
    Caption = 'Kart Durumu'
    Checked = True
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
  end
  object btnKaydet: TcxButton
    Left = 247
    Top = 290
    Width = 98
    Height = 42
    Caption = 'Kaydet'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000000B744558745469746C6500536176653BF9E8F9090000020349444154
      785E7D52316B145110FEDEE6EE9A03EF2E57284A6C6DAC42C0262185829D0A36
      16820AFE010BADC47F60AB2022585A588875B01041822158D858081204956872
      DC5DD6DD3733CF99D93DD713CCC0F7BEF776E7FB66E6ED0654912982633EFCFC
      9F67A2603B2CAC9DBFB2810CEB4B274EE1E4D271B0303832A24450A94C113112
      2846ECED8F301A7DB59CD76F379E9F6D9901425A5F3DB38C4F9FC7B87BE70690
      60E1E49C80BC886049B87EF33656964F6373EBFD1A8096190466017352B0ABA6
      BF22C4D5C9C5972E5CD632010F1F3F0553C4CECE17088B8F9ED99292B898884C
      EFE2548B270711D942867E7F114717BB9E0308582A83962D2C6EE0EE2925EFA6
      245671899205ED561B9D4EA77EC7CA6D887063904CCCE29735C923BEEF4F91C4
      A771DC7FF008C7865DEF88896B23FA6310BC03226FEFEAB55B9A203E63823143
      5490445C3883D05F23F8FCC228F26F180C06B3CB730059BD57866F20229EDF18
      D42358BC78F60487C5EAB98B5A6408E63903B1F6BD358B9FE302F06D729610BC
      B2AE20B63CF9D780602072579FB9F98B6082E6DF8D044932FF156CA648EC89F7
      5E7E844802299851B3C26667F30BCAF31D043B3091DFC3917E0F5C895C1C4D3C
      03E095C79303A4CA20984111CBFCDDE6D6F6CA70D0C39B571F2A7164AF129589
      14C65E59B0FB631765596C03C8030033E929BA8A0C4D8443F6A2982AF67E037E
      F6AC9379188DF20000000049454E44AE426082}
    TabOrder = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnKaydetClick
  end
  object txtAciklama: TEdit
    Left = 8
    Top = 86
    Width = 271
    Height = 24
    TabOrder = 2
    TextHint = 'A'#231#305'klama ('#304'ptal Nedeni)'
  end
  object txtCardId: TEdit
    Left = 285
    Top = 86
    Width = 271
    Height = 24
    TabOrder = 3
    TextHint = 'Kart ID'
  end
  object txtTelNo: TEdit
    Left = 8
    Top = 138
    Width = 271
    Height = 24
    NumbersOnly = True
    TabOrder = 4
    TextHint = 'Telefon Numaras'#305
  end
  object txtAdres: TcxMemo
    Left = 8
    Top = 190
    ParentShowHint = False
    ShowHint = True
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 6
    Height = 65
    Width = 548
  end
  object txtNufus: TEdit
    Left = 285
    Top = 138
    Width = 271
    Height = 24
    NumbersOnly = True
    TabOrder = 5
    TextHint = 'Nufus Say'#305's'#305
  end
end
