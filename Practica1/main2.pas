program main2;
const
	dimf = 300;
type
	oficina = record
		codeId:integer;
		dni:integer;
		valorExpe: real;
		end;
	vecOfi = array[1..dimf]of oficina;


procedure cargarOficina(var o:oficina; var condi:boolean);
begin
	writeln('ingrese el codigo de identificacion: ');
	readln(o.codeId);
	if(o.codeId <> -1)then
	begin
		writeln('ingrese el dni del propietario: ');
		readln(o.dni);
		writeln('ingrese el valor de la expensa: ');
		readln(o.valorExpe);
		condi:= true;
	end
	else
		condi:= false;
end;


procedure CargarVector(var v: vecOfi; var diml:integer);
var
	condi: boolean;
	ofi: oficina;
	i:integer;
begin
	i:= 1;
	cargarOficina(ofi, condi);
	while (condi)do
	begin
		diml:= diml +1;
		v[i]:= ofi;
		cargarOficina(ofi, condi);
		i:= i+1;
	end;
end;
procedure OrdenarInsercion(var v:vecOfi; diml:integer );
var
	i,j: integer;
	act: oficina;
begin
	for i:=2 to diml do
	begin
		act:= v[i];
		j:= i-1;
		while (j>0) and (v[j].codeId>act.codeId) do
		begin
			v[j+1]:= V[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;

procedure OrdenarSeleccion(var v:vecOfi; diml:integer );
var
	i,j,pos: integer;
	item: oficina;
begin
	for i:=1 to (diml-1) do 
	begin
		pos:= i;
		for j:=i+1 to diml do
			begin
				if	(v[j].codeId < v[pos].codeId) then pos:= j;
			end;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;
end;
var
	diml:integer;
	v: vecOfi;
	i:integer;
BEGIN
	diml:= 0;
	CargarVector(v,diml);
	OrdenarInsercion(v,diml);
	OrdenarSeleccion(v,diml);
	for i:= 1 to diml do
	begin
		writeln(v[i].codeId);
	end;
	
END.

