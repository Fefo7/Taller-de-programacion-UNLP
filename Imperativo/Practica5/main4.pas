program untitled;
type
	reclamo = record
		code: integer;
		anio:integer;
		tipoReclamo: string;
	end;
	
	listaReclamo = ^nodoL;
	nodoL = record
		dato: reclamo;
		sig:listaReclamo;
	end;
	
	arbolDato = record
		dni:integer;
		cantReclamos: integer;
		reclamos: listaReclamo;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato:arbolDato;
		hi:arbol;
		hd:arbol;
	end;

procedure leerPrestamo(var r:reclamo;var dni:integer);
begin
	writeln('ingrese el dni');
	readln(dni);
	if(dni <>0)then
	begin
		writeln('ingrese el codigo del reclamo');
		readln(r.code);
		writeln('ingrese el anio');
		readln(r.anio);
		writeln('ingrese el tipo de reclamo');
		readln(r.tipoReclamo);
	end;
end;


procedure insertarHoja(var a: arbol;r:reclamo;dni:integer);
		procedure agregarAdelante(l:listaReclamo; r: reclamo);
		var
			aux:listaReclamo;
		begin
			new(aux);
			aux^.dato:= r;
			aux^.sig:= l;
			l:= aux;		
		end;
begin
	if(a= nil) then
	begin
		new(a);
		a^.dato.dni:=dni;
		a^.dato.cantReclamos:=1;
		a^.dato.reclamos:= nil;
		agregarAdelante(a^.dato.reclamos, r);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		begin
			if(a^.dato.dni = dni) then
			begin
				a^.dato.cantReclamos:= a^.dato.cantReclamos +1;
				agregarAdelante(a^.dato.reclamos, r);
			end
			else
				begin
					if(dni < a^.dato.dni )then
						insertarHoja(a^.hi,r, dni)
					else
						insertarHoja(a^.hd,r, dni);
				end;
		end;
end;



procedure armarArbol(var a:arbol);
var
	r:reclamo;
	dni: integer;
begin
	leerPrestamo(r,dni);
	while (dni <> 0) do
	begin
		insertarHoja(a,r,dni);
		leerPrestamo(r,dni);
	end;
	
end;

procedure 	CantDni(a:arbol);
	function buscarCant(a:arbol;dni:integer): integer;
	begin
		if(a= nil) then
			buscarCant:= 0
		else
			if(a^.dato.dni =  dni ) then
				buscarCant:= a^.dato.cantReclamos
			else
				if(dni < a^.dato.dni) then
					buscarCant:= buscarCant(a^.hi,dni)
				else
					buscarCant:= buscarCant(a^.hd,dni);
	end;
var
	dni: integer;
begin
	writeln('ingrese el dni que quiera');
	readln(dni);
	writeln('la cantidad de reclamos del dni: ', dni,' es: ', buscarCant(a,dni));
end;

procedure CantDniRango(a:arbol);
	function BuscarReclamos(a:arbol;inf: integer;sup:integer): integer;
	begin
		if(a= nil) then BuscarReclamos:= 0
		else
			if(a^.dato.dni >= inf) then
			begin
				if(a^.dato.dni <= sup) then
					BuscarReclamos:= BuscarReclamos(a^.hi,inf,sup)+BuscarReclamos(a^.hd,inf,sup) +a^.dato.cantReclamos
				else
					BuscarReclamos(a^.hi,inf,sup);
			end
			else
				BuscarReclamos(a^.hd,inf,sup);
	end;
var
	inf,sup:integer;
begin
	writeln('ingrese el dni inferior: ');
	readln(inf);
	writeln('ingrese el dni superior: ');
	readln(sup);
	writeln;
	writeln('la cantidad de reclamos es de:  ', BuscarReclamos(a,inf,sup));
	
end;


procedure RetornarCode(a:arbol);
var
	anio:integer;
begin
	writeln('ingrese el anio a buscar');
	readln(anio);
	
end;

var 
	a: arbol;
BEGIN
	armarArbol(a);
	writeln;
	CantDni(a);
	writeln;
	CantDniRango(a);
	writeln;
	RetornarCode(a);
	{Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
	los reclamos realizados en el año recibido.}
	
END.



























