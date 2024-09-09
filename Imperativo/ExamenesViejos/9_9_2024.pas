program untitled;

type
	Rdia = 1..31;
	Rchar= 'A'..'F';
	atencion= record
		matricula: integer;
		dni: integer;
		dia: Rdia;
		diagnostico:Rchar;
	end;
	arbol = ^nodo;
	nodo =record
		matricula: integer;
		cantAtencion: integer;
		hi:arbol;
		hd:arbol;
	end;
	
	ListPaciente = ^nodoL;
	nodoL = record
		dato: atencion;
		sig:ListPaciente;
	end;
	
	vecGenero = array[Rchar] of ListPaciente;

procedure inicializarVec(var generos:vecGenero);
var
	i:char;
begin
	for i:= 'A' to 'F'  do
	begin
		generos[i]:= nil;
	end;
end;

procedure leerAtencion (var a:atencion);
var
	v:array [1..6] of char = ('A','B','C','D','E','F');
begin
	a.dni := Random(5000);
	if(a.dni <> 0) then
	begin
		a.matricula := Random(1000) + 2000;
		a.dia:= Random(31)+1;
		a.diagnostico:= v[Random(6) + 1];
	end;
end;

procedure insertarNodo(a:atencion;var abb:arbol);
begin
	if(abb= nil) then
	begin	
		new(abb);
		abb^.matricula:=a.matricula;
		abb^.cantAtencion:= 0;
		abb^.hi:= nil;
		abb^.hd:= nil;
	end
	else
		begin
			if(abb^.matricula = a.matricula) then
				abb^.cantAtencion:= abb^.cantAtencion +1
			else
			if(a.matricula < abb^.matricula) then
				insertarNodo(a,abb^.hi)
			else
				insertarNodo(a,abb^.hd);
		end;
	 
	
end;

procedure agregarVector(diag: char; var  Vgen:vecGenero; a:atencion);
var
	aux: ListPaciente;
begin
	new(aux);
	aux^.dato:= a;
	aux^.sig:= Vgen[diag];
	Vgen[diag]:= aux;
end;

procedure ArmarEstructuras(var abb:arbol;var  generos:vecGenero);
var
	a:atencion;
begin
randomize;
	inicializarVec(generos);
	leerAtencion(a);
	while(a.dni <> 0) do
	begin
		insertarNodo(a,abb);
		agregarVector(a.diagnostico, generos, a);
		leerAtencion(a);
	end;
end;


procedure IncisoB(a:arbol);
	function ContarMatris(a: arbol; matri: integer): integer;
	begin
	  if a = nil then
		ContarMatris := 0
	  else if a^.matricula > matri then
		ContarMatris := 1 + ContarMatris(a^.hi, matri) + ContarMatris(a^.hd, matri)
	  else
		ContarMatris := ContarMatris(a^.hd, matri);
	end;
var
	matri:integer;
begin
	writeln('ingrese la matricula: ');
	readln(matri);
	writeln('cantidad de matriculas mayores a ',matri, ' es: ', ContarMatris(a,matri));
end;


procedure IncisoC (g:vecGenero);
	function calcularPacientes(l: ListPaciente): integer;
	var
		cant:integer;
	begin
		cant:= 0;
		while(l<> nil) do
		begin
			cant:=cant +1;
		end;
		calcularPacientes:= cant;
	end;
	
	function BuscarDiagnostico(g:vecGenero; diml:char;var  max:integer):integer;
	var
		cant: integer;
	begin
		if(diml <= 'A') then
		begin
			cant:= calcularPacientes(g[diml]);
			if( cant > max ) then
			begin
				max:=cant;
				BuscarDiagnostico:=	BuscarDiagnostico(g,Chr(Ord(diml) - 1),max) + cant
			end
			else
				BuscarDiagnostico(g,Chr(Ord(diml) - 1),max)
		end
		else
			BuscarDiagnostico:= 0;
	end;
var
	diml:char;
	max:integer;
begin
	diml:= 'F';
	max:= -1;
	writeln('el diagnostico con mas cantidad de pacientes atendidos es: ', BuscarDiagnostico(g,diml,max));
end;

procedure MostrarArbol(a:arbol);
begin
	if(a<>nil) then
	begin
		MostrarArbol(a^.hi);
		writeln(a^.matricula);
		MostrarArbol(a^.hd);
	end;
end;

var 
	a:arbol;
	generos: vecGenero;
	
BEGIN
	a:= nil;
	ArmarEstructuras(a, generos);
	MostrarArbol(a);
	IncisoB(a);
	IncisoC(generos);
END.

