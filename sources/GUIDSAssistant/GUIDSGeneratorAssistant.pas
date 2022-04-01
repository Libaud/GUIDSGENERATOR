unit GUIDSGeneratorAssistant;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, IDECommands;

var
  oInsertGUIDCmd: TIDECommand;

procedure InsertGUIDIntoSourceAtCurrentPos(aSender: TObject);

procedure Register;

implementation

uses
  GUIDSGenerator, SrcEditorIntf, LCLType;

const
  SInsertGUID = 'Insert GUID';

procedure InsertGUIDIntoSourceAtCurrentPos(aSender: TObject);
var
  oSourceEditor: TSourceEditorInterface;
  oGUIDSGenerator: TGUIDSGenerator;
begin
  oSourceEditor:= SourceEditorManagerIntf.ActiveEditor;
  if oSourceEditor = nil then
    exit;
  if oSourceEditor.ReadOnly then
    exit;
  oGUIDSGenerator:= TGUIDSGenerator.Create;
  with oGUIDSGenerator do
  try
      oSourceEditor.Selection:= Generate;
  finally
    Destroy;
  end;
end;

procedure Register;
var
  _Key : TIDEShortCut;
  _Cat : TIDECommandCategory;
begin
  _Key:=IDEShortCut(VK_G, [ssAltGr], VK_UNKNOWN, []);
  oInsertGUIDCmd:= RegisterIDECommand(_Cat, SInsertGUID, SInsertGUID, _Key,
                                      nil, @InsertGUIDIntoSourceAtCurrentPos);
end;

end.

