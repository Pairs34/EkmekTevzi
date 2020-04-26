unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
  dxSkinXmas2008Blue, cxClasses, cxLookAndFeels, dxSkinsForm, Vcl.StdCtrls,AksReader_Library_3_0_TLB,
  Vcl.ExtCtrls,StrUtils, cxGraphics, cxControls, cxLookAndFeelPainters, dxNavBar,
  dxNavBarCollns, cxFilter,
  dxNavBarGroupItems, dxBarBuiltInMenu, cxPC, dxStatusBar,
   cxStyles, dxSkinOffice2019Colorful, cxImageList, System.ImageList,
  Vcl.ImgList, dxNavBarBase, cxSplitter, dxGDIPlusClasses;

type
  TfrmMain = class(TForm)
    btnConnect: TButton;
    pnlConnection: TPanel;
    lblComport: TLabel;
    txtComport: TEdit;
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
    dxNavbar: TdxNavBar;
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
    procedure btnConnectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxNavbarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure ShowFormInTab(I : TComponentClass;var Referance;L : TdxNavBarItemLink);
    procedure pageContainerCanCloseEx(Sender: TObject; ATabIndex: Integer;
      var ACanClose: Boolean);
  private
    procedure OnReceiveText(ASender: TObject; const Reader: IReader; ReaderId: Byte;
                                                             const Data: WideString);
    function FindFormByName(const AName: string): TForm;
    procedure OnDisconnected(ASender: TObject; const Reader: IReader);
    procedure OnConnected(ASender: TObject; const Reader: IReader);
    procedure SaveData(KEY : string;VALUE : string);
    function ReadData(KEY : string;VALUE : string) : string;

  public
    mReaderManager: TReaderManager;
  end;

var
  frmMain: TfrmMain;

implementation

uses ComObj,IniFiles, uKisiEkle, uKisiList, uBagis, uSettings,
  uBagisEx, uLogin, uMazeretList, uHareketler, uSplash;

{$R *.dfm}


procedure TfrmMain.btnConnectClick(Sender: TObject);
begin
      mReaderManager.OnConnected := OnConnected;
      mReaderManager.OnReceviceText := OnReceiveText;
      mReaderManager.OnDisconnected := OnDisconnected;
      if not mReaderManager.IsReady then begin
        if mReaderManager.OpenPort(txtComport.Text,StrToInt(txtBaud.Text)) then
        begin
           SaveData('COM',txtComport.Text);
           SaveData('BAUD',txtBaud.Text);
        end;
      end else begin
           SaveData('COM' ,txtComport.Text);
           SaveData('BAUD',txtBaud.Text);
      end;
end;

procedure TfrmMain.btnDisconnectClick(Sender: TObject);
begin
    mReaderManager.Close;
end;

procedure TfrmMain.dxNavbarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
begin
    if ALink.Item.Name = 'itmKisiAdd' then
    begin
       ShowFormInTab(TfrmKisiEkle,frmKisiEkle,ALink);
    end else if ALink.Item.Name = 'itmKisiList' then
    begin
       ShowFormInTab(TfrmKisiList,frmKisiList,ALink);
    end else if ALink.Item.Name = 'itmBagis' then
    begin
       ShowFormInTab(TfrmBagis,frmBagis,ALink);
    end else if ALink.Item.Name = 'itmBagislar' then
    begin
       ShowFormInTab(TfrmHareket,frmHareket,ALink);
    end else if ALink.Item.Name = 'itmSettings' then
    begin
       if frmLogin.ShowModal = mrOk then
       begin
          ShowFormInTab(TFrmSettings,frmSettings,ALink);
       end;
    end else if ALink.Item.Name = 'itmBagisEx' then
    begin
       ShowFormInTab(TfrmBagisEx,frmBagisEx,ALink);
    end else if ALink.Item.Name = 'itmMazeretList' then
    begin
       ShowFormInTab(TfrmMazeretList,frmMazeretList,ALink);
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
    //mReaderManager.FreeOnRelease;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  Com,Baud : string;
