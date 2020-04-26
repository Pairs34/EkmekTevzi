unit uHareketler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
  cxGridTableView, cxGridDBTableView, cxGrid,
  cxLocalization, Vcl.Menus, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxCalendar, Vcl.ExtCtrls,
  cxButtons, cxLabel,ClipBrd,Uni,StrUtils,
  cxProgressBar, Datasnap.DBClient,DateUtils,System.Diagnostics,
  dxSkinOffice2019Colorful,
  System.ImageList, Vcl.ImgList, cxImageList, cxCustomData, cxFilter, cxData,
  dxDateRanges;

type
  TfrmHareket = class(TForm)
    hareketlerLocalizer: TcxLocalizer;
    popupMenu: TPopupMenu;
    btnReport: TMenuItem;
    pnlHeader: TPanel;
    lblYear: TLabel;
    lblAy: TLabel;
    txtAy: TcxComboBox;
    btnFilter: TcxButton;
    pnlFooter: TPanel;
    lblAylikToplam: TcxLabel;
    txtAylikToplam: TcxLabel;
    cxStyleRepository: TcxStyleRepository;
    cxRedStyle: TcxStyle;
    cxGreenStyle: TcxStyle;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    txtYil: TcxComboBox;
    KartIdKopyala1: TMenuItem;
    imgList: TcxImageList;
    cxBlueStyle: TcxStyle;
    MyDataSource: TDataSource;
    btnAddEkmek: TMenuItem;
    cbBagisTuru: TcxComboBox;
    lblBagisTuru: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure CloseUniq(Sender : TObject; var Action : TCloseAction);
    procedure btnFilterClick(Sender: TObject);
    procedure cxGridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure KartIdKopyala1Click(Sender: TObject);
    procedure btnAddEkmekClick(Sender: TObject);
    procedure popupMenuPopup(Sender: TObject);
  private
    procedure LoadHareketlerYeni;
    procedure GetHareketler(Yil,Ay : integer);
    procedure AddHareket(KartId: string; day: Word; paramstr: Char);
  public
    { Public declarations }
  end;

type
  THareket = record
    KartId : string;
    Name : string;
    Days : array[1..31] of Char;
  end;
var
  frmHareket: TfrmHareket;
  HareketList : array of THareket;
  MyDataset : TClientDataSet;
  bWatch : TStopWatch;
implementation

{$R *.dfm}

uses uDbHelper, uGlobals, uReports;

{ TfrmHareket }

procedure TfrmHareket.AddHareket(KartId: string; day: Word; paramstr: Char);
var
  i : integer;
begin
   for i := 0 to Length(HareketList) - 1 do begin
       if (HareketList[i].KartId = KartId) then begin
          HareketList[i].days[day] := paramstr;
       end;
   end;
end;

procedure TfrmHareket.btnAddEkmekClick(Sender: TObject);
var
  bClName,bKartId,bAdSoyad,bValue : string;
  bClDate : TDateTime;
  bYil,bMonth,bDay : integer;
begin
  bKartId := cxGridDBTableView.Controller.FocusedRow
                          .Values[cxGridDBTableView.GetColumnByFieldName('KartId').Index];

  bAdSoyad := cxGridDBTableView.Controller.FocusedRow
                          .Values[cxGridDBTableView.GetColumnByFieldName('AdSoyad').Index];

  bClName := cxGridDBTableView.Controller.FocusedColumn.Caption;

  bValue := cxGridDBTableView.Controller.FocusedRow
                          .Values[cxGridDBTableView.GetColumnByFieldName(bClName).Index];

  if bValue = 'X' then
  begin
    ShowMessage('Daha �nce ' + cbBagisTuru.Text + ' verilmi�');
    Exit;
  end;

  bYil := StrToInt(txtYil.Text);
  bMonth := StrToInt(Format('%.*d',[2, txtAy.SelectedItem + 1]));
  bDay := StrToInt(IfTHen(StrToInt(bClName) < 10,'0'+bClName,bClName));


  bClDate := RecodeDate(Now,bYil,bMonth,bDay);

  EkmekVer(bKartId,cbBagisTuru.Text,bAdSoyad,bClDate);

  LoadHareketlerYeni;

  ShowMessage(cbBagisTuru.Text + ' verildi.');
end;

procedure TfrmHareket.btnFilterClick(Sender: TObject);
begin
  LoadHareketlerYeni;
end;

procedure TfrmHareket.btnReportClick(Sender: TObject);
var
  bReports : TfrmReports;
begin
  bReports := TfrmReports.Create(Self);
  bReports.OnClose := CloseUniq;
  bReports.Show;
end;

