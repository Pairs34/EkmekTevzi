object frmMazeretList: TfrmMazeretList
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmMazeretList'
  ClientHeight = 566
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 916
    Height = 525
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCustomDrawCell = cxGridDBTableViewCustomDrawCell
      DataController.DataSource = frmDb.tblMazeretList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'B'#252't'#252'n alanlardan filtreleyebilirsiniz.'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      NewItemRow.InfoText = 'Yeni Kay'#305't Ekle'
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.ClearPersistentSelectionOnOutsideClick = True
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.NoDataToDisplayInfoText = 'G'#246'r'#252'nt'#252'lenecek veri yok'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByHeaderLayout = ghlHorizontal
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object cxGridDBTableViewId: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        DataBinding.IsNullValueType = True
        Width = 53
      end
      object cxGridDBTableViewKartID: TcxGridDBColumn
        DataBinding.FieldName = 'KartID'
        DataBinding.IsNullValueType = True
        Width = 173
      end
      object cxGridDBTableViewKiiAd: TcxGridDBColumn
        DataBinding.FieldName = 'Ki'#351'i Ad'#305
        DataBinding.IsNullValueType = True
        Width = 342
      end
      object cxGridDBTableViewMazeretGun: TcxGridDBColumn
        DataBinding.FieldName = 'MazeretGun'
        DataBinding.IsNullValueType = True
        Width = 155
      end
      object cxGridDBTableViewIslemTarihi: TcxGridDBColumn
        DataBinding.FieldName = 'IslemTarihi'
        DataBinding.IsNullValueType = True
      end
      object cxGridDBTableViewGelecegiTarih: TcxGridDBColumn
        DataBinding.FieldName = 'GelecegiTarih'
        DataBinding.IsNullValueType = True
      end
      object cxGridDBTableViewKalan: TcxGridDBColumn
        DataBinding.FieldName = 'Kalan'
        DataBinding.IsNullValueType = True
        Visible = False
      end
      object cxGridDBTableViewEkmekAlacagiTarih: TcxGridDBColumn
        DataBinding.FieldName = 'EkmekAlacagiTarih'
        DataBinding.IsNullValueType = True
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object pnlTpMzEkm: TPanel
    Left = 0
    Top = 525
    Width = 916
    Height = 41
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    object lblTpMzEkm: TLabel
      Left = 1
      Top = 1
      Width = 207
      Height = 39
      Align = alLeft
      Caption = 'Toplam Mazeretli Ekmek Say'#305's'#305' : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 16
    end
    object lblTpMzEkmAdt: TLabel
      Left = 208
      Top = 1
      Width = 8
      Height = 39
      Margins.Left = 6
      Align = alLeft
      Caption = '0'
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      ExplicitHeight = 16
    end
  end
  object localizer: TcxLocalizer
    Left = 600
    Top = 288
  end
  object PopupMenu: TPopupMenu
    Left = 605
    Top = 96
    object btnRefresh: TMenuItem
      Caption = 'Yenile'
      ImageIndex = 0
      OnClick = btnRefreshClick
    end
    object btnSil: TMenuItem
      Caption = 'Sil'
      ImageIndex = 1
      OnClick = btnSilClick
    end
    object btnEditMazeret: TMenuItem
      Caption = 'D'#252'zenle'
      OnClick = btnEditMazeretClick
    end
  end
end
