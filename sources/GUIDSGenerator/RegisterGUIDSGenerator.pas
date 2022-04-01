unit RegisterGUIDSGenerator;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, GUIDSGenerator;

procedure Register;

implementation

procedure Register;
begin
  RegisterClass(TGUIDSGenerator);
end;

end.
