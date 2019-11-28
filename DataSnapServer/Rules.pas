unit Rules;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  IPPeerServer,
  Datasnap.DSCommonServer,
  Datasnap.DSHTTP,
  Datasnap.DSServer,
  System.JSON,
  Data.DBXCommon;

type
  TDataModule1 = class(TDataModule)
    DSServer1: TDSServer;
    DSHTTPService1: TDSHTTPService;
    DSServerClass1: TDSServerClass;
    DSServerClass2: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure DSServerClass2GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure DSHTTPService1FormatResult(Sender: TObject; var ResultVal: TJSONValue; const Command: TDBXCommand; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses FooBar,
  DialogFlow;

{$R *.dfm}

procedure TDataModule1.DSHTTPService1FormatResult(Sender: TObject; var ResultVal: TJSONValue; const Command: TDBXCommand; var Handled: Boolean);
begin
  Handled   := True;
  ResultVal := TJSONArray(ResultVal).Items[0];
end;

procedure TDataModule1.DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TFooBar;
end;

procedure TDataModule1.DSServerClass2GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDialogFlow;
end;

end.
