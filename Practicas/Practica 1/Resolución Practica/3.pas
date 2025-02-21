{3. Una librería requiere el procesamiento de la información de sus productos. 
De cadaproducto se conoce :
el código del producto, 
código de rubro (del 1 al 8) 
y precio.
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos
finaliza cuando se lee el precio 0.
Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de
productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
ignore el resto.
c. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría.
d. Muestre los precios del vector ordenado.
}

program punto3;
const
  dimf=8;
  dimf30=30;
type
  rango=1..8;
  producto=record
    cod:integer;
    rugro:rango;
    precio:real;
  end;

  lista=^nodo;
  nodo=record
    elem:producto;
    sig:lista;
  end;  

  vector=array[rango]of lista;

  vector2=array[1..dimf30]of producto;

//PROCESOS
procedure inicializar_vector_listas(var v:vector);
var
  i:integer;
begin
  for i:= 1 to dimf do begin
    v[i]:=nil;
  end;  
end;


procedure leer_producto(var p:producto);
begin
  writeln('ingrese puntaje precio: ');
  readln(p.precio);
  if(p.precio <> 0 )then begin
    writeln('ingrese rugro de producto: ');
    readln(p.rugro);
    writeln('ingrese codigo de producto: ');
    readln(p.cod);
  end;
end;


procedure agregar_ordenado (var l :lista; var dato:producto);
var
  nue:lista;
  ant:lista;
  act:lista;
begin
  new(nue);
  nue^.elem:=dato;
  nue^.sig:=nil;
  if(l = nil)then begin //  primer elemento de la lista.
     L:=nue;
  end
  else begin
    ant:=l;
    act:=l;
    while(act <> nil)and (act^.elem.cod < nue^.elem.cod)do begin  //ordenad e menor a mayor < la lista.
      ant:=act;
      act:=act^.sig;
    end; 
  end;

  if(act = l)then begin   //primer nodo de la lista.
    nue^.sig:=l;
    l:=nue;
  end
  else begin
    ant^.sig:=nue;      //enganche medio o final.
    nue^.sig:=act;  
  end;
end;


procedure cargar_info(var v:vector);
var
  p:producto;
begin
  leer_producto(p);
  while(p.precio <> 0)do begin
    agregar_ordenado(v[p.rugro],p); // se pasa la lista ya con la posicion y los datos de la peli.
    leer_producto(p);
  end;
end;


procedure imprimir_lista(l:lista);
begin
  while (l <> nil)do begin
    writeln(l^.elem.cod);
    l:=l^.sig
  end;
end;  


procedure imprimir_codigos(v:vector);
var
  i:integer;
begin
  for i :=1 to dimf do begin
    writeln('codigos del rugro',i,' : ');
    imprimir_lista(v[i]);
    writeln('-----------------');
  end;
end;  


procedure cargar_vector2(var v2:vector2; l:lista;var diml:integer);
begin
  while (diml < dimf)and(l <> nil)do begin
    diml:=diml+1;
    v2[diml]:=l^.elem;
    l:=l^.sig;
  end;
end;  


procedure imprimir_precios_vector(v2:vector2;diml:integer);
var
  i:integer;
begin
  for i := 1 to diml do begin
    writeln(v2[i].precio);
    writeln ('│') // alt 179
  end;
end;  


procedure ordenar_vector_precio(var v :vector2);
var
  i:integer;
  j:integer;
  actual:producto; // tipo registro
begin
  for i := 2 to dimf do begin 
    actual:=v[i];  
    j:=i-1;     
    while (j > 0) and (v[j].precio > actual.precio) do begin    // pregunto por el precio del registro
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=actual;
  end;              
end;


//PROGRAMA PRINCIPAL
var
  v:vector; // vector de listas
  v2:vector2; // vector de productos
  diml:integer;
begin
  diml:=0;
  inicializar_vector_listas(v);
  cargar_info(v);
  imprimir_codigos(v);
  cargar_vector2(v2,v[3],diml); 
  ordenar_vector_precio(v2); // por insercion.
  imprimir_precios_vector(v2,diml);
end.  