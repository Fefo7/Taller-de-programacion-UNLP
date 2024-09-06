
{a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados su código, la cantidad total de unidades vendidas y el monto total. De cada venta se cargan código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las ventas finaliza cuando se lee el código de venta 0.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el menor código de producto.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos valores recibidos (sin incluir) como parámetros.

}

Program ImperativoClase4;

Type venta = Record
  codigoVenta: integer;
  codigoProducto: integer;
  cantUnidades: integer;
  precioUnitario: real;
End;
productoVendido = Record
  codigo: integer;
  cantTotalUnidades: integer;
  montoTotal: real;
End;
arbol = ^nodoArbol;
nodoArbol = Record
  dato: productoVendido;
  HI: arbol;
  HD: arbol;
End;

Procedure ModuloA (Var a: arbol);

{ Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total 
de unidades vendidas y el monto total. }

Procedure CargarVenta (Var v: venta);
Begin
  v.codigoVenta := random (51) * 100;
  If (v.codigoVenta <> 0)
    Then
    Begin
      v.codigoProducto := random (100) + 1;
      v.cantUnidades := random(15) + 1;
      v.precioUnitario := (100 + random (100))/2;
    End;
End;

Procedure InsertarElemento (Var a: arbol; elem: venta);

Var p: productoVendido;

Procedure ArmarProducto (Var p: productoVendido; v: venta);
Begin
  p.codigo := v.codigoProducto;
  p.cantTotalUnidades := v.cantUnidades;
  p.montoTotal := v.cantUnidades * v.precioUnitario;
End;

Begin
  If (a = Nil)
    Then
    Begin
      new(a);
      ArmarProducto (p, elem);
      a^.dato := p;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If (elem.codigoProducto = a^.dato.codigo)
         Then
         Begin
           a^.dato.cantTotalUnidades := a^.dato.cantTotalUnidades + elem.
                                        cantUnidades;
           a^.dato.montoTotal := a^.dato.montoTotal + (elem.cantUnidades * elem.
                                 precioUnitario);
         End
  Else If (elem.codigoProducto < a^.dato.codigo)
         Then InsertarElemento(a^.HI, elem)
  Else InsertarElemento(a^.HD, elem);
End;

Var unaVenta: venta;
Begin
  writeln;
  writeln ('----- Ingreso de ventas y armado de arbol de productos ----->');
  writeln;
  a := Nil;
  CargarVenta (unaVenta);
  While (unaVenta.codigoVenta <> 0) Do
    Begin
      InsertarElemento (a, unaVenta);
      CargarVenta (unaVenta);
    End;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
End;

Procedure ModuloB (a: arbol);
{ Imprima el contenido del árbol ordenado por código de producto.}
Procedure ImprimirArbol (a: arbol);
Begin
  If (a <> Nil)
    Then
    Begin
      If (a^.HI <> Nil) Then ImprimirArbol (a^.HI);
      writeln ('Codigo producto: ', a^.dato.codigo, ' cantidad unidades: ', a^.
               dato.cantTotalUnidades, ' monto total: ', a^.dato.montoTotal:2:2)
      ;
      If (a^.HD <> Nil) Then ImprimirArbol (a^.HD);
    End;
End;

Begin
  writeln;
  writeln ('----- Modulo B ----->');
  writeln;
  If ( a = Nil) Then writeln ('Arbol vacio')
  Else ImprimirArbol (a);
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
End;

Procedure ModuloC (a: arbol);
{Retornar el menor código de producto.}

Function ObtenerMinimo (a: arbol): integer;
Begin
  If (a = Nil)
    Then ObtenerMinimo := 9999
  Else If (a^.HI = Nil) Then ObtenerMinimo := a^.dato.codigo
  Else ObtenerMinimo := ObtenerMinimo (a^.HI)
End;

Var menorCodigo: integer;
Begin
  writeln;
  writeln ('----- Modulo C ----->');
  writeln;
  write ('Menor codigo de producto: ');
  writeln;
  menorCodigo := ObtenerMinimo (a);
  If (menorCodigo = 9999)
    Then writeln ('Arbol vacio')
  Else
    Begin
      writeln;
      writeln ('El codigo menor es ', menorCodigo);
      writeln;
    End;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
End;

Procedure ModuloD (a: arbol);

{ Retornar la cantidad de códigos que existen en el árbol que son menores que un valor que se recibe como parámetro }
Function CantidadDeCodigosMenores (a: arbol; cod: integer): integer;

Begin
  If (a = Nil) Then
    CantidadDeCodigosMenores :=  0
  Else  If (a^.dato.codigo < cod) Then
          CantidadDeCodigosMenores := 1 + CantidadDeCodigosMenores(a^.HI,cod) +
                                      CantidadDeCodigosMenores(a^.HD,cod)
  Else
    CantidadDeCodigosMenores := CantidadDeCodigosMenores(a^.HI,cod) +
                                CantidadDeCodigosMenores(a^.HD,cod);
End;

Var cantidad, unCodigo: integer;
Begin
  writeln;
  writeln ('----- Modulo D ----->');
  writeln;
  write ('Ingresar un codigo: ');
  readln (unCodigo);
  cantidad := CantidadDeCodigosMenores (a, unCodigo);
  writeln;
  writeln ('La cantidad de codigos menores al codigo ', unCodigo, ' es: ',
           cantidad);
  writeln;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
End;

Procedure ModuloE (a: arbol);

{ Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos 
comprendidos entre los dos valores recibidos (sin incluir). }

Function ObtenerMontoTotalEntreDosCodigos (a: arbol; codigo1, codigo2: integer):
                                                                            real
;
Begin
    { COMPLETAR }
{dos opciones o buscas el codigo1 y de ahi iteras todos los montos totales hasta el codigo2  | recorrer todos hasta encontrar un codigo que este en ese rango}
  If (a = Nil) Then
    ObtenerMontoTotalEntreDosCodigos := 0
  Else If (a^.dato.codigo > codigo1) And (a^.dato.codigo < codigo2) Then
         ObtenerMontoTotalEntreDosCodigos := ObtenerMontoTotalEntreDosCodigos(a^
                                             .HI, codigo1, codigo2) +
                                             ObtenerMontoTotalEntreDosCodigos(a^
                                             .HD, codigo1, codigo2)
                                             + a^.dato.MontoTotal
  Else
    ObtenerMontoTotalEntreDosCodigos := ObtenerMontoTotalEntreDosCodigos(a^.HI,
                                        codigo1, codigo2) +
                                        ObtenerMontoTotalEntreDosCodigos(a^.HD,
                                        codigo1, codigo2);
End;

Var codigo1, codigo2: integer;
  montoTotal: real;
Begin
  writeln;
  writeln ('----- Modulo E ----->');
  writeln;
  write ('Ingrese primer codigo de producto: ');
  readln (codigo1);
  write ('Ingrese segundo codigo de producto (mayor al primer codigo): ');
  readln (codigo2);
  writeln;
  montoTotal := ObtenerMontoTotalEntreDosCodigos (a, codigo1, codigo2);
  If (montoTotal = 0)
    Then writeln ('No hay codigos entre ', codigo1, ' y ', codigo2)
  Else
    Begin
      writeln;
      writeln ('El monto total entre el codigo', codigo1, ' y el codigo : ',
               codigo2, ' es: ', montoTotal :5:0);
      writeln;
    End;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
End;

Var a: arbol;
Begin
  randomize;
  ModuloA (a);
  ModuloB (a);
  ModuloC (a);

  ModuloD (a);
  ModuloE (a);

End.
