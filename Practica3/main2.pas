program main2;


type
	Rdia= 1..31;
	Rmes=1..12;
	dateTime = record
		dia: Rdia;
		mes: Rmes;
		anio: integer;
	end;
	venta = record	
		code:integer;
		fecha:dateTime;
		UnidadesVen: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		elem: venta;
		HI: arbol;
		HD:arbol;
	end;
	
	VentaResumen = record
		code:integer;
		UnidadesVen: integer;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		elem: VentaResumen;
		HI: arbol2;
		HD:arbol2;
	end;
	
	listVenta= ^nodoList;
	nodoList = record
		elem: venta;
		sig:listVenta;
	end;
	
	produXlista= record
		code: integer;
		ventas: listVenta;
	end;
	
	arbol3 = ^nodo3;
	nodo3 = record
		elem: produXlista;
		HI: arbol3;
		HD:arbol3;
	end;
	

function GenerateRandomR ( min: integer; max:integer):integer;
begin
		GenerateRandomR := Random(max - min + 1) + min;
end;


function tomarFecha: dateTime;
var
	f: dateTime;
begin
	
	f.dia:= GenerateRandomR(1, 31);
	f.mes:= GenerateRandomR(1, 12);
	f.anio:= GenerateRandomR(2024, 2030);
	tomarFecha:= f;
	
end;

{agregar nodo arbol 1}

procedure InsertarNodo(var a:arbol; v: venta);
	begin
		if(a=nil) then
		begin
			new(a);
			a^.elem:= v;
			a^.HD:= nil;
			a^.HI:= nil;
		end
		else
			if(v.code < a^.elem.code)then
				InsertarNodo(a^.HI,v)
			else
				InsertarNodo(a^.HD,v);	
	end;

{agregar nodo arbol 2}
procedure InsertarNodo2(var a:arbol2; code: integer; cantUni: integer);
	begin
		if(a=nil) then
		begin
			new(a);
			a^.elem.code:= code;
			a^.elem.UnidadesVen:= cantUni;
			a^.HD:= nil;
			a^.HI:= nil;
		end
		else
			if(code < a^.elem.code)then
				InsertarNodo2(a^.HI,code, cantUni)
			else
				InsertarNodo2(a^.HD,code,cantUni);	
	end;




{agregar nodo arbol 3}

procedure InsertarNodo3(var a:arbol3; v:venta);

	procedure CargarVentaList(var l:listVenta; v:venta);
		var
			aux: listVenta;
		begin
			New(aux);
			aux^.elem := v;
			aux^.sig := l;
			l := aux;
		end;
		
begin
	if(a=nil) then
	begin
		new(a);
		a^.elem.code:= v.code;
		a^.elem.ventas:= nil;
		CargarVentaList(a^.elem.ventas, v);
		a^.HD:= nil;
		a^.HI:= nil;
	end
	else
		if(v.code = a^.elem.code)then
		        CargarVentaList(a^.elem.ventas, v)
		else if (v.code > a^.elem.code) then
			InsertarNodo3(a^.HI,v)
		else
			InsertarNodo3(a^.HD,v);
end;

{Inciso A}
procedure tomarVenta(var arbolOrdenado:arbol;var  arbolProducto:arbol2; 
						var arbolProductoLista: arbol3 );
var
	v:venta;
begin
	
	v.code:= GenerateRandomR(0, 50);
	while(v.code<>0)do
	begin
		v.fecha:= tomarFecha();
		v.UnidadesVen:=  GenerateRandomR(1, 10);
		InsertarNodo(arbolOrdenado,v);
		InsertarNodo2(arbolProducto, v.code, v.UnidadesVen );
		InsertarNodo3(arbolProductoLista, v);
		v.code:= GenerateRandomR(0, 20);
	end;
	
	
end;

{Inciso B }
Function BuscarElemento(a:arbol; f:dateTime): integer ;
	
	function EsIgual (f1:dateTime; f2:dateTime) : boolean;
		begin
			EsIgual:= (f1.dia = f2.dia) and (f1.mes = f2.mes) and (f1.anio = f2.anio) ;							
		end;
		
