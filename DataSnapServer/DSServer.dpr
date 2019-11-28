program DSServer;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  Rules in 'Rules.pas' {DataModule1: TDataModule},
  FooBar in 'FooBar.pas',
  DialogFlow in 'DialogFlow.pas',
  DialogFlowRequest in 'DialogFlowRequest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
