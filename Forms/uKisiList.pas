unit uKisiList;

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
  cxDBData, dxBarBuiltInMenu, cxGridCustomPopupMenu,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxPC,
  dxDockControl, dxDockPanel, StrUtils,
  frxDesgn, frxClass,  cxLocalization,ClipBrd,
  dxSkinOffice2019Colorful,
  dxStatusBar, cxCustomData, cxFilter, cxData, dxDateRanges, System.ImageList,
  Vcl.ImgList, cxImageList;

type
  TfrmKisiList = class(TForm)
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    PopupMenu: TPopupMenu;
    btnSil: TMenuItem;
    btnDegistir: TMenuItem;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewAdSoyad: TcxGridDBColumn;
    cxGridDBTableViewAdet: TcxGridDBColumn;
    cxGridDBTableViewAktif: TcxGridDBColumn;
    cxGridDBTableViewAciklama: TcxGridDBColumn;
    cxGridDBTableViewKartId: TcxGridDBColumn;
    cxGridDBTableViewTelNo: TcxGridDBColumn;
    cxGridDBTableViewAdres: TcxGridDBColumn;
    cxGridDBTableViewNufus: TcxGridDBColumn;
    btnRefresh: TMenuItem;
    btnReport: TMenuItem;
    imgList: TcxImageList;
    reporter: TfrxReport;
    localizer: TcxLocalizer;
    KartIDKopyala1: TMenuItem;
    btnMazeretEkle: TMenuItem;
    statusKisilist: TdxStatusBar;
    btnExportUsers: TMenuItem;
    btnGunlukHareketler: TMenuItem;
    KiiHareketleri1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSilClick(Sender: TObject);
    procedure btnDegistirClick(Sender: TObject);
    procedure CloseUniq(Sender : TObject; var Action : TCloseAction);
    procedure cxGridDBTableViewDblClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure KartIDKopyala1Click(Sender: TObject);
    procedure btnMazeretEkleClick(Sender: TObject);
    procedure cxGridDBTableViewDataControllerDataChanged(Sender: TObject);
    procedure btnExportUsersClick(Sender: TObject);
    procedure btnGunlukHareketlerClick(Sender: TObject);
    procedure KiiHareketleri1Click(Sender: TObject);
  private
    procedure LoadKisiler;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKisiList: TfrmKisiList;

implementation

{$R *.dfm}

uses uDbHelper, uKisiEkle, Uni, uReports, uMazeret,cxGridExportLink,Vcl.FileCtrl,
  uViewHareket;

procedure TfrmKisiList.btnDegistirClick(Sender: TObject);
var
  nKisiEdit : TfrmKisiEkle;
  bKisi : TKisi;
begin
  with bKisi do begin
      try
        Id := StrToInt(cxGridDBTableView.Controller.FocusedRow
                                .Values[cxGridDBTableView.GetColumnByFieldName('Id').Index]);
      except
      end;
      try
        AdSoyad := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('AdSoyad').Index];
      except
      end;
      try
        EkmekAdedi := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Adet').Index];
      except
      end;
      try
        Aktif := StrToBool(IfThen(cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Aktif').Index] = 'Aktif','true','false'));
      except
      end;
      try
        Aciklama := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Aciklama').Index];
      except
      end;
      try
        CardId := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('KartId').Index];
      except
      end;
      try
        TelNo := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('TelNo').Index];
      except
      end;
      try
        Adres := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Adres').Index];
      except
      end;
      try
        Nufus := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Nufus').Index];
      except
      end;
      Action := 'edit';
  end;

  nKisiEdit := TfrmKisiEkle.Create(Self,bKisi);
  nKisiEdit.OnClose := CloseUniq;
  nKisiEdit.Show;
end;

procedure TfrmKisiList.CloseUniq(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmKisiList.cxGridDBTableViewDataControllerDataChanged(
  Sender: TObject);
begin
statusKisilist.Panels[1].Text := cxGridDBTableView.DataController.FilteredRecordCount.ToString;
end;

procedure TfrmKisiList.cxGridDBTableViewDblClick(Sender: TObject);
var
  nKisiEdit : TfrmKisiEkle;
  bKisi : TKisi;
begin
  with bKisi do begin
      try
        Id := StrToInt(cxGridDBTableView.Controller.FocusedRow
                                .Values[cxGridDBTableView.GetColumnByFieldName('Id').Index]);
      except
      end;
      try
        AdSoyad := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('AdSoyad').Index];
      except
      end;
      try
        EkmekAdedi := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Adet').Index];
      except
      end;
      try
        Aktif := StrToBool(IfThen(cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Aktif').Index] = 'Aktif','true','false'));
      except
      end;
      try
        Aciklama := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Aciklama').Index];
      except
      end;
      try
        CardId := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('KartId').Index];
      except
      end;
      try
        TelNo := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('TelNo').Index];
      except
      end;
      try
        Adres := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Adres').Index];
      except
      end;
      try
        Nufus := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('Nufus').Index];
      except
      end;

      Action := 'view';
  end;

  nKisiEdit := TfrmKisiEkle.Create(Self,bKisi);
  nKisiEdit.OnClose := CloseUniq;
  nKisiEdit.Show;
