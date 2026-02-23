{
Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2021.

De cada película se conoce:
-cód de película
-cód de género (1:acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
-puntaje promedio.

Implementar modulos:

a.Leer los datos de películas y los guardar por orden de llegada //agregar atras en las listas
agrupados por cód de género, en una estructura de datos adecuada. // vector dimf= 8 de listas de peliculas 

* La lectura finaliza cuando se lee el cód de la película -1.

b.Una vez guardada la info, crear un vector que GUARDE PARA CADA GENERO, 
el cód de película con mayor puntaje promedio. // crear vector de registro con: cod de peli y puntaje max promedio.

c. ORDENE los elementos del VECTOR creado recientemente POR PUNTAJE PROMEDIO
por seleccion o insercion.

d. Luego de ordenar el vector, IMPRIMIR 
cód de película con mayor puntaje 
y cód de película con menor puntaje. // v[1] y v[dimF]
}

program imperativo_dos;
const
  dimF=8;
type
  rango= 1..dimF;
  
  pelicula=record
    cod:integer;
    cod_genero:integer;
    puntaje:real;
  end;
  
  info_peli=record
    cod:integer;
    puntaje:real;
  end;
   
  lista=^nodo;
  
  nodo=record
    elem:pelicula;
    sig:lista;
  end;     
  
  vector1=array[rango]of lista;
  
  vector2=array[rango]of info_peli;  

//--------------------------------------------------

//INICIALIZAR VECTOR DE LISTAS EN NIL
procedure inicializar_vector_nil(var v:vector1);
var
i:integer;
begin
  for i:=1 to dimF do
    v[i]:=nil;
end;

//AGREGAR ATRAS EN LISTA
procedure agregar_Atras(var l:lista; var ult:lista ; dato:pelicula);
var
nue:lista;
begin
  new(nue);
  nue^.elem:=dato;
  nue^.sig:=nil;
  
  if(l=nil)then
    l:=nue
  else
    ult^.sig:=nue;
  ult:=nue;    
end;

//LEER INFORMACION DE PELICULAS
procedure leer_pelicula(var x:pelicula);
begin
  writeln('Ingresar cod de pelicula (corte cod -1): ');
  read(x.cod);
  writeln('Ingresar genero de pelicula (1 a 8): ');
  read(x.cod_genero);
  x.puntaje:=random * 9 + 1; // 1 a casi 10
end;

//CREAR LISTA DE PELICULAS
procedure cargar_vector_de_lista(var v:vector1);
var
x:pelicula;
ult:lista;
begin
  repeat
   leer_pelicula(x);
   agregar_Atras(v[x.cod_genero],ult,x);
  until(x.cod = -1);
end;

//IMPRIMIR LISTA
procedure imprimir_lista(l:lista);
begin
  if(l<>nil)then begin
    writeln('COD PELI: ',l^.elem.cod);
    writeln('COD GENERO: ',l^.elem.cod_genero);
    writeln('PUNTAJE PROMEDIO: ',l^.elem.puntaje:2:2);
    writeln('--------------');
    imprimir_lista(l^.sig);
  end;
end;  

//IMPRIME VECTOR DE LISTA 
procedure imprimir_vector_listas(v:vector1);
var
i:integer;
begin
  for i:= 1 to dimF do begin
    writeln ('< PELICULAS DE GENERO: ',i,'>');
    writeln;
    if(v[i] <> nil)then // por si alguna de las listas de genero se encuentra vacia
      imprimir_lista(v[i])
  end;
end;  

//RECORRER LISTA RETORNAR ELEM MAX Y COD
procedure recorrerLista(l:lista; var max:real; var cod:integer);
begin
  while(l<>nil)do begin
    if(l^.elem.puntaje > max)then begin
      max:=l^.elem.puntaje;
      cod:=l^.elem.cod;
    end; 
    l:=l^.sig; 
  end;
end;

//CARGAR NUEVO VECTOR
procedure cargar_nuevo_vector(v1:vector1 ;var v2:vector2);
var
max:real;
cod:integer;
i:integer;
begin
  for i := 1 to dimF do begin
    max:=-1;
    cod:=-1;
    recorrerLista(v1[i],max,cod);
    v2[i].cod:=cod;
    v2[i].puntaje:=max;
  end;  
end;

//IMPRIMIR VECTOR
procedure imprimir_vector(v2:vector2);
var
i:integer;
begin
  for i :=1 to dimF do begin
   writeln('CATEGORIA: ',i,':');
   writeln('MAX PUNTAJE: ',v2[i].puntaje:2:2);
   writeln('COD PELI: ',v2[i].cod);
   writeln('-------------');
  end;
end;

//ORDEN DE VECTOR POR INSERCION , ORDEN POR PUNTAJE
procedure orden_insercion(var v2:vector2);
var
i,j:integer;
actual:info_peli;
begin
  for i := 2 to dimF do begin
    actual:=v2[i];
    j:=i-1;
    while(j>0)and(v2[j].puntaje > actual.puntaje)do begin
      v2[j+1]:=v2[j];
      j:=j-1;
    end;
    v2[j+1]:=actual;
  end;
end;    
    

var
v1:vector1;
v2:vector2;
begin
  randomize;
  writeln('INGRESAR COMO MINIMO UNA PELICLULA POR CADA GENERO PARA FUNCIONAMIENTO DE PROGRAMA.');
  inicializar_vector_nil(v1);
  cargar_vector_de_lista(v1);
  writeln('<< LISTA DE PELICULAS >>');
  writeln;
  imprimir_vector_listas(v1);
  cargar_nuevo_vector(v1,v2);
  writeln('<< VECTOR DESORDENADO >>');
  writeln;
  imprimir_vector(v2);
  orden_insercion(v2);
  writeln('<< VECTOR ORDENADO POR PUNTAJE>>');
  writeln;
  imprimir_vector(v2);
  writeln;
  writeln('<<COD PELI CON MAYOR Y MENOR PUNTAJE:>>');
  writeln;
  writeln('COD PELI MIN:',v2[1].cod);
  writeln('COD PELI MAX:',v2[dimF].cod);
end.