begin
	if(a<>nil)then BuscarElemento:= 0
	else
		if EsIgual(a^.elem.fecha, f)  then
			BuscarElemento:= a^.elem.UnidadesVen + BuscarElemento(a^.HI, f) +BuscarElemento(a^.HD, f)
		else
			BuscarElemento := BuscarElemento(a^.HI, f) + BuscarElemento(a^.HD, f);
			
end;

{Inciso B Usuario}
procedure ProductosMasVendidos(a:arbol);
var
f: dateTime;
begin
	writeln('ingrese el dia');
	readln(f.dia);
	writeln('ingrese el mes');
	readln(f.mes);
	writeln('ingrese el anio');
	readln(f.anio);
	writeln('cantidades: ', BuscarElemento(a,f));
end;

{Inciso C }

procedure MaximoVendido (a: arbol2;var  maxU: integer;var codeMax:integer);
	
	procedure actualizarMaximo (code: integer; uniVendi:integer;var  max:integer; var codeMax:integer );
	begin
		if (uniVendi > max) then
		begin
			max:= uniVendi;
			codeMax:= code;
		end;
	
	end;

		
begin
	if(a<> nil)then
	begin
		actualizarMaximo(a^.elem.code, a^.elem.UnidadesVen ,maxU, codeMax);
		MaximoVendido(a^.HI, maxU, codeMax);
		MaximoVendido(a^.HD, maxU, codeMax);
	end;
	
end;


{Inciso D}
procedure MaximaCantVentas(a: arbol3;var code: integer;var MaxV:Integer);
	
	function ContarVentas(l:listVenta):integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l<> nil) do
		begin
			cant:=  +1;
			l:=l^.sig;
		end;
		ContarVentas:= cant;
	end;
	
	procedure buscoMaximo (cantV: integer;code:integer ;var codeMax:integer; var MaxV: integer);
	begin
		if(cantV > MaxV)then
		begin
			MaxV:= cantV;
			codeMax:= code;
		end;
	end;
	
begin
	if(a <> nil) then
	begin
		buscoMaximo(ContarVentas(a^.elem.ventas), a^.elem.code, code, MaxV );
		MaximaCantVentas(a^.HI, code, MaxV);
		MaximaCantVentas(a^.HD, code, MaxV);
	end;
end;



{Procesos para mostrar los arboles para comparar los resultados}

procedure MostrarArbol1(a:arbol);
begin
	if(a <> nil)then
	begin
		writeln('funciono? ', a^.elem.fecha.dia);
		writeln('funciono? ', a^.elem.fecha.mes);
		writeln('funciono? ', a^.elem.fecha.anio);
		writeln;
		MostrarArbol1(a^.HI);
		MostrarArbol1(a^.HD);
	
	end;
end;


procedure MostrarArbol2(a:arbol2);
begin
	if(a <> nil)then
	begin
		writeln('Code: ', a^.elem.code);
		writeln('Unidades: ', a^.elem.UnidadesVen);
		writeln('-----------------------------------------------------------------');
		MostrarArbol2(a^.HI);
		MostrarArbol2(a^.HD);
	
	end;
end;


procedure MostrarArbol3(a:arbol3);
begin
	if(a <> nil)then
	begin
		writeln('funciono? ', a^.elem.code);
		MostrarArbol3(a^.HI);
		MostrarArbol3(a^.HD);
	
	end;
end;

var
	a:arbol;
	arbolProducto:arbol2;
	arbolProductoLista : arbol3;
	max, codeMax: integer;
	codeMax2, max2: integer;
BEGIN
	a:= nil;
	arbolProducto:= nil;
	arbolProductoLista:= nil;
	max:= -1;
	max2:= -1;
	Randomize; 
	
	tomarVenta(a,arbolProducto,arbolProductoLista);
	{MostrarArbol1(a);
	writeln;
	MostrarArbol2(arbolProducto);
	writeln;
	MostrarArbol3(arbolProductoLista);}
	ProductosMasVendidos(a);
	MaximoVendido(arbolProducto, max, codeMax);
	writeln('Codigo maximas unidades vendidas: ',codeMax);
	MaximaCantVentas(arbolProductoLista,codeMax2, max2);
	writeln('Codigo del producto con mas ventas: ',codeMax2);
END.

