

program main2;
type
 listEnteros = ^nodo;
 nodo = record
	elem: integer;
	sig: listEnteros;
 end;
 
 
function GenerateRandomR ( min: integer; max:integer): integer;
begin
		GenerateRandomR := Random(max - min + 1) + min;
end;
procedure cargarLista(var l: listEnteros);
var
	aux: listEnteros;
begin
	new(aux);
	aux^.sig:= nil;
	aux^.elem:= GenerateRandomR(100,110);
	if(aux^.elem <> 100) then
	begin
		if(l=nil) then  l:= aux
			else
				begin
					aux^.sig:= l;
					l:= aux;
				end;
		cargarLista(l);
	end;
	
end;



procedure imprimirLista(l:listEnteros);
begin
	if(l<>nil)then
	begin
		writeln('numero: ', l^.elem);
		l:=l^.sig;
		imprimirLista(l);
	end;
end;
procedure imprimirListaReves(l:listEnteros);

begin
	if(l<>nil)then
	begin	
		imprimirListaReves(l^.sig);
		writeln('numero: ', l^.elem);
	end;
end;

procedure ValorMinimo(l:listEnteros; var minimo: integer);
begin
	if (l<> nil) then
	begin
		if (l^.elem < minimo) then
			minimo:= l^.elem;
		ValorMinimo(l^.sig, minimo);
	end;
	if l= nil then
	begin
		writeln('numero minimo: ', minimo);
	end;
end;

function BuscarElemento(l: listEnteros; elem: integer): boolean;
begin
    if l = nil then
        BuscarElemento := false
    else if l^.elem = elem then
        BuscarElemento := true
    else
        BuscarElemento := BuscarElemento(l^.sig, elem);
end;


var 
  l : listEnteros;
	minimo,elem: integer;
	
BEGIN
	minimo:= 999;
	elem:= 103;
	l:= nil;
	cargarLista(l);
	imprimirLista(l);
	writeln;
	imprimirListaReves(l);
	writeln;
	ValorMinimo(l,minimo);
	writeln(BuscarElemento(l,elem));
END.

