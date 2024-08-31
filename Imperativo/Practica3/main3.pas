program main3;

type
	Rnota= 1..10;
	Examen = record
		codeMateria: integer;
		fecha:string;
		nota: Rnota;
	end;
	
	listExamen= ^nodoL;
	nodoL = record
		elem: Examen;
		sig:listExamen;
	end;
	{prodria poner el legajo en el registro de alumno?} {ExamenF: Examen;}
	alumno = record
		legajo:integer; {podria no estarlo y dejar solo el legajo aca}
		ListaExamenes: listExamen;
	end;
	
	arbol= ^nodoA;
	nodoA = record
		elem: alumno;
		hi:arbol; 
		hd:arbol;
		end;
	
procedure leerExamen(var e:examen; var legajo:integer);
begin
	writeln('ingrese el legajo: ');
	readln(legajo);
	if(legajo <> 0) then
	begin
		writeln('ingrese el codigo de la materia: ');
		readln(e.codeMateria);
		writeln('ingrese la fecha del examen: ');
		readln(e.fecha);
		writeln('ingrese la nota del examen: ');
		readln(e.nota);
	end;
end;	

procedure CargarLista(var l:listExamen ; e:examen);
var 
	aux: listExamen;
begin
	new(aux);
	aux^.elem:= e;
	aux^.sig:= l;
	l:= aux;
end;


procedure InsertarNodo(var a: arbol; e:Examen; legajo: integer);
var
	aux: arbol;
begin
	if(a= nil) then
	begin
		new(aux);
		aux^.elem.legajo:= legajo;
		aux^.elem.ListaExamenes := nil;
		CargarLista(aux^.elem.ListaExamenes, e);
		aux^.hi:= nil;
		aux^.hd:= nil;
		a:= aux;
	end
	else
		if (a^.elem.legajo = legajo) then
			CargarLista(a^.elem.ListaExamenes, e)
		else
			begin
			if (a^.elem.legajo > legajo) then
				InsertarNodo(a^.hi,e, legajo)
			else
				InsertarNodo(a^.hd, e, legajo);
			end;
end;
			
procedure CargarExamen (var a:arbol);
var
	e:Examen;
	legajo:integer;
begin
	leerExamen(e,legajo);
	while(legajo <> 0)do
	begin
		InsertarNodo(a,e, legajo);
		leerExamen(e,legajo);
	end;
end;

function IsImpar( legajo: integer) : boolean;
begin
	IsImpar:= (legajo mod 2) <>  0;
end;

procedure  cantAlumnosImpar (a: arbol; var cant: integer);
begin
	if (a<> nil) then
	begin
		if(IsImpar(a^.elem.legajo)) then cant:= cant+1;
		cantAlumnosImpar(a^.hi, cant);
		cantAlumnosImpar(a^.hd,cant);
	end;

end;

procedure MostrarArbol(a:arbol);
begin
	if(a<> nil) then
	begin
		writeln('numero de legajo', a^.elem.legajo);
		MostrarArbol(a^.hi);
		MostrarArbol(a^.hd);
	end;
end;

procedure calcularAprobados (l: listExamen; var aprob:integer);
begin
	while (l <> nil) do
	begin
		if(l^.elem.nota >=  4)then aprob:= aprob +1;
		l:= l^.sig;
	end;
end;


procedure MostrarFAprobados(a:arbol);
var
	aprob: integer;
begin
	if(a<>nil) then
	begin
		aprob:= 0;
		calcularAprobados(a^.elem.ListaExamenes,aprob);
		writeln(a^.elem.legajo, ' aprobo: ', aprob);
		MostrarFAprobados(a^.hi);
		MostrarFAprobados(a^.hd);
	end;
end;

{Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}
procedure calcularPromedio (l: listExamen;var promedio : real);
var
	cantNotas: integer;
begin
	promedio:= 0;
	cantNotas:= 0;
	while (l<> nil) do
	begin
		cantNotas:= cantNotas +1;
		promedio:= promedio + l^.elem.nota;
		l:= l^.sig;
	end;
	promedio:= promedio / cantNotas;
end;
procedure BuscarPromedios (a:arbol; numero:real);
var
	promedio:reaL;
begin
	if (a<>nil) then
	begin
		calcularPromedio(a^.elem.ListaExamenes, promedio);
		if(promedio > numero ) then
			writeln(a^.elem.legajo, ' promedio del alumno: ', promedio :2:0 );
		BuscarPromedios(a^.hi, promedio);
		BuscarPromedios(a^.hd,promedio);
	end;
end;
	
var 
	a:arbol;
	cantAlum:integer;
	tope: real;
BEGIN
	cantAlum:= 0;
	CargarExamen(a);
	MostrarArbol(a);
	cantAlumnosImpar(a,cantAlum);
	writeln('cantidad de alumnos con legajo impar: ', cantAlum);
	
	MostrarFAprobados(a);
	writeln;
	
	writeln('ingrese el tope del promedio');
	readln(tope);
	BuscarPromedios(a, tope);
END.
