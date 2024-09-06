program untitled;

type
	Ranio= 2010..2018;
	auto = record  // necesito dejar la patente para el insiso F
		patente: string;
		anio:Ranio;
		modelo:string;
	end;
	
	
	datoArbol=  record
		patente: string;
		marca:string; // la marca la necesito para los dos arboles pero		
		anio:Ranio;
		modelo:string; // en el arbol B es necesario usarla como criterio
	end;
	arbol= ^nodo;
	nodo = record
		dato: datoArbol;
		hi: arbol;
		hd: arbol;
	end;
	
	listAutos= ^nodoL;
	nodoL = record
		dato: auto;
		sig:listAutos;
		end;
	
	datoArbolB= record
		marca: string;
		Autos: listAutos;
	end;
	
	arbolB = ^nodoB;
	nodoB = record
		dato: datoArbolB;
		hi: arbolB;
		hd: arbolB;
	end;
	

procedure LeerAuto(var car:auto;var marca:string);
begin
	writeln('ingrese la marca del auto: ');
	readln(marca);
	if(marca <> 'MMM') then
	begin
		writeln('ingrese la patente del auto');
		readln(car.patente);
		writeln;
		writeln('ingrese el anio (2010 y 2018)');
		readln(car.anio);
		writeln;
		writeln('ingrese el modelo del auto');
		readln(car.modelo);
		writeln;
	end;
end;

procedure InsertarNodoA(var a: arbol;car:auto; marca:string);
begin

	if(a= nil) then
	begin
		new(a);
		a^.dato.patente:= car.patente;
		a^.dato.marca:= marca;
		a^.dato.anio:= car.anio;
		a^.dato.modelo:= car.modelo;
	end
	else if car.patente < a^.dato.patente then
			InsertarNodoA( a^.hi,car, marca)
		else
			InsertarNodoA( a^.hd,car, marca);
end;

procedure InsertarNodoB(var a2:arbolB;car:auto; marca:string);
	procedure AgregarLista(var l:listAutos; car:auto);
	var
		aux: listAutos;
	begin
		new(aux);
		aux^.dato:= car;
		aux^.sig:= l;
		l:= aux;
	end;
begin
	if(a2=nil)then
	begin
		new(a2);
		a2^.dato.marca:= marca;
		a2^.dato.Autos:= nil;
		AgregarLista(a2^.dato.Autos, car);
	end
	else if (a2^.dato.marca = marca) then
			AgregarLista(a2^.dato.Autos, car)
		else if(marca < a2^.dato.marca) then
				InsertarNodoB( a2^.hi,car, marca)
			else
				InsertarNodoB( a2^.hd,car, marca);
end;

procedure ArmarArbol(var a:arbol;var a2: arbolB);
var
	car: auto;
	marca: string;
begin
	a:= nil;
	a2:= nil;
	LeerAuto(car, marca);
	while(marca <> 'MMM')do
	begin
		InsertarNodoA(a,car, marca);
		InsertarNodoB(a2,car, marca);
		LeerAuto(car, marca);
	end;
end;


procedure CantidadMarca(a:arbol);
	procedure contarAutosXmarca(a:arbol;marcaB: string; var cantM: integer);
	begin
		if(a<> nil) then
		begin
			if(a^.dato.marca = marcaB) then
				cantM:= cantM+1;
				contarAutosXmarca(a^.hi,marcaB, cantM);
				contarAutosXmarca(a^.hd,marcaB, cantM);	
		end;
	end;
	
var
	cantM: integer;
	marcaB: string;
begin
	cantM:= 0;
	writeln('ingrese la marca que quiera buscar y contar: ');
	readln(marcaB);
	contarAutosXmarca(a,marcaB,cantM);
	writeln('la cantidad es de la marca: ', marcaB, ' es de: ',cantM);
end;

procedure CantidadMarcaV2(a2: arbolB);
	function contarCantL(l:listAutos): integer;
	begin
		if(l= nil) then contarCantL:=0
		else
			begin 
				if(l <> nil) then
				contarCantL:= contarCantL(l^.sig) +1;
			end;		
	end;
	procedure contarAutosXmarca(a2:arbolB;marcaB:string;var cantM:integer);
	begin
		if(a2<> nil) then
		begin
			if(a2^.dato.marca = marcaB) then
			begin
				cantM:= contarCantL(a2^.dato.Autos)
			end
			else 
				begin
					if (marcaB < a2^.dato.marca) then
						contarAutosXmarca(a2^.hi,marcaB,cantM)
					else
					contarAutosXmarca(a2^.hd,marcaB,cantM);
				end;
		end;
	end;
var
	cantM: integer;
	marcaB: string;
begin
	cantM:= 0;
	writeln('ingrese la marca que quiera buscar y contar V2: ');
	readln(marcaB);
	contarAutosXmarca(a2,marcaB,cantM);
	writeln('la cantidad es de la marca: ', marcaB, ' es de: ',cantM);
end;

procedure DatosOrdenadosAnio(a:arbol;var l:listAutos);
		procedure insertarOrdenado(a:datoArbol; var l:listAutos);
		var
			aux,act,ant: listAutos;
		begin
			new(aux);
			aux^.dato.patente:= a.patente;
			aux^.dato.anio:= a.anio;
			aux^.dato.modelo:= a.modelo;
			aux^.sig:= nil;
			act:= l;
			ant:= act;
			while(act <> nil) and (act^.dato.anio < a.anio) do
			begin
				ant:= act;
				act:= act^.sig;
			end;
			if(act=ant) then l:= aux
			else
				ant^.sig:=aux;
			aux^.sig:=act;
		end;

begin
	if(a<> nil) then
	begin
		insertarOrdenado(a^.dato, l);
		DatosOrdenadosAnio(a^.hi ,l);
		DatosOrdenadosAnio(a^.hd ,l);
	end;
end;

procedure BuscarPatente(a: arbol);

	procedure buscarAuto(a: arbol; patenteB: string;var modelo:string);
	begin
		if(a<> nil ) then
		begin
			if (a^.dato.patente = patenteB) then
				modelo:= a^.dato.modelo
			else
				begin
					if (patenteB < a^.dato.patente ) then
						buscarAuto(a^.hi, patenteB, modelo)
					else
						buscarAuto(a^.hd, patenteB, modelo);
				end;
			end;
		end;
var
	patenteB:string;
	modelo: string;
begin
	writeln('ingrese la patente del auto');
	readln(patenteB);
	buscarAuto(a,patenteB, modelo);
	writeln('el modelo de la patente del auto, ',patenteB, ' es: ', modelo);
end;
 

procedure MostarArbol(a:arbol);
begin
	if(a<> nil) then
	begin
		writeln('anio: ', a^.dato.anio);
		MostarArbol(a^.hi);
		MostarArbol(a^.hd);
	end;
end;


var 
	a: arbol; a2:arbolB;
	listaOrdenada: listAutos;
BEGIN
	ArmarArbol(a, a2);
	writeln;
	CantidadMarca(a);
	writeln;
	CantidadMarcaV2(a2);
	writeln;
	DatosOrdenadosAnio(a, listaOrdenada);	
	BuscarPatente(a);
	MostarArbol(a);
END.
