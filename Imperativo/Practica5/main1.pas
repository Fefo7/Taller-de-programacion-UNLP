program main1;
const
	dimf= 300;	
type
	oficina = record
		code:integer;
		dni:integer;
		valor: real;
	end;
	vector = array[1..dimf] of oficina;


procedure leerOficina(var ofi:oficina);
begin
	writeln('ingrese el codigo de idenificacion: ');
	readLn(ofi.code);
	if(ofi.code<>0) then
	begin
		writeln('ingrese el DNI del propietario: ');
		readln(ofi.dni);
		writeln('ingrese el valor: ');
		readln(ofi.valor);
	end;
end;

procedure CargarVector (var v: vector; var diml:integer);
var
	ofi:oficina;
	i:integer;
begin
	diml:=0;
	leerOficina(ofi);
	for i:=1 to dimf do
	begin
		if(ofi.code<>0)then
		begin
			diml:=diml+1;
			v[i]:= ofi;
			leerOficina(ofi);
		end;
			
	end;
		
end;

procedure OrdenarVectorInsercion(var v:vector; diml:integer);
var
	i,j: integer;
	act: oficina;
begin
	for i:=2 to diml do
	begin
		act:= V[i];
		j:= i-1;
		while (j>0) and (v[j].code > act.code) do
		begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
		
	end;
end;

function BusquedaDicotomica(v:vector; diml: integer;  valor:integer): integer;
var
	inicio, ultimo,pos, medio:integer;	
	encontrado: boolean;
begin
		inicio:= 1; ultimo:= diml; 
		encontrado := false;
		pos:=0;
		while (inicio<=ultimo) and not encontrado do
		begin
			medio := (inicio + ultimo) div 2;
			if v[medio].code = valor then
			begin
				pos := medio;
				encontrado := true;
			end
			else if v[medio].code > valor then
				ultimo := medio - 1
			else
				inicio := medio + 1;
		end;
		
		if(inicio <= ultimo) and (valor = v[medio].code) then
			BusquedaDicotomica:= pos
		else
			BusquedaDicotomica:= 0;
end;


procedure MontoTotalEspensas(v:vector; diml:integer);
	procedure contarExpensas(v:vector; diml:integer;var total:real);
	begin
			if(diml > 0) then
			begin
				total:= total + v[diml].valor;
				contarExpensas(v,diml-1, total);
			end;
			
	end;
var
	total:real;
begin
	total:=0;
	contarExpensas(v,diml,total);
	writeln('el monto total de las ventas es: ',total :2:0);	
end;

var 
	v:vector;
	diml: integer;
	valor:integer;
BEGIN
	diml:= 0;
	CargarVector(v,diml);
	writeln('ingrese el valor a buscar: ');
	readln(valor);
	writeln(BusquedaDicotomica(v,diml, valor));
	writeLn;
	MontoTotalEspensas(v, diml);
END.

 
