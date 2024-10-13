unit uBagis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxMemo, cxTextEdit,
  Vcl.Menus, cxButtons, System.DateUtils, cxCheckBox, dxToggleSwitch,
  cxStyles, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StrUtils,
  DBAccess, Uni, VirtualTable, dxSkinOffice2019Colorful, cxCustomData, cxFilter,
  cxData, dxDateRanges, MemDS, dxScrollbarAnnotations;

type
  TfrmBagis = class(TForm)
    txtCardID: TEdit;
    cxGroupBox: TcxGroupBox;
    lblAdSoyad: TLabel;
    txtAdsoyad: TcxTextEdit;
    txtNufus: TcxTextEdit;
    lblHak: TLabel;
    lblTel: TLabel;
    txtTel: TcxTextEdit;
    lblAdres: TLabel;
    txtAdres: TcxMemo;
    lblNufus: TLabel;
    txtAdet: TcxTextEdit;
    btnBagis: TcxButton;
    lblBuyukAdSoyad: TLabel;
    lblBuyukHak: TLabel;
    lblSonHareket: TLabel;
    btnMazeretEkle: TcxButton;
    btnSadeceSorgu: TdxToggleSwitch;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxStyleRepository: TcxStyleRepository;
    cxRedStyle: TcxStyle;
    cxGreenStyle: TcxStyle;
    vAylikHareket: TVirtualTable;
    tblVAylikHareket: TUniDataSource;
    cxBlueStyle: TcxStyle;
    procedure txtCardIDChange(Sender: TObject);
    procedure btnMazeretEkleClick(Sender: TObject);
    procedure cxGridDBTableViewStylesGetContentStyle
      (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private const
    sLineBreak = {$IFDEF LINUX} AnsiChar(#10) {$ENDIF}
{$IFDEF MSWINDOWS} AnsiString(#13#10) {$ENDIF};
  public
    procedure Custommessage(msg : string);
  end;

TYPE
  TStringListHelper = CLASS HELPER FOR TStrings
    FUNCTION ToSQL: STRING;
  END;

var
  frmBagis: TfrmBagis;
  MyCards: TStringList;

implementation

{$R *.dfm}

uses uDbHelper, uMazeret, uGlobals, uCustomDialog;

FUNCTION TStringListHelper.ToSQL: STRING;

VAR
  S: STRING;

  FUNCTION QuotedStr(CONST S: STRING): STRING;
BEGIN Result := '''' + ReplaceStr(S, '', '''') + ''''
END;

BEGIN Result := '';
FOR S IN Self DO
  BEGIN IF Result = '' THEN Result := ''
ELSE
  Result := Result + ',';
Result := Result + QuotedStr(S)
END;
IF Result <> '' THEN Result := Result;
END;

procedure TfrmBagis.btnMazeretEkleClick(Sender: TObject);
begin
  if (txtCardID.Text <> '') then
  begin
    Application.CreateForm(TfrmMazeret, frmMazeret);
    frmMazeret.txtKartID.Text := txtCardID.Text;
    frmMazeret.ShowModal;
  end
  else
  begin
    ShowMessage('Kart ID boþ olmamalý.');
  end;
end;

procedure TfrmBagis.Custommessage(msg: string);
begin
    frmCustomDialog.lblCaption.Caption := msg;
    frmCustomDialog.ShowModal;
end;

procedure TfrmBagis.cxGridDBTableViewStylesGetContentStyle
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if not Assigned(AItem) then
    Exit;

  if AItem.Index > 3 then
  begin
    if ARecord.Values[AItem.Index] = 'X' then
    begin
      AStyle := cxGreenStyle;
    end
    else if ARecord.Values[AItem.Index] = 'M' then
    begin
      AStyle := cxBlueStyle;
    end
    else
    begin
      AStyle := cxRedStyle;
    end;
  end;
end;

procedure TfrmBagis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBagis.FormShow(Sender: TObject);
begin
  ClearGrid(cxGridDBTableView);
  MyCards := TStringList.Create;
  MyCards.Delimiter := ',';
end;

procedure TfrmBagis.txtCardIDChange(Sender: TObject);
var
  LastAction: string;
  MResult: integer;
begin
  if txtCardID.Text = '' then
    Exit;

  with frmDb do
  begin
    if not dbHelper.Connected then
      dbHelper.Connect;

    with myQuery do
    begin
      try
        Close;
        SQL.Clear;
        SQL.Add('select * from hareket where Day(IslemZamani) = DAY(GETDATE()) and MONTH(IslemZamani) = MONTH(GETDATE()) and YEAR(IslemZamani) = YEAR(GETDATE()) ');
        SQL.Add('and KartId = :kartid ');
        SQL.Add('and BagisTuru = :BagisTuru');
        ParamByName('kartid').Value := txtCardID.Text;
        ParamByName('BagisTuru').Value := 'Ekmek';
        ExecSQL;
        if (RecordCount > 0) and (txtCardID.Text <> '') then
        begin
           Custommessage('Bugün ekmek almış.Son ekmek alma tarihi : ' + myQuery.FieldByName('IslemZamani').AsString);
          Exit;
        end;

        Close;
        SQL.Clear;
        SQL.Text := 'select * from users where KartId = :kartid';
        ParamByName('kartid').Value := txtCardID.Text;
        ExecSQL;

        if (RecordCount = 0) and (txtCardID.Text <> '') then
        begin
          Beep;
          CustomMessage('Bu kart sistemde kayıtlı değil.');
          //ShowMessage('Bu kart sistemde kayıtlı değil.');
          Exit;
        end;

        if FieldByName('Aktif').AsString = 'Pasif' then
        begin
          if not btnSadeceSorgu.Checked then
          begin
            CustomMessage(format('%s nolu kart şu sebeple pasiftir : ' +
              sLineBreak + '%s', [txtCardID.Text, FieldByName('Aciklama')
              .AsString]));
              Exit
          end
          else
          begin
            Custommessage(format('%s nolu kart şu sebeple pasiftir : ' +
              sLineBreak + '%s', [txtCardID.Text, FieldByName('Aciklama')
              .AsString]));
          end;
        end;

        if MyCards.Count >= 3 then
        begin
          MyCards.Delete(0);
        end;

        if MyCards.IndexOf(txtCardID.Text) = -1 then
          MyCards.Add(txtCardID.Text);

        txtAdsoyad.Text := FieldByName('AdSoyad').AsString;
        txtAdet.Text := FieldByName('Adet').AsString;
        txtTel.Text := FieldByName('TelNo').AsString;
        txtAdres.Text := FieldByName('Adres').AsString;
        txtNufus.Text := FieldByName('Nufus').AsString;
        lblBuyukAdSoyad.Caption := FieldByName('AdSoyad').AsString;
        lblBuyukHak.Caption := FieldByName('Adet').AsString;

        Close;
        SQL.Clear;
        SQL.Text :=
          'select * from GetLastAction where KartId = :KartId';
        ParamByName('KartId').AsString := txtCardID.Text;
        ExecSQL;

        if (RecordCount > 0) then
        begin
          LastAction := FieldByName('IslemZamani').AsString;
          if (DaysBetween(Now, VarToDateTime(LastAction)) > 1) then
          begin
            lblSonHareket.Font.Color := clRed;
            lblSonHareket.Caption := LastAction;
          end
          else
          begin
            lblSonHareket.Font.Color := clDefault;
            lblSonHareket.Caption := LastAction;
          end;
        end;

        if not btnSadeceSorgu.Checked then
        begin
          EkmekVer(txtCardID.Text, 'Ekmek', txtAdsoyad.Text, Now);
        end;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    end;

    cxGridDBTableView.ClearItems;

    with frmDb do
    begin
      with GetAylikRapor do
      begin
        ParamByName('Yil').AsInteger := YearOf(Now);
        ParamByName('Ay').AsInteger := MonthOf(Now);
        ParamByName('kartid').AsString := MyCards.CommaText;
        ParamByName('BagisTuru').AsString := 'Ekmek';
        Prepare;
        ExecProc;
      end;
    end;

    cxGridDBTableView.DataController.DataSource := frmDb.tblAylikRapor;
    cxGridDBTableView.DataController.CreateAllItems;
    cxGridDBTableView.ApplyBestFit();
  end;
end;

end.
