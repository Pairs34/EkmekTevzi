unit uMazeretEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.Menus, Vcl.WinXPickers, cxTextEdit, cxMaskEdit,
  cxButtons, cxLabel, Uni, System.DateUtils, dxSkinBlack,
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
  dxDateTimeWheelPicker, Vcl.StdCtrls, Data.DB, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar;

type
  TfrmMazeretEdit = class(TForm)
    lblKartID: TcxLabel;
    btnSaveMazeret: TcxButton;
    txtKartId: TcxTextEdit;
    dtBaslangicTarihi: TcxDateEdit;
    lblBaslangicTarihi: TcxLabel;
    dtBitisTarihi: TcxDateEdit;
    lblBitisTarihi: TcxLabel;
    procedure btnSaveMazeretClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    bId: integer;
    bTopluMazeret: bool;
  end;

var
  frmMazeretEdit: TfrmMazeretEdit;

implementation

{$R *.dfm}

uses uDbHelper;

procedure TfrmMazeretEdit.btnSaveMazeretClick(Sender: TObject);
var
  bQuery: TUniQuery;
  bRows : TFields;
  I: Integer;
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

  if not bTopluMazeret then
  begin
    try
      with bQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update mazeretler SET MazeretGun = :MGun,IslemTarihi = :ITarih,GelecegiTarih = :GTarih,EkmekAlacagiTarih = :EATarih ');
        SQL.Add('where Id = :bId');

        ParamByName('bId').AsInteger := bId;
        ParamByName('MGun').AsInteger := mazeretGunu + 1;
        ParamByName('ITarih').AsDateTime := baslangicTarihi;
        ParamByName('GTarih').AsDateTime := bitisTarihi;
        ParamByName('EATarih').AsDateTime := IncDay(bitisTarihi);
        Execute;
      end;

      ShowMessage('Mazeret düzenlendi.');
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end else begin
    try
      with frmDb.qUserList do
      begin
        try
          SQL.Clear;
          SQL.Text := 'select * from users order by Id asc';
          Close;
          Open;

          while not frmDb.qUserList.Eof do
          begin

            with bQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('insert into mazeretler (KartID,MazeretGun,IslemTarihi,GelecegiTarih,EkmekAlacagiTarih) ');
               SQL.Add('values(:KartID,:MGun,:ITarih,:GTarih,:EATarih)');

               ParamByName('KartID').AsString := frmDb.qUserList.FieldByName('KartId').Value;
               ParamByName('MGun').AsInteger := mazeretGunu + 1;
               ParamByName('ITarih').AsDateTime := baslangicTarihi;
               ParamByName('GTarih').AsDateTime := bitisTarihi;
               ParamByName('EATarih').AsDateTime := IncDay(bitisTarihi);
               Execute;
            end;

            frmDb.qUserList.Next;
          end;
        except
          on E: Exception do
            ShowMessage(E.Message);
        end;
      end;

      ShowMessage('Mazeret düzenlendi.');
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TfrmMazeretEdit.FormShow(Sender: TObject);
begin
  txtKartId.Enabled := not bTopluMazeret;
end;

end.
