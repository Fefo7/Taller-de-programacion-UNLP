program untitled;
type
	Rdia = 1..31;
	Rmes= 1..12;
	prestamo= record
		numSocio: integer;
		dia: Rdia;
		mes: Rmes;
		diasPrestados: integer;
	end;
	
	datoArbolA= record
		isbn:integer;
		pres: prestamo;
		end;
	
	arbol= ^nodoA;
	nodoA = record
		dato:datoArbolA;
		HI:arbol;
		HD: arbol;
	end; 
	
	
	listPres = ^nodoL;
	nodoL= record
		dato:prestamo;
		sig: listPres;
	end; 
	
	datoArbolB = record
		isbn:integer;
		prestamos:listPres;
	end;
	
	arbolB = ^nodoB;
	nodoB = record
		dato:datoArbolB;
		HI: arbolB;
		HD: arbolB;
	end;
	
	datoArbolC = record
		isbn:integer;
		cantPrestamo: integer;
	end;
	
	arbolC = ^nodoC;
	nodoC = record
		dato:datoArbolC;
		HI:arbolC;
		HD:arbolC;
	end;
	


procedure leerPrestamo(var p:prestamo;var isbn:integer);
begin
	writeln('ingrese el ISBN de libro');
	readln(isbn);
	if(isbn<> 0)then
	begin
		writeln('ingrese el numero de socio: ');
		readln(p.numSocio);
		writeln('ingrese el dia (1..31): ');
		readln(p.dia);
		writeln('ingrese el mes (1..12): ');
		readln(p.mes);
		writeln('ingrese la cantidad de dias prestados:  ');
		readln(p.diasPrestados);
	end;
end;

procedure	insertarNodoA(var a:arbol; p:prestamo; isbn:integer);
begin
	if(a = nil) then
	begin
		new(a);
		a^.dato.isbn:= isbn;
		a^.dato.pres:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(isbn < a^.dato.isbn) then
			insertarNodoA(a^.HI, p,isbn)
		 else
			insertarNodoA(a^.HD, p,isbn);
end;

procedure insertarNodoB(var a:arbolB; p:prestamo; isbn: integer);

	procedure CargarLista (var l : listPres; p:prestamo );
	var
		aux: listPres;
	begin
		new(aux);
		aux^.dato:= p;
		aux^.sig:= l;
		l:= aux;
	end;
	
begin
	if(a=nil) then
	begin
		new(a);
		a^.dato.isbn:= isbn;
		a^.dato.prestamos:= nil;
		CargarLista(a^.dato.prestamos, p);
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(a^.dato.isbn =  isbn) then
			CargarLista(a^.dato.prestamos, p)
		else if(isbn < a^.dato.isbn) then
				insertarNodoB(a^.HI, p,isbn)
			 else
				insertarNodoB(a^.HD, p,isbn);
end;
	
procedure ArmarArboles(var a: arbol; var a2: arbolB);
var
	p:prestamo;
	isbn : integer;
begin
	
	leerPrestamo(p, isbn);
	while(isbn<> 0) do
	begin
		insertarNodoA(a, p, isbn);
		insertarNodoB(a2, p, isbn);
		leerPrestamo(p, isbn);
	end;
end;

procedure  IsbnMasGrande(a:arbol);
	
	procedure actulizarMaximo(a:arbol; var isbnMax: integer);
	begin
		if(a<>nil) then
		begin
			if(a^.dato.isbn > isbnMax) then
				isbnMax:=a^.dato.isbn;
				
			actulizarMaximo(a^.HI, isbnMax);
			actulizarMaximo(a^.HD, isbnMax);
		end;
	end;
	
var
	isbnMax:integer;
begin
	isbnMax:= -1;
	actulizarMaximo(a,isbnMax);
	writeln('----------------------------------');
	writeln('el ISBN mas grande es: ', isbnMax);
	writeln('----------------------------------');
end;

procedure IsbnMasChico(a2:arbolB);
	procedure actulizarMinimo(a2:arbolB; var isbnMin: integer);
	begin
		if(a2<>nil) then
		begin
			if(a2^.dato.isbn < isbnMin) then
				isbnMin:=a2^.dato.isbn;
				
			actulizarMinimo(a2^.HI, isbnMin);
			actulizarMinimo(a2^.HD, isbnMin);
		end;
	end;
var
	isbnMin:integer;
begin
	isbnMin:= 999;
	actulizarMinimo(a2,isbnMin);
	writeln('----------------------------------');
	writeln('el ISBN mas chico es: ', isbnMin);
	writeln('----------------------------------');
end;

procedure CantidadPrestamoS(a:arbol);

	procedure ContarPrestamos(a:arbol; nroS:integer;var cantTotal:integer);
	begin
		if(a<>nil)then
		begin
			if(a^.dato.pres.numSocio = nroS) then
				cantTotal:= cantTotal+1;
			ContarPrestamos(a^.HI,nros,cantTotal);
			ContarPrestamos(a^.HD,nros,cantTotal);
		end;
		
	end;
	
