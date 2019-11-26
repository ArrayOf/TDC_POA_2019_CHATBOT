unit FooBar;

interface

uses
  System.JSON, System.Classes;

type

{$METHODINFO ON}
  TFooBar = class(TComponent)
  public
    function HelloWord: TJSONObject;
  end;
{$METHODINFO OFF}

implementation

{ TFooBar }

function TFooBar.HelloWord: TJSONObject;
begin
  Result := TJSONObject.Create();
  Result.AddPair('msg', 'Olá Mundo!')
end;

end.
