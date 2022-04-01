{ This file was automatically created by Typhon IDE. Do not edit!
  This source is only used to compile and install the package.
 }

unit GUIDSGeneratorNewPkg;

{$warn 5023 off : no warning about unused units}
interface

uses
  TestGUIDSGenerator, GUIDSGenerator, RegisterGUIDSGenerator, TyphonPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('RegisterGUIDSGenerator', @RegisterGUIDSGenerator.Register);
end;

initialization
  RegisterPackage('GUIDSGeneratorNewPkg', @Register);
end.
