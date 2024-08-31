program main3;
const
	maxG = 3;
type
	generoR = 1..maxG;
	pelicula = record
		code : integer;
		genero:generoR;
		promCritica: real;
	end;
	listPelicula = ^nodo;
	nodo = record
		elem: pelicula;
		sig: listPelicula;
	end;
	vec = array[generoR] of integer;

procedure cargarPelicula(var p:pelicula; var condi:boolean);
begin
	writeln('ingrese el codigo de la pelicula: ');
	readln(p.code);
	if(p.code<> -1) then
	begin
		writeln('ingrese el genero entre 1 y ',maxG,': ');
		readln(p.genero);
		writeln('ingrese el promedio de las criticas: ');
		readln(p.promCritica);
		condi:= true;
	end
	else
		condi:= false;
end;

procedure inicializarVec(var v: vec);
var
i:integer;
begin
	for i:=1 to maxG do
	begin
		v[i]:= 0;
	end;
end;

Procedure AgregarNodo(Var listP: listPelicula; p: pelicula);

Var 
  aux, act, ant: listPelicula;
Begin
  new(aux);
  aux^.elem := p;
  aux^.sig := Nil;

  If listP = Nil Then listP := aux
  Else
    Begin
      act := listP;
      ant := Nil;
      While (act <> Nil) And (act^.elem.genero <> p.genero) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If (act <> Nil) And (act^.elem.genero = p.genero) Then
        Begin
          While (act^.sig <> Nil) And (act^.sig^.elem.genero = p.genero) Do
            Begin
              act := act^.sig;
            End;
          aux^.sig := act^.sig;
          act^.sig := aux;
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

procedure ProcesarVector(var v:vec; listP:listPelicula);
var
	aux:listPelicula;
	max: real;
begin
	while(listP<>nil) do
	begin
		aux:= listP;
		max:= -1;
		while ((listP<> nil) and (listP^.elem.genero = aux^.elem.genero)) do
		begin
			if(listP^.elem.promCritica > max)then
			begin
				max:= listP^.elem.promCritica;
				v[listP^.elem.genero]:= listP^.elem.code;
			end;
			listP:= listP^.sig;
		end;
		
	end;
	
end;

procedure OrdenarInsercion(var v:vec; diml:integer );
var
	i,j: integer;
	act: integer;
begin
	for i:=2 to diml do
	begin
		act:= v[i];
		j:= i-1;
		while (j>0) and (v[j]>act) do
		begin
			v[j+1]:= V[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;


procedure CargarLista(var listP:listPelicula);
var
	condi:boolean;
	peli: pelicula;
begin
	condi:= true;
	cargarPelicula(peli,condi);
	while(condi) do
	begin
		AgregarNodo(listP,peli);
		cargarPelicula(peli,condi);
	end;
end;
 
var
	peliculas: listPelicula;
	v: vec;
BEGIN
	peliculas:= nil;
	inicializarVec(v);
	CargarLista(peliculas);
	ProcesarVector(v,peliculas);
	OrdenarInsercion(v,maxG);
	writeln('mayor puntaje ', v[maxG]);
	writeln('menor puntaje ', v[1]);
	
	
	
	
END.

