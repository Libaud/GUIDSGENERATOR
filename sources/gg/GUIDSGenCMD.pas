unit GUIDSGenCMD;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, CustApp, GUIDSGenerator;

type

  { TGUIDGenerator }

  TGUIDSGeneratorCMD = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

var
  Application: TGUIDSGeneratorCMD;

implementation

{ TGUIDGenerator }

procedure TGUIDSGeneratorCMD.DoRun;
var
  ErrorMsg: String;
  oGUIDGenerator: TGUIDSGenerator;
  _iGUID, _Count: integer;
begin
  // quick check parameters
  ErrorMsg:= CheckOptions('hc', 'help count');
  if ErrorMsg <> '' then
  begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help')
   or HasOption('?') then
  begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  oGUIDGenerator:= TGUIDSGenerator.Create;
  with oGUIDGenerator do
  try
    try
      if ParamCount <= 0 then
        WriteLn(Format('New GUID generate : %s.', [Generate]))
      else
        if HasOption('c') then
        begin
          _Count:= StrToInt(GetOptionValue('c'));
          for _iGUID:= 1 to _Count do
            WriteLn(Format('New GUID generate : %s.', [Generate]));
        end;
    except
      on e: Exception do
        WriteLn(e.Message);
    end;
  finally
    Destroy
  end;

  // stop program loop
  Terminate;
end;

constructor TGUIDSGeneratorCMD.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TGUIDSGeneratorCMD.Destroy;
begin
  inherited Destroy;
end;

procedure TGUIDSGeneratorCMD.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;


end.

