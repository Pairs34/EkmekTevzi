object frmBagisEx: TfrmBagisEx
  Left = 0
  Top = 0
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderStyle = bsNone
  Caption = 'frmBagisEx'
  ClientHeight = 555
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  DesignSize = (
    803
    555)
  TextHeight = 12
  object lblBuyukAdSoyad: TLabel
    Left = 6
    Top = 66
    Width = 12
    Height = 46
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -38
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBuyukHak: TLabel
    Left = 6
    Top = 115
    Width = 12
    Height = 46
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -38
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBagisTuru: TLabel
    Left = 6
    Top = 227
    Width = 87
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Ba'#287#305#351' T'#252'r'#252
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSonHareket: TLabel
    Left = 6
    Top = 166
    Width = 12
    Height = 46
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -38
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object txtCardID: TEdit
    Left = 6
    Top = 6
    Width = 564
    Height = 56
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Kart ID'
    OnChange = txtCardIDChange
  end
  object cxGroupBox: TcxGroupBox
    Left = 6
    Top = 256
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Ki'#351'i Bilgileri'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 180
    Width = 590
    object lblAdSoyad: TLabel
      Left = 14
      Top = 23
      Width = 76
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Ad Soyad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHak: TLabel
      Left = 14
      Top = 46
      Width = 91
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Adet Hakk'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTel: TLabel
      Left = 14
      Top = 70
      Width = 89
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Telefon No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAdres: TLabel
      Left = 14
      Top = 118
      Width = 47
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Adres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNufus: TLabel
      Left = 14
      Top = 95
      Width = 46
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'N'#252'fus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtAdsoyad: TcxTextEdit
      Left = 118
      Top = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 469
    end
    object txtNufus: TcxTextEdit
      Left = 118
      Top = 97
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 168
    end
    object txtTel: TcxTextEdit
      Left = 118
      Top = 71
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 322
    end
    object txtAdres: TcxMemo
      Left = 118
      Top = 127
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Height = 38
      Width = 469
    end
    object txtAdet: TcxTextEdit
      Left = 118
      Top = 46
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Width = 168
    end
  end
  object btnRefreshBagisTurleri: TcxButton
    Left = 607
    Top = 227
    Width = 34
    Height = 27
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
      462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
      617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
      2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
      77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
      22307078222076696577426F783D2230203020333220333222207374796C653D
      22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
      3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
      303B3C7374796C6520747970653D22746578742F637373223E2E477265656E7B
      66696C6C3A233033394332333B7D3C2F7374796C653E0D0A3C7061746820636C
      6173733D22477265656E2220643D224D31362C3236632D332E332C302D362E32
      2D312E362D382D346C342D3448362E32682D3448327631306C332E322D332E32
      43372E372C32382C31312E362C33302C31362C333063372E312C302C31322E39
      2D352E322C31332E382D3132682D3420202623393B4332342E392C32322E362C
      32302E382C32362C31362C32367A222F3E0D0A3C7061746820636C6173733D22
      477265656E2220643D224D32362E382C372E324332342E332C342C32302E342C
      322C31362C3243382E392C322C332E312C372E322C322E322C3134683463302E
      392D342E362C352D382C392E382D3863332E332C302C362E322C312E362C382C
      346C2D342C3468352E386834483330563420202623393B4C32362E382C372E32
      7A222F3E0D0A3C2F7376673E0D0A}
    OptionsImage.Spacing = 3
    TabOrder = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnRefreshBagisTurleriClick
  end
  object btnMazeretEkle: TcxButton
    Left = 575
    Top = 6
    Width = 122
    Height = 55
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Mazeret Ekle'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
      F40000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C0000002F744558745469746C650043616C656E6461723B536368
      6564756C65723B436C6F636B3B576F726B3B54696D653B5363616C653B458EE0
      88000008B349444154785EA5970B7094D515C77FF7FB36FBC86E36EFEC261008
      3E280C3450A829437D816DAC445B4154042CD6AA9DB114ADD33A4AB5556774B4
      D20E5A1CC7D1BE4CABD25A1511C7076035B6D4562D82B118421E2079C06E368F
      DDECEBFBEEEDE6FBBE5992D9E9D04ECFCE99FB98F3DFF33FE79E73EFAE6092FC
      E881275152F1C05D376980C0160928A60AFF0F4EA9FC76DE78F25ABBE5CEAD7B
      800B52C9F1B627B66EFE0A90E574727A9C2A2400AE492484A39E742673C1B5EB
      2EE7E12D4F9C0778015940B8400A70C5C0B8E3584ECA4861C4BB57ADB8D0A36B
      0FA2D439D1D808830D8DAC7DF231B6AC58C9BCE40095C1204A2A8BB994D21A51
      587389BD3F3432466AC1D23C2E3CD049C8EFC790EA83B16CE6CE6FBFBF7F2F0E
      89820C785DDA33B3969D1FF2876A183A31C8CEB6C33CB2ED8F2492491AAF5841
      285C0B4A814500040AE5AC6D262A873BC1ABFFECCBE3CEBDB2855028CC70DFC0
      E2FDAFEE6D0566000E80290434940815D75411DFFF0F46234364332ECA4A4B18
      48A518397090E2FE3E10809479B8C22290E7301289E670813C6EEC9376FC2707
      299D330F012140070CF232A5061498264A4A5CBA4EACBF9783F7DD468547E076
      D5A19404A91CE79653C7799E0D2E974EF4780FED395C791114B9CA51A604D364
      4A8D151270B26B4C105004037E36AEBC00CDED41A6936472A9C59428C7B91DB8
      CACF6D30048BFD7C77C51284DB6BE30607AD80E44460A882022EE802254D9469
      82123970FF24474C4AB593761C91F65C38D9480F0C58A3C8E340194641CB0B21
      A612D87BDE2616ADBE10CF6ADBCA81B37D573B57B7CC3F45C2022A9EDDF131D7
      7C7D7EC1E5D2FAC201AE5DD578CAB900A1E0BD7823FC6D25FF29034827C28C21
      7104855DF199AC59D0BC5242DA30019C880502C5590DA5188661CDA5727A5CD3
      F0F95C009A15ECA55F219D3530729ACE64ED0C28D306489C0C283B4D4A2A240A
      A14021B027C2EE7FA96C0728643A41E2C08754EDDB47644F1221254AD3508120
      DEC6C534CDA9027003E9E5AFEC365F3C7FA90258B671834D404A792ACD606991
      AE33B3AE14B7AE176460E6B4206E5DC3340DA26FEE22FEE64E02A57EAA4BFCE8
      6E81AE09ABF8CC6494D4EE1D84A2233CDFB2FC96D5BBF66E01E4CA77FE3A4142
      222502F06FFEE9AE78C38C5AD4A4366BA82FA3FA9EF598D22E2A33A748896142
      51288CF7DE4789B63E4ED9583FD5E17262276244FA238C44477184D2CA205575
      55545497111988D17F6C60CF331D5DEB5B0F77470123D2FA881240E08E07778E
      DDB1A99974D644585B0A4F91CEA196F36978E9AD7C5149E7D68B3DFD38C39128
      9EC11ECA2B4BE9E9384A22508DAFF9728AE62C4478DCA864866CC74724DF7811
      7FFC240DB3EB191E1AE368D7F1376E7DEF83353DF1441C30344028AB009C16B3
      DD20ED889DCE738EC64A9949B4BB0BB3B39D92808F8F3FEC20BBF4126AEE7888
      F92D17B3787E3DAFEF7A87C58DF5CC6B69A666F3436497AEC8D91D26E0F75255
      5DD67CF7FC39B73935A16900523A4E25387E01300C8942397BF6DC488C11F9B8
      9D706D2547FED583EFCAEBA9B97C0D0B67D75055EAC3EBD6B9F7F635D6589D5B
      97B90D5A0F0F4DD859F6A17005156EF7A65575B57580AED945E844E8B4158E53
      534AE715247FC1F4B7BD4D69899791D81872C66C02E77E958670907BB63C8769
      CA297AF8C8317E7CFFE3AC59DD4CF1D28B26EC2D5C455559F0CB15E55701452E
      40984AF2F4F3FB6DC7D21A387366394153F2E9C54B2D12133615975CC6B15CF4
      0DE525444F0EE3FFE675085D50E4D2B8EBD6AB304C852374757FC6DDF76DE3A6
      EB57B364C9023A8E8FE1BFE85262AD5BA90955502C580E3CE6726A8075AB16D8
      978E0204F8DC2EDAEEDFCE794B66A21048D34066D374DE701DC53E0FC7C653D4
      9E35070D88A78C9CBD0EC08E57FECC6BBBF7319E88B36EED65347DA9918CA970
      E9E0CDD98F2452F8BC6E305403E072E58F404E7DDDC6D3593A7A222C5E340DC0
      BAB93465303E3404B50124023D1864E8D675444C13D3302D9B97A72F65E3A6EB
      F9F9D6A798D5301D290591D124BFFDF50EAEFBD64A0B67759A29CB01FD140140
      3AFE05CE3ADF05D2694189F005C866B26828443A4968DB7686A243B85C9A9585
      D92FBCCE4FEEDDCA1716CE256B2AA2F12420B8F1C62BC88CC42C9C91CD9236B2
      A380B00928493C9EA6A2D437E5DD3ABBA192126F11083B03D9B449515525F1D1
      617C5E0F99CE43781735110A57A2090DA109AE5EFB0DBA7BFBB8A8F9427CFE00
      BAD041936808C67B3B2DDCD8588271C3EC03A40BB0D2FFD26B9F588F040AD4A4
      6BF950E7091458555D1F2E46CD984BFFBB3BA99B56C3E89B2F53FAC52674A1B1
      F517CFF283EFAFA5C46F07513FAD9A60B098071F6ECDEDAFC7D460F48D97ADBD
      BEFE0843A9F45F80ACCBFE6E63B82AEC2FAB0997634BFE45B2DBCF390E0D89AF
      F66B1C78E9F79C39AB8EA18E7646DFDD43E5B2667E78DB5AEBE5D39C7AD1856E
      11BBF3F60DD6110EBFB50723671F98564957777FB22D3EFA0720E30232D1C1DE
      9BDFDE2B1FD534ADCA8EDE56E57CB037AD2C2C9C1B82A6E51C38D8C682CF9F45
      EF2F1F43C56284AFB81A5DD34040369B45D741776908C3A0EFC5E738F9A76799
      595BC181F62E7A12895FBD373E7E14C80AC005782C2DF89F50201AE0F10A51B1
      A9BC725BD3EC594BE6CCAEA76F3006D36731EDCA75942F5C8CEEF5103D194175
      77707CFBEFE0B31EEA42E574761DE7EF9F74BFFFC870644D42CA0120290047D1
      0B1D178A63573CCB5534FD9A60E96FCEAEAB59B868C1D924535946E2E38C2733
      3862DD17A501AF357E74F008EDBDFD1FBC9018FD4E47367304881FFEDE06A330
      DAD38BC021E1175AD5FA40C9C67AAFF7A63366848BEB6A2A282B2BC1EB7193C9
      64888DC4E93F11E3484F7FEA6832F5746B62E467E34A9D001280D171F3B54A28
      A54EEF51080036FB829C73CE7C723F281C127880C03C977B4693C7BBB242D397
      B910555E21CE48A1BA0C25634352B6ED4BA79E3F64647A813120051813BF8AE6
      CD6DE07F26B0615D0B60633EF7D473DAA41AF23A6391434E0206907234EDACE5
      A737ACC93BFD6F099CEE48B4492A1C0590531580290EFF0D7D02CF2341DA9852
      0000000049454E44AE426082}
    OptionsImage.Spacing = 3
    TabOrder = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnMazeretEkleClick
  end
  object btnSadeceSorgu: TdxToggleSwitch
    Left = 441
    Top = 200
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Sadece Sorgu'
    Checked = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    StyleReadOnly.LookAndFeel.NativeStyle = False
    TabOrder = 4
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 454
    Width = 803
    Height = 101
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    LookAndFeel.NativeStyle = False
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = tblVAylikHareket
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideSelection = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.OnGetContentStyle = cxGridDBTableViewStylesGetContentStyle
      object cxGridDBTableViewKartId: TcxGridDBColumn
        DataBinding.FieldName = 'KartId'
        DataBinding.IsNullValueType = True
        MinWidth = 16
      end
      object cxGridDBTableViewAdSoyad: TcxGridDBColumn
        DataBinding.FieldName = 'Ad Soyad'
        DataBinding.IsNullValueType = True
        MinWidth = 16
      end
      object cxGridDBTableViewBaTr: TcxGridDBColumn
        DataBinding.FieldName = 'Ba'#287#305#351' T'#252'r'#252
        DataBinding.IsNullValueType = True
        MinWidth = 16
      end
      object cxGridDBTableViewDBColumn01: TcxGridDBColumn
        DataBinding.FieldName = '01'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn02: TcxGridDBColumn
        DataBinding.FieldName = '02'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn03: TcxGridDBColumn
        DataBinding.FieldName = '03'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn04: TcxGridDBColumn
        DataBinding.FieldName = '04'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn05: TcxGridDBColumn
        DataBinding.FieldName = '05'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn06: TcxGridDBColumn
        DataBinding.FieldName = '06'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn07: TcxGridDBColumn
        DataBinding.FieldName = '07'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn08: TcxGridDBColumn
        DataBinding.FieldName = '08'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn09: TcxGridDBColumn
        DataBinding.FieldName = '09'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn10: TcxGridDBColumn
        DataBinding.FieldName = '10'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn11: TcxGridDBColumn
        DataBinding.FieldName = '11'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn12: TcxGridDBColumn
        DataBinding.FieldName = '12'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn13: TcxGridDBColumn
        DataBinding.FieldName = '13'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn14: TcxGridDBColumn
        DataBinding.FieldName = '14'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn15: TcxGridDBColumn
        DataBinding.FieldName = '15'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn16: TcxGridDBColumn
        DataBinding.FieldName = '16'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn17: TcxGridDBColumn
        DataBinding.FieldName = '17'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn18: TcxGridDBColumn
        DataBinding.FieldName = '18'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn19: TcxGridDBColumn
        DataBinding.FieldName = '19'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn20: TcxGridDBColumn
        DataBinding.FieldName = '20'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn22: TcxGridDBColumn
        DataBinding.FieldName = '22'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn23: TcxGridDBColumn
        DataBinding.FieldName = '23'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn24: TcxGridDBColumn
        DataBinding.FieldName = '24'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn25: TcxGridDBColumn
        DataBinding.FieldName = '25'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn26: TcxGridDBColumn
        DataBinding.FieldName = '26'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn27: TcxGridDBColumn
        DataBinding.FieldName = '27'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn28: TcxGridDBColumn
        DataBinding.FieldName = '28'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn29: TcxGridDBColumn
        DataBinding.FieldName = '29'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 16
      end
      object cxGridDBTableViewDBColumn30: TcxGridDBColumn
        DataBinding.FieldName = '30'
        DataBinding.IsNullValueType = True
        MinWidth = 16
        Width = 26
      end
      object cxGridDBTableViewDBColumn31: TcxGridDBColumn
        DataBinding.FieldName = '31'
        DataBinding.IsNullValueType = True
        MinWidth = 16
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object cbMultiBagis: TcxCheckComboBox
    Left = 124
    Top = 226
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ParentFont = False
    Properties.EmptySelectionText = 'Ba'#287#305#351' Se'#231'iniz'
    Properties.Items = <>
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 6
    Width = 357
  end
  object bagisLocalizer: TcxLocalizer
    Left = 776
    Top = 393
  end
  object vAylikHareket: TVirtualTable
    AutoCalcFields = False
    Left = 760
    Top = 168
    Data = {04000000000000000000}
  end
  object tblVAylikHareket: TUniDataSource
    DataSet = vAylikHareket
    Left = 832
    Top = 168
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 152
    Top = 480
    PixelsPerInch = 96
    object cxRedStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clHighlightText
    end
    object cxGreenStyle: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxBlueStyle: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
  end
end
