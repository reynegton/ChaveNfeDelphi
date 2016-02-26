program ChaveNFe;

uses
  Forms,
  UChaveNFe in 'UChaveNFe.pas' {FChaveNfe};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFChaveNfe, FChaveNfe);
  Application.Run;
end.
