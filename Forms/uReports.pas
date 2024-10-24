﻿unit uReports;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue,
  cxContainer, cxEdit, cxListView, Uni, frxClass,
  Vcl.Menus, cxButtons, cxGroupBox, frxDesgn, dxSkinOffice2019Colorful,
  System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls,System.IOUtils,
  dxUIAClasses;

type
  TfrmReports = class(TForm)
    imgList32: TcxImageList;
    reporter: TfrxReport;
    btnGroups: TcxGroupBox;
    btnYazdir: TcxButton;
    btnYeni: TcxButton;
    btnDuzenle: TcxButton;
    frxDesigner: TfrxDesigner;
    SaveDialog: TSaveDialog;
    lstReports: TcxListView;
    popupMenu: TPopupMenu;
    btnSil: TMenuItem;
    btnRefresh: TMenuItem;
    imgList16: TcxImageList;
    procedure btnYeniClick(Sender: TObject);
    function frxDesignerSaveReport(Report: TfrxReport; SaveAs: Boolean)
      : Boolean;
    procedure FormShow(Sender: TObject);
    procedure lstReportsDblClick(Sender: TObject);
    procedure btnDuzenleClick(Sender: TObject);
    procedure lstReportsClick(Sender: TObject);
    procedure btnYazdirClick(Sender: TObject);
    procedure btnSilClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    procedure LoadReports;
    { Private declarations }
  public
    selectedReport: integer;
  end;

var
  frmReports: TfrmReports;

implementation

{$R *.dfm}

uses uDbHelper, uGlobals;

procedure TfrmReports.btnDuzenleClick(Sender: TObject);
var
  bReportPath: string;
  bQuery: TUniQuery;
begin
  bReportPath := lstReports.Selected.SubItems[2];
  with frmDb do
  begin
    if not dbHelper.Connected then
      dbHelper.Connect;
    bQuery := TUniQuery.Create(Self);
    with bQuery do
    begin
      try
        Connection := dbHelper;
        frxUserList.DataSet := bQuery;
        SQL.Clear;
        SQL.Text := 'select * from users';
        Activate;
        Close;
        Open;

        with reporter do
        begin
          LoadFromFile(bReportPath);
          DesignReport();
        end;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    end;
    FreeAndNil(bQuery);
  end;
end;

procedure TfrmReports.btnRefreshClick(Sender: TObject);
begin
  LoadReports;
end;

procedure TfrmReports.btnSilClick(Sender: TObject);
var
  selectedItem: TListItem;
