unit Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfMain = class(TForm)
    Panel1: TPanel;
    memoResponse: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses Rules;

procedure TfMain.Button1Click(Sender: TObject);
begin
  DataModule1.DSServer1.Start;
  Self.Button1.Enabled := False;
  Application.ProcessMessages;
end;

end.
