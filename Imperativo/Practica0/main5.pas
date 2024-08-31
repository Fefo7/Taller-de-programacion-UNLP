program untitled;
//bug si estan repetidos los numeros al buscalos fallan
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

procedure InsertarOrdenado (var l:listEnteros;  numRandom: integer);
var
	ant,act,aux: listEnteros;
begin
	New(aux);
	aux^.elem:= numRandom;
	act := l;
	ant := l;
	 While ((act<>Nil) And (aux^.elem > act^.elem)) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
     If act=ant Then
    Begin
      l := aux;
    End
  Else
    ant^.sig := aux;
  aux^.sig := act;	
end;

procedure CargarLista(var l:listEnteros);
var
	numRandom: integer;
begin
	GenerateRandomR(100,150, numRandom);
	while(numRandom <> 120) do
	begin
		InsertarOrdenado(l,numRandom );
		GenerateRandomR(100,150, numRandom);
	end;
end;

procedure ImprimirLista(l:listEnteros);
begin
	while(l<>nil)do
	begin
		writeln('numeros random: ', l^.elem);
		l:=L^.sig;
	end; 
end;
function BuscarElemento(l:listEnteros; num:integer): Boolean;
begin
	while((l<>nil) and (l^.elem <= num ))do
	begin
		l:=l^.sig;
	end;
	BuscarElemento := (l^.elem = num);
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

