{Escribir un programa que:

Implemente un módulo que genere una lista a partir de la lectura de números enteros. 
La lectura finaliza con el número -1.

Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
Implemente un módulo recursivo que devuelva el máximo valor de la lista.
Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista 
o falso en caso contrario
}

program imperativo_cuatro;
type

lista=^nodo;

nodo=record
 elem:integer;
 sig:lista;
end;

//-------------------------


//AGREGAR ATRAS EN UNA LISTA.
procedure agregar_atras(var l:lista; var ult:lista ; num:integer);
var
nue:lista;
begin
  new(nue);
  nue^.elem:=num;
  nue^.sig:=nil;
  if(l=nil)then
    l:=nue
  else
      ult^.sig:=nue;
  ult:=nue;    
end;

//CREACION DE LISTA DE ENTEROS.
procedure crear_lista_de_enteros (var l:lista);
var
ult:lista;
num:integer;
begin
  num:=random(11) - 1;
  while(num <> -1)do begin
    agregar_atras(l,ult,num);
    num:=random(11) - 1;
  end;  
end;

//IMPRIMIR LISTA DE ENTEROS DE MANERA RECURSIVA.
procedure imprimir_lista(l:lista);
begin
  if (l<> nil)then begin
    write(l^.elem,' - ');
    imprimir_lista(l^.sig);   
  end;  
end;

//OBTENER MAXIMO DE MANERA RECURSIVA EN UNA LISTA.
function maximo(l:lista ; max:integer):integer;
begin
 if(l=nil)then
    maximo:= max
 else begin
   if(l^.elem > max)then
     max:=l^.elem;
   maximo:= maximo(l^.sig,max);  
 end;     
end;

//OBTENER MINIMO DE MANERA RECURSIVA EN UNA LISTA.
function minimo(l:lista; min:integer):integer;
begin
 if(l=nil)then 
   minimo:=min
 else begin
   if(l^.elem < min)then
     min:=l^.elem;
   minimo:= minimo(l^.sig,min);
 end;   
end;

////OBTENER VERDADERO O FALSO SI EXISTE ELEMENTO EN LA LISTA DE MANERA RECURSIVA.
function seEncuentra(l:lista; valor:integer):boolean;
begin
  if(l=nil)then
    seEncuentra:=false
  else begin
    if(l^.elem=valor)then  
       seEncuentra:=true
    else   
    seEncuentra:=seEncuentra(l^.sig,valor)
  end;     
end;

//--------------------------

var
max:integer;
min:integer;
l:lista;
valor:integer;
begin
randomize;
l:=nil;
min:=9999;
max:=-1;
valor:=random(10)+1;
crear_lista_de_enteros(l);
writeln('<< LISTA DE ENTEROS: >>');
imprimir_lista(l);
writeln();
writeln('El numero max: ', maximo(l,max));
writeln('El numero min:',minimo(l,min));
if(seEncuentra(l,valor))then
  writeln('El valor: ',valor,' se encuentra en la lista')
else
  writeln('El valor: ',valor,' no se encuentra en la lista')
end.
  else begin
    writeln('no se encontro el numero ',x,' en la lista.');
  end; 
end.
