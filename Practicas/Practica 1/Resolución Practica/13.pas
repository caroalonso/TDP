{13. Un teatro tiene funciones los 7 días de la semana.
 Para cada día se tiene una lista con las entradas vendidas.
Se desea procesar la información de una semana
Implementar un programa que:

a. Genere 7 listas con las entradas vendidas para cada día. 
De cada entrada se lee 
día (de 1 a 7),
código de la obra, // corte 0
asiento y
monto. 
La lectura finaliza con el código de obra igual a 0.
Las listas deben estar ordenadas por código de obra de forma ascendente.(menor a mayor).

b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra.
 Esta lista debe estar ordenada por código de obra de forma ascendente.
}

program tp1ejercicio13;
const
dimf=7; 

type
rango=1..dimf;

entradas=record
  dia:rango;
  cod_obra:integer;
  asiento:integer;
  monto:real;
end;

lista=^nodo;

nodo=record
  elem:entradas;
  sig:lista;
end;

totalidad=record
  num_obra: integer;
  entradas_vendidas:integer;
end;  

lista2=^nodos;

nodos=record
  elementos:totalidad;
  sig:lista2;
end;

vector=array [1..dimf]of lista;

//MERGE CONTADOR:
//1)inicializar listas o vector en cero 
//2)cargar los datos de las listas de manera ordenada por un criterio:
//insertar odernado : verificar las parametros , fijarse el dato que cargo en el nodo  y el nue , verificar < .
//3)merge
//4)minimo
//5)agregar atras nueva lista en nil con un criterio de orden.

//PROCESOS
procedure inicializar_listas(var v:vector); //1)
var
i:integer;
begin
   for i := 1 to dimf do begin
    v[i]:=nil;
   end;
end; 


procedure insertar_ordenado (var l :lista; e:entradas);
var
  nue:lista;
  ant:lista;
  act:lista;
begin
  new(nue);
  nue^.elem:=e;
  nue^.sig:=nil;
  if(l=nil)then begin //  primer elemento de la lista.
     l:=nue;
  end
  else begin
    ant:=l;
    act:=l;
    while(act<>nil)and (act^.elem.cod_obra < nue^.elem.cod_obra)do begin //menor a mayor dato de antes < dato nuevo
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


Procedure agregar_atras(var l:lista2 ;var ult:lista2 ; dato:totalidad);
var
  nue:lista2;
begin
  new(nue);
  nue^.elementos:=dato;
  nue^.sig:=nil;
  if(l=nil)then begin
     l:=nue;
  end   
  else begin
    ult^.sig:=nue;
  end;
  ult:= nue;
end;


procedure leer_info(var e:entradas);
begin
  //writeln('ingrese codigo de obra (corte 0 ) : ');
  e.cod_obra:=random(10);  // de 1 a 10
  if(e.cod_obra <> 0)then begin
    //writeln('ingrese dia: ');
    e.dia:=1+random(8); //1 a 7
    //writeln('ingrese asiento : ');
    e.asiento:=random(20); //1..19
    //writeln('ingrese monto : ');
    e.monto:=random(100); //0.. 99
  end;
end;


procedure cargar_listas(var vec:vector);
var
  e:entradas;
begin
  leer_info(e);
  while(e.cod_obra <> 0)do begin
    insertar_ordenado(vec[e.dia],e);
    leer_info(e);
  end;
end;  


procedure imprimir_lista(l:lista);  // podria hacerse de manera recursiva
begin
  while (l <> nil)do begin
    writeln('COD OBRA  : ' ,l^.elem.cod_obra,' | DIA : ' ,l^.elem.dia,' | ASIENTO: ' ,l^.elem.asiento,'| MONTO $ : ' ,l^.elem.monto:0:2);
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
      writeln('INFORMACION DEL DIA ' ,i,':');
      imprimir_lista(ve[i]);
   end
   else begin
     writeln('');
     writeln('NO HAY INFORMACION DEL DIA : ',i);
     writeln('');
   end;  
  end;
end; 


procedure minimo (var v:vector;var min:integer );
var
  i:integer;
  pos_min:integer;
begin
  min:=9999;
  pos_min := -1;
  for i := 1 to dimf do begin
      if (v[i] <> nil)and(v[i]^.elem.cod_obra <= min) then begin //  si la lista no esta vacia y el elemento es menor o igual al minimo.
	        min:=v[i]^.elem.cod_obra;
          pos_min := i;	
      end;
  end;
  if (pos_min <> -1) then begin
    v[pos_min] := v[pos_min]^.sig; //avanza al siguiente nodo del minimo
  end;
end;


procedure merge_acumulador (ve:vector; var l2:lista2);
var 
obra_actual:integer;
contador_total:integer;
min:integer; // siempre
ult:lista2;
registro:totalidad;
begin
  minimo(ve,min);
  while(min <> 9999 )do begin  
    obra_actual:= min;
    contador_total:=0;
    while (min <> 9999 ) and (obra_actual = min)do begin;  // condicion de corte .
       contador_total:=contador_total + 1; 
       minimo(ve,min);
    end;
    registro.num_obra:=obra_actual;
    registro.entradas_vendidas :=contador_total;
    agregar_atras(l2,ult,registro);  
  end;  
end;


procedure imprimir_lista_nueva(l2:lista2);
begin
  while(l2<>nil)do begin
    writeln('cantidad de venta para la obra ' ,l2^.elementos.num_obra,' :  ', l2^.elementos.entradas_vendidas);
    writeln('');
    l2:=l2^.sig;
  end;
end;


//PROGRAMA PRINCIPAL
var
  v:vector;
  l2:lista2;
begin
  randomize;
  l2:=nil;
  inicializar_listas(v);
  cargar_listas(v);
  writeln('');
  imprimir_vector_listas(v);
  merge_acumulador(v,l2);
  writeln;
  writeln('INFORMACION NUEVA LISTA:');
  writeln;
  imprimir_lista_nueva(l2); 
end.