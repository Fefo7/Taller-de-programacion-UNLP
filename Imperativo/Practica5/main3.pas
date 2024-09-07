program untitled;
const
	maxRubro = 1;
type
	Rrubro  = 1..maxRubro;
	producto = record
		rubro: Rrubro;
		stock: integer;
		precioUni: real;
	end;
	
	arbol= ^nodo;
	nodo= record
		code:integer;
		dato: producto;
		hi: arbol;
		hd: arbol;
	end;
	
	vec = array[Rrubro] of arbol;

procedure inicializarVector(var v:vec);
var
	i:integer;
begin
	for i:=1 to maxRubro do
	begin
		v[i]:= nil;
	end;
end;

procedure leerProducto(var p:producto;var code:integer);
begin
	writeln('ingrese codigo del producto: ');
	readln(code);
	if(code<>0)then
	begin
		writeln('ingrese el rubro (entre 1 y 10)');
		readln(p.rubro);
		writeln('ingrese el stock: ');
		readln(p.stock);
		writeln('ingrese el precio unitario: ');
		readln(p.precioUni);
	end;
end;

procedure CargarVector(var vector:vec); 

	procedure insertarArbol(var a:arbol; p:producto; code:integer);
	begin
		IF(a=nil) then
		begin
			new(a);
			a^.code:= code;
			a^.dato:= p;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else if (code < a^.code)then
				insertarArbol( a^.hi, p, code)
			else
				insertarArbol( a^.hd, p, code);
	end;
var
	p:producto;
	code: integer;
begin
	leerProducto(p, code);
	while (code <> 0 ) do
	begin
		insertarArbol(vector[p.rubro], p, code);
		leerProducto(p, code);
	end;
end;


procedure ExisteCode(vector: vec);
	function existe(a:arbol; code:integer): boolean;
		begin
			if (a=nil) then existe:= false
			else if(a^.code = code) then
						existe:= true
				  else if (code < a^.code ) then
							existe(a^.hi, code)
						else
							existe(a^.hd, code);	
		end;
var
	rubro,code: integer;
begin
	writeln('ingrese el rubro');
	readln(rubro);
	writeln('ingrese el codigo del producto');
	readln(code);
	if (existe(vector[rubro], code)) then
		writeln('se encotro')
	else
		writeln('no se encotro');
	
end;


procedure RetornarCodigoMax(vector:vec);
	procedure MayorCodigo(a:arbol;var  max,stock: integer);
	begin
			if(a^.hd <> nil) then
				MayorCodigo(a^.hd, max ,stock)
			else
				begin
					max:= a^.code;
					stock:= a^.dato.stock;
				end;				
	end;
var
	i,max, stock: integer;
begin
	for i:= 1 to maxRubro do
	begin
		MayorCodigo(vector[i], max, stock);
		writeln(i,'- el codigo maximo es: ',max, 'y tiene stock de: ',  stock);
	end;
end;


procedure CantidadProducto(vector:vec);
	function ContarProdu(a:arbol; inf,sup: integer): integer;
	begin
		if(a=nil) then
			ContarProdu:= 0 
		else
			if(a^.code >= inf) then
			begin
				if(a^.code <= sup) then
					ContarProdu:= ContarProdu(a^.hi,inf,sup) + ContarProdu(a^.hd,inf,sup) + 1
				else
					ContarProdu:= ContarProdu(a^.hi,inf,sup)
			end
			else
				ContarProdu:= ContarProdu(a^.hd,inf,sup)
	end;
var
	inf,sup,i: integer;
begin
	writeln('ingrese el inferior');
	readln(inf);
	writeln;
	writeln('ingrese el superior');
	readln(sup);
	writeln;
	for i:= 1 to maxRubro do
	begin
		writeln(i,'- la cantidad de prodcutos entre ', inf, ' - ',sup, ' es de: ', ContarProdu(vector[i],inf,sup));
	end;
end;


procedure MostrarArbol(a:arbol);
begin
	if(a<> nil) then
	begin
		MostrarArbol(a^.hi);
		writeln('codigo del producto', a^.code);
		MostrarArbol(a^.hd);
	end;
	
end;

var 
	vector: vec;
BEGIN
	inicializarVector(vector);
	CargarVector(vector);
	writeln;
	ExisteCode(vector);
	writeln;
	RetornarCodigoMax(vector);
	writeln;
	CantidadProducto(vector);
	
END.

