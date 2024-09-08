program untitled;
const
	maxM= 12;
type
	Rmes= 1..maxM;
	compra = record
		code:integer;
		mes: Rmes;
		montoGastado: real;
	end;
	
	vec = array[Rmes] of  real; 
	
	
	ArbolDato = record
		code: integer;
		MontosXmes : vec;
	end;
	
	arbol = ^nodo;
	nodo= record
		dato: ArbolDato;
		hi: arbol;
		hd:arbol;
	end;
	
procedure LeerCompra (var c: compra );
begin
	writeln('ingrese el codigo del cliente');
	readln(c.code);
	if(c.code<>0) then
	begin
		writeln('ingrese un mes entre (1 y 12 )');
		readln(c.mes);
		writeln('ingrese el monto gastado: ');
		readln(c.montoGastado);
	end;
end;


procedure insertaHoja(var a:arbol;c:compra);
	procedure inicializarVec(var v:vec);
	var
		i:integer;
	begin
		for i:= 1 to maxM do
		begin
			 v[i]:= 0;
		end;
	end;
begin
	if(a= nil)then 
	begin
		new(a);
		a^.dato.code:= c.code;
		inicializarVec(a^.dato.MontosXmes);
		a^.dato.MontosXmes[c.mes]:=a^.dato.MontosXmes[c.mes] + c.montoGastado;
		a^.hi:= nil;
		a^.hd:= nil;
	end	
	else if(c.code < a^.dato.code) then
			insertaHoja( a^.hi,c)
		else
			insertaHoja( a^.hd,c);
end;			


procedure armarArbol(var a:arbol);
var
	c:compra;
begin
	leerCompra(c);
	while c.code <> 0 do
	begin
		insertaHoja(a,c);
		leerCompra(c);
	end;
end;

procedure IncisoB(a: arbol);
	procedure exiteCliente(a:arbol;var exite:boolean;var  v:vec; numC:integer);
	begin
		if(a<> nil) then
		begin
			if(a^.dato.code = numC) then
				begin
					v:= a^.dato.MontosXmes;
					exite:= true;
				end
			else
				if(numC < a^.dato.code ) then
					exiteCliente(a^.hi, exite,  v ,numC)
				else
					exiteCliente(a^.hd, exite,  v ,numC);
		end;
	end;
	function BuscarMax(v:vec): integer;
	var
		i:integer;
		max:real;
		MesM: integer;
	begin
		max:=-1;
		for i:=1 to maxM  do
		begin
			if(v[i] > max) then
			begin
				max:= v[i];
				MesM:= i;
			end;
 		end;
 		BuscarMax:= MesM;
	end;
var
	numC:integer;
	v:vec;
	existe:boolean;
begin
	writeln('ingrese el numero del cliente: ');
	readln(numC);
	exiteCliente(a,existe, v, numC);
	if(existe)then
		writeln('el mes con mayor gasto del cliente ', numC , ' es de: ', BuscarMax(v))
	else
		writeln('no existe el cliente que busca');
end;


procedure IncisoC(a:arbol);
	function ContarC(a:arbol; numMes: integer):integer;
	begin
		if(a= nil) then ContarC:= 0
		else
			begin
				 if(a^.dato.MontosXmes[numMes] = 0 ) then
					ContarC:= ContarC(a^.hi,numMes) +  ContarC(a^.hi,numMes)+1
				else
					ContarC:= ContarC(a^.hi,numMes) +  ContarC(a^.hi,numMes);
			end;
	end;
var
	numMes:integer;
begin
	writeln('ingrese un numero de mes entre (1 y 12): ');
	readln(numMes);
	writeln('cantidad de clientes que no gastaron nada: ', ContarC(a, numMes));
	
end;


var
	a: arbol;
BEGIN
	a:= nil;
	armarArbol(a);
	IncisoB(a);
	IncisoC(a);
END.

