{8. Escribir un programa que:
a. Implemente un módulo que lea números enteros y los almacene en un árbol
binario de búsqueda.    //   La lectura finaliza con el valor 0.

b. Una vez generado el árbol, realice módulos independientes para:
1). Obtener el número más grande.
2) Obtener el número más chico.
3). Obtener la cantidad de elementos.
4). Informar los números en orden creciente.
5). Informar los números pares en orden decreciente.

Nota: Tener en cuenta que cada número debe aparecer una única vez en el árbol.}

program punto8;
type
   arbol=^nodo;
   nodo=record
     elem:integer;
     HD:arbol;  //hijo derecho
     HI:arbol;  //hijo izquierdo
   end;  

//PROCESOS
Procedure crear_arbol (var a:arbol; num:integer); // No se cargan elementos repetidos
begin
  if (a=nil)then begin  //caso base
    new(a);
    a^.elem:= num;      // crear el primer nodo del arbol
    a^.HD:=nil;
    a^.HI:=nil;
  end
  else begin 
    if (num < a^.elem)then begin  // siguientes nodos, rama izquierda (menor).
      crear_arbol (a^.HI,num);     // manda nodo izq y dato (recursion)
    end
    else begin                   // siguientes nodos, rama derecha (mayor)
      if(num > a^.elem)then begin   
        crear_arbol (a^.HD,num);   // siguientes nodos, der y dato (recursion)
      end;  
    end;
  end;
end;


procedure leer_info(var a:arbol);
var
  num:integer;
begin
  writeln('ingrese un numero:');
  read(num);
  while (num<>0)do begin
    crear_arbol(a,num);
    writeln('ingrese un numero:');
    read(num);
  end;
end;  


procedure suma_elementos (a:arbol ; var cant:integer); // PUNTO 3
begin
  if (a <> nil)then begin  // caso base
    cant:=cant+1;                      
    suma_elementos(a^.HI,cant);
    suma_elementos(a^.HD,cant);
  end;
end; 


procedure Imprimir_arbol_en_orden(a:arbol); //PUNTO 4
begin
  if (a <> nil)then begin                        // caso base
    Imprimir_arbol_en_orden(a^.HI);
    writeln(a^.elem);
    Imprimir_arbol_en_orden(a^.HD)  
  end;
end;


Procedure imprimir_par (a:arbol);
begin
  if (a <> nil)then begin  // caso base                  
     imprimir_par(a^.HD);     //primero lado derecho y despues
     if (a^.elem mod 2<>0)then begin
       writeln(a^.elem); 
     end;  
     imprimir_par(a^.HI); // lado izquierdo , recorro el arbol completo en orden decreciente.
  end;
end;


function maximo (a:arbol):integer;  // PUNTO 1
begin
  if (a=nil)then begin    //caso base 1 para arbol vacio.
     maximo:=-1;    // si retorna menos uno el arbol esta vacio.
  end   
  else begin
    if (a^.HD=nil)then begin// caso base 2 se encontro el elemento maximo.
      maximo:=a^.elem;
    end  
    else begin
        maximo:=maximo (a^.HD);  // sigue buscando por la rama derecha.
    end;
  end;
end;


function minimo (a:arbol):integer; // PUNTO 2
begin
  if (a=nil)then begin   //caso base 1 para arbol vacio.
     minimo:=-1;    // si retorna menos uno si el arbol esta vacio.
  end   
  else begin
    if (a^.HI=nil)then begin // caso base 2 se encontro el elemento minimo.
      minimo:=a^.elem;
    end  
    else begin
        minimo:=minimo(a^.HI);  // sigue buscando por la rama izquierad.
    end;
  end;
end;


//PROGRAMA PRINCIPAL
var
  abb:arbol;
  cant:integer;
  min:integer;
  max:integer;
begin
  abb:=nil;
  cant:=0;  
  leer_info(abb);
  max:=maximo(abb); // PUNTO 1
  min:=minimo(abb); //PUNTO 2
  if(max = -1 )then begin
    writeln('el arbol se encuentra vacio');
  end
  else begin
    writeln ('el numero mas grande del arbol es :', max);  
  end;
  if(min = -1 )then begin
    writeln('el arbol se encuentra vacio');
  end
  else begin
    writeln ('el numero mas chico del arbol es :', min);  
  end;
  suma_elementos(abb,cant); // PUNTO 3
  writeln('cantidad de elementos del vector : ',cant);
  writeln('elementos de menor a mayor del arbol:');
  Imprimir_arbol_en_orden(abb);  //PUNTO 4
  writeln('elementos impares del arbol :');
  imprimir_par(abb); //PUNTO 5
end.