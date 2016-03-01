unit UChaveNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBClient, Mask, DBCtrls, AtkDA;

type
  TFChaveNfe = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    BtnQuebraChave: TBitBtn;
    BtnCalcDV: TBitBtn;
    BtnGeraChaveNFe: TBitBtn;
    CDSDados: TClientDataSet;
    CDSDadosCodEstado: TStringField;
    CDSDadosAnoMes: TStringField;
    CDSDadosCNPJ: TStringField;
    CDSDadosModeloNFe: TStringField;
    CDSDadosSerieNFe: TStringField;
    CDSDadosNumeroNFe: TStringField;
    CDSDadosCodNFe: TStringField;
    CDSDadosDV: TStringField;
    EdtChaveNfe: TDBEdit;
    EdtDV: TDBEdit;
    EdtCodNfe: TDBEdit;
    EdtNumDocto: TDBEdit;
    EdtSerieNfe: TDBEdit;
    EdtModDocto: TDBEdit;
    EdtCNPJ: TDBEdit;
    EdtMesAno: TDBEdit;
    DsDados: TDataSource;
    CDSDadosChaveNFe: TStringField;
    DBCBxUfs: TDBComboBoxValues;
    procedure EdtChaveNfeKeyPress(Sender: TObject; var Key: Char);
    procedure BtnQuebraChaveClick(Sender: TObject);
    procedure BtnCalcDVClick(Sender: TObject);
    procedure BtnGeraChaveNFeClick(Sender: TObject);
    procedure SomenteNumeros(Sender:TObject;var Key:Char);
    procedure FormShow(Sender: TObject);
  private

  private

  function CalcularDv(Numero: String): String;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChaveNfe: TFChaveNfe;

implementation

{$R *.dfm}

procedure TFChaveNfe.EdtChaveNfeKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFChaveNfe.BtnQuebraChaveClick(Sender: TObject);
  var ChaveNfe:String;
begin

  ChaveNfe := CDSDadosChaveNfe.AsString;
  if (Length(ChaveNfe) <> 44) or (ChaveNfe[44] <> CalcularDv(Copy(ChaveNfe,0,43))) then
  begin
    ShowMessage('Chave de Acesso invalida');
    exit;
  end;

  if not (CDSDados.State in [dsinsert,dsedit]) then
    CDSDados.Edit;

  CDSDadosCodEstado.AsString := copy(ChaveNfe,0,2);
  CDSDadosAnoMes.AsString    := Copy(ChaveNfe,3,4);
  CDSDadosCNPJ.AsString      := Copy(ChaveNfe,7,14);
  CDSDadosModeloNFe.AsString := Copy(ChaveNfe,21,2);
  CDSDadosSerieNFe.AsString  := Copy(ChaveNfe,23,3);
  CDSDadosNumeroNFe.AsString := Copy(ChaveNfe,26,9);
  CDSDadosCodNFe.AsString    := Copy(ChaveNfe,35,9);
  CDSDadosDV.AsString        := Copy(ChaveNfe,44,1);
end;

procedure TFChaveNfe.BtnCalcDVClick(Sender: TObject);
begin
  if Length(CDSDadosChaveNfe.AsString) = 44 then
  begin
    ShowMessage('Chave de acesso ja possui 44 digitos');
    exit;
  end;
  if Length(CDSDadosChaveNfe.AsString) <> 43 then
  begin
    ShowMessage('É necessario que a chave possua 43 digitos para calcular o dv');
    exit;
  end;
  if not (CDSDados.State in [dsinsert,dsedit]) then
    CDSDados.Edit;
  CDSDadosChaveNfe.AsString := CDSDadosChaveNfe.AsString + CalcularDv(CDSDadosChaveNfe.AsString);
end;

procedure TFChaveNfe.BtnGeraChaveNFeClick(Sender: TObject);
  var DV: String;
  chave:String;
begin
  if (CDSDadosCodEstado.AsString = '') or (CDSDadosAnoMes.AsString = '') or (CDSDadosCNPJ.AsString = '') or  (CDSDadosModeloNFe.AsString = '') or (CDSDadosSerieNFe.AsString = '') or
     (CDSDadosNumeroNFe.AsString = '') or (CDSDadosCodNFe.AsString = '') then
  begin
    ShowMessage('É necessario informar os campos acima antes, o unico que pode ficar vazio é o DV');
  end;

  chave := CDSDadosCodEstado.AsString + CDSDadosAnoMes.AsString + CDSDadosCNPJ.AsString + CDSDadosModeloNFe.AsString + CDSDadosSerieNFe.AsString + CDSDadosNumeroNFe.AsString + CDSDadosCodNFe.AsString;
  DV := CalcularDv (chave);
  if not (CDSDados.State in [dsinsert,dsedit]) then
    CDSDados.Edit;
  if CDSDadosDV.AsString <> '' then
  begin
    if CDSDadosDV.AsString <> DV then
    begin
      if messagedlg('DV Informado invalido, deseja recalcular',mtCustom,[mbYes,mbNo], 0) = mrYes then
        CDSDadosDV.AsString := DV
      else
        exit;
    end;
  end
  else
    CDSDadosDV.AsString := DV;
  CDSDadosChaveNfe.AsString :=  chave + DV;
end;

procedure TFChaveNfe.SomenteNumeros(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  key:=#0;
end;

function TFChaveNfe.CalcularDv(Numero: String): String;
var i,j,k : Integer;
  Soma : Integer;
  Digito : Integer;
begin
  Result := '';

  Soma := 0; k:= 2;
  for i := Length(Numero) downto 1 do
  begin
    Soma := Soma + (StrToInt(Numero[i])*k);
    inc(k);
    if k > 9 then k := 2;
  end;
  Digito := 11 - Soma mod 11;
  if Digito >= 10 then
    Digito := 0;
  Result := Result + Chr(Digito + Ord('0'));
end;

procedure TFChaveNfe.FormShow(Sender: TObject);
begin
  if not (CDSDados.Active and (CDSDados.State in [dsinsert,dsedit])) then
    CDSDados.Append;
end;

end.
