
Program main2;


Type 
  Rdia = 1..31;
  Rmes = 1..12;
  dateTime = Record
    dia: Rdia;
    mes: Rmes;
    anio: integer;
  End;
  venta = Record
    code: integer;
    fecha: dateTime;
    UnidadesVen: integer;
  End;

  arbol = ^nodo;
  nodo = Record
    elem: venta;
    HI: arbol;
    HD: arbol;
  End;

  VentaResumen = Record
    code: integer;
    UnidadesVen: integer;
  End;

  arbol2 = ^nodo2;
  nodo2 = Record
    elem: VentaResumen;
    HI: arbol2;
    HD: arbol2;
  End;

  listVenta = ^nodoList;
  nodoList = Record
    elem: venta;
    sig: listVenta;
  End;

  produXlista = Record
    code: integer;
    ventas: listVenta;
  End;

  arbol3 = ^nodo3;
  nodo3 = Record
    elem: produXlista;
    HI: arbol3;
    HD: arbol3;
  End;


Function GenerateRandomR ( min: integer; max:integer): integer;
Begin
  GenerateRandomR := Random(max - min + 1) + min;
End;


Function tomarFecha: dateTime;

Var 
  f: dateTime;
Begin

  f.dia := GenerateRandomR(1, 31);
  f.mes := GenerateRandomR(1, 12);
  f.anio := GenerateRandomR(2024, 2030);
  tomarFecha := f;

End;

{agregar nodo arbol 1}

Procedure InsertarNodo(Var a:arbol; v: venta);
Begin
  If (a=Nil) Then
    Begin
      new(a);
      a^.elem := v;
      a^.HD := Nil;
      a^.HI := Nil;
    End
  Else
    If (v.code < a^.elem.code)Then
      InsertarNodo(a^.HI,v)
  Else
    InsertarNodo(a^.HD,v);
End;

{agregar nodo arbol 2}
Procedure InsertarNodo2(Var a:arbol2; code: integer; cantUni: integer);
Begin
  If (a=Nil) Then
    Begin
      new(a);
      a^.elem.code := code;
      a^.elem.UnidadesVen := cantUni;
      a^.HD := Nil;
      a^.HI := Nil;
    End
  Else
    If (code < a^.elem.code)Then
      InsertarNodo2(a^.HI,code, cantUni)
  Else
    InsertarNodo2(a^.HD,code,cantUni);
End;




{agregar nodo arbol 3}

Procedure InsertarNodo3(Var a:arbol3; v:venta);

Procedure CargarVentaList(Var l:listVenta; v:venta);

Var 
  aux: listVenta;
Begin
  New(aux);
  aux^.elem := v;
  aux^.sig := l;
  l := aux;
End;

Begin
  If (a=Nil) Then
    Begin
      new(a);
      a^.elem.code := v.code;
      a^.elem.ventas := Nil;
      CargarVentaList(a^.elem.ventas, v);
      a^.HD := Nil;
      a^.HI := Nil;
    End
  Else
    If (v.code = a^.elem.code)Then
      CargarVentaList(a^.elem.ventas, v)
  Else If (v.code > a^.elem.code) Then
         InsertarNodo3(a^.HI,v)
  Else
    InsertarNodo3(a^.HD,v);
End;

{Inciso A}
Procedure tomarVenta(Var arbolOrdenado:arbol;Var  arbolProducto:arbol2;
                     Var arbolProductoLista: arbol3 );

Var 
  v: venta;
Begin

  v.code := GenerateRandomR(0, 50);
  While (v.code<>0) Do
    Begin
      v.fecha := tomarFecha();
      v.UnidadesVen :=  GenerateRandomR(1, 10);
      InsertarNodo(arbolOrdenado,v);
      InsertarNodo2(arbolProducto, v.code, v.UnidadesVen );
      InsertarNodo3(arbolProductoLista, v);
      v.code := GenerateRandomR(0, 20);
    End;


End;

{Inciso B }
Function BuscarElemento(a:arbol; f:dateTime): integer ;

