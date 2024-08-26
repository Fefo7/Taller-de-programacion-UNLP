program main4;


procedure Parsebinary (num: integer);
var
	cociente, resto: integer;
begin
	resto:= num mod 2;
	cociente:= num div 2;
	if (cociente <> 0) then
		Parsebinary(cociente);
	writeln(resto);
end;

var 
	num: integer;
BEGIN
	writeln('ingrese el numero que quiere convertir a binario');
	readln(num);
	while (num <> 0)do
	begin
		Parsebinary(num);
		writeln('ingrese el numero que quiere convertir a binario');
		readln(num);
	end;
	


END.

