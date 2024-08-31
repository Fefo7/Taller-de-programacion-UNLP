
program main4;
type
	listEnteros=^nodo;
	nodo = record
		elem: integer;
		sig: listEnteros;
	end;



procedure GenerateRandomR ( min: integer; max:integer; var NumRandom: integer);
begin
		NumRandom := Random(max - min + 1) + min;
end;


procedure CargarLista(var l:listEnteros);
var
	aux: listEnteros;
begin
	new(aux);
	aux^.sig:= nil;
	 GenerateRandomR(100,150, aux^.elem);
	 while(aux^.elem <> 120)do
		begin
			if(l=nil) then  l:= aux
			else
				begin
					aux^.sig:= l;
					l:= aux;
				end;
			new(aux);
			GenerateRandomR(100,150, aux^.elem);	
		end; 
end;

function BuscarElemento(l:listEnteros; num:integer): Boolean;
begin
	while((l<>nil) and (l^.elem <> num ))do
	begin
		l:=l^.sig;
	end;
	BuscarElemento := (l^.elem = num);
end;	

procedure ImprimirLista(l:listEnteros);
begin
	while(l<>nil)do
	begin
		writeln('numeros random: ', l^.elem);
		l:=L^.sig;
	end; 
end;

var 
	l: listEnteros;
	numABuscar: integer;
BEGIN
	l:= nil;
	CargarLista(l);
	ImprimirLista(l);
	writeln('ingrese el numero a buscar');
	readln(numABuscar);
	if (BuscarElemento(l,numABuscar)) then
		writeln('se encontro el numero')
	else
		writeln('no se encontro el numero');
END.

