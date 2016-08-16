unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,UChaveNFe,UCnpjBase,UCalcMD5,midaslib;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    menu1: TMenuItem;
    ChavedeAcesso1: TMenuItem;
    CNPJ1: TMenuItem;
    CNPJBase1: TMenuItem;
    Diversos1: TMenuItem;
    CalculodeMD51: TMenuItem;
    procedure ChavedeAcesso1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CNPJBase1Click(Sender: TObject);
    procedure CalculodeMD51Click(Sender: TObject);
  private

    { Private declarations }
  public
    FChaveNfe : TFChaveNfe;
    FCNPJBase : TFCnpjBase;
    FCalcMD5  : TFCalcMD5;
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
  FCalcMD5  := nil;
end;

procedure TFPrincipal.CalculodeMD51Click(Sender: TObject);
begin
  if not (assigned(FCalcMD5)) then
  begin
    FCalcMD5 := TFCalcMD5.Create(self);
    FCalcMD5.Show;
  end
  else
  begin
    FCalcMD5.WindowState := wsnormal ;
    FCalcMD5.Position := poScreenCenter;
    FCalcMD5.Visible := true;
  end;
end;

end.
