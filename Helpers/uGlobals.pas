unit uGlobals;

interface
  uses System.IniFiles,System.SysUtils,Uni,Vcl.Dialogs,cxLocalization,System.Classes,cxGridDBTableView,Generics.Collections,
  StrUtils,WinSvc,ShellAPI;

  procedure SaveData(SECTION : string;KEY : string;VALUE : string);
  function ReadData(SECTION : string;KEY, VALUE: string): string;
  function FromDatabase(SqlCode: string): TUniQuery;
  function ToDatabase(SqlCode: string): boolean;
  procedure ToTranslate(localizer : TcxLocalizer);
  function LoadFileToStr(const FileName: TFileName): String;
  procedure KartKapat(KartId,KartGun: string);
  procedure ClearGrid(grid : TcxGridDBTableView);
  function CheckEkmek(bKartId : string;Yil,Ay,Gun : integer) : string;
  function CheckEkmekX(XKartId : string;Yil,Ay,Gun : integer) : string;
  function CheckMazeret(KartId : string;Yil,Ay,Gun : integer) : string;
  function CheckIfMazeret(KartId : string) : TUniQuery;
  function GetKartKapatmaGunu :string;
  procedure CheckKartKapat;
  procedure UpdateSonIslemHareketi(bKartId,bIslemTip : string);
  procedure EkmekVer(KartId,Tip,AdSoyad : string;Zaman : TDateTime);
  function FirstDayOfMonth(Date: TDateTime): TDateTime;
  function LastDayCurrMon: TDate;
  procedure GetLastHareket;
  function StartNTService(const ServiceName: string): Boolean;
  function StopNTService(const ServiceName: string): Boolean;
type
  THareket = record
    KartId : string;
    IslemZamani : TDateTime;
  end;

var
  AllLastHareket : TList<THareket>;

implementation

uses uDbHelper,DateUtils;

function StartNTService(const ServiceName: string): Boolean;
var
 SCM: SC_HANDLE;
 ServiceHandle: SC_HANDLE;
 Res: Boolean;
 Temp: PChar;
 Status: SERVICE_STATUS;
 Err: Integer;
begin
  Result := False;
  SCM := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCM = 0 then
   raise Exception.Create('Servis Kontrol Yöneticisi açılamadı. Hata: ' + SysErrorMessage(getLastError));
  ServiceHandle := OpenService(SCM, PChar(ServiceName), SERVICE_ALL_ACCESS);
  if ServiceHandle = 0 then
  begin
    CloseServiceHandle(SCM);
    raise Exception.Create(ServiceName + ' isimli servis açılamadı. Hata: ' + SysErrorMessage(getLastError));
  end;
  Res := StartService(ServiceHandle, 0, Temp);
  if Res then
  begin
    Res := QueryServiceStatus(ServiceHandle, Status);
    while (Res) do
    begin
      if Status.dwCurrentState = SERVICE_RUNNING then
      begin
        Result := True;
        Break;
      end else if Status.dwCurrentState = SERVICE_STOPPED then
      begin
        Result := False;
        Break;
      end;
      QueryServiceStatus(ServiceHandle, Status);
    end;
  end else begin
    Err := GetLastError;
    if  Err <> SERVICE_RUNNING then
    raise Exception.Create(ServiceName + ' isimli servis başlatılamadı. Hata:' + SysErrorMessage(Err));
  end;
  CloseServiceHandle(SCM);
  if not Result then
    raise Exception.Create(ServiceName + ' isimli servis başlatılamadı');
 end;

function StopNTService(const ServiceName: string): Boolean;
var
 SCM: SC_HANDLE;
 ServiceHandle: SC_HANDLE;
 Res: Boolean;
 Status: SERVICE_STATUS;
begin
  Result := False;
  SCM := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if SCM = 0 then
   raise Exception.Create('Servis Kontrol Yöneticisi açılamadı');
  ServiceHandle := OpenService(SCM, PChar(ServiceName), SERVICE_ALL_ACCESS);
  if ServiceHandle = 0 then
  begin
    CloseServiceHandle(SCM);
    raise Exception.Create(ServiceName + ' isimli servis açılamadı. Hata: ' + SysErrorMessage(getLastError));
  end;
  Res := ControlService(ServiceHandle, SERVICE_CONTROL_STOP, Status);
  if not Res then
  begin
    if GetLastError <> SERVICE_DISABLED then
      raise Exception.Create('Servis durdurulamadı');
  end else Result := True;
end;

function CheckEkmekX(XKartId : string;Yil,Ay,Gun : integer) : string;
var
 bHareket : THareket;
 I : integer;
 bFound : boolean;
