﻿unit uKisiEkle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCheckBox,
  dxToggleSwitch, uDbHelper,StrUtils, cxTextEdit, cxMemo,
  dxSkinOffice2019Colorful;

type
  TKisi = record
    Id : integer;
    AdSoyad : string;
    EkmekAdedi : string;
    Aciklama : string;
    CardId : string;
    TelNo : string;
    Adres : string;
    Nufus : string;
    Action : string;
    Aktif : bool;
  end;

  TfrmKisiEkle = class(TForm)
    txtAdSoyad: TEdit;
    txtEkmekAdedi: TEdit;
    btnKartIptal: TdxToggleSwitch;
    btnKaydet: TcxButton;
    txtAciklama: TEdit;
    txtCardId: TEdit;
    txtTelNo: TEdit;
    txtAdres: TcxMemo;
    lblAdres: TLabel;
    txtNufus: TEdit;
    lblAdSoyad: TLabel;
    lblEkmekAdedi: TLabel;
    lblAciklama: TLabel;
    lblKartId: TLabel;
    lblTelNo: TLabel;
    lblNufus: TLabel;
    procedure btnKaydetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; var pKisi : TKisi); reintroduce;
  end;
var
  frmKisiEkle: TfrmKisiEkle;
  Kisi : TKisi;

implementation

{$R *.dfm}




procedure TfrmKisiEkle.btnKaydetClick(Sender: TObject);
var
  c : TControl;
  I : integer;
begin
    with Kisi do
      begin
        AdSoyad := txtAdSoyad.Text;
        Aciklama := txtAciklama.Text;
        EkmekAdedi := txtEkmekAdedi.Text;
        CardId := txtCardId.Text;
        TelNo := txtTelNo.Text;
        Adres := txtAdres.Text;
        Nufus := txtNufus.Text;
    end;

    if (not btnKartIptal.Checked) and (Kisi.Aciklama = '') then
    begin
        Beep;
        ShowMessage('Kart iptal nedenini girmeniz lazım.');
        Exit;
    end else if
    (Kisi.AdSoyad = '') or
    (Kisi.EkmekAdedi = '') or
    (Kisi.CardId = '') or
    (Kisi.TelNo = '') or
    (Kisi.Adres = '') or
    (Kisi.Nufus = '') then begin
        Beep;
        ShowMessage('Zorunlu alan bilgileri girilmedi.');
        Exit;
    end;


    with frmDb do begin

      if not dbHelper.Connected then
         dbHelper.Connect;

      with myQuery do begin
        try
          SQL.Clear;

          if Kisi.Action = 'create' then begin
            SQL.Add('insert into users (AdSoyad,Adet,Aktif,Aciklama,KartId,TelNo,Adres,Nufus,SonIslemTarihi,SonIslemTipi)');
            SQL.Add('values(:user,:adet,:aktif,:aciklama,:kartid,:tel,:adres,:nufus,:SIslemTarih,:SIslemTip)');
          end else if Kisi.Action = 'edit' then begin
            SQL.Add('Update users SET AdSoyad = :user,Adet = :adet,Aktif = :aktif,Aciklama = :aciklama,');
            SQL.Add('KartId = :kartid,TelNo = :tel,Adres = :adres,Nufus = :nufus,SonIslemTarihi = :SIslemTarih,SonIslemTipi = :SIslemTip');
            SQL.Add(' where Id = :kisiid');
          end;
          ParamByName('user').Value := Kisi.AdSoyad;
          ParamByName('adet').Value := Kisi.EkmekAdedi;
          ParamByName('aktif').Value := IfThen(btnKartIptal.Checked,'Aktif','Pasif');
          ParamByName('aciklama').Value := Kisi.Aciklama;
          ParamByName('kartid').Value := Trim(Kisi.CardId);
          ParamByName('tel').Value := Kisi.TelNo;
          ParamByName('adres').Value := Kisi.Adres;
          ParamByName('nufus').Value := Kisi.Nufus;
          ParamByName('SIslemTarih').AsDateTime := Now;
          if Kisi.Action = 'edit' then begin
            ParamByName('kisiid').Value := Kisi.Id;
            ParamByName('SIslemTip').Value := 'Aktif Edildi';
          end else if Kisi.Action = 'create' then begin
            ParamByName('SIslemTip').Value := 'Kayıt Edildi';
          end;
          ExecSQL;
          ShowMessage(IfThen(Kisi.Action = 'edit','Kayıt Güncellendi','Kayıt Yapıldı'));

          with Kisi do
          begin
            AdSoyad := '';
            Aciklama := '';
            EkmekAdedi := '';
            CardId := '';
            TelNo := '';
            Adres := '';
            Nufus := '';
            Action := 'create';
          end;
        Except on E : Exception do
          ShowMessage(E.Message);
        end;
      end;
    end;

    for I := 0 to self.ControlCount -1 do begin
        c := self.Controls[I];
        if self.Controls[I] is TEdit then begin
           TEdit(c).Clear;
        end
        else if self.Controls[I] is TcxMemo then begin
           TcxMemo(c).Clear;
        end;
    end;

end;

constructor TfrmKisiEkle.Create(AOwner: TComponent; var pKisi: TKisi);
var
  I : integer;
begin
  inherited Create(AOwner);
  Kisi := pKisi;

  if Kisi.Action = 'edit' then
  begin
    Self.BorderStyle := bsSizeToolWin;
    with Kisi do begin
      txtAdSoyad.Text := AdSoyad;
      txtEkmekAdedi.Text := EkmekAdedi;
      txtAciklama.Text := Aciklama;
      txtCardId.Text := CardId;
      txtTelNo.Text := TelNo;
      txtAdres.Text := Adres;
      txtNufus.Text := Nufus;
      btnKartIptal.Checked := Aktif;
    end;
  end else if Kisi.Action = 'create' then begin
    Self.BorderStyle := bsNone;
  end else if Kisi.Action = 'view' then begin
    Self.BorderStyle := bsSizeToolWin;
    for I := 0 to self.ControlCount -1 do begin
        self.Controls[I].Enabled := false;
    end;
    with Kisi do begin
      txtAdSoyad.Text := AdSoyad;
      txtEkmekAdedi.Text := EkmekAdedi;
      txtAciklama.Text := Aciklama;
      txtCardId.Text := CardId;
      txtTelNo.Text := TelNo;
      txtAdres.Text := Adres;
      txtNufus.Text := Nufus;
      btnKartIptal.Checked := Aktif;
    end;
  end;
end;

procedure TfrmKisiEkle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Kisi.Action := 'create';
end;

procedure TfrmKisiEkle.FormCreate(Sender: TObject);
begin
  if Kisi.Action = '' then
      Kisi.Action := 'create';

end;

end.
