{
Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta.

Implementar un programa que:

a.Genere un árbol binario de búsqueda ordenado por patente. 
Cada nodo del árbol debe contener:
- patente //ORDEN DE ARBOL
- año de fabricación (2010..2018)
- marca
- modelo

b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la
cantidad de autos de dicha marca que posee la agencia.
Mostrar el resultado.

c. Contenga un módulo que reciba el árbol generado en a) y retorne una estructura con la
información de los autos agrupados por año de fabricación.

d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el
año de fabricación del auto con dicha patente. 
Mostrar el resultado.
}


program imperativo_diecisiete;

type
fabricacion=2010..2018;
str=String[10];

auto=record
  patente:integer;
  anio:fabricacion;
  marca:str;
  modelo:str;
end;  
  
arbol=^nodo;

nodo=record
  elem:auto;
  HI:arbol;
  HD:arbol;
end;

lista=^nodo2;

nodo2=record
  elem:auto;
  sig:lista;
end;


vector=array[fabricacion]of lista;
  
  
//----------------------------


//CREACION DE ARBOL.
procedure crear_arbol(var a:arbol ; au:auto);
begin
  if(a=nil)then begin
    new(a);
    a^.elem:=au;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if(a^.elem.patente < au.patente)then
      crear_arbol(a^.HD,au)
  else if(a^.elem.patente > au.patente)then 
      crear_arbol(a^.HI,au)
end;


//LECURA DE INFORMACION DEL ARBOL.
procedure leer_info (var a:auto);
begin
   writeln('Ingrese patete de auto : (corte con patente 0)');
   readln(a.patente);
   if(a.patente<>0)then begin
     a.anio:= 2010 + random(9);
     writeln('Ingrese marca de auto:');
     readln(a.marca);
     a.modelo:='x';
   end;
end;


//CARGA DEL ARBOL.
procedure cargar_arbol (var a:arbol);
var
au:auto;
begin
  leer_info(au);
  while(au.patente<>0)do begin //CORTE DE CARGA AGREGADO.
      crear_arbol(a,au);
      leer_info(au);
  end;
end;


//IMPRIME PATENTES EN ORDEN (PRUEBA)
procedure inOrden(a:arbol);
begin
  if(a<>nil)then begin
	inOrden(a^.HI);
	writeln('Patente: ',a^.elem.patente, ' Anio Fabricacion: ',a^.elem.anio, ' Marca: ',a^.elem.marca);
	inOrden(a^.HD);
  end;
end;


//CONTADOR DE UN CAMPO DE MANERA RECURSIVA CON FUNCITON.
function contadorMarca(a:arbol; m:String):integer;
begin
  if(a=nil)then 
    contadorMarca:= 0
  else if(a^.elem.marca = m)then
    contadorMarca:= 1 + contadorMarca(a^.HI,m) + contadorMarca(a^.HD,m)
  else
    contadorMarca:= contadorMarca(a^.HI,m) + contadorMarca(a^.HD,m);
end;


//INICIALIZACION DE VECTOR DE LISTAS EN NIL.
procedure inicializacionNil(var v:vector);
var
i:integer;
begin
  for i:= 2010 to 2018 do 
    v[i]:=nil;
end;


//AGREGAR ATRAS EN LISTA.
procedure agregar_atras(var l:lista;var ult:lista; a:auto);
var
nue:lista;
begin
  new(nue);
  nue^.elem:=a;
  nue^.sig:=nil;
  if(l=nil)then
    l:=nue
  else
    ult^.sig:=nue;
  ult:=nue;    
end;


//CREACION DE VECTOR DE LISTAS ORDENADO POR AÑO DE FABRICACION.
procedure estructuraPorAnio(a:arbol; var ult:lista ; var v:vector);
begin
  if(a<>nil)then begin
    agregar_atras(v[a^.elem.anio],ult,a^.elem);
    estructuraPorAnio(a^.HI,ult,v);
    estructuraPorAnio(a^.HD,ult,v);
  end;
end;


//IMPRIMIR LISTA DE MANERA RECURSIVA (PRUEBA).
procedure imprimirLista(l:lista);
begin
  if (l<>nil)then begin
    writeln(l^.elem.patente);
    imprimirLista(l^.sig);
  end;  
end;


//IMPRIME FABRICACION EN ORDEN (PRUEBA).
procedure imprimirAnioFabricacion(v:vector);
var
i:integer;
begin
  for i:= 2010 to 2018 do begin
      writeln('Fabricacion anio ', i ,' : ');
	  if(v[i]<> nil)then begin
		imprimirLista(v[i]);
	    writeln;
	  end;
  end;
end;


//BUSQUEDA EFICIENTE DE PATENTE EN ARBOL.
function patenteExistente (a:arbol; patente:integer):boolean;
begin
  if(a=nil)then 
    patenteExistente:=false
  else if(a^.elem.patente=patente)then 
    patenteExistente:=true
  else if(a^.elem.patente < patente)then
    patenteExistente:= patenteExistente(a^.HD,patente)
  else
    patenteExistente:= patenteExistente(a^.HI,patente);  
end;

//------------------

var
a:arbol;
v:vector;
marca:string[10];
patente:integer;
ult:lista;
begin
randomize;
a:=nil;
inicializacionNil(v);
cargar_arbol(a);
writeln;
writeln('<< ARBOL ORDENADO POR PATENTE: >>'); //PRUEBA
inOrden(a); //PRUEBA
writeln;
marca:='ford';
patente:=8;
writeln('<< CANTIDAD DE AUTOS MARCA FORD: >>');
writeln('Cantidad de autos de ',marca,': ', contadorMarca(a,marca));
estructuraPorAnio(a,ult,v);
writeln;
writeln('<< VECTOR DE LISTAS ORDENADO POR ANIO DE FABRICACION: >>'); //PRUEBA
imprimirAnioFabricacion(v); //PRUEBA
writeln;
writeln('<< PATENTE EXISTENTE: >>');
writeln('<< Patente ',patente,' existente: ', patenteExistente(a,patente),' >>');
writeln;
end.
