program Utilidades;

uses
  Forms,
  UChaveNFe in 'UChaveNFe.pas' {FChaveNfe},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UFunctions in 'UFunctions.pas',
  UCnpjBase in 'UCnpjBase.pas' {FCnpjBase},
  UCalcMD5 in 'UCalcMD5.pas' {FCalcMD5};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Utilidades';
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