end;

procedure TfrmKisiList.FormShow(Sender: TObject);
begin
  LoadKisiler;
  localizer.FileName := Format('%s\turkce.ini',[GetCurrentDir]);
  localizer.Active := true;
  localizer.Locale := 1055;

  cxGridDBTableView.BeginUpdate();
  cxGridDBTableView.ApplyBestFit();
  cxGridDBTableView.EndUpdate();
end;

procedure TfrmKisiList.KartIDKopyala1Click(Sender: TObject);
begin
    Clipboard.AsText := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('KartId').Index];
end;

procedure TfrmKisiList.KiiHareketleri1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmKisiHareketleri,frmKisiHareketleri);
    frmKisiHareketleri.bKartIdFilter := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('KartId').Index];
    frmKisiHareketleri.ShowModal;
end;

procedure TfrmKisiList.btnExportUsersClick(Sender: TObject);
var
  sDir : string;
  MyClass: TComponent;
begin
   SelectDirectory('Veritabaný Yedeði Alýnacak Dizini Seçiniz','',sDir);

   if sDir <> '' then
   begin
     try
       ExportGridToXLSX(sDir + PathDelim + 'KisiListesi',cxGrid,true,true,true,'xlsx',nil);
     except on E: Exception do begin
       ShowMessage('Excel''e aktarýlýrkan hata oluþtu.' + E.Message);
     end;
     end;
   end;
end;

procedure TfrmKisiList.btnGunlukHareketlerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmKisiHareketleri,frmKisiHareketleri);
    frmKisiHareketleri.ShowModal;
end;

procedure TfrmKisiList.btnMazeretEkleClick(Sender: TObject);
var
  bText : string;
begin
  bText := cxGridDBTableView.Controller.FocusedRow
                        .Values[cxGridDBTableView.GetColumnByFieldName('KartId').Index];

  if (bText <> '') then
  begin
    Application.CreateForm(TfrmMazeret,frmMazeret);
    frmMazeret.txtKartID.Text := bText;
    frmMazeret.ShowModal;
  end else begin
    ShowMessage('Kart ID boþ olmamalý.');
  end;
end;

procedure TfrmKisiList.btnRefreshClick(Sender: TObject);
begin
   LoadKisiler;
end;

procedure TfrmKisiList.btnReportClick(Sender: TObject);
var
  bReports : TfrmReports;
begin
  bReports := TfrmReports.Create(Self);
  bReports.OnClose := CloseUniq;
  bReports.Show;
end;

procedure TfrmKisiList.LoadKisiler;
begin
    with frmDb do
    begin
      if not dbHelper.Connected then
        dbHelper.Connect;
      cxGridDBTableView.ClearItems;
      with qUserList do
      begin
        try
          SQL.Clear;
          SQL.Text := 'select * from users';
          Close;
          Open;
        except
          on E: Exception do
            ShowMessage(E.Message);
        end;
      end;
      cxGridDBTableView.DataController.CreateAllItems();
    end;
end;

procedure TfrmKisiList.btnSilClick(Sender: TObject);
var
    selectedVal : Variant;
    secim : integer;
begin
    selectedVal := cxGridDBTableView.Controller.FocusedRow.Values[0];
    secim := MessageDlg('Kayýdý silmek istiyormusunuz ?',mtConfirmation,mbYesNo,1);
    if secim = mrYes then begin
      with frmDb do
      begin
        if not dbHelper.Connected then
          dbHelper.Connect;
        with myQuery do
        begin
          try
            SQL.Clear;
            SQL.Text := Format('delete from users where Id = %s',[selectedVal]);
            ExecSQL;
            qUserList.Close;
            qUserList.Open;
            ShowMessage('Kayýt Silindi');
          except
            on E: Exception do
              ShowMessage(E.Message);
          end;
        end;
      end;
    end;

end;

end.
