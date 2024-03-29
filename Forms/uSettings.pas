unit uSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.StdCtrls, cxButtons, Uni, Vcl.ComCtrls,
  dxAuthorizationAgents, cxClasses, dxCloudStorage, cxControls,
  cxContainer, cxEdit, cxCheckBox, dxToggleSwitch, Vcl.ExtCtrls,

  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrmSettings = class(TForm)
    txtKayipGun: TEdit;
    lblKayipGun: TLabel;
    btnSaveKayipGun: TcxButton;
    txtBagisAdi: TEdit;
    lblBagisTur: TLabel;
    btnRefreshBagislar: TcxButton;
    txtUsername: TEdit;
    txtPass: TEdit;
    btnSaveUser: TcxButton;
    lstUsers: TListView;
    lstBagisTurleri: TListView;
    popupMenu: TPopupMenu;
    btnSil: TMenuItem;
    procedure btnSaveKayipGunClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshBagislarClick(Sender: TObject);
    procedure txtBagisAdiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveUserClick(Sender: TObject);
    procedure btnSilClick(Sender: TObject);
  private
    procedure LoadAyarlar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

{$R *.dfm}

uses uGlobals, uDbHelper, dxCore;

procedure TfrmSettings.txtBagisAdiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  bSqlCode: string;
begin
  if Key = VK_RETURN then
  begin
    bSqlCode := format('insert into bagisturu (BagisAdi) values(%s)',
      [QuotedStr(txtBagisAdi.Text)]);
    if ToDatabase(bSqlCode) then
    begin
      LoadAyarlar;
      txtBagisAdi.Clear;
    end
    else
    begin
      ShowMessage('Kaydedilemedi');
    end;
  end;
end;

procedure TfrmSettings.LoadAyarlar;
var
  bSqlCode: string;
  bQuery: TUniQuery;
  bListViewItem: TListItem;
begin
  bSqlCode := 'select * from settings';
  bQuery := FromDatabase(bSqlCode);
  try
    with bQuery do
    begin
      if FieldByName('UKey').AsString = 'CCDay' then
        txtKayipGun.Text := FieldByName('UVal').AsString;
    end;
  except
    on E: EAccessViolation do
    begin
      txtKayipGun.Text := '7';
      ToDatabase
        (format('insert into settings (UKey,UVal) values(''%s'',''%s'')',
        ['CCDay', txtKayipGun.Text]));
    end;
  end;

  // Ba���lar
  bSqlCode := 'select * from bagisturu';
  bQuery := FromDatabase(bSqlCode);
  lstBagisTurleri.Items.Clear;
  with bQuery do
  begin
    try
      while not EOF do
      begin
        bListViewItem := lstBagisTurleri.Items.Add;
        bListViewItem.Caption := FieldByName('Id').AsString;
        bListViewItem.SubItems.Add(FieldByName('BagisAdi').AsString);
        Next;
      end;
    except
      on E: EAccessViolation do
    end;
  end;

  // Kullan�c�lar
  bSqlCode := 'select * from personals';
  bQuery := FromDatabase(bSqlCode);
  lstUsers.Items.Clear;
  with bQuery do
  begin
    try
      while not EOF do
      begin
        bListViewItem := lstUsers.Items.Add;
        bListViewItem.Caption := FieldByName('Id').AsString;
        bListViewItem.SubItems.Add(FieldByName('Username').AsString);
        bListViewItem.SubItems.Add(FieldByName('Password').AsString);
        Next;
      end;
    except
      on E: EAccessViolation do

    end;
  end;
end;

procedure TfrmSettings.btnRefreshBagislarClick(Sender: TObject);
begin
  LoadAyarlar;
end;

procedure TfrmSettings.btnSaveKayipGunClick(Sender: TObject);
var
  bSqlCode: string;
  bIsUpdate: boolean;
begin
  with frmDb do
  begin
    if not dbHelper.Connected then
      dbHelper.Connect;

    bIsUpdate := False;

    with myQuery do
    begin
      try
        Close;
        SQL.Clear;
        SQL.Text := 'select * from settings where UKey = ' + QuotedStr('CCDay');
        Open;

        if RecordCount = 0 then
        begin
          bIsUpdate := false;
        end
        else
        begin
          bIsUpdate := true;
        end;

        Deactivate;
      Except
        on E: Exception do
        begin
          Deactivate;
          ShowMessage(E.Message);
        end;
      end;
    end;
  end;

  if bIsUpdate then
  begin
    bSqlCode := format('update settings SET UVal = %s where UKey = %s',
      [QuotedStr(txtKayipGun.Text), QuotedStr('CCDay')]);
  end
  else
  begin
    bSqlCode := format('insert into settings (UKey,UVal) values(''%s'',''%s'')',
      ['CCDay', txtKayipGun.Text]);
  end;

  if ToDatabase(bSqlCode) then
  begin
    ShowMessage('Kaydedildi');
  end
  else
  begin
    ShowMessage('Kaydedilemedi');
  end;
end;

procedure TfrmSettings.btnSaveUserClick(Sender: TObject);
var
  bSqlCode: string;
begin
  bSqlCode := format('insert into personals (Username,Password) values(%s,%s)',
    [QuotedStr(txtUsername.Text), QuotedStr(txtPass.Text)]);

  if ToDatabase(bSqlCode) then
  begin
    LoadAyarlar;
    txtUsername.Clear;
    txtPass.Clear;
  end
  else
  begin
    ShowMessage('Kaydedilemedi');
  end;
end;

procedure TfrmSettings.btnSilClick(Sender: TObject);
var
  AParentMenu: TMenu;
  AComponent: TComponent;
  bSelectedId: Integer;
begin
  try
    AParentMenu := TMenuItem(Sender).GetParentMenu;
    AComponent := TPopupMenu(AParentMenu).PopupComponent;
    if AComponent.Name = 'lstBagisTurleri' then
    begin
      bSelectedId := StrToInt(lstBagisTurleri.ItemFocused.Caption);
      if ToDatabase(format('delete from bagisturu where Id = %d', [bSelectedId]))
      then
      begin
        ShowMessage('Kay�t Silindi');
      end
      else
        ShowMessage('Kay�t silinemedi');
    end
    else if AComponent.Name = 'lstUsers' then
    begin
      bSelectedId := StrToInt(lstUsers.ItemFocused.Caption);
      if ToDatabase(format('delete from personals where Id = %d', [bSelectedId]))
      then
      begin
        ShowMessage('Kay�t Silindi');
      end
      else
        ShowMessage('Kay�t silinemedi');
    end;
    LoadAyarlar;
  except
    on E: EAccessViolation do
      ShowMessage('Silinecek bir�ey yokki :)');
  end;
end;

procedure TfrmSettings.FormShow(Sender: TObject);
begin
  LoadAyarlar;
end;

end.