procedure TfrmHareket.CloseUniq(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;


procedure TfrmHareket.cxGridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if not Assigned(AItem) then
      Exit;

    if AItem.Index > 3 then begin
      if ARecord.Values[AItem.Index] = 'X' then begin
        AStyle := cxGreenStyle;
      end else if ARecord.Values[AItem.Index] = 'M' then begin
        AStyle := cxBlueStyle;
      end else begin
        AStyle := cxRedStyle;
      end;
    end;
end;

procedure TfrmHareket.FormShow(Sender: TObject);
var
  bSqlCode : string;
  bQuery   : TUniQuery;
begin
  ToTranslate(hareketlerLocalizer);
  txtYil.EditValue := FormatDateTime('yyyy',Now);

  bSqlCode := 'select * from bagisturu';
  bQuery := FromDatabase(bSqlCode);
  cbBagisTuru.Properties.Items.Clear;
  with bQuery do
  begin
    try
      while not EOF do
      begin
        cbBagisTuru.Properties.Items.Add(FieldByName('BagisAdi').AsString);
        Next;
      end;
    except
      on E: EAccessViolation do
    end;
  end;

  ClearGrid(cxGridDBTableView);
end;

procedure TfrmHareket.GetHareketler(Yil, Ay: integer);
var
    bQuery : TUniQuery;
    bHareket : THareket;
    bYear,bMonth,bDay : word;
begin
    bQuery := TUniQuery.Create(nil);
    with bQuery do begin
      Connection := frmDb.dbHelper;
      Close;
      SQL.Clear;
      SQL.Add('select * from hareket where YEAR(IslemZamani) = '+QuotedStr(Yil.ToString)+' and MONTH(IslemZamani) = '
                              +QuotedStr(IfTHen(Ay < 10,'0'+Ay.ToString,Ay.ToString)));
      ExecSql;

      while not eof do
      begin
        with bHareket do begin
          KartId := FieldByName('KartId').AsString;
          Name := FieldByName('AdSoyad').AsString;
          DecodeDate(FieldByName('IslemZamani').AsDateTime,bYear,bMonth,bDay);
          AddHareket(KartId,bDay,'X');
        end;
        Next;
      end;
    end;
end;

procedure TfrmHareket.KartIdKopyala1Click(Sender: TObject);
begin
  Clipboard.AsText := cxGridDBTableView.Controller.FocusedRow
                          .Values[cxGridDBTableView.GetColumnByFieldName('KartId').Index];
end;

procedure TfrmHareket.LoadHareketlerYeni;
var
  I: integer;
  X,Y,LastDay : integer;
  IsAvailable : string;
  bQuery : TUniQuery;
begin
    cxGridDBTableView.ClearItems;

    with frmDb do begin
        with GetBagisList do begin
          ParamByName('Yil').AsInteger := StrToInt(txtYil.Text);
          ParamByName('Ay').AsInteger := txtAy.SelectedItem + 1;
          ParamByName('BagisTuru').AsString := cbBagisTuru.Text;
          Prepare;
          ExecProc;
        end;
    end;

    cxGridDBTableView.DataController.DataSource := frmDb.tblBagisList;
    cxGridDBTableView.DataController.CreateAllItems;

    Exit;

    bQuery := TUniQuery.Create(Self);

    if Assigned(MyDataset) then
       MyDataset.Free;

    LastDay := DayOf(EndOfAMonth(StrToInt(txtYil.Text),txtAy.SelectedItem + 1));

    MyDataset := TClientDataSet.Create(nil);
    with frmDb do
    begin
        if not dbHelper.Connected then
           dbHelper.Connect;

           cxGridDBTableView.ClearItems;

           with bQuery do begin
              Connection := frmDb.dbHelper;
              SQL.Clear;
              SQL.Add('select * from users');
              Open;
              First;

              while not eof do
              begin
                 SetLength(HareketList,I+1);
                 HareketList[I].KartId := FieldByName('KartId').AsString;
                 HareketList[I].Name := FieldByName('AdSoyad').AsString;
                 Next;
                 I := I+1;
              end;
              SetLength(HareketList,I);
           end;

          MyDataset.FieldDefs.Add('KartId',ftString,15);
          MyDataset.FieldDefs.Add('Name',ftString,30);
          for I := 1 to LastDay do
          begin
             MyDataset.FieldDefs.Add(I.ToString, ftString, 3);
          end;
          MyDataset.CreateDataSet;

          GetHareketler(StrToInt(txtYil.Text),StrToInt(Format('%.*d',[2, txtAy.SelectedItem + 1])));

          for Y := 0 to Length(HareketList) -1 do
          begin
              MyDataset.Open;
              MyDataset.Append;
              MyDataset.FieldByName('KartId').Value := HareketList[Y].KartId;
              MyDataset.FieldByName('Name').Value := HareketList[Y].Name;
              for X := 1 to LastDay do
              begin

                IsAvailable := HareketList[Y].Days[X];
                MyDataset.FieldByName(''+ X.ToString +'').AsString := IfThen(IsAvailable = 'X',IsAvailable,
                                CheckMazeret(HareketList[Y].KartId,StrToInt(txtYil.Text),
                                StrToInt(Format('%.*d',[2, txtAy.SelectedItem + 1])),X));

              end;
          end;

          MyDataSource.DataSet := MyDataset;
          cxGridDBTableView.DataController.DataSource := MyDataSource;
          cxGridDBTableView.DataController.CreateAllItems;

          with qSumBagis do
          begin
            Close;
            ParamByName('Yil').AsString := txtYil.Text;
            ParamByName('Ay').AsString := Format('%.*d',[2, txtAy.SelectedItem + 1]);
            Open;

            txtAylikToplam.Caption := FieldByName('Adet').AsString;
          end;
          cxGridDBTableView.Controller.TopRowIndex := 0;
    end;
end;

procedure TfrmHareket.popupMenuPopup(Sender: TObject);
begin
  popupMenu.Items[2].Caption := cbBagisTuru.Text + ' Ver';
end;

end.