begin
  if lstReports.Items.Count = 0 then
    Exit;

  selectedItem := lstReports.Selected;

  if MessageDlg('Raporu silmek istiyormusunuz.', TMsgDlgType.mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    try
      if ToDatabase(format('delete from reports where Id = %s',
        [selectedItem.Caption])) then
      begin
        if FileExists(selectedItem.SubItems[2]) then
        begin
          DeleteFile(selectedItem.SubItems[2]);
        end;
      end;
    except
      On E: Exception do
        ShowMessage(E.Message);
    end;
  end;

  LoadReports;
end;

procedure TfrmReports.btnYazdirClick(Sender: TObject);
var
  bQuery: TUniQuery;
begin
  if lstReports.Items.Count = 0 then
    Exit;

  var selectedItem := lstReports.Selected;

  if selectedItem = nil then
    Exit;

  with frmDb do
  begin
    if not dbHelper.Connected then
      dbHelper.Connect;
    bQuery := TUniQuery.Create(Self);
    with bQuery do
    begin
      try
        Connection := dbHelper;
        frxUserList.DataSet := bQuery;
        SQL.Clear;
        SQL.Text := 'select * from users';
        Activate;
        Close;
        Open;

        with reporter do
        begin
          DataSet := frxUserList;
          LoadFromFile(lstReports.Selected.SubItems[2]);
          PrepareReport(True);
          Print;
        end;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    end;
    FreeAndNil(bQuery);
  end;
end;

procedure TfrmReports.btnYeniClick(Sender: TObject);
begin
  with frmDb do
  begin
    if not dbHelper.Connected then
      dbHelper.Connect;

    with reporter do
    begin
      DataSets.Clear;
      DataSets.ClearAndResetID;
      EngineOptions.UseGlobalDataSetList := true;
      EnabledDataSets.Add(frxUserList);
      EnabledDataSets.Add(frxHareketList);
      Clear;
      DesignReport();
    end;
  end;
end;

procedure TfrmReports.FormShow(Sender: TObject);
begin
  LoadReports;
end;

procedure TfrmReports.LoadReports;
var
  bQuery: TUniQuery;
  bItem: TListItem;
begin
  with frmDb do
  begin
    if not dbHelper.Connected then
      dbHelper.Connect;
    lstReports.Items.Clear;
    bQuery := TUniQuery.Create(Self);
    with bQuery do
    begin
      try
        Connection := dbHelper;
        SQL.Clear;
        SQL.Text := 'select * from reports';
        Activate;
        Close;
        Open;
        while not EOF do
        begin
          bItem := lstReports.Items.Add;
          bItem.Caption := FieldByName('Id').AsString;
          bItem.SubItems.Add(FieldByName('Name').AsString);
          bItem.SubItems.Add(FieldByName('Date').AsString);
          bItem.SubItems.Add(FieldByName('ReportFile').AsString);
          Next;
        end;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
      FreeAndNil(bQuery);
    end;
  end;
end;

procedure TfrmReports.lstReportsClick(Sender: TObject);
begin
  if lstReports.Items.Count > 0 then begin
    try
      selectedReport := StrToInt(lstReports.Selected.Caption);
    except
    end;
  end;
end;

procedure TfrmReports.lstReportsDblClick(Sender: TObject);
var
  bReportPath: string;
  bQuery: TUniQuery;
begin
  bReportPath := lstReports.Selected.SubItems[2];

  if not FileExists(bReportPath) then
  begin
    ShowMessage('Rapor dosyası yok yada yeri yanlış.');
    Exit;
  end;

  with frmDb do
  begin
    if not dbHelper.Connected then
      dbHelper.Connect;
    bQuery := TUniQuery.Create(Self);
    with bQuery do
    begin
      try
        Connection := dbHelper;
        frxUserList.DataSet := bQuery;
        SQL.Clear;
        SQL.Text := 'select * from users';
        Activate;
        Close;
        Open;

        with reporter do
        begin
          LoadFromFile(bReportPath);
          PrepareReport(True);
          ShowPreparedReport;
        end;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    end;
    FreeAndNil(bQuery);
  end;
end;

function TfrmReports.frxDesignerSaveReport(Report: TfrxReport;
  SaveAs: Boolean): Boolean;
var
  bReportName: string;
begin
  frxDesigner.CloseQuery := false;

  if SaveAs then
  begin
    bReportName := InputBox('Rapor Kayıt', 'Rapor Adı', '');
    SaveDialog.InitialDir := GetCurrentDir;
    SaveDialog.FileName := bReportName;
    if SaveDialog.Execute then
    begin
      with frmDb do
      begin
        if not dbHelper.Connected then
          dbHelper.Connect;
        with myQuery do
        begin
          try
            SQL.Clear;
            SQL.Text :=
              'insert into reports (Name,Date,ReportFile) values(:name,:date,:file)';
            ParamByName('name').Value := bReportName;
            ParamByName('date').Value := DateToStr(Now);
            ParamByName('file').Value := SaveDialog.FileName;
            Execute;
          except
            on E: Exception do
              ShowMessage(E.Message);
          end;
        end;
      end;
      Report.SaveToFile(SaveDialog.FileName);
    end;
  end
  else
  begin
    with frmDb do
    begin
      if not dbHelper.Connected then
        dbHelper.Connect;
      with myQuery do
      begin
        try
          SQL.Clear;
          SQL.Text :=
            'update reports SET Name = :name,Date = :date,ReportFile = :file where Id = :Id';
          ParamByName('name').Value := TPath.GetFileNameWithoutExtension(lstReports.Selected.SubItems[2])	;
          ParamByName('date').Value := DateToStr(Now);
          ParamByName('file').Value := lstReports.Selected.SubItems[2];
          ParamByName('Id').Value := selectedReport;
          Execute;
        except
          on E: Exception do
            ShowMessage(E.Message);
        end;
      end;
    end;
    Report.SaveToFile(lstReports.Selected.SubItems[2]);
  end;

  LoadReports;
end;

end.
