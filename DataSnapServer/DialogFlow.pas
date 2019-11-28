unit DialogFlow;

interface

uses
  System.Classes,
  System.JSON,

  DialogFlowRequest;

type

{$METHODINFO ON}
  TDialogFlow = class(TComponent)
  public
    function UpdateResolver(AContent: TJSONObject): TJSONValue;
  end;
{$METHODINFO OFF}

implementation

{ TDialogFlow }

uses Main, System.SysUtils;

function TDialogFlow.UpdateResolver(AContent: TJSONObject): TJSONValue;
var
  oRequest : TDialogFlowRequest;
  sProduto : string;
  sResponse: string;
begin
  oRequest := TDialogFlowRequest.FromJsonString(AContent.ToJSON);

  sProduto := oRequest.queryResult.parameters.product;

  sResponse := StringReplace(fMain.memoResponse.Lines.Text, '$PRODUCT', sProduto, [rfReplaceAll, rfIgnoreCase]);

  try
    Result := TJSONObject.ParseJSONValue(sResponse);
  finally
    oRequest.Free;
  end;
end;

end.
