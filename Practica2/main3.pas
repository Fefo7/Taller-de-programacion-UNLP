
program main3;
const 
	maxRandom= 20;
type
 vec = array [1..maxRandom] of integer;


function GenerateRandomR ( min: integer; max:integer):integer;
begin
		GenerateRandomR := Random(max - min + 1) + min;
		// 150M - 100m + 1 = 51 + 100
		// me genera un numero random entre 0 y 51  y depues le suma 100
end;

procedure CargarVector(var v: vec; var i: integer);
begin
	if i<= maxRandom then
		begin
			v[i]:= GenerateRandomR(300, 370);
			i:= i+1;
			CargarVector(v,i);
		end;
end;
procedure OrdenarVector(var v: vec);
var
	i,j,act:integer;
begin
	for i:=2 to maxRandom do 
	begin
		act:= v[i];
		j:= i-1;
		while (j>0) and (v[j] > act) do
		begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;

Procedure busquedaDicotomica (v: vec; inicio: integer; ultimo: integer; dato: integer; var pos: integer);
var
    medio: integer;
    encontrado: boolean;
begin
    pos := -1; // Inicialmente, asumimos que el elemento no se encuentra
    encontrado := false;
    while (inicio <= ultimo) and not encontrado do
    begin
        medio := (inicio + ultimo) div 2;
        if v[medio] = dato then
        begin
            pos := medio;
            encontrado := true;
        end
        else if v[medio] > dato then
            ultimo := medio - 1
        else
            inicio := medio + 1;
    end;
end;





VAR 
	v:vec;
	i,j,inicio,ultimo:integer;
	pos,dato:integer;
BEGIN
	i:=1;
	dato:= 330;
	CargarVector(v,i);
	OrdenarVector(v);
	inicio:= 1; ultimo:= maxRandom;
	busquedaDicotomica(v,inicio, ultimo,dato,pos);
	for j:=1 to maxRandom do
	begin
		writeln('numero: ', v[j]);
	end;
END.

