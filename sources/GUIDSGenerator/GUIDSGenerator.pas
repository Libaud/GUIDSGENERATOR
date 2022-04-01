unit GUIDSGenerator;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils;

type
  TGUIDStringArray = array of string;

  TGUIDSGenerator = class(TPersistent)
    private
    public
      function Generate: string; {$ifndef FPC} overload;{$endif}
      procedure Generate(const aCount: integer; aStrings: TStrings; const aReset: boolean = false); {$ifndef FPC} overload;{$endif}
      procedure Generate(const aCount: integer; var aStrings: TGUIDStringArray; const aReset: boolean = false); {$ifndef FPC} overload;{$endif}
  end;

implementation

function TGUIDSGenerator.Generate: string;
var
  _GUID: TGUID;
  _GGError: integer;
begin
  _GGError:= CreateGUID(_GUID);
  if _GGError = 0 then
    Result:= GUIDToString(_GUID)
  else
    raise
      Exception(Format('Error in GUID generation (Code %s) !', [IntToStr(_GGError)]));
end;

procedure TGUIDSGenerator.Generate(const aCount: integer; aStrings: TStrings; const aReset: boolean);
var
  _iGUID: integer;
begin
  if aReset then
    aStrings.Clear;
  for _iGUID:= 1 to aCount do
    aStrings.Add(Generate);
end;

procedure TGUIDSGenerator.Generate(const aCount: integer; var aStrings: TGUIDStringArray; const aReset: boolean);
var
  _OldSize, _NewSize, _iGUID: integer;
begin
  _OldSize:= Length(aStrings);
  _NewSize:= _OldSize + aCount;
  SetLength(aStrings, _NewSize);
  for _iGUID:= _OldSize to _NewSize - 1 do
    aStrings[_iGUID]:= Generate;
end;

end.

