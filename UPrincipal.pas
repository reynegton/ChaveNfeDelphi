unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,UChaveNFe,UCnpjBase;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    menu1: TMenuItem;
    ChavedeAcesso1: TMenuItem;
    CNPJ1: TMenuItem;
    CNPJBase1: TMenuItem;
    procedure ChavedeAcesso1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CNPJBase1Click(Sender: TObject);
  private

    { Private declarations }
  public
    FChaveNfe : TFChaveNfe;
    FCNPJBase : TFCnpjBase;
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses UFunctions;

{$R *.dfm}

procedure TFPrincipal.ChavedeAcesso1Click(Sender: TObject);
begin
  if not (assigned(FChaveNfe)) then
  begin
    FChaveNfe := TFChaveNfe.Create(self);
    FChaveNfe.Show;
  end
  else
  begin
    FChaveNfe.WindowState := wsnormal ;
    FChaveNfe.Position := poScreenCenter;
    fchavenfe.Visible := true;
  end;
end;

procedure TFPrincipal.CNPJBase1Click(Sender: TObject);
begin
  if not (assigned(FCNPJBase)) then
  begin
    FCNPJBase := TFCnpjBase.Create(self);
    FCNPJBase.Show;
  end
  else
  begin
    FCNPJBase.WindowState := wsnormal ;
    FCNPJBase.Position := poScreenCenter;
    FCNPJBase.Visible := true;
  end;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  FChaveNfe := nil;
  FCnpjBase := nil;
end;

end.
