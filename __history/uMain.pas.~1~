unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, cxClasses, cxLookAndFeels, dxSkinsForm, Vcl.StdCtrls,
  AksReader_Library_3_0_TLB,
  Vcl.ExtCtrls, StrUtils, cxGraphics, cxControls, cxLookAndFeelPainters,
  dxNavBar,
  dxNavBarCollns, cxFilter,
  dxNavBarGroupItems, dxBarBuiltInMenu, cxPC, dxStatusBar,
  cxStyles, dxSkinOffice2019Colorful, cxImageList, System.ImageList,
  Vcl.ImgList, dxNavBarBase, cxSplitter, dxGDIPlusClasses, FileCtrl, Uni,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, dxCore;

type
  TfrmMain = class(TForm)
    btnConnect: TButton;
    pnlConnection: TPanel;
    lblComport: TLabel;
    lblBaud: TLabel;
    txtBaud: TEdit;
    btnDisconnect: TButton;
    imgList: TImageList;
    pageContainer: TcxPageControl;
    statusBar: TdxStatusBar;
    dxStatusBar1Container2: TdxStatusBarContainerControl;
    cxImageList1: TcxImageList;
    dxSkinController: TdxSkinController;
    Panel1: TPanel;
    dxNavBar: TdxNavBar;
    dxGroupMenu: TdxNavBarGroup;
    itmKisiAdd: TdxNavBarItem;
    navSeperator: TdxNavBarSeparator;
    itmKisiList: TdxNavBarItem;
    itmBagis: TdxNavBarItem;
    navSeperator2: TdxNavBarSeparator;
    navSeperator3: TdxNavBarSeparator;
    itmBagislar: TdxNavBarItem;
    navSeperator4: TdxNavBarSeparator;
    itmSettings: TdxNavBarItem;
    itmBagisEx: TdxNavBarItem;
    navSeperator5: TdxNavBarSeparator;
    navSeperator6: TdxNavBarSeparator;
    itmMazeretList: TdxNavBarItem;
    cxSplitter1: TcxSplitter;
    Image1: TImage;
    itmBackup: TdxNavBarItem;
    openDialog: TOpenDialog;
    cbComportList: TcxComboBox;
    itmRestore: TdxNavBarItem;
    navSeperator7: TdxNavBarSeparator;
    navSeperator8: TdxNavBarSeparator;
    procedure btnConnectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxNavbarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure ShowFormInTab(I: TComponentClass; var Referance;
      L: TdxNavBarItemLink; HiddenForm: Boolean = false;
      HiddenCaption: string = '');
    procedure pageContainerCanCloseEx(Sender: TObject; ATabIndex: Integer;
      var ACanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure OnReceiveText(ASender: TObject; const Reader: IReader;
      ReaderId: Byte; const Data: WideString);
    function FindFormByName(const AName: string): TForm;
    procedure OnDisconnected(ASender: TObject; const Reader: IReader);
    procedure OnConnected(ASender: TObject; const Reader: IReader);
    procedure SaveData(Key: string; VALUE: string);
    function ReadData(Key: string; VALUE: string): string;

  public
    mReaderManager: TReaderManager;
  end;

var
  frmMain: TfrmMain;

implementation

uses ComObj, IniFiles, uKisiEkle, uKisiList, uBagis, uSettings,
  uBagisEx, uLogin, uMazeretList, uHareketler, uSplash, uDbHelper, uSQLEditor;

{$R *.dfm}

procedure TfrmMain.btnConnectClick(Sender: TObject);
begin
  SaveData('COM', cbComportList.Text);
  mReaderManager.OnConnected := OnConnected;
  mReaderManager.OnReceviceText := OnReceiveText;
  mReaderManager.OnDisconnected := OnDisconnected;
  if not mReaderManager.IsReady then
  begin
    if mReaderManager.OpenPort('COM' + cbComportList.Text,
      StrToInt(txtBaud.Text)) then
    begin
      SaveData('BAUD', txtBaud.Text);
      SaveData('COM', cbComportList.Text);
    end;
  end
  else
  begin
    SaveData('BAUD', txtBaud.Text);
    SaveData('COM', cbComportList.Text);
  end;
end;

procedure TfrmMain.btnDisconnectClick(Sender: TObject);
begin
  mReaderManager.Close;
end;

procedure TfrmMain.dxNavbarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
var
  sDir: String;
  bQuery: TUniQuery;
begin
  if ALink.Item.Name = 'itmKisiAdd' then
  begin
    ShowFormInTab(TfrmKisiEkle, frmKisiEkle, ALink);
  end
  else if ALink.Item.Name = 'itmKisiList' then
  begin
    ShowFormInTab(TfrmKisiList, frmKisiList, ALink);
  end
  else if ALink.Item.Name = 'itmBagis' then
  begin
    ShowFormInTab(TfrmBagis, frmBagis, ALink);
  end
  else if ALink.Item.Name = 'itmBagislar' then
  begin
    ShowFormInTab(TfrmHareket, frmHareket, ALink);
  end
  else if ALink.Item.Name = 'itmSettings' then
  begin
    if frmLogin.ShowModal = mrOk then
    begin
      ShowFormInTab(TFrmSettings, frmSettings, ALink);
    end;
  end
  else if ALink.Item.Name = 'itmBagisEx' then
  begin
    ShowFormInTab(TfrmBagisEx, frmBagisEx, ALink);
  end
  else if ALink.Item.Name = 'itmMazeretList' then
  begin
    ShowFormInTab(TfrmMazeretList, frmMazeretList, ALink);
  end
  else if ALink.Item.Name = 'itmBackup' then
  begin
    SelectDirectory('Veritabanı Yedeği Alınacak Dizini Seçiniz', '', sDir);

    if sDir <> '' then
    begin
      try
        var
        backupLocation := format('%s\%s-%s.bak', [sDir, 'backup_ekmektevzi',
          FormatDateTime('yyyymmdd', Now)]);
        with uDbHelper.frmDb do
        begin
          dbDumper.BackupToFile(backupLocation);

          ShowMessage('Yedek alındı');
        end;
      except
        on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
    end;

  end
  else if ALink.Item.Name = 'itmRestore' then
  begin
    //SelectDirectory('Veritabanı Yedeği Alınacak Dizini Seçiniz', '', sDir);
    openDialog.Filter := 'SQL yedek|*.bak';
    openDialog.Execute;

    if openDialog.FileName <> '' then
    begin
      try
        with uDbHelper.frmDb do
        begin
          dbDumper.RestoreFromFile(openDialog.FileName,TEncoding.UTF8);

          ShowMessage('Yedek alındı');
        end;
      except
        on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
    end;

  end;

  pageContainer.ActivePageIndex := pageContainer.PageCount - 1;
end;

function TfrmMain.FindFormByName(const AName: string): TForm;
var
  i: Integer;
begin
  for i := 0 to Screen.FormCount - 1 do
  begin
    Result := Screen.Forms[i];
    if (Result.Name = AName) then
      Exit;
  end;
  Result := nil;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // mReaderManager.FreeOnRelease;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  bNavbarLink: TdxNavBarItemLink;
begin
  if (Key = VK_F7) and (ssShift in Shift) then
  begin
    ShowFormInTab(TfrmSQLEditor, frmSQLEditor, nil, true, 'SQL Editor');
  end;

end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  Baud: string;
begin
  cbComportList.SelText := ReadData('COM', '3');
  Baud := ReadData('BAUD', '9600');
  txtBaud.Text := IfThen(Baud = '', '9600', Baud);
  mReaderManager := TReaderManager.Create(Self);
  frmSplash.ShowModal;
end;

procedure TfrmMain.OnConnected(ASender: TObject; const Reader: IReader);
begin
  txtBaud.Color := RGB(164, 214, 58);
  statusBar.Panels[0].Text := 'Baðlý';
end;

procedure TfrmMain.OnDisconnected(ASender: TObject; const Reader: IReader);
begin
  txtBaud.Color := clWindow;
  statusBar.Panels[0].Text := 'Baðlý Deðil';
end;

procedure TfrmMain.OnReceiveText(ASender: TObject; const Reader: IReader;
  ReaderId: Byte; const Data: WideString);
var
  I: integer;
  bForm: TForm;
begin
  if pageContainer.PageCount > 0 then
  begin
    if pageContainer.ActivePage.Name = 'itmBagis' then
    begin
      frmBagis.txtCardID.Text := '';
      frmBagis.txtCardID.Text := Trim(Data)
    end
    else if pageContainer.ActivePage.Name = 'itmKisiAdd' then
    begin
      frmKisiEkle.txtCardID.Text := '';
      frmKisiEkle.txtCardID.Text := Trim(Data);
    end
    else if pageContainer.ActivePage.Name = 'itmBagisEx' then
    begin
      frmBagisEx.txtCardID.Text := '';
      frmBagisEx.txtCardID.Text := Trim(Data);
    end
    else if pageContainer.ActivePage.Name = 'itmKisiList' then
    begin
      with frmKisiList do
      begin
        with cxGridDBTableView do
        begin
          DataController.Filter.Active := false;
          DataController.Filter.Root.Clear;
          DataController.Filter.Root.AddItem
            (DataController.GetItemByFieldName('KartId'), foEqual, Data, Data);
          DataController.Filter.Active := true;
        end;
      end;
    end;
  end;

  for I := 0 to Screen.FormCount - 1 do
  begin
    bForm := Screen.Forms[I];
    if (bForm.Name = 'frmKisiEkle') and (bForm.Parent = nil) then
    begin
      TfrmKisiEkle(bForm).txtCardID.Text := Data;
    end;
  end;
end;

procedure TfrmMain.pageContainerCanCloseEx(Sender: TObject; ATabIndex: Integer;
  var ACanClose: Boolean);
var
  IComp: TcxPageControl;
begin
  IComp := Sender as TcxPageControl;
  FindFormByName(IComp.Components[0].Name).Free;
end;

function TfrmMain.ReadData(Key, VALUE: string): string;
var
  IniF: TIniFile;
begin
  IniF := TIniFile.Create(GetCurrentDir + '\Settings.ini');
  try
    Result := IniF.ReadString('Baglanti', Key, VALUE);
  finally
    IniF.Free;
  end;
end;

procedure TfrmMain.SaveData(Key, VALUE: string);
var
  IniF: TIniFile;
begin
  IniF := TIniFile.Create(GetCurrentDir + '\Settings.ini');
  try
    IniF.WriteString('Baglanti', Key, VALUE);
  finally
    IniF.Free;
  end;
end;

procedure TfrmMain.ShowFormInTab(I: TComponentClass; var Referance;
  L: TdxNavBarItemLink; HiddenForm: Boolean = false;
  HiddenCaption: string = '');
var
  nPanel: TPanel;
  nTab: TcxTabSheet;
  nForm: TForm;
begin
  try
    nTab := TcxTabSheet.Create(pageContainer);
    with nTab do
    begin
      if HiddenForm = true then
      begin
        Caption := HiddenCaption;
      end
      else
      begin
        Caption := L.Item.Caption;
        Name := L.Item.Name;
      end;

    end;

    nTab.Parent := pageContainer;

    nPanel := TPanel.Create(nTab);

    with nPanel do
    begin
      Align := TAlign.alClient;
      Parent := nTab;
    end;

    Application.CreateForm(I, Referance);
    nForm := TForm(Referance);
    nForm.Parent := nPanel;
    nForm.Align := TAlign.alClient;
    nForm.Show;
  except
    on E: EComponentError do
    begin
      nTab.Free;
      ShowMessage('Sayfa zaten açık');
    end;
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

end.
