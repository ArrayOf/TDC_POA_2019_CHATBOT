program TDC_POA_2019;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {TabbedForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTabbedForm, TabbedForm);
  Application.Run;
end.
