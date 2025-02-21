{2. Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2021. 
De cada película se conoce: 
código de película, 
código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
y puntaje promedio otorgado por las críticas.

Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por
código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee
el código de la película -1.
b. Una vez almacenada la información, genere un vector que guarde, para cada
género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de
los dos métodos vistos en la teoría.
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el
código de película con menor puntaje.
}

program punto2;
const
  dimf=8;
type
  rango=1..8;

  pelis=record
    cod:integer;
    cod_genero:rango;
    pun_promedio:real;
  end;

  info2=record
    codigo:integer;
    puntaje:real;
  end;  

  lista=^nodo;

  nodo=record
    elem:pelis;
    sig:lista;
  end;

  vector2=array[rango]of info2;

  vector=array[rango]of lista;

//PEOCESOS
procedure inicializar_vector_listas(var v:vector);
var
  i:integer;
begin
  for i:= 1 to dimf do begin
    v[i]:=nil;
  end;  
end;


procedure agregar_atras(var l:lista;p:pelis);
var
  nue:lista;
  ant:lista;
  act:lista;
begin
  new(nue);
  nue^.elem:=p;
  nue^.sig:=nil;
  ant:=l;
  act:=l;
  while (act <> nil) do begin
    ant:=act;
    act:= act^.sig
  end;
  if(ant=act)then begin
    l:=nue;
  end
  else begin
    ant^.sig:=nue;
  end;
  nue^.sig:=act;
end;


procedure leer_pelis(var p:pelis);
begin
  writeln('ingrese codigo de pelicula: ');
  readln(p.cod);
  if(p.cod <> -1)then begin
    writeln('ingrese genero de pelicula: ');
    readln(p.cod_genero);
    writeln('ingrese puntaje promedio: ');
    readln(p.pun_promedio);
  end;
end;


procedure cargar_info(var v:vector);
var
  p:pelis;
begin
  leer_pelis(p);
  while(p.cod<>-1)do begin
    agregar_atras(v[p.cod_genero],p); // se pasa la lista ya con la posicion y los datos de la peli.
    leer_pelis(p);
  end;
end;


procedure recorrer_cada_lista (l:lista; var max_puntaje:real; var cod:integer);
begin
  while(l <> nil)do begin
    if(l^.elem.pun_promedio > max_puntaje)then begin
       max_puntaje:= l^.elem.pun_promedio;
       cod:=l^.elem.cod;
       l:=l^.sig;  
    end;
  end;
end;


procedure cargar_vector2(v:vector; var v_2: vector2);
var
  i:integer;
  max_puntaje:real;
  cod:integer;
begin
  for i:=1 to dimf do begin
    max_puntaje:=-1;
    cod:=-1;
    recorrer_cada_lista(v[i],max_puntaje,cod);
    v_2[i].codigo:=cod;
    v_2[i].puntaje:=max_puntaje;
  end;  
end;


procedure ordenar_vector_promedios(var v :vector2);
var
  i:integer;
  j:integer;
  actual:info2; // tipo registro
 begin
   for i := 2 to dimf do begin 
     actual:=v[i];  
     j:=i-1;     
     while (j>0) and (v[j].puntaje > actual.puntaje) do begin    // pregunto por el puntaje del registro
       v[j+1]:=v[j];
       j:=j-1;
     end;
     v[j+1]:=actual;
   end;              
 end;


procedure imprimir(v:vector2);
begin
  writeln('----------------');
  writeln('codigo de pelicula con mejor promedio: ',v[1].codigo);
  writeln('codigo de pelicula con mayor promedio: ',v[dimf].codigo);
  writeln('----------------');
end;


//PROGRAMA PRINCIPAL
var
  v:vector;
  v_2:vector2;
begin
   inicializar_vector_listas(v);
   cargar_info(v);
   cargar_vector2(v,v_2);
   ordenar_vector_promedios(v_2);
   imprimir(v_2);
end.