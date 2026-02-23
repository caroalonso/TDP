{
Una librería requiere el procesamiento de la información de sus productos. 
De cadaproducto se conoce :

- cód producto
- cód rubro (del 1 al 8) 
- precio.

Implementar un programa modularizado que:

a. Lea los datos de los productos y los almacene ordenados por cód de producto y
agrupados por cod de rubro, en una estructura de datos adecuada. 
El ingreso de los productos finaliza cuando se lee el precio 0.
Una vez almacenados, muestre los cód de los productos pertenecientes a cada rubro.

b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
Considerar que puede haber más o menos de 30 productos del rubro 3. 
Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
ignore el resto.

c. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría.

d. Muestre los precios del vector ordenado.
}

program imperativo_tres;
const
  dimF=8;
  dimensionF=30;

type
  rango1=1..dimF;
  rango2=1..dimensionF;
  
  producto=record
    cod:integer;
    cod_r:integer;
    precio:real;
  end;
  
  lista=^nodo;
  
  nodo=record
    elem:producto;
    sig:lista;
  end;  
  
  
  vector1=array[rango1]of lista;
  
  vector2=array[rango2]of producto;

//----------------------------------

//INICIALIZAR VECTOR NIL
procedure inicializar_vector_nil(var v:vector1);
var
i:integer;
begin
 for i:= 1 to dimF do 
    v[i]:=nil;
end;

//LEER INFORMACION DE PRODUCTO
procedure leer_info(var x:producto);
begin
  writeln('ingrese precio de producto - corte precio 0');
  read(x.precio);
  if (x.precio <> 0)then begin
    writeln('ingrese cod producto -');
    read(x.cod);
    writeln('ingrese rugro(1..8)');
    read(x.cod_r);
  end;
end;

//AGREGAR_ATRAS
procedure agregar_atras(var l:lista; var ult:lista ;p:producto);
var
nue:lista;
begin
  new(nue);
  nue^.elem:=p;
  nue^.sig:=nil;
  
  if(l=nil)then
    l:=nue
  else
    ult^.sig:=nue;
  ult:=nue;  
end;

//CARGAR INFO EN EL VECTOR DE LISTAS
procedure cargar_info(var v1:vector1);
var
p:producto;
ult:lista;
begin
  leer_info(p);
  while(p.precio <> 0)do begin
    agregar_atras(v1[p.cod_r],ult,p);
    leer_info(p);
  end;  
end;

//CARGAR VECTOR DE PRODUCTOS MAX 30
procedure cargar_nuevo_vector(var v2:vector2; var diml:integer; l:lista);

begin
  while(diml<dimensionF)and(l<>nil)do begin
    diml:=diml+1;
    v2[diml]:=l^.elem;
    l:=l^.sig;
  end;
end;

//IMPRIMIR VECTOR
procedure imprimir_vector(v2:vector2; diml:integer);
var
i:integer;
begin
  for i:= 1 to diml do begin
    writeln('COD: ',v2[i].cod);
    writeln('RUGRO: ',v2[i].cod_r);
    writeln('PRECIO: ',v2[i].precio:2:2);
    writeln('--------------------');
  end;
end;

//IMPRIMIR PRECIOS ORDENADOS DE VECTOR
procedure imprimir_precio_vector(v2:vector2; diml:integer);
var
i:integer;
begin
  for i:= 1 to diml do begin
    writeln('PRECIO: ',v2[i].precio:2:2);
  end;
end;

//ORDEN INSERCION VECTOR
procedure orden_insercion(var v:vector2; diml:integer);
var
i,j:integer;
actual:producto;
begin
  for i := 2 to diml do begin
    actual:=v[i];
    j:=i-1;
    while(j>0)and(v[j].precio > actual.precio)do begin
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=actual;
  end;
end;


var
v1:vector1;
v2:vector2;
diml:integer;
begin
  writeln('<<CARGAR COMO MINIMO UN RUGRO DE CADA PRODUCTO PARA BUEN FUNCIONAMIENTO DEL PRODUCTO>>');
  diml:=0;
  inicializar_vector_nil(v1);
  cargar_info(v1);
  cargar_nuevo_vector(v2,diml,v1[3]);
  writeln('<<VECTOR DE PRODUCTOS DE RUGRO 3 DESORDENADO>>');
  writeln;
  imprimir_vector(v2,diml);
  orden_insercion(v2,diml);
  writeln;
  writeln('<<VECTOR ORDENADO POR PRECIOS DE RUGRO 3>>');
  writeln;
  imprimir_precio_vector(v2,diml);
end.
