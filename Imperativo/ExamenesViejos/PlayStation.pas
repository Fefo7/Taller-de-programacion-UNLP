program untitled;

type
	sub_dia = 1..31;
	sub_mes = 1..12;
	compra= record
		videoJuego: integer;
		cliente: integer;
		dia: sub_dia;
		mes: sub_mes;
	end;
	
	listCompra = ^nodoL;
	nodoL = record
		dato: compra;
		sig: listCompra;
	end;
		
	arbol = ^nodo;
	nodo = record
		codeC:integer;
		dato:listCompra;
		hi:arbol;
		hd:arbol;
	end;
	vector = array[sub_mes] of integer;




procedure IncializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 12 do
	begin
		v[i]:= 0;
	end;
end; 

procedure agregarAdelante(var l:listCompra; c:compra);
var
	aux: listCompra;
begin
	new(aux);
	aux^.dato:= c;
	aux^.sig:= l;
	l:= aux;
end;


procedure leerCompra(var c:compra);
begin
	c.cliente:= Random(100);
	if(c.cliente<> 0) then
	begin
		c.dia:= Random(31)+1;
		c.mes:= Random(12)+1;
		c.videoJuego:= Random(20000)+1;
	end;
end;


procedure insertarNodo(var a:arbol; c:compra);
begin
	if(a= nil) then
	begin
		new(a);
		a^.codeC:= c.cliente;
		a^.dato:= nil;
		agregarAdelante(a^.dato, c);
		a^.hi := nil;
		a^.hd:= nil;
	end
	else
		if(a^.codeC = c.cliente)then
			agregarAdelante(a^.dato, c)
		else
			begin
				if(c.cliente<a^.codeC) then
					 insertarNodo( a^.hi, c)
				else
					 insertarNodo( a^.hd, c);
			end;
end;

procedure ArmarEstructuras(var a:arbol;var v:vector);
var
	c: compra;
begin
	a:= nil;
	IncializarVector(v);
	leerCompra(c);
	while c.cliente <> 0 do
	begin
		v[c.mes]:= v[c.mes] +1;
		insertarNodo(a,c);
		leerCompra(c);
	end;
end;

procedure RecorrerLista(l: listCompra);
	begin
		 if(l<> nil) then
		 begin
			RecorrerLista(l^.sig);
			writeln('video juego: ', l^.dato.videoJuego);
		 end
	end;
procedure BuscarCliente(a:arbol);
	function BuscarCode(a:arbol; code:integer): listCompra;
	begin
		if(a<> nil) then
		begin
			if(a^.codeC = code) then
				BuscarCode:= a^.dato
			else 
				begin
					if(code < a^.codeC) then
						BuscarCode:= BuscarCode(a^.hi, code)
					else
						BuscarCode:= BuscarCode(a^.hd, code);
				end;
		end
		else
			BuscarCode:= nil;
	end;
	
	
var
	code:integer;
	lCliente: listCompra;
begin
	writeln('ingrese el codigo de un cliente: ');
	readln(code);
	lCliente := BuscarCode(a, code);
	if(lCliente = nil) then
		writeln('no se encontro el cliente')
	else
		RecorrerLista(lCliente);
	
end;


procedure OrdenarVector(var v: vector);
var
	i,j,act:integer;
begin
	for i:= 2 to 12 do
	begin
		act:= v[i];
		j:= i-1;
		while (j>0) and (v[j] < act ) do
		begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act; 
	end;
end;

procedure MostrarArbol(a:arbol);
begin
	if(a<> nil) then
	begin
		MostrarArbol(a^.hi);
		writeln(a^.codeC);
		MostrarArbol(a^.hd);
	end;
end;

procedure MostraVector(v:vector);
var
	i:integer;
begin
	for i:=1 to 12 do
	begin
		writeLn('dato: ',v[i]);
	end;
end;
var
	a:arbol;
	v:vector;
BEGIN
	ArmarEstructuras(a,v);
	MostrarArbol(a);
	OrdenarVector(v);
	MostraVector(v);
	BuscarCliente(a);
	
END.

