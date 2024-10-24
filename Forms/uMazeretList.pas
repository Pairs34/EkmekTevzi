﻿unit uMazeretList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxLocalization,
  dxBarBuiltInMenu, Vcl.Menus, cxGridCustomPopupMenu,
  Vcl.StdCtrls, Vcl.ExtCtrls,System.StrUtils, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2019Colorful,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, dxDateRanges,
  dxScrollbarAnnotations;

type
  TfrmMazeretList = class(TForm)
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewKartID: TcxGridDBColumn;
    cxGridDBTableViewKiiAd: TcxGridDBColumn;
    cxGridDBTableViewMazeretGun: TcxGridDBColumn;
    localizer: TcxLocalizer;
    PopupMenu: TPopupMenu;
    btnRefresh: TMenuItem;
    btnSil: TMenuItem;
    cxGridDBTableViewIslemTarihi: TcxGridDBColumn;
    cxGridDBTableViewGelecegiTarih: TcxGridDBColumn;
    pnlTpMzEkm: TPanel;
    lblTpMzEkm: TLabel;
    lblTpMzEkmAdt: TLabel;
    cxGridDBTableViewKalan: TcxGridDBColumn;
    cxGridDBTableViewEkmekAlacagiTarih: TcxGridDBColumn;
    btnEditMazeret: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSilClick(Sender: TObject);
    procedure cxGridDBTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnEditMazeretClick(Sender: TObject);
  private
    procedure LoadMazeretler;
  public
    { Public declarations }
  end;

var
  frmMazeretList: TfrmMazeretList;

implementation

{$R *.dfm}

uses uDbHelper, uMazeretEdit;

procedure TfrmMazeretList.btnEditMazeretClick(Sender: TObject);
var
    bKartId : string;
    bId : integer;
begin
    bKartId := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('KartId').Index];

    bId := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Id').Index];

    Application.CreateForm(TfrmMazeretEdit,frmMazeretEdit);
    frmMazeretEdit.txtKartID.Text := bKartId;
    frmMazeretEdit.bId := bId;
    frmMazeretEdit.bTopluMazeret := false;
    frmMazeretEdit.ShowModal;
end;

procedure TfrmMazeretList.btnRefreshClick(Sender: TObject);
begin
    LoadMazeretler;
end;

procedure TfrmMazeretList.btnSilClick(Sender: TObject);
var
    selectedVal : Variant;
    secim : integer;
begin
    selectedVal := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Id').Index];
    secim := MessageDlg('Kayıdı silmek istiyormusunuz ?',mtConfirmation,mbYesNo,1);
    if secim = mrYes then begin
      with frmDb do
      begin
        if not dbHelper.Connected then
          dbHelper.Connect;
        with myQuery do
        begin
          try
            SQL.Clear;
            SQL.Text := Format('delete from mazeretler where Id = %s',[selectedVal]);
            ExecSQL;
            qMazeretList.Close;
            qMazeretList.Open;
            ShowMessage('Kayıt Silindi');
          except
            on E: Exception do
              ShowMessage(E.Message);
          end;
        end;
      end;
    end;
end;

procedure TfrmMazeretList.cxGridDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  IValue : Variant;
begin
  if Assigned(AViewInfo) then begin
    IValue := Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex , cxGridDBTableView.GetColumnByFieldName('Kalan').Index);
    if IValue = null then
       Exit;

    if StrToInt(IValue) <= 0 then
        ACanvas.Brush.Color := clOlive;
  end;
end;

procedure TfrmMazeretList.FormShow(Sender: TObject);
begin
  LoadMazeretler;
  localizer.FileName := Format('%s\turkce.ini',[GetCurrentDir]);
  localizer.Active := true;
  localizer.Locale := 1055;

end;

procedure TfrmMazeretList.LoadMazeretler;
begin
    with frmDb do
    begin
      if not dbHelper.Connected then
        dbHelper.Connect;
      cxGridDBTableView.ClearItems;
      with qMazeretList do
      begin
        try
          Activate;
          Close;
          Open;
        except
          on E: Exception do
            ShowMessage(E.Message);
        end;
      end;
      cxGridDBTableView.DataController.CreateAllItems();

      with myQuery do begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from GetMazeretliEkmekAdedi';
          ExecSQL;

          lblTpMzEkmAdt.Caption := Format('%s adet mazeretli ekmeği var.',
                                    [IfThen(FieldByName('Adet').AsString = '','0',FieldByName('Adet').AsString)]);
      end;
    end;
end;

end.