begin

  bFound := False;

  with bHareket do begin
    KartId := XKartId;
    IslemZamani := EncodeDate(Yil,Ay,Gun);
  end;

  for I := 0 to AllLastHareket.Count -1 do
  begin
    if (AllLastHareket[I].KartId = bHareket.KartId) and
          (FormatDateTime('dd.mm.yyyy',AllLastHareket[I].IslemZamani) = FormatDateTime('dd.mm.yyyy',bHareket.IslemZamani))
      then begin
        bFound := true;
      end
  end;

  Result := IfThen(bFound,'X','');
end;

procedure GetLastHareket;
var
  bQuery : TUniQuery;
  bHareket : THareket;
begin
  bQuery := TUniQuery.Create(nil);

  if not Assigned(AllLastHareket) then begin
    AllLastHareket := TList<THareket>.Create;
  end else begin
    AllLastHareket.Clear;
  end;

  with bQuery do begin
    Connection := frmDb.dbHelper;
    Close;
    SQL.Clear;
    SQL.Add('select * from hareket where MONTH(IslemZamani) = MONTH(GETDATE())');
    ExecSQL;

    while not EOF do
    begin
      with bHareket do begin
          KartId := FieldByName('KartId').AsString;
          IslemZamani := FieldByName('IslemZamani').AsDateTime;
      end;

      AllLastHareket.Add(bHareket);

      Next;
    end;
  end;

  bQuery.Free;
end;

