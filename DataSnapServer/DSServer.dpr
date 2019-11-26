program DSServer;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  Rules in 'Rules.pas' {DataModule1: TDataModule},
  FooBar in 'FooBar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
