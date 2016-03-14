unit UFunctions;

interface
uses SysUtils;
  function CalcMod11(Numero: String): String;
  procedure SomenteNumerosKeyPress(var Key: Char);
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

procedure SomenteNumerosKeyPress(var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

end.
