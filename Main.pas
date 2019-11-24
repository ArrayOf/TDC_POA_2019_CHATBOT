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
    Edit4: TEdit;
    Memo1: TMemo;
    EditButton4: TEditButton;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);


    procedure SendTextToDialogFlow();
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

procedure TTabbedForm.EditButton2Click(Sender: TObject);
begin
  fOAuthID := Edit1.Text
end;

procedure TTabbedForm.EditButton4Click(Sender: TObject);
begin
  // Memo1.Lines.Add(fOAuthID);

end;

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;

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

end.