function FirstDayOfMonth(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

function LastDayCurrMon: TDate;
var
  y, m, d: word;
begin
  decodedate(now, y, m, d);
  m := m + 1;
  if m > 12 then
  begin
    y := y + 1;
    m := 1;
  end;
  result := encodedate(y, m, 1) - 1;
end;

procedure EkmekVer(KartId,Tip,AdSoyad : string;Zaman : TDateTime);
var
  bQuery : TUniQuery;
begin
  bQuery := TUniQuery.Create(nil);
  with bQuery do begin
    Connection := frmDb.dbHelper;
    Close;
    SQL.Clear;
    SQL.Add('insert into hareket (KartId,IslemZamani,BagisTuru,AdSoyad) ');
    SQL.Add('values(:kartid,:zaman,:bagisturu,:AdSoyad)');
    ParamByName('kartid').Value := KartId;
    ParamByName('zaman').AsDateTime := Zaman;
    ParamByName('bagisturu').Value := Tip;
    ParamByName('AdSoyad').Value := AdSoyad;
    ExecSQL;
  end;
end;

procedure UpdateSonIslemHareketi(bKartId,bIslemTip : string);
var
  bQuery : TUniQuery;
begin
  bQuery := TUniQuery.Create(nil);
  with bQuery do begin
    Connection := frmDb.dbHelper;
    Close;
    SQL.Clear;
    SQL.Add('update users set SonIslemTarihi = :SIslemTarih,SonIslemTipi = :SIslemTip ');
    SQL.Add('where KartId = :KartId');
    ParamByName('SIslemTarih').AsDateTime := now;
    ParamByName('SIslemTip').AsString := bIslemTip;
    ParamByName('KartId').AsString := bKartId;
    ExecSQL;
  end;
end;

function GetKartKapatmaGunu :string;
var
  bQuery : TUniQuery;
begin
  bQuery := TUniQuery.Create(nil);
  with bQuery do begin
    Connection := frmDb.dbHelper;
    Close;
    SQL.Clear;
    SQL.Add('select UVal from settings where UKey = ''CCDay''');
    ExecSQL;

    Result := FieldByName('UVal').AsString;
  end;
end;

procedure KartKapat(KartId,KartGun: string);
begin
    with frmDb do
    begin
      if not dbHelper.Connected then
        dbHelper.Connect;

      with myQuery do
      begin
          Close;
          SQL.Clear;
          SQL.Add('update users set Aktif = ''Pasif'',SonIslemTarihi = :SIslemTarih,SonIslemTipi = :SIslemTip,Aciklama = :Aciklama where KartId = :KartId');
          ParamByName('KartId').AsString := KartId;
          ParamByName('SIslemTarih').AsDateTime := now;
          ParamByName('SIslemTip').AsString := 'Kart Kapatıldı';
          ParamByName('Aciklama').AsString := 'Bu kart ' + KartGun + ' gün hareket görmediği için kapatılmıştır.';
          ExecSql;
      end;
    end;
end;

function CheckIfMazeret(KartId : string) : TUniQuery;
var
  bQuery : TUniQuery;
begin
  bQuery := TUniQuery.Create(nil);
  with bQuery do begin
    Connection := frmDb.dbHelper;
    Close;
    SQL.Clear;
    SQL.Add('select * from mazeretler where KartId = :kartid');
    ParamByName('kartid').AsString := KartId;
    ExecSQL;

    Result := bQuery;
  end;
end;

procedure CheckKartKapat;
var
  bQuery,bMazeretResult : TUniQuery;
  bKartId,bCCDay : string;
  bMazeretsiz,bGunFarki,I : integer;
  bStartDate,bEndDate,bIslemDate : TDateTime;
begin
  GetLastHareket;

  bMazeretsiz := 0;

  bQuery := TUniQuery.Create(nil);
  with bQuery do begin
    Connection := frmDb.dbHelper;
    Close;
    SQL.Clear;
    SQL.Add('select * from users where Aktif = ''Aktif''');
    ExecSQL;

    bCCDay := GetKartKapatmaGunu;

    while not eof do begin

        if FieldByName('SonIslemTarihi').IsNull then begin
        
            bGunFarki := DaysBetween(Now,FirstDayOfMonth(Now));
            bKartId := FieldByName('KartId').AsString;
            bMazeretsiz := 0;
            for I := 1 to bGunFarki do
            begin
               if CheckEkmekX(bKartId,YearOf(Now),MonthOf(Now),I) <> 'X' then
               begin
                   bMazeretResult := CheckIfMazeret(bKartId);
                   if bMazeretResult.RecordCount > 0 then
                   begin
                      bStartDate := bMazeretResult.FieldByName('IslemTarihi').AsDateTime;
                      bEndDate := bMazeretResult.FieldByName('GelecegiTarih').AsDateTime;

                      if not DateInRange(EncodeDate(YearOf(Now),MonthOf(Now),I),bStartDate,bEndDate) then begin
                         bMazeretsiz := bMazeretsiz + 1;
                      end;
                   end else begin
                      bMazeretsiz := bMazeretsiz + 1;
                   end;
               end;
            end;

            if bMazeretsiz >= StrToInt(bCCDay) then
               KartKapat(bKartId,bCCDay);

            Next;             
        end else
        begin
            if DateInRange(FieldByName('SonIslemTarihi').AsDateTime,
                        FirstDayOfMonth(Now),LastDayCurrMon,True) then
            begin
                bIslemDate := FieldByName('SonIslemTarihi').AsDateTime;

                bGunFarki := DaysBetween(Now,bIslemDate);
                if bGunFarki <= 31 then begin          
                  bKartId := FieldByName('KartId').AsString;
                  bMazeretsiz := 0;
                  for I := 1 to bGunFarki do
                  begin
                   if CheckEkmekX(bKartId,YearOf(bIslemDate),MonthOf(bIslemDate),I) <> 'X' then
                   begin
                       bMazeretResult := CheckIfMazeret(bKartId);
                       bIslemDate := IncDay(bIslemDate,1);
                       if bMazeretResult.RecordCount > 0 then
                       begin
                          bStartDate := bMazeretResult.FieldByName('IslemTarihi').AsDateTime;
                          bEndDate := bMazeretResult.FieldByName('GelecegiTarih').AsDateTime;

                          if not DateInRange(bIslemDate,bStartDate,bEndDate) then begin
                             bMazeretsiz := bMazeretsiz + 1;
                          end;
                       end else begin
                          bMazeretsiz := bMazeretsiz + 1;
                       end;
                    end;
                  end;
                end;

                if bMazeretsiz >= StrToInt(bCCDay) then
                   KartKapat(bKartId,bCCDay);

                Next;
            end else begin
                bGunFarki := DaysBetween(Now,FirstDayOfMonth(Now));
                bKartId := FieldByName('KartId').AsString;
                bMazeretsiz := 0;
                for I := 1 to bGunFarki do
                begin
                   if CheckEkmekX(bKartId,YearOf(Now),MonthOf(Now),I) <> 'X' then
                   begin
                       bMazeretResult := CheckIfMazeret(bKartId);
                       if bMazeretResult.RecordCount > 0 then
                       begin
                          bStartDate := bMazeretResult.FieldByName('IslemTarihi').AsDateTime;
                          bEndDate := bMazeretResult.FieldByName('GelecegiTarih').AsDateTime;

                          if not DateInRange(EncodeDate(YearOf(Now),MonthOf(Now),I),bStartDate,bEndDate) then begin
                             bMazeretsiz := bMazeretsiz + 1;
                          end;
                       end else begin
                          bMazeretsiz := bMazeretsiz + 1;
                       end;
                   end;
                end;

                if bMazeretsiz >= StrToInt(bCCDay) then
                   KartKapat(bKartId,bCCDay);

                Next;
            end;            
        end;
    end;

  end;
end;

procedure ToTranslate(localizer : TcxLocalizer);
begin
  localizer.FileName := Format('%s\turkce.ini',[GetCurrentDir]);
  localizer.Active := true;
  localizer.Locale := 1055;
end;

function CheckEkmek(bKartId: string; Yil, Ay, Gun: integer): string;
var
 bHareket : THareket;
 I : integer;
 bFound : boolean;
begin

  bFound := false;

  with bHareket do begin
    KartId := bKartId;
    IslemZamani := EncodeDate(Yil,Ay,Gun);
  end;


  for I := 0 to AllLastHareket.Count -1 do
  begin
    if (AllLastHareket[I].KartId = bHareket.KartId) and
          (FormatDateTime('dd.mm.yyyy',AllLastHareket[I].IslemZamani) = FormatDateTime('dd.mm.yyyy',bHareket.IslemZamani))
    then begin
      bFound := true;
    end;
  end;

  Result := IfThen(bFound,'X','');
end;

function CheckMazeret(KartId: string; Yil, Ay,
  Gun: integer): string;
var
    bYil,bAy,bGun : string;
    bQuery : TUniQuery;
begin
    bQuery := TUniQuery.Create(nil);
    bYil :=  Yil.ToString;
    bAy := IfThen(Ay > 9,Ay.ToString,'0'+Ay.ToString);
    bGun :=  IfThen(Gun > 9,Gun.ToString,'0'+Gun.ToString);

    with bQuery do begin
      Connection := frmDb.dbHelper;
      Close;
      SQL.Add('select KartId from mazeretler where CONVERT(DATETIME,'''+bYil+'-'+bAy+'-'+bGun+''',102)');
      SQL.Add('between FORMAT(IslemTarihi,''yyyy-MM-dd'') and FORMAT(GelecegiTarih,''yyyy-MM-dd'') and ');
      SQL.Add('KartId = :KartId');

      ParamByName('KartId').Value := KartId;

      try
        ExecSql;
      except on E: Exception do
        ShowMessage(E.Message + Format('%s - %s - %s',[bYil,bAy,bGun]));
      end;

      if(RecordCount > 0) then begin
        Close;
        Result := 'M';
      end else begin
        Result := '';
      end;
    end
end;

procedure ClearGrid(grid : TcxGridDBTableView);
begin
  with grid.DataController do
  begin
    BeginUpdate;
    try
      while RecordCount > 0 do
        DeleteRecord(0);
    finally
      EndUpdate;
    end;
  end;
end;


function ToDatabase(SqlCode: string): boolean;
begin
  with frmDb do begin
      if not dbHelper.Connected then
         dbHelper.Connect;

      with myQuery do begin
        try
          SQL.Clear;
          SQL.Text := SqlCode;
          Execute;
          Result := true;
        Except on E : Exception do
          begin
            ShowMessage(E.Message);
            Result := false;
          end;
        end;
      end;
  end;
end;

function FromDatabase(SqlCode: string): TUniQuery;
begin
   with frmDb do begin
    if not dbHelper.Connected then
       dbHelper.Connect;

    with myQuery do begin
      try
        Close;
        SQL.Clear;
        SQL.Text := SqlCode;
        Open;

        if RecordCount > 0 then
          Result := myQuery;

      Except on E : Exception do
        begin
          Result := nil;
        end;
      end;
    end;
  end;
end;

function LoadFileToStr(const FileName: TFileName): String;
var LStrings: TStringList;
begin
    LStrings := TStringList.Create;
    try
      LStrings.Loadfromfile(FileName);
      Result := LStrings.text;
    finally
      FreeAndNil(LStrings);
    end;
end;

procedure SaveData(SECTION : string;KEY : string;VALUE : string);
var
  IniF: TIniFile;
begin
  IniF := TIniFile.Create(GetCurrentDir + '\Settings.ini');
  try
     IniF.WriteString(SECTION,KEY,VALUE);
  finally
     IniF.Free;
  end;
end;

function ReadData(SECTION : string;KEY, VALUE: string): string;
var
  IniF: TIniFile;
begin
  IniF := TIniFile.Create(GetCurrentDir + '\Settings.ini');
  try
     Result := IniF.ReadString(SECTION,KEY,VALUE);
  finally
     IniF.Free;
  end;
end;

end.
