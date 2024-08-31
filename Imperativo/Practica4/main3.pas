
program main3;

type
	Venta = record
		codeV: integer;
		cantUVenta:integer;
		precioUnitario: real;
		end;
	Producto= record
		codeProd:integer;
		cantUVendida:integer;
		montoTotal: real;
	end;
	
	
	productoXArbol= record
		ventaNueva: Venta;
		produNuevo:Producto;
	end;
	
	arbol= ^nodo2;
	nodo2=record
		dato: productoXArbol;
		HI: arbol;
		HD: arbol;
	end;
	


procedure LeerVenta(var v:Venta);
begin
	writeln('ingrese el codigo de la venta');
	readln(v.codeV);
	if(v.codeV <> -1) then
	begin
		writeln('cantidad de unidades vendidas vendidas: ');
		readln(v.cantUVenta);
		writeln('ingrese el precio unitario: ');
		readln(v.precioUnitario);
	end;
end;

procedure LeerProducto(var p:Producto);
begin
	writeln('ingrese el codigod el producto: ');
	readln(p.codeProd);
	writeln('ingrese la cantidad de unidades producto: ');
	readln(p.cantUVendida);
	writeln('ingrese el monto total: ');
	readln(p.montoTotal);
	
end;

procedure LeerProductoXArbol ( var PxA:productoXArbol );
var
	p:Producto;
	v:Venta;
begin
	LeerVenta(v);
	PxA.ventaNueva:=v;
	if(PxA.ventaNueva.codeV <> -1)then
	begin
		LeerProducto(p);
		PxA.produNuevo:= p;
	end;
end;

Procedure InsertarNodo(var a:arbol; PxA:productoXArbol);

begin
	if(a= nil) then 
	begin
		new(a);
		a^.dato:= PxA;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if(PxA.produNuevo.codeProd < a^.dato.produNuevo.codeProd ) then
			InsertarNodo(a^.HI, PxA)
		else
			InsertarNodo(a^.HD, PxA);
end;


Procedure ArmarArbol(var a:arbol);
var
	PxA: productoXArbol;
begin
	a:= nil;
	LeerProductoXArbol(PxA);
	while(PxA.ventaNueva.codeV <> -1) do
	begin
		InsertarNodo(a, PxA);
		LeerProductoXArbol(PxA);
	end;
end;

procedure MostraArbolOrdenado(a:arbol);
begin
	if(a<>nil)then
	begin
		MostraArbolOrdenado(a^.HI);
		writeln('codigo producto: ', a^.dato.produNuevo.codeProd);
		MostraArbolOrdenado(a^.HD);
	end;
end;

procedure CodeMasUnidadesVendias(a:arbol);
	procedure BuscarMaximo(a:arbol; var max,codeMax: integer);
	begin
		if(a<>nil)then 
		begin
			if(a^.dato.produNuevo.cantUVendida > max) then
			begin
				max:=a^.dato.produNuevo.cantUVendida;
				codeMax:=a^.dato.produNuevo.codeProd;
			end;
			BuscarMaximo(a^.HI, max,codeMax);
			BuscarMaximo(a^.HD, max,codeMax);
		end;
	end;
var
	max:integer;
	codeMax: integer;
begin
	max:=-1;
	BuscarMaximo(a,max, codeMax);
	writeln('--------------------------------');
	writeln('el codigo del producto con mas cantidad de unidades vendias');
	writeln(codeMax);
	writeln('--------------------------------');
end;

procedure CodigosExisten(a: arbol);

	procedure ContarCodigos(a:arbol; var cant: integer; valor: integer);
	begin
		if(a<>nil)then
		begin
			if(a^.dato.produNuevo.codeProd <= valor) then
				cant:= cant +1;
			ContarCodigos(a^.HI, cant,valor);
			ContarCodigos(a^.HD, cant,valor);
		end;
	end;
	
var
	cant:integer;
	valor:integer;
begin
	cant:=0;
	writeln('ingrese un valor para buscar los codigos');
	readln(valor);
	
	ContarCodigos(a, cant, valor);
	
	writeln('--------------------------------');
	writeln('la cantidad de codigos menores a ', valor, ' son: ');
	writeln(cant);
	writeln('--------------------------------');
	
end;
procedure InformarMontosTotales(a:arbol);
	procedure CalcularMontoTotal(a:arbol;valor,valor2:integer;var total:real);
	begin
		if(a<> nil)then
		begin
			if(a^.dato.produNuevo.codeProd > valor) and(a^.dato.produNuevo.codeProd < valor2) then
			begin
				total:= total + a^.dato.produNuevo.montoTotal;
			end;
			CalcularMontoTotal(a^.HI, valor,valor2, total); 
			CalcularMontoTotal(a^.HD, valor,valor2, total);
		end;
	end;
var
	valor,valor2:integer;
	total:real;
begin
	total:= 0;
	writeln('--------------------------------');
	writeln('ingrese el valor 1: ');
	readln(valor);
	writeln('ingrese el valor 2 (mayor que el primero) : ');
	readln(valor2);
	writeln('--------------------------------');
	
	CalcularMontoTotal(a,valor,valor2,total);
	
	writeln('el monto total de los productos comprendidos entre ', valor ,' y ', valor2, ' es: ' );
	writeln(total :5:0 );
	
	
end;
var 
	a:arbol;
BEGIN
	ArmarArbol(a);
	MostraArbolOrdenado(a);
	writeln;
	CodeMasUnidadesVendias(a);
	writeln;
	CodigosExisten(a);
	writeln;
	InformarMontosTotales(a);
END.

