{ This file was automatically created by Typhon IDE. Do not edit!
  This source is only used to compile and install the package.
 }

unit PkgGUIDSGeneratorAssistant;

{$warn 5023 off : no warning about unused units}
interface

uses
  GUIDSGeneratorAssistant, TyphonPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('GUIDSGeneratorAssistant', @GUIDSGeneratorAssistant.Register);
end;

initialization
  RegisterPackage('PkgGUIDSGeneratorAssistant', @Register);
end.
