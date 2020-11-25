unit uCustomDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCustomDialog = class(TForm)
    lblCaption: TLabel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCustomDialog: TfrmCustomDialog;

implementation

{$R *.dfm}


procedure TfrmCustomDialog.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

end.
