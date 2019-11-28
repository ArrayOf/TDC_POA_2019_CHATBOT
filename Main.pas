unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.Controls.Presentation, FMX.Objects,
  FMX.Layouts, FMX.Edit, FMX.ScrollBox, FMX.Memo,

  REST.Types,
  REST.Client,
  Web.HTTPApp,
  System.JSON,
  System.Threading,

{$IFDEF ANDROID}
  Androidapi.JNI.GraphicsContentViewText, Androidapi.Helpers,
  Androidapi.JNI.Telephony, Androidapi.JNI.Provider, Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Os,
  Androidapi.JNI.App, Data.Bind.Components, Data.Bind.ObjectScope,
  System.ImageList, FMX.ImgList
{$ENDIF};

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    GestureManager1: TGestureManager;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    Label1: TLabel;
    Edit1: TEdit;
    FlowLayout1: TFlowLayout;
    Label2: TLabel;
    Edit2: TEdit;
    Layout2: TLayout;
    Label3: TLabel;
    Edit3: TEdit;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    EditButton1: TEditButton;
    EditButton2: TEditButton;
    EditButton3: TEditButton;
    GridPanelLayout2: TGridPanelLayout;
    EdtText: TEdit;
    Memo1: TMemo;
    BtnSend: TEditButton;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure EditButton2Click(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);

    procedure SendTextToDialogFlow(Text: string);
    procedure CreateRequestJSON(Text: string; out JSON: string);

    procedure EditButton1Click(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
  private
    { Private declarations }
    fOAuthID: string;
    fProjectID: string;
    fSessionID: string;

  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TTabbedForm.EditButton1Click(Sender: TObject);
begin
  fProjectID := Edit2.Text;
end;

procedure TTabbedForm.EditButton2Click(Sender: TObject);
begin
  fOAuthID := Edit1.Text
  // https://dialogflow.googleapis.com/v2/projects/newagent-fcaogp/agent/sessions/teste:detectIntent
end;

procedure TTabbedForm.EditButton3Click(Sender: TObject);
begin
  fSessionID := Edit3.Text;
end;

procedure TTabbedForm.BtnSendClick(Sender: TObject);
var
  aTask: ITask;
begin
  Memo1.Lines.Add('Eu: ' + EdtText.Text);

  aTask := TTask.Create(
    procedure()
    begin
      SendTextToDialogFlow(EdtText.Text);
    end);
  aTask.Start;

end;

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;

  Edit1.Text :=
    'ya29.ImCyB73JJrYh6zhk8aX--kV8T_TwrEdy4pRX6x1-7KwlILoYMrT-OG_TaNAArmOUoW6JrbDfbJmoK6FWJM9NHcnJk2-U6zlSSUo5HTf3E2rjo9xwkcRhrS9M6iRxtq_FJQI';
  Edit2.Text := 'newagent-fcaogp';
  Edit3.Text := 'teste';

end;

procedure TTabbedForm.FormGesture(Sender: TObject;
const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount - 1]
        then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex + 1];
        Handled := True;
      end;

    sgiRight:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex - 1];
        Handled := True;
      end;
  end;
{$ENDIF}
end;

procedure TTabbedForm.SendTextToDialogFlow(Text: string);
var
  oResponse: TJSONObject;
  oBody: string;

  oParam: TRESTRequestParameter;
  oTextContent: TJSONObject;
  oQueryResult: TJSONObject;

begin
  oTextContent := nil;
  try

    RESTRequest.Method := TRESTRequestMethod.rmPost;
    RESTRequest.Params.ParameterByName('project-id').Value := fProjectID;
    RESTRequest.Params.ParameterByName('session-id').Value := fSessionID;

    oParam := RESTRequest.Params.AddItem;
    oParam.Name := 'Authorization';
    oParam.Value := 'Bearer ' + fOAuthID;
    oParam.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
    oParam.Options := [TRESTRequestParameterOption.poDoNotEncode];

    CreateRequestJSON(Text, oBody);

    TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        Memo1.Lines.Add('Processando ....: ' + oBody);
      end);

    RESTRequest.AddBody(oBody, TRESTContentType.ctAPPLICATION_JSON);

    RESTRequest.Execute;
    oResponse := RESTRequest.Response.JSONValue as TJSONObject;

    TThread.Synchronize(TThread.CurrentThread,
      procedure()
      begin
        Memo1.Lines.Delete(Memo1.Lines.Count - 1);
      end);

    if RESTRequest.Response.StatusCode = 200 then
    begin
      oResponse := RESTRequest.Response.JSONValue as TJSONObject;
      oQueryResult := oResponse.GetValue('queryResult') as TJSONObject;

      TThread.Synchronize(TThread.CurrentThread,
        procedure()
        begin
          EdtText.Text := '';
          Memo1.Lines.Add(oQueryResult.GetValue('fulfillmentText').Value);
        end);
    end
    else
    begin
      TThread.Synchronize(TThread.CurrentThread,
        procedure()
        begin
          Memo1.Lines.Add(RESTRequest.Response.StatusText);
          Memo1.Lines.Add(RESTRequest.Response.Content);
        end);
    end;

  finally
    oResponse.Free;
  end;
end;

procedure TTabbedForm.CreateRequestJSON(Text: string; out JSON: string);
var
  oBody: TJSONObject;
  oText: TJSONObject;
  oTextContent: TJSONObject;
begin

  try
    oBody := TJSONObject.Create;
    oText := TJSONObject.Create;
    oTextContent := TJSONObject.Create;

    oTextContent.AddPair('text', Text);
    oTextContent.AddPair('languageCode', 'pt-BR');

    oText.AddPair('text', oTextContent);
    oBody.AddPair('queryInput', oText);

    JSON := oBody.ToString;
  finally
    oBody.Free;
    oText.Free;
    oTextContent.Free;
  end;
end;

end.
