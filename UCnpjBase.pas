unit UCnpjBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons;

type
  TFCnpjBase = class(TForm)
    Label1: TLabel;
    CDSCNPJ: TClientDataSet;
    DSCNPJ: TDataSource;
    CDSCNPJCNPJ: TStringField;
    CDSCNPJCNPJ_Base: TStringField;
    CDSCNPJCNPJ_Filial: TStringField;
    CDSCNPJCNPJ_DV: TStringField;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BtnGeraChaveNFe: TBitBtn;
    procedure FormShow(Sender: TObject);
    function CalculoDvCNPJ(CNPJ_Base,CNPJ_Filial: String) : String;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnGeraChaveNFeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCnpjBase: TFCnpjBase;

implementation

uses UFunctions, UPrincipal;

{$R *.dfm}

procedure TFCnpjBase.FormShow(Sender: TObject);
begin
  if not (CDSCNPJ.Active and (CDSCNPJ.State in [dsinsert,dsedit])) then
    CDSCNPJ.Append;
end;

function TFCnpjBase.CalculoDvCNPJ(CNPJ_Base, CNPJ_Filial: String): String;
var DV : String;
begin
  DV := CalcMod11(CNPJ_Base+CNPJ_Filial);
  DV := DV+CalcMod11(CNPJ_Base+CNPJ_Filial+DV);

  Result := DV;
end;

procedure TFCnpjBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TFPrincipal(owner).FCNPJBase := nil;
  TFPrincipal(owner).FCNPJBase.Free;
  self.Release;
end;

procedure TFCnpjBase.BitBtn1Click(Sender: TObject);
var DVCalc: String;
begin
  if  Length(CDSCNPJCNPJ.AsString) <> 14 then
  begin
    ShowMessage('Digite um CNPJ com 14 DIgitos');
    exit;
  end;

  CDSCNPJCNPJ_Base.AsString := Copy(CDSCNPJCNPJ .AsString,0,8);
  CDSCNPJCNPJ_Filial.AsString := Copy(CDSCNPJCNPJ .AsString,9,4);

  DVCalc := CalculoDvCNPJ(CDSCNPJCNPJ_Base.AsString, CDSCNPJCNPJ_Filial.AsString);

  CDSCNPJCNPJ_DV.AsString := Copy(CDSCNPJCNPJ .AsString,13,2);

  if DvCalc <> CDSCNPJCNPJ_DV.AsString then
  begin
    if messagedlg('DV Informado invalido, deseja recalcular ?',mtCustom,[mbYes,mbNo], 0) = mrYes then
      CDSCNPJCNPJ_DV.AsString := DVCalc;
  end;

end;

procedure TFCnpjBase.BtnGeraChaveNFeClick(Sender: TObject);
var DVCalc,CamposLengthErrado: String;
begin
  if (CDSCNPJCNPJ_Base.AsString = '') or
     (CDSCNPJCNPJ_Filial.AsString = '') then
  begin
    ShowMessage('Informe todos os campos do CNPJ, o unico que pode ficar em branco é DV');
    exit;
  end;

  if Length(CDSCNPJCNPJ_Base.AsString) <> 8 then
    CamposLengthErrado := 'CNPJ Base deve possuir 8 digitos';
  if Length(CDSCNPJCNPJ_Filial.AsString) <> 4 then
    if CamposLengthErrado <> '' then
      CamposLengthErrado := CamposLengthErrado +#13+'Filial deve possuir 4 digitos'
    else
      CamposLengthErrado := 'Filial deve possuir 4 digitos';

  if CamposLengthErrado <> '' then
  begin
    ShowMessage(CamposLengthErrado);
    exit;
  end;

  DVCalc := CalculoDvCNPJ(CDSCNPJCNPJ_Base.AsString, CDSCNPJCNPJ_Filial.AsString);
  if DvCalc <> CDSCNPJCNPJ_DV.AsString then
  begin
    if messagedlg('DV Informado invalido, deseja recalcular ?',mtCustom,[mbYes,mbNo], 0) = mrYes then
      CDSCNPJCNPJ_DV.AsString := DVCalc;
  end;

  CDSCNPJCNPJ.AsString := CDSCNPJCNPJ_Base.AsString+CDSCNPJCNPJ_Filial.AsString+CDSCNPJCNPJ_DV.AsString;
end;

procedure TFCnpjBase.FormCreate(Sender: TObject);
begin
  SetEditNumbers(DBEdit1.Handle);
  SetEditNumbers(DBEdit2.Handle);
  SetEditNumbers(DBEdit3.Handle);
  SetEditNumbers(DBEdit4.Handle);
end;

end.

