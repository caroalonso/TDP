{10. Implementar un programa que contenga:

a. Un módulo que lea información de alumnos de Taller de Programación y almacene
en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
búsqueda por dicho criterio. 
De cada alumno se lee :
legajo, // orden
apellido,
nombre, 
DNI y 
año de ingreso. > 2010

b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo sea inferior a 15853.

c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.}

program tp1punto10;
type
str=string[30];

alumnos=record
  legajo:integer;
  nom:str;
  apellido:str;
  dni:integer;
  anio:integer;
end;  

arbol=^nodo;

nodo=record
  elem:alumnos;
  HD:arbol; //hijo derecho
  HI:arbol; //hijo izquierdo
end;

//PROCESOS
procedure leer_alumno (var alu:alumnos);
begin
  writeln('ingrese anio de ingreso:');
  readln(alu.anio);
  if (alu.anio > 2010)then begin
    writeln('ingrese nombre:');
    readln(alu.nom);
    writeln('ingrese apellido:');
    readln(alu.apellido);
    writeln('ingrese dni:');
    readln(alu.dni);
    writeln('ingrese numero de legajo');
    readln(alu.legajo);
  end;
end;


Procedure crear_arbol (var a:arbol; alu:alumnos);
begin
  if (a=nil)then begin  //caso base
    new(a);
    a^.elem:= alu;      // crear el primer nodo del arbol
    a^.HD:=nil;
    a^.HI:=nil;
  end
  else begin 
    if (alu.legajo < a^.elem.legajo)then begin  // siguientes nodos, rama izquierda (menor).
      crear_arbol (a^.HI,alu);     // manda nodo izq y dato (recursion)
    end
    else begin                   // siguientes nodos, rama derecha (mayor)
      crear_arbol (a^.HD,alu);   // siguientes nodos, der y dato (recursion)
    end;
  end;
end;


procedure cargar(var a:arbol);
var
  alumno:alumnos;
begin
  leer_alumno(alumno);
  while (alumno.anio > 2010)do begin
    crear_arbol(a,alumno);
    leer_alumno(alumno);
  end; 
end;


procedure moduloB(a:arbol;num:integer);
begin
  if (a=nil)then begin
    if (a^.elem.legajo < num)then begin // si el legajo es menor a 15853 debo imprimir nombre y apellido y seguir por las subramas
      writeln('nombre del alumno: ',a^.elem.nom,'apellido de alumno:',a^.elem.apellido);                      
      moduloB(a^.HI,num);
      moduloB(a^.HD,num);
    end
    else begin
      moduloB(a^.HI,num)    // si el legajo es mayor sigo buscando por la rama izquierda.
    end;
  end;  
end;


procedure moduloC(a:arbol; inf:integer; sup:integer);    
begin
  if (a<>nil) then begin
    if (a^.elem.legajo >= inf )then begin                 { (si solo entre > , si entre y igual =>)}
      if (a^.elem.legajo <= sup) then begin              { (si solo entre < , si entre y igual <=)}
        writeln('nombre del alumno: ',a^.elem.nom,'apellido de alumno:',a^.elem.apellido);  
        moduloC(a^.HI,inf,sup);
        moduloC(a^.HD,inf,sup);
      end
      else begin
        moduloC(a^.HI,inf,sup);
      end;
    end
    else begin
       moduloC(a^.HD,inf,sup);
    end;
  end;
end;


//PROGRAMA PRINCIPAL
var
  a:arbol;
  num:integer;
begin
  a:=nil;
  cargar(a);  // PUNTO A
  writeln('Los alumnos cuyo legajo sea inferior a 15853 son: ');
  moduloB(a,15853); //PUNTO B
  moduloC(a,1258,7692); //PUNTO C
end.