begin
    Com := ReadData('COM','COM3');
    Baud := ReadData('BAUD','9600');
    txtComport.Text := IfThen(Com = '' , 'COM3' , Com);
    txtBaud.Text := IfThen(Baud = '' , '9600' , Baud);
    mReaderManager:= TReaderManager.Create(Self);
    frmSplash.ShowModal;
end;

procedure TfrmMain.OnConnected(ASender: TObject; const Reader: IReader);
begin
    txtComport.Color := RGB(164,214,58);
    txtBaud.Color := RGB(164,214,58);
    statusBar.Panels[0].Text := 'Ba�l�';
end;

procedure TfrmMain.OnDisconnected(ASender: TObject; const Reader: IReader);
begin
    txtComport.Color := clWindow;
    txtBaud.Color := clWindow;
    statusBar.Panels[0].Text := 'Ba�l� De�il';
end;

procedure TfrmMain.OnReceiveText(ASender: TObject; const Reader: IReader;
  ReaderId: Byte; const Data: WideString);
var
  I : integer;
  bForm : TForm;
begin
    if pageContainer.PageCount > 0 then
    begin
      if pageContainer.ActivePage.Name = 'itmBagis' then begin
        frmBagis.txtCardID.Text := '';
        frmBagis.txtCardID.Text := Data;
      end else if pageContainer.ActivePage.Name = 'itmKisiAdd' then begin
        frmKisiEkle.txtCardId.Text := Data;
      end else if pageContainer.ActivePage.Name = 'itmBagisEx' then begin
        frmBagisEx.txtCardId.Text := '';
        frmBagisEx.txtCardId.Text := Data;
      end else if pageContainer.ActivePage.Name = 'itmKisiList' then begin
        with frmKisiList do begin
          with cxGridDBTableView do begin
            //if not frmKisiEkle.Visible then begin
              DataController.Filter.Root.AddItem(DataController.GetItemByFieldName('KartId'),foEqual, Data, Data);
              DataController.Filter.Active := True;
            //end;
          end;
        end;
      end;
    end;

    for I := 0 to Screen.FormCount -1 do
    begin
        bForm := Screen.Forms[I];
        if (bForm.Name = 'frmKisiEkle') and (bForm.Parent = nil) then
        begin
          TfrmKisiEkle(bForm).txtCardId.Text := Data;
        end;
    end;
end;

procedure TfrmMain.pageContainerCanCloseEx(Sender: TObject; ATabIndex: Integer;
  var ACanClose: Boolean);
var
  IComp : TcxPageControl;
begin
  IComp := Sender as TcxPageControl;
  FindFormByName(IComp.Components[0].Name).Free;
end;

function TfrmMain.ReadData(KEY, VALUE: string): string;
var
  IniF: TIniFile;
begin
  IniF := TIniFile.Create(GetCurrentDir + '\Settings.ini');
  try
     Result := IniF.ReadString('Baglanti',KEY,VALUE);
  finally
     IniF.Free;
  end;
end;

procedure TfrmMain.SaveData(KEY, VALUE: string);
var
  IniF: TIniFile;
begin
  IniF := TIniFile.Create(GetCurrentDir + '\Settings.ini');
  try
     IniF.WriteString('Baglanti',KEY,VALUE);
  finally
     IniF.Free;
  end;
end;

procedure TfrmMain.ShowFormInTab(I: TComponentClass; var Referance;L : TdxNavBarItemLink);
var
  nPanel : TPanel;
  nTab : TcxTabSheet;
  nForm : TForm;
begin
      nTab := TcxTabSheet.Create(pageContainer);
      with nTab do begin
        Caption := L.Item.Caption;
        Name := L.Item.Name;
      end;

      nTab.Parent := pageContainer;

      nPanel := TPanel.Create(nTab);

      with nPanel do begin
         Align := TAlign.alClient;
         Parent := nTab;
      end;

      try
        Application.CreateForm(I,Referance);
        nForm := TForm(Referance);
        nForm.Parent := nPanel;
        nForm.Align := TAlign.alClient;
        nForm.Show;
      except on E : Exception do
        ShowMessage(E.Message);
      end;
end;

end.
