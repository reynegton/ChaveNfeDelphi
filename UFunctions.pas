unit UFunctions;

interface
uses SysUtils,Windows,classes,IdHashMessageDigest, IdHash;
  function CalcMod11(Numero: String): String;
  procedure SomenteNumerosKeyPress(var Key: Char);
  procedure SetEditNumbers(HEdit: THandle);
  function GetMD5File(const fileName : string) : string;
implementation

function CalcMod11(Numero: String): String;
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

procedure SetEditNumbers(HEdit: THandle);
var fstyle: DWord;
begin
  fstyle :=  GetWindowLong(HEdit,GWL_STYLE);
  SetWindowLong(HEdit, GWL_STYLE, fstyle or ES_NUMBER);
end;


procedure SomenteNumerosKeyPress(var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

function GetMD5File(const fileName : string) : string;
var
  idmd5 : TIdHashMessageDigest5;
  fs : TFileStream;
  hash : T4x4LongWordRecord;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  fs := TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite) ;
  try
    result := idmd5.AsHex(idmd5.HashValue(fs)) ;
  finally
    fs.Free;
    idmd5.Free;
  end;
end;

end.
