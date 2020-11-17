unit uViewHareket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,Uni;

type
  TfrmKisiHareketleri = class(TForm)
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKisiHareketleri: TfrmKisiHareketleri;

implementation

{$R *.dfm}

uses uDbHelper;

procedure TfrmKisiHareketleri.FormActivate(Sender: TObject);
var
  bQuery : TUniQuery;
  bDataSource : TUniDataSource;
begin
  bQuery := TUniQuery.Create(nil);
  bDataSource := TUniDataSource.Create(nil);
  bDataSource.DataSet := bQuery;

  with uDbHelper.frmDb do begin
    bQuery.Connection := dbHelper;
    bQuery.SQL.Clear;
    bQUery.SQL.Add('select * from GetLastAction');
    bQuery.Execute;
  end;

  cxGridDBTableView.ClearItems;
  cxGridDBTableView.DataController.DataSource := nil;
  cxGridDBTableView.DataController.DataSource := bDataSource;
  cxGridDBTableView.DataController.CreateAllItems;
end;

procedure TfrmKisiHareketleri.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

end.
