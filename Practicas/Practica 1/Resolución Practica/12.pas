{Implementar un programa que procese la información de las ventas de productos de una
librería que tiene 4 sucursales. 
De cada venta se lee:
 fecha de venta, 
 código del producto vendido,
código de sucursal y
 cantidad vendida. 
 El ingreso de las ventas finaliza cuando se lee el código de sucursal 0.

Implementar un programa que:
a. Almacene las ventas ordenadas por CODIGO DE PRODUCTO y agrupados por sucursal(VECTOR DE SUCURSALES),
en una estructura de datos adecuada.

b. Contenga un módulo que reciba la estructura generada en el punto a 
y retorne una estructura donde esté acumulada la CANTIDAD TOTAL VENDIDA para CADA CODIGO DE PRODUCTO.

MERGE
LLEO INFO
GUARDO INFO DE FORMA ORDENADA (INSERTAR ORDENADO) EN VECTOR DE LISTAS O VECTOR DE VECTOR
MERGE , MINIMO GUARDO EL MINIMO EN UNA LISTA INSERTO AL FINAL.
}

program tp1ejercicio12;
const
dimf=4; 

type
rango=0..dimf;

ventas=record
  fecha:integer;
  cod:integer;
  cod_sucursal:rango;
  cant:integer;
end;

lista=^nodo;

nodo=record
  elem:ventas;
  sig:lista;
end;

mergee=record
  codigoo:integer;
  total:integer;
end;  

lista2=^nodos;
nodos=record
  elemento:mergee;
  sig:lista2;
end;  

vector=array [1..dimf] of lista;

//PROCESOS
procedure inicializar_listas(var v:vector);
var
i:integer;
begin
   for i := 1 to dimf do begin
    v[i]:=nil;
   end;
end;  


procedure insertar_ordenado (var l :lista; v:ventas);
var
  nue:lista;
  ant:lista;
  act:lista;
begin
  new(nue);
  nue^.elem:=v;
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


procedure leer_info(var ve:ventas);
begin
  writeln('ingrese codigo sucursal (corte 0 ) : ');
  ve.cod_sucursal:=random(4);  // de 1 a 4
  if(ve.cod_sucursal <> 0)then begin
    writeln('ingrese fecha: ');
    ve.fecha:=1+random(31); //1 a 31
    writeln('ingrese codigo prod : ');
    ve.cod:=random(20); //1..19
    writeln('ingrese cantidad : ');
    ve.cant:=random(100);
  end;
end;


procedure cargar_listas(var vec:vector);
var
  v:ventas;
begin
  leer_info(v);
  while(v.cod_sucursal <> 0)do begin
    insertar_ordenado(vec[v.cod_sucursal],v);
    leer_info(v);
  end;
end;  


procedure imprimir_lista(l:lista);
begin
  while (l <> nil)do begin
    writeln('');
    writeln('codigo sucursal: ' ,l^.elem.cod_sucursal);
    writeln('codigo producto: ' ,l^.elem.cod);
    writeln('cantidad venta: ' ,l^.elem.cant);
    writeln('fecha: ' ,l^.elem.fecha);
    l:=l^.sig;
    writeln('');
    writeln('--------------------')
    
  end; 
end;


procedure imprimir_vector_listas(ve:vector);
var
  i:integer;
begin
  for i := 1 to dimf do begin
   if(ve[i]<>nil)then begin
      writeln('');
      writeln('ventas de la sucursal ',i,':');
      imprimir_lista(ve[i]);
   end
   else begin
     writeln('');
     writeln('no hay ventas en la sucursal: ',i);
     writeln('');
   end;  
  end;
end; 


Procedure agregar_atras(var l:lista2 ;var ult:lista2 ; dato:mergee);
var
  nue:lista2;
begin
  new(nue);
  nue^.elemento:=dato;
  nue^.sig:=nil;
  if(l=nil)then begin
     l:=nue;
  end   
  else begin
    ult^.sig:=nue;
  end;
  ult:= nue;
end;


procedure minimo (var v:vector;var min:integer ;var cant_pro:integer);
var
i:integer;
pos_min:integer;
begin
  min:=9999;
  pos_min := -1;
  for i := 1 to dimf do begin
      if (v[i] <> nil)and(v[i]^.elem.cod <= min) then begin //  si la lista no esta vacia y el elemento es menor o igual al minimo.
	      min:=v[i]^.elem.cod;
        pos_min := i;	
      end;
  end;
  if (pos_min <> -1) then begin
    cant_pro:= v[pos_min]^.elem.cant;
    v[pos_min] := v[pos_min]^.sig; //avanza al siguiente nodo del minimo
  end;
end;


procedure merge (ve:vector; var l_nueva:lista2);
var 
  codigo_actual:integer;
  contador_total:integer;
  min:integer;
  ult:lista2;
  cant_pro:integer;
  registro:mergee;
begin
  minimo(ve,min,cant_pro);
  while(min <> 9999 )do begin  
    codigo_actual:=min;
    contador_total:=0;
    while (min <> 9999 ) and (codigo_actual = min)do begin;  // condicion de corte .
       contador_total:=contador_total + cant_pro;
       minimo(ve,min,cant_pro);
    end;
    registro.codigoo:=codigo_actual;
    registro.total:=contador_total;
    agregar_atras(l_nueva,ult,registro);  
  end;  
end;


procedure imprimir_lista_nueva(li:lista2);
begin
  while(li<>nil)do begin
    writeln('codigo producto: ' ,li^.elemento.codigoo);
    writeln('cantidad venta: ' ,li^.elemento.total);
    writeln('');
    li:=li^.sig;
  end;
end;


//PROGRAMA PRINCIPAL
var
  v:vector;                        
  l_nueva:lista2;
begin
randomize;
inicializar_listas(v);
cargar_listas(v);
writeln('');
imprimir_vector_listas(v);
l_nueva:=nil;
merge(v,l_nueva);
writeln('------- info final ----------');
imprimir_lista_nueva(l_nueva);
end.