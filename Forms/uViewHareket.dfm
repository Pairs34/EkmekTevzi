object frmKisiHareketleri: TfrmKisiHareketleri
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Ki'#351'i Hareketleri'
  ClientHeight = 570
  ClientWidth = 1087
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 1087
    Height = 570
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object HareketListSource: TUniDataSource
    DataSet = HareketListQuery
    Left = 376
    Top = 432
  end
  object HareketListQuery: TUniQuery
    Connection = frmDb.dbHelper
    Left = 232
    Top = 432
  end
end
