object frmHareket: TfrmHareket
  Left = 0
  Top = 0
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderStyle = bsNone
  Caption = 'frmHareket'
  ClientHeight = 535
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 12
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 874
    Height = 535
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ActivePage = tabMonthly
    Align = alClient
    TabOrder = 0
    object tabMonthly: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Ayl'#305'k'
      object cxGridMonthly: TcxGrid
        Left = 0
        Top = 33
        Width = 866
        Height = 446
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PopupMenu = popupMenu
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object cxGridMonthlyDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = frmDb.tblAylikRapor
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems.OnSummary = cxGridMonthlyDBTableViewDataControllerSummaryFooterSummaryItemsSummary
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'Filtreleme Ekran'#305
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          Styles.OnGetContentStyle = cxGridDBTableViewStylesGetContentStyle
        end
        object cxGridMonthlyLevel: TcxGridLevel
          GridView = cxGridMonthlyDBTableView
        end
      end
      object pnlFooterMonthly: TPanel
        Left = 0
        Top = 479
        Width = 866
        Height = 29
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 1
        object lblMonthlyCount: TcxLabel
          Left = 13
          Top = 5
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Ayl'#305'k Toplam : '
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 0
        end
        object txtMonthlyCount: TcxLabel
          Left = 98
          Top = 4
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '0'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 1
        end
        object lblDailyCount: TcxLabel
          Left = 173
          Top = 5
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'G'#252'nl'#252'k Toplam : '
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 2
        end
        object txtDailyCount: TcxLabel
          Left = 269
          Top = 4
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '0'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 3
        end
      end
      object pnlHeaderMonthly: TPanel
        Left = 0
        Top = 0
        Width = 866
        Height = 33
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 2
        object lblYear: TLabel
          Left = 13
          Top = 10
          Width = 15
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Y'#305'l'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAy: TLabel
          Left = 176
          Top = 10
          Width = 18
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Ay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBagisTuru: TLabel
          Left = 359
          Top = 9
          Width = 67
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Ba'#287#305#351' T'#252'r'#252
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txtAy: TcxComboBox
          Left = 207
          Top = 5
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'Ocak'
            #350'ubat'
            'Mart'
            'Nisan'
            'May'#305's'
            'Haziran'
            'Temmuz'
            'A'#287'ustos'
            'Eyl'#252'l'
            'Ekim'
            'Kas'#305'm'
            'Aral'#305'k')
          Properties.Nullstring = 'Ay Se'#231'iniz'
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
          StyleReadOnly.LookAndFeel.NativeStyle = False
          TabOrder = 0
          TextHint = 'Ay Se'#231'iniz'
          Width = 148
        end
        object btnFilter: TcxButton
          Left = 554
          Top = 5
          Width = 87
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Filtrele'
          LookAndFeel.NativeStyle = False
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000028744558745469746C6500536F7274416E6446696C7465723B46696C
            7465723B536F72743B536F7274696E673BF4E4F70F0000034849444154785E75
            936D685B551C877FE7DE9B9BA436E9B2D42DD636BA98E0D6C9502A6C3A83195A
            5C3A5D91EDCB2AED170515066E4C710E04AB6E559C2F6C58E66060272B4C749D
            73682928BAD6B1B5D54D6A43E64257579736754DDADC34E9BDB9E7FCBD5ECC87
            213EF070381CF8C1FFE530D880FD571BB2442C1683B4BCD92FBB02370C5DC7C2
            CDC9BA2A4FDD2C090105807CECF907838165CE768722C540B45266AC910830B9
            480821665736355F3BF2E36DE9D45FFA3580FC8A5AD372FEECAEE3EB37BF2794
            332F3FBC2BB02A74605574AB5A1D0843767AC11415800078B1B1BC78B3116A7D
            CC373E44616453C969360CB02D004E70C185E256A5CEFBDB5E53A72E9E47AABF
            1B93DFF741920414870CC5A960F5F617B122DA8EC4A4C1766CAA0F8D7D9E38CE
            24D71E8F2FE41C1DD86BB2AF773F74A6E9E92D4FD5AE7D1472D53D2061028C03
            2010E930B4327E492E62F78173001154971BA661209FBBDE921C3E3C201596CA
            FD33E363E08504001DB2D30F3DF305B2975EC2D457AF20377105831752F07964
            74B5C99FA5C73F696060F3B252B5058022F5FD9C3E397DF57AA6309D8199BF0A
            519E03C801617094B52240C0C5CB19AC6D70F0A1CBC9B778599B2B68733F30A6
            3E56999672B4635DC7E0FECD941D799BF4D941CAFFFE01A5079EA0F14351CA8C
            9CA6F46F3FD1773D073F8AC7E35E00AA65B5A5C752A9CCDCD1BDE3BEF670D077
            24B8AE51F1870328FC790E336305D435EF1337F675E548D3FCA620488CC1E084
            F9E2E2C4B6D4D46A9C7EA1A9B2486AE79391786F5B88B2C3AFD2C4A71BA9675B
            90CE7677EE6C6D6D5D1689449C005C8743C14D7D91BB4B47838177003870E1E0
            568CBEFB4825C4DBFB4C880A890FE98F13CDD4B33D48006AFE7D93DE68B82378
            2A7C57FA5843A01F409525930CDD8030CB18D9BF81EC14C62055D743565D6012
            4385C76B3CDE350EE5D47C492F7E335F780E80FEF1EDB52495970C9069DADA89
            B20452568064B71D108D465500AE0E9FB7BB5032D6FC5A2AB57FA915660ED52E
            E706E760DFEED9081B30C4DF1FAAB6EEDA42660120D8F46AA13B5B2E8D3EEB26
            7A33595CDAD995CD9D04605872CB25865B512CDDF66903331C0EB3BD8BDA3040
            F7722E2004810B819CC9AFBC9ECF3FC08808FF8FDD131980CB0EBDF5AB73CBE2
            DF40C075D622B9E8A10000000049454E44AE426082}
          OptionsImage.Spacing = 3
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnFilterClick
        end
        object txtYil: TcxComboBox
          Left = 32
          Top = 5
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            '2018'
            '2019'
            '2020'
            '2021'
            '2022'
            '2023'
            '2024'
            '2025'
            '2026'
            '2027'
            '2028'
            '2029'
            '2030')
          Properties.Nullstring = 'Ay Se'#231'iniz'
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
          StyleReadOnly.LookAndFeel.NativeStyle = False
          TabOrder = 2
          TextHint = 'Y'#305'l Se'#231'iniz'
          Width = 140
        end
        object cbBagisTuru: TcxComboBox
          Left = 430
          Top = 5
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Nullstring = 'Ay Se'#231'iniz'
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
          StyleReadOnly.LookAndFeel.NativeStyle = False
          TabOrder = 3
          TextHint = 'Ba'#287#305#351' T'#252'r'#252' Se'#231'iniz'
          Width = 120
        end
      end
    end
    object tabDaily: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'G'#252'nl'#252'k'
      ImageIndex = 1
      object pnlHeaderDaily: TPanel
        Left = 0
        Top = 0
        Width = 866
        Height = 33
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 0
        object lblDailyYear: TLabel
          Left = 13
          Top = 10
          Width = 10
          Height = 12
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Y'#305'l'
        end
        object lblDailyMonth: TLabel
          Left = 173
          Top = 10
          Width = 13
          Height = 12
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Ay'
        end
        object lblDailyBagisTur: TLabel
          Left = 352
          Top = 10
          Width = 48
          Height = 12
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Ba'#287#305#351' T'#252'r'#252
        end
        object txtDailyMonth: TcxComboBox
          Left = 198
          Top = 7
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'Ocak'
            #350'ubat'
            'Mart'
            'Nisan'
            'May'#305's'
            'Haziran'
            'Temmuz'
            'A'#287'ustos'
            'Eyl'#252'l'
            'Ekim'
            'Kas'#305'm'
            'Aral'#305'k')
          Properties.Nullstring = 'Ay Se'#231'iniz'
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          StyleReadOnly.LookAndFeel.NativeStyle = False
          TabOrder = 0
          TextHint = 'Ay Se'#231'iniz'
          Width = 148
        end
        object btnLoadDailyData: TcxButton
          Left = 530
          Top = 8
          Width = 66
          Height = 20
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Filtrele'
          LookAndFeel.NativeStyle = False
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000028744558745469746C6500536F7274416E6446696C7465723B46696C
            7465723B536F72743B536F7274696E673BF4E4F70F0000034849444154785E75
            936D685B551C877FE7DE9B9BA436E9B2D42DD636BA98E0D6C9502A6C3A83195A
            5C3A5D91EDCB2AED170515066E4C710E04AB6E559C2F6C58E66060272B4C749D
            73682928BAD6B1B5D54D6A43E64257579736754DDADC34E9BDB9E7FCBD5ECC87
            213EF070381CF8C1FFE530D880FD571BB2442C1683B4BCD92FBB02370C5DC7C2
            CDC9BA2A4FDD2C090105807CECF907838165CE768722C540B45266AC910830B9
            480821665736355F3BF2E36DE9D45FFA3580FC8A5AD372FEECAEE3EB37BF2794
            332F3FBC2BB02A74605574AB5A1D0843767AC11415800078B1B1BC78B3116A7D
            CC373E44616453C969360CB02D004E70C185E256A5CEFBDB5E53A72E9E47AABF
            1B93DFF741920414870CC5A960F5F617B122DA8EC4A4C1766CAA0F8D7D9E38CE
            24D71E8F2FE41C1DD86BB2AF773F74A6E9E92D4FD5AE7D1472D53D2061028C03
            2010E930B4327E492E62F78173001154971BA661209FBBDE921C3E3C201596CA
            FD33E363E08504001DB2D30F3DF305B2975EC2D457AF20377105831752F07964
            74B5C99FA5C73F696060F3B252B5058022F5FD9C3E397DF57AA6309D8199BF0A
            519E03C801617094B52240C0C5CB19AC6D70F0A1CBC9B778599B2B68733F30A6
            3E56999672B4635DC7E0FECD941D799BF4D941CAFFFE01A5079EA0F14351CA8C
            9CA6F46F3FD1773D073F8AC7E35E00AA65B5A5C752A9CCDCD1BDE3BEF670D077
            24B8AE51F1870328FC790E336305D435EF1337F675E548D3FCA620488CC1E084
            F9E2E2C4B6D4D46A9C7EA1A9B2486AE79391786F5B88B2C3AFD2C4A71BA9675B
            90CE7677EE6C6D6D5D1689449C005C8743C14D7D91BB4B47838177003870E1E0
            568CBEFB4825C4DBFB4C880A890FE98F13CDD4B33D48006AFE7D93DE68B82378
            2A7C57FA5843A01F409525930CDD8030CB18D9BF81EC14C62055D743565D6012
            4385C76B3CDE350EE5D47C492F7E335F780E80FEF1EDB52495970C9069DADA89
            B20452568064B71D108D465500AE0E9FB7BB5032D6FC5A2AB57FA915660ED52E
            E706E760DFEED9081B30C4DF1FAAB6EEDA42660120D8F46AA13B5B2E8D3EEB26
            7A33595CDAD995CD9D04605872CB25865B512CDDF66903331C0EB3BD8BDA3040
            F7722E2004810B819CC9AFBC9ECF3FC08808FF8FDD131980CB0EBDF5AB73CBE2
            DF40C075D622B9E8A10000000049454E44AE426082}
          OptionsImage.Spacing = 3
          TabOrder = 1
          OnClick = btnLoadDailyDataClick
        end
        object txtDailyYear: TcxComboBox
          Left = 28
          Top = 7
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            '2018'
            '2019'
            '2020'
            '2021'
            '2022'
            '2023'
            '2024'
            '2025'
            '2026'
            '2027'
            '2028'
            '2029'
            '2030')
          Properties.Nullstring = 'Ay Se'#231'iniz'
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          StyleReadOnly.LookAndFeel.NativeStyle = False
          TabOrder = 2
          TextHint = 'Y'#305'l Se'#231'iniz'
          Width = 140
        end
        object txtDailyBagisTur: TcxComboBox
          Left = 406
          Top = 7
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Nullstring = 'Ay Se'#231'iniz'
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          StyleReadOnly.LookAndFeel.NativeStyle = False
          TabOrder = 3
          TextHint = 'Ba'#287#305#351' T'#252'r'#252' Se'#231'iniz'
          Width = 120
        end
      end
      object cxGridDaily: TcxGrid
        Left = 0
        Top = 33
        Width = 866
        Height = 475
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        PopupMenu = popupMenu
        TabOrder = 1
        LookAndFeel.NativeStyle = False
        object cxGridDBTableViewDaily: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = frmDb.tblAylikRapor
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
            end>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'Filtreleme Ekran'#305
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          Styles.OnGetContentStyle = cxGridDBTableViewDailyStylesGetContentStyle
        end
        object cxGridLevelDaily: TcxGridLevel
          GridView = cxGridDBTableViewDaily
        end
      end
    end
  end
  object hareketlerLocalizer: TcxLocalizer
    Left = 336
    Top = 440
  end
  object popupMenu: TPopupMenu
    Images = imgList
    OnPopup = popupMenuPopup
    Left = 224
    Top = 344
    object KartIdKopyala1: TMenuItem
      Caption = 'Kart Id Kopyala'
      ImageIndex = 1
      OnClick = KartIdKopyala1Click
    end
    object btnReport: TMenuItem
      Caption = 'Rapor'
      ImageIndex = 0
      OnClick = btnReportClick
    end
    object btnAddEkmek: TMenuItem
      Caption = 'Ekmek Ver'
      ImageIndex = 2
      OnClick = btnAddEkmekClick
    end
    object btnExportXls: TMenuItem
      Caption = 'Excel'#39'e Aktar'
      ImageIndex = 3
      OnClick = btnExportXlsClick
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
  object imgList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 15729232
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00004FB5EAFF4FB5EAFF4FB5EAFF4FB5EAFF4FB5EAFF4FB5EAFF4FB5EAFF4FB5
          EAFF4FB5EAFF4FB5EAFF4FB5EAFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
          EEFF72C4EEFF72C4EEFF72C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF00000000000000000000000000000000000000000000
          0000000000000000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF000000005C4127805C4127805C4127805C4127805C41
          27805C4127800000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF00000000000000000000000000000000000000000000
          0000000000000000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF000000005C4127805C4127805C4127805C4127805C41
          27805C4127800000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF00000000000000000000000000000000000000000000
          0000000000000000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF000000005C4127805C4127805C4127805C4127805C41
          27805C4127800000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF00000000000000000000000000000000000000000000
          0000000000000000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF000000005C4127805C4127805C4127805C4127805C41
          27805C4127800000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF72C4EEFF00000000000000000000000000000000000000000000
          0000000000000000000072C4EEFF4FB5EAFF0000000000000000000000000000
          00004FB5EAFF0000000000000000000000000000000000000000000000000000
          000000000000000000000000000050B5E9FF0000000001010001000000000000
          00004FB5EAFF00000000848484FF848484FF848484FF848484FF848484FF8484
          84FF848484FF848484FF000000004FB5EAFF0000000000000000000000000000
          00000000000000000000848484FF848484FF848484FF00000000000000008484
          84FF848484FF848484FF00000000000000000000000000000000000000000000
          000000000000000000000000000000000000848484FF848484FF848484FF8484
          84FF000000000000000000000000000000000000000000000000}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000025744558745469746C6500436F70793B426172733B526962626F6E3B
          5374616E646172643B436C6F6E656D0EDF5B000001B649444154785E7D90318B
          53411446CF7DD94D229AC24A2BC1CADE56248D8A76D65A2B6C6721DA0A82D66A
          A1A58DFD7656168B0B36D6AB85827F40566159F3E6CDBD9F929921210B4E3317
          1EE7BC33D724B17E66B3D9E8F9EBBD0F9DD95C18104842180290109053FAF8E4
          C18D6B5B9C3C9DD07CE7CE65A0C9A9F06A7EF1F6F35560B4149899011D6093C9
          647CE1FC1952EAF9B37000A28266DD3F62C47432C2B303582BE89EBDF954B265
          7CF97EC8C1B79F88AE660702CE9D9D72FBE62526E35364DF10483E7F74FFCA7F
          B39FBEDA27E78C24D210EB02CC73418E6BB6B07207C8C474DC2DB3DD45881305
          960747802464566E00A3CC1572050A11454013903C00080C095001010221897E
          88B5026D3E21832042C8A83308812850CE840721E1B1B18361080484B4064351
          14B1BB2384043E6C1464CFE54314A87A304140CB66BADD11802B00B47AC29254
          2D68FF368450D4820876DF1FF0F5C711B93FDA07721330785058519750E02613
          780A1EEE5CBF381E8F7F0103B06802A2EEE0F4740B54F090210588964D4AE9B0
          EFFBDF8D6B02EFD3F1DEBDC7BB73B15AA299AABD088645C906D814A4772FEFDE
          02B601033879A396BD2EF80B61825062DDA3F2C70000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001B744558745469746C65004164643B506C75733B426172733B526962
          626F6E3B9506332F0000036349444154785E35927D6C535518C69F73EE6DEB64
          63A3AEFB60A3A36E33B8C56581E0D8707E21CC1A43A2A22304FE3001512A86C4
          E900132451FF503367420043B244364C483031465C248B4441C0980C45B4D065
          CDBA4ECAE82AAC5DBBDE8FF3E1BD27F1397973DE9C3CBFF7233964226FC2D543
          A53E0280443E3FD752525AB14323FA06685A3381E492F329C6ADF39954E2F8C9
          C3DBA6018858DE940A9C2C5870C1D51BB6FAF61DBB327860F81A1BFE25297FB8
          3127C7EFE4E5D5745E9EBB9991239766E481937FE4DE1818DB0DC0EB322EABBA
          B63FD5EB7D6CCBBE6F1B83FE9E67BA82E084C0E4123697CAE0D109BC94805B0C
          E7AFCC606A66EEECF75FBCBB753AFAEB2201A0BD3E7861B02914D8DBF34408A9
          AC0D2181D3672E23319D81AB950D016CEBED824E809A722FC62E4CE17A343130
          D4DF73507FB9FFAB551E9F6FCF93EB82B879BB088D52504A14FCC9CE4E95F79D
          B80CD396284A8179C7D3DD1144F29FEC5BE1D73E1BA6BEB2C09BEDCD955A7CCE
          44D1744C1687C9045C05EBFC686F0DAADCB08413D2098E89B4E1BC5779965687
          5ED585D03ACBFDA548E7197EFA711C776EDFC5FF12200A7075F4E85975D7D4FA
          F1F4A635A82C5F02A2956CD46D2EEB1D160B455BC19FEE5E0F4A885A45828071
          81137D1B61DB0C1E5D43E4C8CF5858E4D0A1810BBA5CB76DEEBDB768C1E604AE
          EA6B1F40D9121F0A265385BC0E5457530109404A8010E27805EEE60598CDA15B
          8699C8E7CD4784EEC3F2BA00767C340A4AA9327E79300CE1505BDEFF0E9AA681
          5082150DD5604CA26858282E1693D428E42F6666B3909068EF68C5E6171FC7E6
          17BA611A260C93A9029C713CF7FC3A3C1BEE404B5B2398E0989FCBA190FD774C
          CFA46243B11B4B77ADADF67BB236478E10500AA5D2121D5C48354D3A674108A1
          56114C201E4BB1D9F86FA70880FB1EDD3E34B0A229B4E7E1350FC2E22E2011BF
          16C3FCBD050557562DC3CA964608B8B4C4E49F4924A27F1F193F1DD9AF03B0FE
          1AFDE03D113EDC6431B1A96575089212B4AD6D555F581280D902398343308EC9
          EB49DC9A981A75E043000CA46D09005A49457059DB4BC78E77EDFCDAEAFDF892
          DC3B1295EF7C13977D4E444E45E52BCE5BE7AE338555E10FDF0650EE32B30E4B
          D24C0212A8F210EAAED3D01969BB3FD0BCDDE32BEB06D56AD5D09CCDDA66EE62
          EED6EF43A9AB2331008603ABCEFF019D3AAD15CCD8D2E00000000049454E44AE
          426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001D744558745469746C65004578706F72743B586C733B4578706F7274
          546F586C733B4CA099FE000001DD49444154785E8D53BB6E134114BDB36C2022
          54FC004A9D86062571E42C523AA4144097262028E90C45522414AC11B8A78970
          E8D2B988446B05AD6DF111F00D29E23CBCBB3393B36766562BDC30D6F83EF69E
          73CFDD995522F2EF9660E77D2E8B5D5A2C5889B1D597A3DFC34845897B8A9F75
          2863F98F18D6C2225B9637D9C1BBA75BC015812012AB92CEDB27357FEDCC8792
          7E9BB461EE340954690D81B35C134071B4814431BF7857892E8DB0299727D0B9
          66A02B4000FB57426E653D3146D0AC554D02B06A42AC27B04AD1B7AE34F8244B
          561F494A684341A10D0B0CAA3FFEDC91ECCF29891C29DCE01BE73F3E8CA7D815
          601071042A406C84E0F1FB29F159674AA20C7100BF5EDF9333E4CF9043DB1754
          9017DA77B2BE1375736663495C8FB7DBDA97CDAF4B8ECDF8B75978055A3BD0F7
          498AEE97D28775E74F30498EC75D74BF605D95742368AFC05541E6BE6CF4EECB
          ABB53DE691AB151C8F3E81E4B30C3B17C4C4810011A50600B9828B3C6606B82B
          BB203748FE80BA9AA0342CE683D6F236BA2FB1639BB3C2F66809E86769F3C807
          E11E90E0C1622CE9F3132F809DBD6FEA5C36F92B2F9FAD3C04C179B807657E7D
          F5EBCD874162808AFCC5A97CA5C289081722C9679723B879F3538DB0EF612FFC
          C7276DFD47748D263CBA5B445552645BC908B30000000049454E44AE426082}
      end>
  end
end
