unit uDbHelper;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  frxClass, frxDBSet,Vcl.Dialogs,
  Ole2,IniFiles, DADump, UniDump, SQLServerUniProvider;

type
  TfrmDb = class(TDataModule)
    dbHelper: TUniConnection;
    myQuery: TUniQuery;
    tblUser: TUniDataSource;
    qUserList: TUniQuery;
    frxUserList: TfrxDBDataset;
    qKartKapat: TUniQuery;
    qMazeretSil: TUniQuery;
    tblMazeretList: TUniDataSource;
    qMazeretList: TUniQuery;
    AylikHareket: TUniQuery;
    tblAylikHareket: TUniDataSource;
    monthlyCount: TUniQuery;
    SQLServerUniProvider1: TSQLServerUniProvider;
    GetAylikRapor: TUniStoredProc;
    tblAylikRapor: TUniDataSource;
    GetBagisList: TUniStoredProc;
    tblBagisList: TUniDataSource;
    dailyCount: TUniQuery;
    GetDailyBagis: TUniStoredProc;
    tblDailyBagis: TUniDataSource;
    qHareketList: TUniQuery;
    dbDumper: TUniDump;
    procedure dbHelperBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDb: TfrmDb;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uGlobals;

{$R *.dfm}

procedure TfrmDb.dbHelperBeforeConnect(Sender: TObject);
var
  bSv,bPort,bUsername,bPassword,bDb,bServiceName : string;
begin
    bSv := ReadData('SERVER','SNAME','');
    bPort := ReadData('SERVER','PORT','');
    bUsername := ReadData('SERVER','UNAME','');
    bPassword := ReadData('SERVER','PASS','');
    bDb := ReadData('SERVER','DB','');
    bServiceName := ReadData('SERVER','SCNAME','');


    with dbHelper do begin
         ProviderName := 'SQL Server';
         Server := bSv;
         Port := StrToInt(bPort);
         Username := bUsername;
         Password := bPassword;
         Database := bDb;
      end;
end;

end.
