object frmBagis: TfrmBagis
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 596
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1068
    596)
  PixelsPerInch = 120
  TextHeight = 16
  object lblBuyukAdSoyad: TLabel
    Left = 8
    Top = 77
    Width = 15
    Height = 57
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -47
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBuyukHak: TLabel
    Left = 8
    Top = 145
    Width = 15
    Height = 57
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -47
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSonHareket: TLabel
    Left = 8
    Top = 208
    Width = 15
    Height = 57
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -47
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object txtCardID: TEdit
    Left = 8
    Top = 8
    Width = 705
    Height = 68
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -50
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Kart ID'
    OnChange = txtCardIDChange
  end
  object cxGroupBox: TcxGroupBox
    Left = 0
    Top = 271
    Caption = 'Ki'#351'i Bilgileri'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -20
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 187
    Width = 737
    object lblAdSoyad: TLabel
      Left = 22
      Top = 24
      Width = 83
      Height = 24
      Caption = 'Ad Soyad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblHak: TLabel
      Left = 22
      Top = 51
      Width = 97
      Height = 24
      Caption = 'Adet Hakk'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTel: TLabel
      Left = 22
      Top = 78
      Width = 97
      Height = 24
      Caption = 'Telefon No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblAdres: TLabel
      Left = 22
      Top = 135
      Width = 50
      Height = 24
      Caption = 'Adres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNufus: TLabel
      Left = 22
      Top = 105
      Width = 50
      Height = 24
      Caption = 'N'#252'fus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object txtAdsoyad: TcxTextEdit
      Left = 147
      Top = 24
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
      TabOrder = 0
      Width = 587
    end
    object txtNufus: TcxTextEdit
      Left = 147
      Top = 105
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
      TabOrder = 1
      Width = 210
    end
    object txtTel: TcxTextEdit
      Left = 147
      Top = 78
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
      TabOrder = 2
      Width = 403
    end
    object txtAdres: TcxMemo
      Left = 147
      Top = 132
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
      TabOrder = 3
      Height = 44
      Width = 587
    end
    object txtAdet: TcxTextEdit
      Left = 147
      Top = 51
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
      TabOrder = 4
      Width = 210
    end
  end
  object btnBagis: TcxButton
    Left = 799
    Top = 438
    Width = 154
    Height = 50
    Caption = 'Ekmek Ver'
    LookAndFeel.NativeStyle = False
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
      F400000015744558745469746C6500436865636B3B4D61726B3B5469636B0B00
      C7240000061249444154785EB5977D8C945715C67F77BED9016469619765172A
      6B10B410B45B8C80690B3129316D2CD062253168D29A96A409698D41636CEC87
      9AB424B4D834454D459BC6DA58AC465AB595046DAC103E6AC5A604975DBA0BB3
      DD7567D9DD997766DE7B8E66F7E6BD937D6762F8833B99C99D33F3CEF39CE739
      F7CC790D8D97E1EA2D8D01FDF4CD3BF8DAC6570C60AE80C0957DC7038BDB2BF5
      80CF1EBEEDE6543AF94363B8F1FFD357D0C69FC5833E6A458F97276A7B766F7D
      EDCF38222947C2FC0FFCC55B56DDD3B670DE32FC520F58FFDEBF7868B4213945
      50075228F6F61C79E7F95F005D8E00298794C0D0969F9DA5B7F8B2C3AA87543C
      AEFA38E03167C475C6B50A0BF39F0268031280710A78A9423B8188AD87437D46
      3E169188C79A13502AB6888AB7BE5E01A30AA216AB210EC5538829E2761A271A
      C1AAC6485BA92151DC1388605442ACC40938B56259AACEB446A3FD7B670779FB
      D8FBDC71FB67989DCFA128D6D6506DA68028969AB3209E65DC7F45BD2A91E497
      C7CABCFAFB93B4CFBD89554B3ECB2BAFFE9C3BB7AE25954A104A0D895B80892C
      881450B4098178DCD7C8B9DE21DEF8E305B66DFA3E9F5CFE69128CF1E6533F62
      607084CEC5F3B05A43AC80C3AC57002B424DAA533E7910E292D7C755220BCE9C
      19E0E4DF2DBBEE3AC8D2AE0E5A72551E7EE601767E690B73E70704E165AA6185
      D04AC31A3013930113C125825A895432E3FD55418DCB1E0368E4B738158E1FEF
      E3FD7FA6B96FFB335CD7B9885CA6CA9E7D3BD878F3725A3E32CE44659CD0D618
      3305CAA56AC31A20AC5942A9305A2A9049CD62563A8F3149140571591B505130
      0A6A1084BF1C3D47A1BF955D77EFA773511BE954856FEEDDCEDAB59DCCBDA6CC
      78A548502D51B50199E41CC2501A17A1288808224A509D9C7AA65359B0694E9F
      BA484F4F178964C27BAFCAA9931F70A97F3EF76FDFCFE28E05B464933CFDC2B7
      E8E84AD3BE14862706A68055C118B02A8868630BC40AA21651EFD16469923F1C
      EE23231FE3FCF977F9FCE625B4CCCA0186FEBE51CEBCA33CB0632F1D8B169034
      098EBDFB3BFE7DF12DBEB8650D85B15E57B806350AE28EB9D558119AE818AAA0
      AED2C50A47DEB840DBEC757CF90B8F72F6FC090E1DFA36EB37B5128696A3478A
      DCB3E5277475740050AD0DF1DCCB0F73E75D37303CD9EF0B15010198FE7D2B8D
      2DC00AA87805828AE53FC3015FDF791F8BDBAF61FEBC9B9895DDC70B8777530D
      27B9FBD67DACEC5E893190CB181E7FEE41D6AFEFA6A4838808BE2302380212FA
      3ED0C8022B12B5CA39F93CDBB76E64FFAF76F1C4EEDF90CBB5B2EA1337F0D5EC
      01FA2EFE839EEBD7914C25499804478FBFC878F51CED4B9771B95489352DB745
      C422962635306541384D40A12C25F22DA36CBA6505DF7D76078FEC7A894C3ACF
      8AEE155CD7D94D3A9346145446F8D96F7FC0B66D3D8C4D0EB8BC71804A74729D
      05629B5960155541C5F7F4F1A0C89C56C3EA35D7F2D8819D7CEFFE9718D3042D
      C92CAA4A369DE2F9438FB37A75176586A6008CE2FB06A0E25B99B5365E84DE02
      C5BA1A50C02808CA587984F9ED0BE82C2579E2E0BD3CF8951F333A6101280C9F
      E6F4B93F71DBED6B280683DE7355C4DBE06731B5CDFF0B4404F1E734FA4B5503
      C55281AEEE0EDE2B1738F0EB6F70EFD6BD54AA214F1EFA0E9FDB703DC5E012A2
      DE6B50F7309112A86245B0A136AB01B0E26AC00F21EE3D0C8F7FC0CA554B3871
      EC14BF7CFD113A172E87D408B97929268210C029A7E8CCF9607AEB12ACAF018C
      AF8150B0E2FA00EA3D745D4C55192AF6D1D3F351FEFAD6EBBCF6B7836CDE7C23
      E3E5012F733DB8CB3E8AA8417C238A1F432BEA1410D7F7751A1C10F153D140B1
      970D1B3E4E3EBB96DE0FFF855A05884D417E247311F51637ED03AAD64964D07A
      F9660CA5FD2367BDBCF8E515F0591BA7022E11A700B179400442910850519F09
      78406340FCB029DE7C50E329A91FC91D19D709052F932760C3D01646862EB7B5
      5EDB0E0A8280A827A312C92CAAD316894631AF96A0EA6AC8E0F7C0E848155B93
      0260EB2D10A03A3C58DE7DE2ED817D46130B1405666413A96120360D1BC0C744
      C1CCBCCE005687870BC1434000D8FA8E94043240D6ED1357702F68AEE0DE3004
      024F008D2C70C1AA277555963AC525C6B031E8D5BF45FF2F78E87AD17B7EBBE5
      0000000049454E44AE426082}
    TabOrder = 2
    Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnMazeretEkle: TcxButton
    Left = 719
    Top = 8
    Width = 130
    Height = 68
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
    TabOrder = 3
    OnClick = btnMazeretEkleClick
  end
  object btnSadeceSorgu: TdxToggleSwitch
    Left = 510
    Top = 228
    Caption = 'Sadece Sorgu'
    Checked = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = 24
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 472
    Width = 1068
    Height = 124
    Align = alBottom
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    LookAndFeel.NativeStyle = False
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
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
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.OnGetContentStyle = cxGridDBTableViewStylesGetContentStyle
      object cxGridDBTableViewKartId: TcxGridDBColumn
        DataBinding.FieldName = 'KartId'
        Width = 70
      end
      object cxGridDBTableViewAdSoyad: TcxGridDBColumn
        DataBinding.FieldName = 'Ad Soyad'
        Width = 69
      end
      object cxGridDBTableViewBaTr: TcxGridDBColumn
        DataBinding.FieldName = 'Ba'#287#305#351' T'#252'r'#252
        Width = 70
      end
      object cxGridDBTableViewDBColumn01: TcxGridDBColumn
        DataBinding.FieldName = '01'
        Width = 35
      end
      object cxGridDBTableViewDBColumn02: TcxGridDBColumn
        DataBinding.FieldName = '02'
        Width = 22
      end
      object cxGridDBTableViewDBColumn03: TcxGridDBColumn
        DataBinding.FieldName = '03'
        Width = 21
      end
      object cxGridDBTableViewDBColumn04: TcxGridDBColumn
        DataBinding.FieldName = '04'
        Width = 22
      end
      object cxGridDBTableViewDBColumn05: TcxGridDBColumn
        DataBinding.FieldName = '05'
        Width = 35
      end
      object cxGridDBTableViewDBColumn06: TcxGridDBColumn
        DataBinding.FieldName = '06'
        Width = 35
      end
      object cxGridDBTableViewDBColumn07: TcxGridDBColumn
        DataBinding.FieldName = '07'
        Width = 35
      end
      object cxGridDBTableViewDBColumn08: TcxGridDBColumn
        DataBinding.FieldName = '08'
        Width = 25
      end
      object cxGridDBTableViewDBColumn09: TcxGridDBColumn
        DataBinding.FieldName = '09'
        Width = 21
      end
      object cxGridDBTableViewDBColumn10: TcxGridDBColumn
        DataBinding.FieldName = '10'
        Width = 35
      end
      object cxGridDBTableViewDBColumn11: TcxGridDBColumn
        DataBinding.FieldName = '11'
        Width = 35
      end
      object cxGridDBTableViewDBColumn12: TcxGridDBColumn
        DataBinding.FieldName = '12'
        Width = 21
      end
      object cxGridDBTableViewDBColumn13: TcxGridDBColumn
        DataBinding.FieldName = '13'
        Width = 22
      end
      object cxGridDBTableViewDBColumn14: TcxGridDBColumn
        DataBinding.FieldName = '14'
        Width = 21
      end
      object cxGridDBTableViewDBColumn15: TcxGridDBColumn
        DataBinding.FieldName = '15'
        Width = 22
      end
      object cxGridDBTableViewDBColumn16: TcxGridDBColumn
        DataBinding.FieldName = '16'
        Width = 22
      end
      object cxGridDBTableViewDBColumn17: TcxGridDBColumn
        DataBinding.FieldName = '17'
        Width = 35
      end
      object cxGridDBTableViewDBColumn18: TcxGridDBColumn
        DataBinding.FieldName = '18'
        Width = 35
      end
      object cxGridDBTableViewDBColumn19: TcxGridDBColumn
        DataBinding.FieldName = '19'
        Width = 34
      end
      object cxGridDBTableViewDBColumn20: TcxGridDBColumn
        DataBinding.FieldName = '20'
        Width = 21
      end
      object cxGridDBTableViewDBColumn22: TcxGridDBColumn
        DataBinding.FieldName = '22'
        Width = 22
      end
      object cxGridDBTableViewDBColumn23: TcxGridDBColumn
        DataBinding.FieldName = '23'
        Width = 22
      end
      object cxGridDBTableViewDBColumn24: TcxGridDBColumn
        DataBinding.FieldName = '24'
        Width = 22
      end
      object cxGridDBTableViewDBColumn25: TcxGridDBColumn
        DataBinding.FieldName = '25'
        Width = 21
      end
      object cxGridDBTableViewDBColumn26: TcxGridDBColumn
        DataBinding.FieldName = '26'
        Width = 35
      end
      object cxGridDBTableViewDBColumn27: TcxGridDBColumn
        DataBinding.FieldName = '27'
        Width = 22
      end
      object cxGridDBTableViewDBColumn28: TcxGridDBColumn
        DataBinding.FieldName = '28'
        Width = 22
      end
      object cxGridDBTableViewDBColumn29: TcxGridDBColumn
        DataBinding.FieldName = '29'
        Width = 21
      end
      object cxGridDBTableViewDBColumn30: TcxGridDBColumn
        DataBinding.FieldName = '30'
        Width = 34
      end
      object cxGridDBTableViewDBColumn31: TcxGridDBColumn
        DataBinding.FieldName = '31'
        Width = 70
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 152
    Top = 512
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
  object vAylikHareket: TVirtualTable
    AutoCalcFields = False
    Left = 808
    Top = 200
    Data = {04000000000000000000}
  end
  object tblVAylikHareket: TUniDataSource
    DataSet = vAylikHareket
    Left = 816
    Top = 144
  end
end
