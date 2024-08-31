program main3;
const
	max= 50;

type
	vector = array[1..max] of integer;
procedure GenerateRandomR ( min: integer; max:integer; var NumRandom: integer);
begin
		NumRandom := Random(max - min + 1) + min;
end;

procedure CargarVector (min: integer; max:integer; var v:vector; var diml: integer);
var
i:integer;
num:integer;
begin
	i:=1;
	GenerateRandomR(min,max,num);
	while (i<max) and (num<>0) do 
	begin
		diml:= diml +1;
		v[i]:= num;
		i:= i+1;
		GenerateRandomR(min,max,num);
	end;
	
end;
procedure ImprimirVector(v:vector; diml: integer);
var
i:integer;
begin
	for i:= 1 to diml do
	begin
		writeln('numeros: ', v[i]);
	end;
	// para imprimirlo al reves podemos usar downto para recorrerlo al reves
end;

var
	v: vector;
	diml:integer;
	minR,maxR: integer;
BEGIN
	diml:=0;
	writeln('ingrese el minimo del rango: ');
	readln(minR);
	writeln('ingrese el maximo del rango: ');
	readln(maxR);
	CargarVector(minR,maxR,v,diml);
	ImprimirVector(v,diml);
END.

