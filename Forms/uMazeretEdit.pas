unit uMazeretEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.Menus, Vcl.WinXPickers, cxTextEdit, cxMaskEdit,
  cxButtons, cxLabel,Uni,System.DateUtils, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, Vcl.ComCtrls, dxNumericWheelPicker,
  dxDateTimeWheelPicker, Vcl.StdCtrls;

type
  TfrmMazeretEdit = class(TForm)
    lblKartID: TcxLabel;
    btnSaveMazeret: TcxButton;
    lblMazeretGun: TcxLabel;
    txtMazeretGun: TcxMaskEdit;
    txtKartId: TcxTextEdit;
    lblStartDate: TcxLabel;
    dtStart: TDatePicker;
    procedure btnSaveMazeretClick(Sender: TObject);
  private
    { Private declarations }
  public
    bId : integer;
  end;

var
  frmMazeretEdit: TfrmMazeretEdit;


implementation

{$R *.dfm}

uses uDbHelper;

procedure TfrmMazeretEdit.btnSaveMazeretClick(Sender: TObject);
var
  bQuery: TUniQuery;
begin
  bQuery := TUniQuery.Create(Self);

  with frmDb do
  begin
      if not dbHelper.Connected then
         dbHelper.Connect;

      bQuery.Connection := dbHelper;
  end;

  try
    with bQuery do
    begin
       Close;
       SQL.Clear;
       SQL.Add('update mazeretler SET MazeretGun = :MGun,IslemTarihi = :ITarih,GelecegiTarih = :GTarih,EkmekAlacagiTarih = :EATarih ');
       SQL.Add('where Id = :bId');

       ParamByName('bId').AsInteger := bId;
       ParamByName('MGun').AsInteger := StrToInt(txtMazeretGun.Text);
       ParamByName('ITarih').AsDateTime := dtStart.Date;
       ParamByName('GTarih').AsDateTime := IncDay(dtStart.Date,StrToInt(txtMazeretGun.Text));
       ParamByName('EATarih').AsDateTime := IncDay(dtStart.Date,StrToInt(txtMazeretGun.Text) + 1);
       Execute;
    end;

    ShowMessage('Mazeret düzenlendi.');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

end.
