program ChaveNFe;

uses
  Forms,
  UChaveNFe in 'UChaveNFe.pas' {FChaveNfe};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Chave de Acesso NFe';
  Application.CreateForm(TFChaveNfe, FChaveNfe);
  Application.Run;
end.
