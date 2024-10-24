﻿unit uMazeret;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.Menus, cxButtons, cxTextEdit,
  cxMaskEdit, cxLabel, Uni, DateUtils, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, Vcl.StdCtrls, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar;

type
  TfrmMazeret = class(TForm)
    lblKartID: TcxLabel;
    btnSaveMazeret: TcxButton;
    txtKartId: TcxTextEdit;
    dtBaslangicTarihi: TcxDateEdit;
    lblBaslangicTarihi: TcxLabel;
    dtBitisTarihi: TcxDateEdit;
    lblBitisTarihi: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveMazeretClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMazeret: TfrmMazeret;
  KartID: Integer;

implementation

{$R *.dfm}

uses uDbHelper;

procedure TfrmMazeret.btnSaveMazeretClick(Sender: TObject);
var
  bQuery: TUniQuery;
begin
  var
  baslangicTarihi := dtBaslangicTarihi.Date;
  var
  bitisTarihi := dtBitisTarihi.Date;
  var
  mazeretGunu := DaysBetween(baslangicTarihi, bitisTarihi);

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
      SQL.Add('insert into mazeretler (KartID,MazeretGun,IslemTarihi,GelecegiTarih,EkmekAlacagiTarih) ');
      SQL.Add('values(:KartID,:MGun,:ITarih,:GTarih,:EATarih)');

      ParamByName('KartID').AsString := txtKartId.Text;
      ParamByName('MGun').AsInteger := mazeretGunu + 1;
      ParamByName('ITarih').AsDateTime := baslangicTarihi;
      ParamByName('GTarih').AsDateTime := bitisTarihi;
      ParamByName('EATarih').AsDateTime := IncDay(bitisTarihi);
      Execute;
    end;

    ShowMessage('Mazeret kayıt edildi.');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmMazeret.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
