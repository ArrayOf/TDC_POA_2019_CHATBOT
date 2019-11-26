unit Rules;

interface

uses
  System.SysUtils,
  System.Classes,
  IPPeerServer,
  Datasnap.DSCommonServer,
  Datasnap.DSHTTP,
  Datasnap.DSServer;

type
  TDataModule1 = class(TDataModule)
    DSServer1: TDSServer;
    DSHTTPService1: TDSHTTPService;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses FooBar;

{$R *.dfm}

procedure TDataModule1.DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TFooBar;
end;

end.
