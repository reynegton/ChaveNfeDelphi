unit UChaveNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBClient, Mask, DBCtrls, AtkDA,
  rxToolEdit, rxCurrEdit, CellEditors;

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
    DsDados: TDataSource;
    CDSDadosChaveNFe: TStringField;
    DBCBxUfs: TDBComboBoxValues;
    EdtChaveNfe: TDBEdit;
    EdtDV: TDBEdit;
    EdtCodNfe: TDBEdit;
    EdtNumDocto: TDBEdit;
    EdtSerieNfe: TDBEdit;
    EdtModDocto: TDBEdit;
    EdtCNPJ: TDBEdit;
    EdtMesAno: TDBEdit;
    procedure BtnQuebraChaveClick(Sender: TObject);
    procedure BtnCalcDVClick(Sender: TObject);
    procedure BtnGeraChaveNFeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtSerieNfeExit(Sender: TObject);
    procedure EdtNumDoctoExit(Sender: TObject);
    procedure EdtCodNfeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   // procedure SetEditNumbers(HEdit: THandle);
  private



    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChaveNfe: TFChaveNfe;

implementation

uses UPrincipal, UFunctions;

{$R *.dfm}

procedure TFChaveNfe.BtnQuebraChaveClick(Sender: TObject);
  var ChaveNfe:String;
begin

  ChaveNfe := CDSDadosChaveNfe.AsString;
  if (Length(ChaveNfe) <> 44) or (ChaveNfe[44] <> CalcMod11(Copy(ChaveNfe,0,43))) then
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
  CDSDadosChaveNfe.AsString := CDSDadosChaveNfe.AsString + CalcMod11(CDSDadosChaveNfe.AsString);
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
  DV := CalcMod11 (chave);
  if not (CDSDados.State in [dsinsert,dsedit]) then
    CDSDados.Edit;
  if CDSDadosDV.AsString <> '' then
  begin
    if CDSDadosDV.AsString <> DV then
    begin
      if messagedlg('DV Informado invalido, deseja recalcular ?',mtCustom,[mbYes,mbNo], 0) = mrYes then
        CDSDadosDV.AsString := DV
      else
        exit;
    end;
  end
  else
    CDSDadosDV.AsString := DV;
  CDSDadosChaveNfe.AsString :=  chave + DV;
end;




procedure TFChaveNfe.FormShow(Sender: TObject);
begin
  if not (CDSDados.Active and (CDSDados.State in [dsinsert,dsedit])) then
    CDSDados.Append;
end;

procedure TFChaveNfe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TFPrincipal(owner).FChaveNfe := nil;
  TFPrincipal(owner).FChaveNfe.Free;
  self.Release;
end;

procedure TFChaveNfe.EdtSerieNfeExit(Sender: TObject);
begin
  CDSDadosSerieNFe.AsString := FormatFloat('000', CDSDadosSerieNFe.AsFloat);
end;

procedure TFChaveNfe.EdtNumDoctoExit(Sender: TObject);
begin
  CDSDadosNumeroNFe.AsString := FormatFloat('000000000', CDSDadosNumeroNFe.AsFloat);
end;

procedure TFChaveNfe.EdtCodNfeExit(Sender: TObject);
begin
  CDSDadosCodNFe.AsString := FormatFloat('000000000',CDSDadosCodNFe.AsFloat);
end;

{procedure TFChaveNfe.SetEditNumbers(HEdit: THandle);
var fstyle: DWord;
begin
  fstyle :=  GetWindowLong(HEdit,GWL_STYLE);
  SetWindowLong(HEdit, GWL_STYLE, fstyle or ES_NUMBER);
end;}

procedure TFChaveNfe.FormCreate(Sender: TObject);
begin
  SetEditNumbers(EdtChaveNfe.Handle);
  SetEditNumbers(EdtMesAno.Handle);
  SetEditNumbers(EdtCNPJ.Handle);
  SetEditNumbers(EdtModDocto.Handle);
  SetEditNumbers(EdtSerieNfe.Handle);
  SetEditNumbers(EdtNumDocto.Handle);
  SetEditNumbers(EdtCodNfe.Handle);
  SetEditNumbers(EdtDV.Handle);
end;

end.
