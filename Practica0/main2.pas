program	main2;
procedure GenerateRandomR ( min: integer; max:integer; var NumRandom: integer);
begin
		NumRandom := Random(max - min + 1) + min;
end;
procedure	LeerPorTeclado(var a: integer;var b: integer; var c: integer);
begin
	writeln('ingrese la cantidad de numeros que quiera: ');
	readln(c);
	writeln('ingrese un numero a: ');
	readln(a);
	writeln('ingrese un numero b : ');
	readln(b);
end;
procedure incisoC( );
var
ale: integer;
i: integer;
begin
	randomize;
     for i:=1 to 20  do 
		begin
			ale := random (100);
			writeln ('El numero aleatorio generado es: ', ale);
		end;
	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end;

procedure incisoD( );
var 
a,b,n : integer;
ale:integer;
i:integer;
begin
	LeerPorTeclado(a,b,n);
	randomize;
     for i:=1 to n  do 
		begin
			GenerateRandomR(a,b,ale);
			writeln ('el numero es: ',ale);
		end;
	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end;
procedure incisoE();
var 
	a,b,f,i : integer;
	ale: integer;
begin
LeerPorTeclado(a,b,f);
	randomize;
	GenerateRandomR(a,b,ale);
	i:= 1;
	while ( (ale <> f )and (i <= f)) do 
	begin
			writeln ('El numero aleatorio generado es: ', ale);
			GenerateRandomR(a,b,ale);
			i:= i+1;
	end;
	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end; 


begin
  incisoC();
  incisoD();
  incisoE
end.
