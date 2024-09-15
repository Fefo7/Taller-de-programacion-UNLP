program untitled;

type
	cat = 1..5;
	compra = record
		cod_comida: integer;
		cod_cliente: integer;
		categoria: string;
	end;
	
	arbol = ^nodo;
	nodo = record
		cod: integer;
		cant: integer;
		hi: arbol;
		hd: arbol;
	end;
	
	Rvector = record
		categoria: string;
		cant: integer;
	end;
	
	vector = array[cat] of Rvector;

function BuscarCategoria(i: integer): string;
begin
	case i of 
		1: BuscarCategoria := 'Full';
		2: BuscarCategoria := 'Super';
		3: BuscarCategoria := 'Media';
		4: BuscarCategoria := 'Normal';
		5: BuscarCategoria := 'Basica';
	end;
end;

function BuscarCategoriaV2(i: string): integer;
begin
	case i of 
		'full': BuscarCategoriaV2 := 1;
		'super': BuscarCategoriaV2 := 2;
		'media': BuscarCategoriaV2 := 3;
		'normal': BuscarCategoriaV2 := 4;
		'basica': BuscarCategoriaV2 := 5;
	end;
end;

procedure InicializarVector(var v: vector);
var
	i: integer;
begin
	for i := 1 to 5 do 
	begin
		v[i].categoria := BuscarCategoria(i);
		v[i].cant := 0;
	end;
end;

procedure leerCompra(var c: compra);
var
	v: array[cat] of string = ('full', 'super', 'media', 'normal', 'basica');
begin
	c.cod_cliente := Random(200);
	if (c.cod_cliente <> 0) then
	begin
		c.categoria := v[Random(5) + 1];
		c.cod_comida := Random(200) + 1000;
	end;
end;

procedure armarEstructuras(var a: arbol; var v: vector);

	procedure InsertarNodo(var a: arbol; c: compra);
	begin
		if (a = nil) then
		begin
			new(a);
			a^.cod := c.cod_comida;
			a^.cant := 1;
			a^.hi := nil;
			a^.hd := nil;
		end
		else
		begin
			if (a^.cod = c.cod_comida) then
				a^.cant := a^.cant + 1
			else if (c.cod_comida < a^.cod) then
				InsertarNodo(a^.hi, c)
			else
				InsertarNodo(a^.hd, c);
		end;		
	end;
	
var
	c: compra;
begin
	leerCompra(c);
	while c.cod_cliente <> 0 do
	begin
		v[BuscarCategoriaV2(c.categoria)].cant := v[BuscarCategoriaV2(c.categoria)].cant + 1;
		InsertarNodo(a, c);
		leerCompra(c);
	end;
end;

procedure MostarArbol(a: arbol);
begin
	if (a <> nil) then
	begin
		MostarArbol(a^.hi);
		writeln(a^.cod, ' - ', a^.cant);
		MostarArbol(a^.hd);
	end;
end;

procedure MostarVector(v: vector);
var
	i: integer;
begin
	for i := 1 to 5 do 
	begin
		writeln(v[i].categoria, ' - ', v[i].cant);
	end;
end;

var
	a: arbol;
	v: vector;

BEGIN
	a := nil;  // Inicializar el árbol
	InicializarVector(v);
	armarEstructuras(a, v);
	MostarArbol(a);
	MostarVector(v);
END.
 
