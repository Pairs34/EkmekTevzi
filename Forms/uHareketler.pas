﻿unit uHareketler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridDBDataDefinitions,
  cxLocalization, Vcl.Menus, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls,
  cxButtons, cxLabel, ClipBrd, Uni, StrUtils,
  cxProgressBar, Datasnap.DBClient, DateUtils, System.Diagnostics,
  dxSkinOffice2019Colorful,
  System.ImageList, Vcl.ImgList, cxImageList, cxCustomData, cxFilter, cxData,
  dxDateRanges, FileCtrl, cxGridExportLink, Vcl.Tabs, Vcl.DockTabSet, System.Character  ,
  dxScrollbarAnnotations, dxUIAClasses;

type
  TfrmHareket = class(TForm)
    hareketlerLocalizer: TcxLocalizer;
    popupMenu: TPopupMenu;
    btnReport: TMenuItem;
    cxStyleRepository: TcxStyleRepository;
    cxRedStyle: TcxStyle;
    cxGreenStyle: TcxStyle;
    KartIdKopyala1: TMenuItem;
    ImgList: TcxImageList;
    cxBlueStyle: TcxStyle;
    btnAddEkmek: TMenuItem;
    btnExportXls: TMenuItem;
    PageControl: TPageControl;
    tabMonthly: TTabSheet;
    cxGridMonthly: TcxGrid;
    cxGridMonthlyDBTableView: TcxGridDBTableView;
    cxGridMonthlyLevel: TcxGridLevel;
    pnlFooterMonthly: TPanel;
    lblMonthlyCount: TcxLabel;
    txtMonthlyCount: TcxLabel;
    lblDailyCount: TcxLabel;
    txtDailyCount: TcxLabel;
    pnlHeaderMonthly: TPanel;
    lblYear: TLabel;
    lblAy: TLabel;
    lblBagisTuru: TLabel;
    txtAy: TcxComboBox;
    btnFilter: TcxButton;
    txtYil: TcxComboBox;
    cbBagisTuru: TcxComboBox;
    tabDaily: TTabSheet;
    pnlHeaderDaily: TPanel;
    lblDailyYear: TLabel;
    lblDailyMonth: TLabel;
    lblDailyBagisTur: TLabel;
    txtDailyMonth: TcxComboBox;
    btnLoadDailyData: TcxButton;
    txtDailyYear: TcxComboBox;
    txtDailyBagisTur: TcxComboBox;
    cxGridDaily: TcxGrid;
    cxGridDBTableViewDaily: TcxGridDBTableView;
    cxGridLevelDaily: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure CloseUniq(Sender: TObject; var Action: TCloseAction);
    procedure btnFilterClick(Sender: TObject);
    procedure cxGridDBTableViewStylesGetContentStyle
      (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure KartIdKopyala1Click(Sender: TObject);
    procedure btnAddEkmekClick(Sender: TObject);
    procedure popupMenuPopup(Sender: TObject);
    procedure btnExportXlsClick(Sender: TObject);
    procedure btnLoadDailyDataClick(Sender: TObject);
    procedure cxGridDBTableViewDailyStylesGetContentStyle
      (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cxGridMonthlyDBTableViewDataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
  private
    procedure LoadHareketlerYeni;
    procedure LoadHareketlerGunluk;
//    procedure GetHareketler(Yil, Ay: integer);
    procedure AddHareket(KartId: string; day: Word; paramstr: Char);
  public
    { Public declarations }
  end;

type
  THareket = record
    KartId: string;
    Name: string;
    Days: array [1 .. 31] of Char;
  end;

var
  frmHareket: TfrmHareket;
  HareketList: array of THareket;
  MyDataset: TClientDataSet;
  bWatch: TStopWatch;

implementation

{$R *.dfm}

uses uDbHelper, uGlobals;

{ TfrmHareket }

procedure TfrmHareket.AddHareket(KartId: string; day: Word; paramstr: Char);
var
  i: integer;
begin
  for i := 0 to Length(HareketList) - 1 do
  begin
    if (HareketList[i].KartId = KartId) then
    begin
      HareketList[i].Days[day] := paramstr;
    end;
  end;
end;

procedure TfrmHareket.btnAddEkmekClick(Sender: TObject);
var
  bClName, bKartId, bAdSoyad, bValue: string;
  bClDate: TDateTime;
  bYil, bMonth, bDay: integer;
begin
  if cxGridMonthlyDBTableView.DataController.RecordCount > 0 then
  begin
    bKartId := cxGridMonthlyDBTableView.Controller.FocusedRow.Values
      [cxGridMonthlyDBTableView.GetColumnByFieldName('KartId').Index];

    bAdSoyad := cxGridMonthlyDBTableView.Controller.FocusedRow.Values
      [cxGridMonthlyDBTableView.GetColumnByFieldName('AdSoyad').Index];

    bClName := cxGridMonthlyDBTableView.Controller.FocusedColumn.Caption;

    try
      bValue := cxGridMonthlyDBTableView.Controller.FocusedRow.Values
        [cxGridMonthlyDBTableView.GetColumnByFieldName(bClName).Index];
    Except
      bValue := '';
    end;

    if StrToIntDef(bValue, 0) <> 0 then
    begin
      ShowMessage('Daha önce ' + cbBagisTuru.Text + ' verilmiş');
      Exit;
    end;

    bYil := StrToInt(txtYil.Text);
    bMonth := StrToInt(Format('%.*d', [2, txtAy.SelectedItem + 1]));
    bDay := StrToInt(IfTHen(StrToInt(bClName) < 10, '0' + bClName, bClName));

    bClDate := RecodeDate(Now, bYil, bMonth, bDay);

    EkmekVer(bKartId, cbBagisTuru.Text, bAdSoyad, bClDate);

    LoadHareketlerYeni;

    ShowMessage(cbBagisTuru.Text + ' verildi.');
  end;
end;

procedure TfrmHareket.btnExportXlsClick(Sender: TObject);
var
  sDir: string;
  MyClass: TComponent;
begin
  SelectDirectory('Hareket Listesi Yedeği Alınacak Dizini Seçiniz', '', sDir);

  if sDir <> '' then
  begin
    try
      ExportGridToXLSX(sDir + PathDelim + 'BagisListesi', cxGridMonthly, true,
        true, true, 'xlsx', nil);
    except
      on E: Exception do
      begin
        ShowMessage('Excel''e aktarılırken hata oluþtu.' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmHareket.btnFilterClick(Sender: TObject);
begin
  LoadHareketlerYeni;
end;

procedure TfrmHareket.btnLoadDailyDataClick(Sender: TObject);
begin
  LoadHareketlerGunluk;
end;

procedure TfrmHareket.btnReportClick(Sender: TObject);
//var
//  bReports: TfrmReports;
begin
//  bReports := TfrmReports.Create(Self);
//  bReports.OnClose := CloseUniq;
//  bReports.Show;
end;

procedure TfrmHareket.CloseUniq(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmHareket.cxGridDBTableViewDailyStylesGetContentStyle
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if not Assigned(AItem) then
    Exit;

  if AItem.Index > 4 then
  begin
   var recordValue := ARecord.Values[AItem.Index];
    if StrToIntDef(ARecord.Values[AItem.Index], 0) <> 0 then
    begin
      AStyle := cxGreenStyle;
    end
    else if ARecord.Values[AItem.Index] = 'M' then
    begin
      AStyle := cxBlueStyle;
    end
    else if VarToStr(ARecord.Values[AItem.Index]) = '' then
    begin
      AStyle := cxRedStyle;
    end;
  end;
end;

procedure TfrmHareket.cxGridDBTableViewStylesGetContentStyle
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if not Assigned(AItem) then
    Exit;

  if AItem.Index > 4 then
  begin
    var recordValue := ARecord.Values[AItem.Index];
    if VarIsNull(recordValue) then
       Exit;

    if StrToIntDef(ARecord.Values[AItem.Index], 0) <> 0 then
      begin
        AStyle := cxGreenStyle;
      end
      else if ARecord.Values[AItem.Index] = 'M' then
      begin
        AStyle := cxBlueStyle;
      end
      else
      begin
        AStyle := cxRedStyle;
      end;
  end;
end;

procedure TfrmHareket.cxGridMonthlyDBTableViewDataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
begin
   if not VarIsNull(OutArguments.Value) then
   begin
      if StrToIntDef(OutArguments.Value, 0) = 0 then
      begin
        OutArguments.Done := true;
      end else begin
        OutArguments.Value := StrToFloat(OutArguments.Value);
        OutArguments.SummaryValue := StrToFloat(OutArguments.Value);
      end;
   end;
end;

procedure TfrmHareket.FormShow(Sender: TObject);
var
  bSqlCode: string;
  bQuery: TUniQuery;
begin
  ToTranslate(hareketlerLocalizer);
  txtYil.EditValue := FormatDateTime('yyyy', Now);
  txtDailyYear.EditValue := FormatDateTime('yyyy', Now);
  txtAy.EditValue := FormatDateTime('mmmm', Now);

  bSqlCode := 'select * from bagisturu';
  bQuery := FromDatabase(bSqlCode);
  cbBagisTuru.Properties.Items.Clear;
  with bQuery do
  begin
    try
      while not EOF do
      begin
        cbBagisTuru.Properties.Items.Add(FieldByName('BagisAdi').AsString);
        txtDailyBagisTur.Properties.Items.Add(FieldByName('BagisAdi').AsString);
        Next;
      end;
    except
      on E: EAccessViolation do
    end;
  end;

  ClearGrid(cxGridMonthlyDBTableView);
end;

//procedure TfrmHareket.GetHareketler(Yil, Ay: integer);
//var
//  bQuery: TUniQuery;
//  bHareket: THareket;
//  bYear, bMonth, bDay: Word;
//begin
//  bQuery := TUniQuery.Create(nil);
//  with bQuery do
//  begin
//    Connection := frmDb.dbHelper;
//    Close;
//    SQL.Clear;
//    SQL.Add('select * from hareket where YEAR(IslemZamani) = ' +
//      QuotedStr(Yil.ToString) + ' and MONTH(IslemZamani) = ' +
//      QuotedStr(IfTHen(Ay < 10, '0' + Ay.ToString, Ay.ToString)));
//    ExecSql;
//
//    while not EOF do
//    begin
//      with bHareket do
//      begin
//        KartId := FieldByName('KartId').AsString;
//        Name := FieldByName('AdSoyad').AsString;
//        DecodeDate(FieldByName('IslemZamani').AsDateTime, bYear, bMonth, bDay);
//        AddHareket(KartId, bDay, 'X');
//      end;
//      Next;
//    end;
//  end;
//end;

procedure TfrmHareket.KartIdKopyala1Click(Sender: TObject);
begin
  if cxGridMonthlyDBTableView.DataController.RecordCount > 0 then
    Clipboard.AsText := cxGridMonthlyDBTableView.Controller.FocusedRow.Values
      [cxGridMonthlyDBTableView.GetColumnByFieldName('KartId').Index];
end;

procedure TfrmHareket.LoadHareketlerGunluk;
begin
  cxGridDBTableViewDaily.ClearItems;

  with frmDb do
  begin
    with GetDailyBagis do
    begin
      ParamByName('Yil').AsInteger := StrToInt(txtDailyYear.Text);
      ParamByName('Ay').AsInteger := txtDailyMonth.SelectedItem + 1;
      ParamByName('BagisTuru').AsString := txtDailyBagisTur.Text;
      Prepare;
      ExecProc;
    end;
  end;

  frmDb.tblDailyBagis.DataSet.FindField('siralama').Visible := false;
  cxGridDBTableViewDaily.DataController.DataSource := frmDb.tblDailyBagis;
  cxGridDBTableViewDaily.DataController.CreateAllItems;
  cxGridDBTableViewDaily.ApplyBestFit();
end;

procedure TfrmHareket.LoadHareketlerYeni;
var
  I: Integer;
begin
  cxGridMonthlyDBTableView.ClearItems;

  with frmDb do
  begin
    with GetBagisList do
    begin
      ParamByName('Yil').AsInteger := StrToInt(txtYil.Text);
      ParamByName('Ay').AsInteger := txtAy.SelectedItem + 1;
      ParamByName('BagisTuru').AsString := cbBagisTuru.Text;
      Prepare;
      ExecProc;
    end;
  end;

  cxGridMonthlyDBTableView.DataController.DataSource := frmDb.tblBagisList;
  cxGridMonthlyDBTableView.DataController.CreateAllItems;
  cxGridMonthlyDBTableView.GetColumnByFieldName('AdSoyad').Width := 80;
  cxGridMonthlyDBTableView.GetColumnByFieldName('KartId').Width := 50;
  cxGridMonthlyDBTableView.GetColumnByFieldName('BagisTuru').Width := 50;

  for I := 5 to cxGridMonthlyDBTableView.ColumnCount do
  begin
    var sItemCount := cxGridMonthlyDBTableView.DataController.Summary.FooterSummaryItems.Count;
    var summaryItem := cxGridMonthlyDBTableView.DataController.Summary.FooterSummaryItems.Add;
      cxGridMonthlyDBTableView.DataController.Summary.FooterSummaryItems.Items[sItemCount]
        .ItemLink := cxGridMonthlyDBTableView.Columns[I];
      cxGridMonthlyDBTableView.DataController.Summary.FooterSummaryItems.Items[sItemCount]
        .Kind := skSum;
      cxGridMonthlyDBTableView.DataController.Summary.FooterSummaryItems.Items[sItemCount]
        .Position := spFooter;
      cxGridMonthlyDBTableView.DataController.Summary.FooterSummaryItems.Items[sItemCount].Format := '0';
  end;

  with frmDb do
  begin
    with monthlyCount do
    begin
      Close;
      ParamByName('Yil').AsString := txtYil.Text;
      ParamByName('Ay').AsString := Format('%.*d', [2, txtAy.SelectedItem + 1]);
      Open;

      txtMonthlyCount.Caption := FieldByName('Adet').AsString;
    end;

    with dailyCount do
    begin
      Close;
      Open;
      txtDailyCount.Caption := FieldByName('Adet').AsString;
    end;
  end;
end;

procedure TfrmHareket.popupMenuPopup(Sender: TObject);
begin
  popupMenu.Items[2].Caption := cbBagisTuru.Text + ' Ver';
end;

end.
