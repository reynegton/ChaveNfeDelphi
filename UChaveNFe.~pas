unit UChaveNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFChaveNfe = class(TForm)
    Panel1: TPanel;
    EdtChaveNfe: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label9: TLabel;
    Edit8: TEdit;
    Edit7: TEdit;
    Label8: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label10: TLabel;
    procedure EdtChaveNfeKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SomenteNumeros(Sender:TObject;var Key:Char);
    procedure Edit1Exit(Sender: TObject);
  private
    procedure BuscaUF;
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

procedure TFChaveNfe.BitBtn1Click(Sender: TObject);
  var ChaveNfe:String;
begin

  ChaveNfe := EdtChaveNfe.Text;
  if (Length(ChaveNfe) <> 44) or (ChaveNfe[44] <> CalcularDv(Copy(ChaveNfe,0,43))) then
  begin
    ShowMessage('Chave de Acesso invalida');
    exit;
  end;
  Edit1.Text := copy(ChaveNfe,0,2);
  Edit2.Text := Copy(ChaveNfe,3,4);
  Edit3.Text := Copy(ChaveNfe,7,14);
  Edit4.Text := Copy(ChaveNfe,21,2);
  Edit5.Text := Copy(ChaveNfe,23,3);
  Edit6.Text := Copy(ChaveNfe,26,9);
  Edit7.Text := Copy(ChaveNfe,35,9);
  Edit8.Text := Copy(ChaveNfe,44,1);
  BuscaUF;
end;

procedure TFChaveNfe.BitBtn2Click(Sender: TObject);
begin
  if Length(EdtChaveNfe.Text) = 44 then
  begin
    ShowMessage('Chave de acesso ja possui 44 digitos');
    exit;
  end;
  if Length(EdtChaveNfe.Text) <> 43 then
  begin
    ShowMessage('É necessario que a chave possua 43 digitos para calcular o dv');
    exit;
  end;

  EdtChaveNfe.Text := EdtChaveNfe.Text + CalcularDv(EdtChaveNfe.Text);
end;

procedure TFChaveNfe.BitBtn3Click(Sender: TObject);
  var DV: String;
  chave:String;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or  (Edit4.Text = '') or (Edit5.Text = '') or
     (Edit6.Text = '') or (Edit7.Text = '') then
  begin
    ShowMessage('É necessario informar os campos acima antes, o unico que pode ficar vazio é o DV');
  end;

  chave := Edit1.Text + Edit2.Text + Edit3.Text + Edit4.Text + Edit5.Text + Edit6.Text + Edit7.Text;
  DV := CalcularDv (chave);
  if Edit8.Text <> '' then
  begin
    if Edit8.Text <> DV then
    begin
      if messagedlg('DV Informado invalido, deseja recalcular',mtCustom,[mbYes,mbNo], 0) = mrYes then
        Edit8.Text := DV
      else
        exit;
    end;
  end
  else
    Edit8.Text := DV;

  EdtChaveNfe.Text :=  chave + DV
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
  CNPJ : Boolean;
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
procedure TFChaveNfe.BuscaUF;
var COD_UF : Integer;
begin
  COD_UF := strtoint(Edit1.Text);
  Label10.Caption :='';
  case COD_UF of
    11 : Label10.Caption :='RO';
    12 : Label10.Caption :='AC';
    13 : Label10.Caption :='AM';
    14 : Label10.Caption :='RR';
    15 : Label10.Caption :='PA';
    16 : Label10.Caption :='AP';
    17 : Label10.Caption :='TO';
    21 : Label10.Caption :='MA';
    22 : Label10.Caption :='PI';
    23 : Label10.Caption :='CE';
    24 : Label10.Caption :='RN';
    25 : Label10.Caption :='PB';
    26 : Label10.Caption :='PE';
    27 : Label10.Caption :='AL';
    28 : Label10.Caption :='SE';
    29 : Label10.Caption :='BA';
    31 : Label10.Caption :='MG';
    32 : Label10.Caption :='ES';
    33 : Label10.Caption :='RJ';
    35 : Label10.Caption :='SP';   
    41 : Label10.Caption :='PR'; 
    42 : Label10.Caption :='SC';
    43 : Label10.Caption :='RS';  
    50 : Label10.Caption :='MS';
    51 : Label10.Caption :='MT';
    52 : Label10.Caption :='GO';
    53 : Label10.Caption :='DF';
  end;
end;

procedure TFChaveNfe.Edit1Exit(Sender: TObject);
begin
  BuscaUF;
end;

end.
