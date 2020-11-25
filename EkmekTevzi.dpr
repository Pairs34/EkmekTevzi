program EkmekTevzi;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  AksReader_Library_3_0_TLB in 'AksReader_Library_3_0_TLB.pas',
  uKisiEkle in 'Forms\uKisiEkle.pas',
  uDbHelper in 'Helpers\uDbHelper.pas' {frmDb: TDataModule},
  uKisiList in 'Forms\uKisiList.pas' {frmKisiList},
  uBagis in 'Forms\uBagis.pas' {frmBagis},
  uHareketler in 'Forms\uHareketler.pas' {frmHareket},
  uReports in 'Forms\uReports.pas' {frmReports},
  uSettings in 'Forms\uSettings.pas' {frmSettings},
  uGlobals in 'Helpers\uGlobals.pas',
  uBagisEx in 'Forms\uBagisEx.pas' {frmBagisEx},
  uLogin in 'Forms\uLogin.pas' {frmLogin},
  uMazeret in 'Forms\uMazeret.pas' {frmMazeret},
  uMazeretList in 'Forms\uMazeretList.pas' {frmMazeretList},
  uSplash in 'Forms\uSplash.pas' {frmSplash},
  Vcl.Themes,
  Vcl.Styles,
  uMazeretEdit in 'Forms\uMazeretEdit.pas' {frmMazeretEdit},
  uSQLEditor in 'Forms\uSQLEditor.pas' {frmSQLEditor},
  uViewHareket in 'Forms\uViewHareket.pas' {frmKisiHareketleri},
  uCustomDialog in 'Forms\uCustomDialog.pas' {frmCustomDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDb, frmDb);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmCustomDialog, frmCustomDialog);
  Application.Run;
end.
