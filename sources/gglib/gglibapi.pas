unit gglibapi;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils;

type
  PCharArray = ^TCharArray;

function NewGUID: string;
procedure NewGUIDS(const aCount: integer; var aStrings: PCharArray);

implementation

uses
  GUIDSGenerator;

function NewGUID: string;
begin
  with TGUIDSGenerator.Create do
  try
    Result:= Generate;
  finally
    Destroy;
  end;
end;

procedure NewGUIDS(const aCount: integer; var aStrings: PCharArray);
var
  _Strings: TStringArray;
begin
  with TGUIDsGenerator.Create do
  try
    Generate(acount, _Strings);
  finally
    Destroy;
  end;

end;

end.

