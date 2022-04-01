unit Main;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, Menus,
  ExtCtrls, GUIDSGenerator;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private
    oGUIDS: TGUIDSGenerator;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.frm}

uses
  ClipBrd;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  oGUIDS.Generate(SpinEdit1.Value, ListBox1.Items, CheckBox1.Checked);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  with SaveDialog1 do
  begin
    Execute;
    ListBox1.Items.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  oGUIDS.Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);

  Function UserDir : String;
  {$ifdef mswindows}
  Var
    PATH : Array[0..MAX_PATH] of char;
  {$endif}
  begin
  {$ifdef mswindows}
     Path[0]:=#0;
     SHGetFolderPath(0,CSIDL_PERSONAL,0,0,@PATH);
     Result:=StrPas(Path);
  {$else}
     Result:= GetEnvironmentVariable('HOME')
  {$endif}
  end;

begin
  oGUIDS:= TGUIDSGenerator.Create;
  SaveDialog1.InitialDir:= GetEnvironmentVariable('HOME');
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  ListBox1.SelectAll;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Clipboard.AsText:= ListBox1.GetSelectedText;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  ListBox1.ClearSelection;
end;

end.

