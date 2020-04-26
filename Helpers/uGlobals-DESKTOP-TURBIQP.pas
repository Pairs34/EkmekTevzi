unit uGlobals;

interface
  uses System.IniFiles,System.SysUtils,Uni,Vcl.Dialogs,cxLocalization,System.Classes;

  procedure SaveData(SECTION : string;KEY : string;VALUE : string);
  function ReadData(SECTION : string;KEY, VALUE: string): string;
  function FromDatabase(SqlCode: string): TUniQuery;
  function ToDatabase(SqlCode: string): boolean;
  procedure ToTranslate(localizer : TcxLocalizer);
  function LoadFileToStr(const FileName: TFileName): String;

implementation

uses uDbHelper;

procedure ToTranslate(localizer : TcxLocalizer);
begin
  localizer.FileName := Format('%s\turkce.ini',[GetCurrentDir]);
  localizer.Active := true;
  localizer.Locale := 1055;
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
