program main4;
const
	codMAx  = 18;
	dimf = 3;

type
	rubroR = 1..codMax;
	producto= record
		codeProd: integer;
		codRubro: rubroR;
		precio:Real;
	end;
	listProduc =  ^nodo;
	nodo= record
		elem: producto;
		sig: listProduc;
	end;
	vecProd = array [1..dimf] of producto;
	

procedure CargarProducto(var p: producto;var condicion: boolean);
begin
	writeln('ingrese el precio del producto: ');
	readln(p.precio);
	if(p.precio <> 0) then
	begin
		writeln('ingrese el codigo del producto');
		readln(p.codeProd);
		writeln('ingrese el codigo del rubro entre 1 y ',codMax,':');
		readln(p.codRubro);
		condicion:= true;
	end
	else
		condicion:= false;
end;

Procedure AgregarNodo(Var listP: listProduc; p:producto);

Var 
  ant,act, aux: listProduc;
Begin
  new(aux);
  aux^.elem := p;
  aux^.sig := Nil;
  If (listP = Nil) Then listP := aux
  Else
    Begin
      ant := listP;
      act := listP;
      While (act<> Nil) And (act^.elem.codRubro <> p.codRubro) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If (act<> Nil) And (act^.elem.codRubro = p.codRubro) Then
        Begin
          While (act<>Nil)And (act^.elem.codeProd <= p.codeProd) Do
            Begin
              ant := act;
              act := act^.sig;
            End;
          If (act=ant) Then
            listP := aux
          Else
            ant^.sig := aux;
          aux^.sig := act;
        End
      Else
        Begin
          If ant = Nil Then
            listP := aux
          Else
            ant^.sig := aux;
        End;
    End;
End;


procedure CargarLista(var listP:listProduc);
var
	p: producto;
	condi: boolean;
begin
	CargarProducto(p,condi);
	while condi do
	begin
		AgregarNodo(listP, p);
		CargarProducto(p,condi);
	end;
end;

procedure MostrarCodProd(prods: listProduc);
var
	act: listProduc;
begin
	while (prods <> nil)do
	begin
		act:= prods;
		while (prods <> nil) and (act^.elem.codeProd = prods^.elem.codeProd)do
		begin
			writeln('codigo de producto: ', prods^.elem.codeProd);
			prods:= prods^.sig;
		end;
	end;
end;


procedure CargarVector(var v: vecProd; prods: listProduc);
var
	aux: listProduc;
	i: integer;
BEGIN
	i:= 1;
	aux:= prods;
	while (prods<>nil) and(prods^.elem.codRubro <> 3) do
	begin
		aux:= prods;
		prods:= prods^.sig;
	end;
	if (aux^.elem.codRubro = 3)then
	begin
		while (i <= dimf) and (aux^.elem.codRubro = 3) do
		begin
			v[i]:= aux^.elem;
			aux:=aux^.sig;
			i:= i+1;
		end;
	end;
end;


procedure OrdenarVector(var v: vecProd);
var
	i,j: integer;
	act: producto;
begin
	for i:=2 to dimf do
	begin
		act:= v[i];
		j:= i-1;
		while (j>0) and (v[j].precio > act.precio)do
		begin	
			v[j+1] := v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;

procedure ImprimirVector(v:vecProd);
var
	sumar : real;
	i:integer;
begin
	sumar:= 0;
	for i:= 1 to dimf do
	begin
		sumar:= sumar + v[i].precio;
		writeln('precios ordenados: ', v[i].precio :2:0 );
	end;
	writeln('el promedio de los precios es: ',sumar/dimf :2:2);
end;

var 
	productos: listProduc;
	v: vecProd;
BEGIN
	productos:= nil;
	CargarLista(productos);
	MostrarCodProd(productos);
	CargarVector(v,productos);
	OrdenarVector(v);
	ImprimirVector(v);
END.
 