Function EsIgual (f1:dateTime; f2:dateTime) : boolean;
Begin
  EsIgual := (f1.dia = f2.dia) And (f1.mes = f2.mes) And (f1.anio = f2.anio) ;
End;

Begin
  If (a<>Nil)Then BuscarElemento := 0
  Else
    If EsIgual(a^.elem.fecha, f)  Then
      BuscarElemento := a^.elem.UnidadesVen + BuscarElemento(a^.HI, f) +
                        BuscarElemento(a^.HD, f)
  Else
    BuscarElemento := BuscarElemento(a^.HI, f) + BuscarElemento(a^.HD, f);

End;

{Inciso B Usuario}
Procedure ProductosMasVendidos(a:arbol);

Var 
  f: dateTime;
Begin
  writeln('ingrese el dia');
  readln(f.dia);
  writeln('ingrese el mes');
  readln(f.mes);
  writeln('ingrese el anio');
  readln(f.anio);
  writeln('cantidades: ', BuscarElemento(a,f));
End;

{Inciso C }

Procedure MaximoVendido (a: arbol2;Var  maxU: integer;Var codeMax:integer);

Procedure actualizarMaximo (code: integer; uniVendi:integer;Var  max:integer;
                            Var codeMax:integer );
Begin
  If (uniVendi > max) Then
    Begin
      max := uniVendi;
      codeMax := code;
    End;

End;


Begin
  If (a<> Nil)Then
    Begin
      actualizarMaximo(a^.elem.code, a^.elem.UnidadesVen ,maxU, codeMax);
      MaximoVendido(a^.HI, maxU, codeMax);
      MaximoVendido(a^.HD, maxU, codeMax);
    End;

End;


{Inciso D}
Procedure MaximaCantVentas(a: arbol3;Var code: integer;Var MaxV:Integer);

Function ContarVentas(l:listVenta): integer;

Var 
  cant: integer;
Begin
  cant := 0;
  While (l<> Nil) Do
    Begin
      cant :=  +1;
      l := l^.sig;
    End;
  ContarVentas := cant;
End;

Procedure buscoMaximo (cantV: integer;code:integer ;Var codeMax:integer; Var
                       MaxV: integer);
Begin
  If (cantV > MaxV)Then
    Begin
      MaxV := cantV;
      codeMax := code;
    End;
End;

Begin
  If (a <> Nil) Then
    Begin
      buscoMaximo(ContarVentas(a^.elem.ventas), a^.elem.code, code, MaxV );
      MaximaCantVentas(a^.HI, code, MaxV);
      MaximaCantVentas(a^.HD, code, MaxV);
    End;
End;



{Procesos para mostrar los arboles para comparar los resultados}

Procedure MostrarArbol1(a:arbol);
Begin
  If (a <> Nil)Then
    Begin
      writeln('funciono? ', a^.elem.fecha.dia);
      writeln('funciono? ', a^.elem.fecha.mes);
      writeln('funciono? ', a^.elem.fecha.anio);
      writeln;
      MostrarArbol1(a^.HI);
      MostrarArbol1(a^.HD);

    End;
End;


Procedure MostrarArbol2(a:arbol2);
Begin
  If (a <> Nil)Then
    Begin
      writeln('Code: ', a^.elem.code);
      writeln('Unidades: ', a^.elem.UnidadesVen);
      writeln(


             '-----------------------------------------------------------------'
      );
      MostrarArbol2(a^.HI);
      MostrarArbol2(a^.HD);

    End;
End;


Procedure MostrarArbol3(a:arbol3);
Begin
  If (a <> Nil)Then
    Begin
      writeln('funciono? ', a^.elem.code);
      MostrarArbol3(a^.HI);
      MostrarArbol3(a^.HD);

    End;
End;

Var 
  a: arbol;
  arbolProducto: arbol2;
  arbolProductoLista : arbol3;
  max, codeMax: integer;
  codeMax2, max2: integer;
Begin
  a := Nil;
  arbolProducto := Nil;
  arbolProductoLista := Nil;
  max := -1;
  max2 := -1;
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
End.