var
	nroS:integer;
	cantTotal:integer;
begin
	cantTotal:=0;
	writeln('ingrese el numero de socio: ');
	readln(nroS);
	ContarPrestamos(a,nroS, cantTotal);
	writeln('-------------------------------------------------------------------');
	writeln;
	writeln('la cantidad de prestamos del socio ', nroS ,' es: ', cantTotal);
	writeln;
	writeln('-------------------------------------------------------------------');
end;

procedure CantidadPrestamoSV2(a2:arbolB);
	
	procedure BuscarEnLista(l:listPres; nros:integer;var cantTotal:integer);
	begin
		if(l<>nil) then
		begin
			 if(l^.dato.numSocio = nros) then
				cantTotal:= cantTotal+1;
			BuscarEnLista(l^.sig, nros,cantTotal);
		end;
	end;

	procedure ContarPrestamosV2(a2:arbolB;nroS:integer; var cantTotal:integer);
	begin
		if(a2<>nil)then
		begin
			 BuscarEnLista(a2^.dato.prestamos, nros, cantTotal);
			 ContarPrestamosV2(a2^.HI, nroS, cantTotal);
			 ContarPrestamosV2(a2^.HD, nroS, cantTotal);
		end;
	end;
	
var
	nroS:integer;
	cantTotal:integer;
begin
	cantTotal:=0;
	writeln('ingrese el numero de socio: ');
	readln(nroS);
	ContarPrestamosV2(a2,nroS, cantTotal);
	writeln('-------------------------------------------------------------------');
	writeln;
	writeln('la cantidad de prestamos del socio V2 ', nroS ,' es: ', cantTotal);
	writeln;
	writeln('-------------------------------------------------------------------');
end;


procedure ArmarArbolC (a:arbol; var a3:arbolC) ;
	
	procedure insertarNodoC( dato: datoArbolA;var cant:integer;var a3:arbolC );
	begin
		if(a3=nil) then
		begin
			new(a3);
			a3^.dato.isbn:= dato.isbn;
			a3^.dato.cantPrestamo:= 1;
		end
		else if(a3^.dato.isbn = dato.isbn) then
					a3^.dato.cantPrestamo:=a3^.dato.cantPrestamo+ 1
			else if (dato.isbn < a3^.dato.isbn) then
					insertarNodoC(dato, cant, a3^.HI)
				else
					insertarNodoC(dato, cant, a3^.HD);
	end;
var
	cant:integer;
begin
	if(a<> nil) then
	begin
		insertarNodoC(a^.dato,cant, a3);
		ArmarArbolC(a^.HI, a3);
		ArmarArbolC(a^.HD, a3);
	end;
end;

procedure ArmarArbolD(a:arbolB; var a4: arbolC);

	function ContarISBNprestamo( l: listPres):integer;
	begin	
			if(l=nil) then ContarISBNprestamo:= 0
			else
				ContarISBNprestamo:= ContarISBNprestamo(l^.sig)+1;	
	end;
	procedure  insertarNodoD(var a4: arbolC; dato: datoArbolB);
	begin
		if(a4 = nil) then
		begin
			new(a4);
			a4^.dato.isbn:= dato.isbn;
			a4^.dato.cantPrestamo:= ContarISBNprestamo(dato.prestamos);
		end
		else if (dato.isbn < a4^.dato.isbn) then
				insertarNodoD(a4^.HI, dato)
			else
				insertarNodoD(a4^.HD, dato);
	end;

begin
		if(a<> nil) then
		begin
			 insertarNodoD(a4, a^.dato);
			 ArmarArbolD(a^.HI, a4);
			 ArmarArbolD(a^.HD, a4);
		end;
end;



procedure MostrarArbolD(a4:arbolC);
begin 
	if(a4<>nil) then
	begin
		writeln('isbn: ', a4^.dato.isbn, ' cantidad de prestamos ',a4^.dato.cantPrestamo);
		MostrarArbolD(a4^.HI);
		MostrarArbolD(a4^.HD);
	end;
end;
var 
	a: arbol;
	a2: arbolB;
	a3: arbolC;
	a4: arbolC;
BEGIN
	a:= nil;
	a2:= nil;
	a3:= nil;
	a4:= nil;
	ArmarArboles(a,a2);
	IsbnMasGrande(a);
	writeln;
	IsbnMasChico(a2);
	writeln;
	CantidadPrestamoS(a);
	writeln;
	CantidadPrestamoSV2(a2);
	writeln;
	ArmarArbolC (a, a3);
	ArmarArbolD(a2, a4);
	MostrarArbolD(a4);
	writeln;

END.

