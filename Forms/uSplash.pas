unit uSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxImage, dxGDIPlusClasses, Vcl.ExtCtrls,Activex;

type
  TfrmSplash = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses uGlobals, uDbHelper;

procedure TfrmSplash.FormActivate(Sender: TObject);
var
  bThread : TThread;
  bDebugMode : Integer;
begin
    bDebugMode := StrToInt(ReadData('DATA','DEBUG','0'));

    if bDebugMode = 1 then
    begin
        CoInitialize(nil);

        try
          with frmDb do begin
              if not dbHelper.Connected then
                 dbHelper.Connect;

              CheckKartKapat;

              with qMazeretSil do begin
                  ExecSQL;
              end;

              PostMessage(Self.Handle, WM_CLOSE, 0, 0);
          end;
        except on E: Exception do begin
              ShowMessage(E.Message);
              PostMessage(Self.Handle, WM_CLOSE, 0, 0);
            end
        end;

        CoUninitialize;
    end else begin
        bThread := TThread.CreateAnonymousThread(
        procedure
        begin
          CoInitialize(nil);

          try
            with frmDb do begin
                if not dbHelper.Connected then
                   dbHelper.Connect;

                CheckKartKapat;

                with qMazeretSil do begin
                    ExecSQL;
                end;

                PostMessage(Self.Handle, WM_CLOSE, 0, 0);
            end;
          except on E: Exception do begin
                ShowMessage(E.Message);
                PostMessage(Self.Handle, WM_CLOSE, 0, 0);
              end
          end;

          CoUninitialize;
        end
      );

      bThread.Start;
    end;
end;

end.
