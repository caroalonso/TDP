{11. Un cine posee la lista de películas que proyectará durante el mes de octubre.
 De cada película se conoce: 
 código de película, 
 código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
y puntaje promedio otorgado por las críticas.

Implementar un programa que contenga:

a. Un módulo que lea los datos de películas y 
los almacene ordenados por código de Película 
y agrupados por código de género, en una estructura de datos adecuada. 
La lectura finaliza cuando se lee el código de película -1.

b. Un módulo que reciba la estructura generada en el punto a y retorne una
estructura de datos donde estén todas las películas almacenadas ordenadas por código de
película.
}

program tp1punto11;
const
dimf=8; 

type
rango=1..dimf;

pelis=record
  cod:integer;
  cod_genero:rango;
  pun_promedio:real;
end;

lista=^nodo;

nodo=record
  elem:pelis;
  sig:lista;
end;

vector=array [1..dimf] of lista;

//PEOCESOS
procedure inicializar_listas(var v:vector);
var
i:integer;
begin
   for i := 1 to dimf do begin
    v[i]:=nil;
   end;
end;   


procedure insertar_ordenado (var l :lista; p:pelis);
var
  nue:lista;
  ant:lista;
  act:lista;
begin
  new(nue);
  nue^.elem:=p;
  nue^.sig:=nil;
  if(l=nil)then begin //  primer elemento de la lista.
     l:=nue;
  end
  else begin
    ant:=l;
    act:=l;
    while(act<>nil)and (act^.elem.cod < nue^.elem.cod)do begin //menor a mayor dato de antes < dato nuevo
      ant:=act;
      act:=act^.sig;
    end; 
    
    if(act=l)then begin   //primer nodo de la lista.
    nue^.sig:=l;
    l:=nue;
    end
    else begin
      ant^.sig:=nue;      //enganche medio o final.
      nue^.sig:=act;  
    end;
  end;
end;  


procedure leer_info(var p:pelis);
begin
  writeln('ingrese codigo: ');
  readln(p.cod);
  if(p.cod <>-1)then begin
    writeln('ingrese genero: ');
    readln(p.cod_genero);
    writeln('ingrese puntaje : ');
    readln(p.pun_promedio);
  end;
end;


procedure cargar_listas(var vec:vector);
var
  p:pelis;
begin
  leer_info(p);
  while(p.cod <> -1)do begin
    insertar_ordenado(vec[p.cod_genero],p);
    leer_info(p);
  end;
end;  


Procedure agregar_atras(var l:lista;var ult:lista; regis:pelis);
var
  nue:lista;
begin
  new(nue);
  nue^.elem:=regis;
  nue^.sig:=nil;
  if(l=nil)then begin
     l:=nue;
  end   
  else begin
    ult^.sig:= nue;
  end;
  ult:= nue;
end;


procedure minimo (var ve:vector; var min:integer; var regis:pelis);
var
  i:integer;
  indice_minimo:integer;
begin
  min:=9999;
  indice_minimo:=-1;
  for i := 1 to dimf do begin
    if(ve[i]<>nil) and (ve[i]^.elem.cod <= min)then begin // si la lista no esta vacia y el emenento es menor al minimo.
          min:= ve[i]^.elem.cod;
          indice_minimo :=i; 
    end;  
  end;
  if(indice_minimo <> -1) then begin
    regis:=ve[indice_minimo]^.elem;
    ve[indice_minimo]:= ve[indice_minimo]^.sig;
  end;  
end;


procedure merge (ve:vector; var l_nueva:lista);
var
  min:integer;
  ult:lista;
  regis:pelis;
begin
  minimo(ve,min,regis);
  while(min <> 9999 )do begin  
    agregar_atras(l_nueva,ult,regis);   
    minimo(ve,min,regis);
  end;
end;


procedure imprimir_lista(l:lista);
begin
  while (l <> nil)do begin
    writeln('codigo: ' ,l^.elem.cod);
    writeln('genero: ' ,l^.elem.cod_genero);
    writeln('puntaje: ' ,l^.elem.pun_promedio:0:2);
    writeln('');
    l:=l^.sig;
  end; 
end;


procedure imprimir_vector_listas(ve:vector);
var
i:integer;
begin
  for i := 1 to dimf do begin
   if(ve[i]<>nil)then begin
      writeln('');
      writeln('peliculas del genero ',i,':');
      imprimir_lista(ve[i]);
   end
   else begin
     writeln('');
     writeln('no hay peliculas del genero: ',i);
   end;  
  end;
end; 


//PROGRAMA PRINCIPAL
var
  v:vector;                        
  l_nueva:lista;
begin
  inicializar_listas(v);
  cargar_listas(v);
  writeln('');
  imprimir_vector_listas(v);
  l_nueva:=nil;
  merge(v,l_nueva);
  writeln('------- info final ----------');
  imprimir_lista(l_nueva);
end.