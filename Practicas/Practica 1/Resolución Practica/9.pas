{9. Implemente un programa que invoque a un módulo que genere un árbol binario de
búsqueda con nombres de personas que se leen desde teclado. La lectura finaliza con el
nombre ‘ZZZ’ que no debe procesarse. También debe invocar a otro módulo que reciba el
árbol generado y un nombre, y retorne verdadero si existe dicho nombre en el árbol o falso
en caso contrario.}

program punto9;
type
   str=string[30];

   arbol=^nodo;
   nodo=record
    elem:str;
    HD:arbol;  //hijo derecho
    HI:arbol;  //hijo izquierdo
  end;  

//PROCESOS
Procedure crear_arbol (var a:arbol; nombre:str); // No se cargan elementos repetidos
begin
  if (a=nil)then begin  //caso base
    new(a);
    a^.elem:= nombre;      // crear el primer nodo del arbol
    a^.HD:=nil;
    a^.HI:=nil;
  end
  else begin 
    if (nombre < a^.elem)then begin  // siguientes nodos, rama izquierda (menor).
      crear_arbol (a^.HI,nombre);     // manda nodo izq y dato (recursion)
    end
    else begin                   // siguientes nodos, rama derecha (mayor)
      if(nombre > a^.elem)then begin   
        crear_arbol (a^.HD,nombre);   // siguientes nodos, der y dato (recursion)
      end;  
    end;
  end;
end;


procedure leer_info(var a:arbol);
var
  nom:str;
begin
  writeln('ingrese un nombre:');
  readln(nom);                //SIEMPRE QUE LEA UN STRING USAR READLN , PARA QUE NO TOME EL ENTER
  while (nom <>'zzz')do begin
    crear_arbol(a,nom);
    writeln('ingrese un nombre:');
    readln(nom);
  end;
end;  


function buscar(a:arbol; nombre:str):boolean;            
begin
  If (a=nil) then begin
    buscar:= false;             // caso base 1 el arbol se encuntra vacio.
  end  
  else begin
    If (nombre=a^.elem) then begin
      buscar:= true;                 // caso base 2 encuentra elemento
    end
    else begin
      If (nombre < a^.elem) then begin
        buscar:= buscar(a^.HI,nombre);
      end  
      else begin
        buscar:= buscar(a^.HD,nombre);
      end;  
    end;      
  end;
end;


//PROGRAMA PRINCIPAL
var
  nom:str;
  a:arbol;
begin
  a:=nil;
  leer_info(a);
  writeln('ingrese un nombre por teclado:');
  readln(nom);
  if( buscar(a,nom) )then begin
    writeln('el nombre',nom,'si existe.');
  end
  else begin
      writeln('el nombre ingresado no existe.');
  end;
end.