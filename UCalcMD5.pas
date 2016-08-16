unit UCalcMD5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TFCalcMD5 = class(TForm)
    OpenDialog: TOpenDialog;
    edtLocalArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLocalArquivoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCalcMD5: TFCalcMD5;

implementation

uses UFunctions, UPrincipal;
{$R *.dfm}

procedure TFCalcMD5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TFPrincipal(owner).FCalcMD5 := nil;
  TFPrincipal(owner).FCalcMD5.Free;
  self.Release;
end;

procedure TFCalcMD5.edtLocalArquivoExit(Sender: TObject);
begin
 if not FileExists(edtLocalArquivo.Text) then
  begin
    ShowMessage('O Diretório Selecionado não existe. Verifique!');
    edtLocalArquivo.Text := '';
    exit;
  end;
  //if RightStr(edtLocalArquivo.Text,1) <> '\' then
  //  edtLocalArquivo.Text := edtLocalArquivo.Text + '\';
end;

procedure TFCalcMD5.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog.Title := 'Selecione o Arquivo.';
  OpenDialog.InitialDir := 'C:\';
  if OpenDialog.Execute then
  Begin
    edtLocalArquivo.Text := OpenDialog.FileName;
  end;
end;

procedure TFCalcMD5.BitBtn1Click(Sender: TObject);
begin
  if edtLocalArquivo.Text<> '' then
    Edit1.text :=GetMD5File(edtLocalArquivo.Text)
end;

end.
