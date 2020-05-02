unit uLogin;

// Burasý muþtur adý yokuþtur giden gelmiyor acep nere gidem

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.StdCtrls, cxButtons,Uni, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue;

type
  TfrmLogin = class(TForm)
    txtUsername: TEdit;
    txtPass: TEdit;
    btnLogin: TcxButton;
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure txtPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    isLogged : boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uGlobals;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  bQuery : TUniQuery;
begin
  bQuery := FromDatabase(format('select * from personals where Username = %s and Password = %s',
                                [QuotedStr(txtUsername.Text),QuotedStr(txtPass.Text)]));
  try
    if bQuery.RecordCount > 0 then begin
       isLogged := true;
       ModalResult := mrOk;
    end
    else
       isLogged := false;
  except on E : EAccessViolation do
  begin
     ShowMessage('Böyle bir kullanýcý bulunamadý.');
     isLogged := false;
  end;
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not isLogged then
  begin
     ModalResult := mrAbort;
  end else begin
     ModalResult := mrOk;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  txtUsername.Clear;
  txtPass.Clear;
end;

procedure TfrmLogin.txtPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
     btnLogin.Click;
  end;

end;

end.
