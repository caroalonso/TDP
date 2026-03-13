{8. Escribir un programa que:

a. Implemente un módulo que lea números enteros y los almacene en un árbol
binario de búsqueda.    //   La lectura finaliza con el valor 0.

b. Una vez generado el árbol, realice módulos independientes para:
1)Obtener el número más grande.
2)Obtener el número más chico.
3)Obtener la cantidad de elementos.
4)Informar los números en orden creciente.
5)Informar los números pares en orden decreciente.

Nota: Tener en cuenta que cada número debe aparecer una única vez en el árbol. // No puede haber repetidos
}


program imperativo_ocho;
type

arbol=^nodo;

nodo=record
  elem:integer;
  sig:arbol;
  HI:arbol;
  HD:arbol;
end;  

//----------------


//CREAR ARBOL SIN REPETIDOS.
procedure crear(var a:arbol; num:integer);
begin
  if(a=nil)then begin
    new(a);
    a^.elem:=num;
    a^.HI:=nil;
    a^.HD:=nil;
  end  
  else
  begin
    if(num < a^.elem)then
       crear(a^.HI,num)
    else if (num > a^.elem)then // if evita repetidos.
        crear(a^.HD,num)
  end;  
end;


//NUMERO MAXIMO DEL ARBOL.
function numMax(a:arbol):integer;
begin
  if(a=nil)then //ab vacio
    numMax:= 9999
  else 
    if(a^.HD=nil)then //si mi hijo derecho es nil yo soy el max del arbol.
      numMax:=a^.elem
    else
      numMax:= numMax(a^.HD); //si no sigo bajando por mi hijo derecho.    
end;


//NUMERO MINIMO DEL ARBOL DE MANERA RECURSIVA.
function numMin(a:arbol):integer;
begin
  if(a=nil)then //ab vacio
    numMin:=-1
  else
    if(a^.HI=nil)then //si mi hijo izquiero es nil yo soy el min del arbol.
      numMin:=a^.elem
    else
      numMin:= numMin(a^.HI); //si no sigo bajando por mi hijo izquierdo.      
end;


//CANTIDAD DE ELEMENTOS DEL ARBOL
procedure cantidadTotal(a:arbol; var cant:integer);
begin
  if(a<>nil)then begin
    cant:=cant+1;
    cantidadTotal(A^.HI,cant);
    cantidadTotal(a^.HD,cant);
  end;    
end;


{
//CANTIDAD DE ELEMENTOS ARBOL DE MANERA RECURSIVA CON FUNCTION.
function cantidadTotal(a:arbol):integer;
begin
  if(a=nil)then
    cantidadTotal:= 0
  else
    cantidadTotal:= 1 + cantidadTotal(a^.HI) + cantidadTotal(a^.HD);
end;}



//INFORMAN NUMEROS EN ORDEN CRECIENTE.
procedure enOrdenCreciente(a:arbol);
begin
  if(a<>nil)then begin
    enOrdenCreciente(a^.HI);
    write(a^.elem ,' - ');
    enOrdenCreciente(a^.HD);
  end;
end;


//INFORMAN NUMEROS PARES EN ORDEN DECRECIENTE.
procedure enOrdenDecreciente(a:arbol);
begin
  if(a<>nil)then begin
    enOrdenDecreciente(a^.HD);
    if(a^.elem mod 2=0)then
      write(a^.elem ,' - ');
    enOrdenDecreciente(a^.HI);
  end;
end;

//----------------

var
a:arbol;
num:integer;
cant:integer;
begin
  randomize;
  a:=nil;
  cant:=0;
  num:=random(30); // 0 a 29
  while(num<>0)do begin
    crear(a,num);
    num:=random(30);
  end; 
  writeln('numero maximo del arbol: ', numMax(a));
  writeln('numero minimo del arbol: ', numMin(a));
  cantidadTotal(a,cant);
  writeln('cantidad de elementos del arbol: ',cant);
  writeln('numeros del arbol en orden creciente:');
  enOrdenCreciente(a);
  writeln;
  writeln('numeros pares del arbol en orden decreciente:');
  enOrdenDecreciente(a);
end.
