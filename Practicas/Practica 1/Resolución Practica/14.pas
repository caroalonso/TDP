{
Una aerolínea DISPONE de un árbol binario de búsqueda con la información de sus
empleados. 
De cada empleado se conoce: 
* Número de legajo // criterio de orden del arbol
* Dni
* Categoría (1..20) 
* y año de ingreso a la empresa. 
Nota: El árbol se encuentra ordenado por número de legajo. 

Se solicita:
a. Implementar un módulo que reciba:
* el árbol de empleados
* número de legajo “A”
* número de legajo “B” 
* número de categoría

y retorne un vector ordenado por número de legajo. 
El vector debe contener: 
* número de legajo 
* Dni 

de los empleados cuyo número de legajo se encuentra comprendido entre los números de legajo recibidos (“A” y “B”, siendo “A” menor que “B”) 
y la categoría se corresponda con la recibida por parámetro. 

Por norma de la empresa, cada categoría puede contar con a lo sumo 250 empleados. //DimF vector.

b. Implementar un módulo recursivo que reciba la información generada en “a” y retorne
el promedio de los números de Dni.
}

program imperativo_catorce;
const
  dimF=250;
type
  categoria=1..20;
  
  empleado=record
    legajo:integer;
    dni:integer;
    cat:categoria;
    anio:integer;
  end;  
  
  arbol=^nodo;
  
  nodo=record
    elem:empleado;
    HI:arbol;
    HD:arbol;
  end;
  
  empleado2=record
    legajo:integer;
    dni:integer;
  end; 
  
  vector=array[1..dimF] of empleado2;
  
  
//----------------------------------------


//(PRUEBA) LECTURA DE ARBOL EN ORDEN CRECIENTE
procedure inOrden(a:arbol);
begin
  if(a<>nil)then begin
    inOrden(a^.HI);
    writeln('Legajo: ',a^.elem.legajo);
    writeln('Categoria: ',a^.elem.cat);
    writeln;
    inOrden(a^.HD);
  end;  
end;


//YA SE DISPONE (PRUEBA) - CREACION ARBOL SIN REPETIDOS
procedure crear_arbol(var a:arbol ; e:empleado);
begin
  if(a=nil)then begin
    new(a);
    a^.elem:=e;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if(a^.elem.legajo < e.legajo)then 
     crear_arbol(a^.HD,e)
  else if(a^.elem.legajo > e.legajo)then 
    crear_arbol(a^.HI,e)
end;


//YA SE DISPONE (PRUEBA) - LEECTURA DE CARGA ARBOL
procedure leer_info (var e:empleado);
begin
  writeln('Ingrese num legajo: (corte de carga con legajo 0)');
  readln(e.legajo);
  if(e.legajo <> 0)then begin
    writeln('Ingrese categoria: (1..20)');
    readln(e.cat);
    e.anio:=2000+random(21); // año de 2000 a 2020.
    e.dni:=random(999)+1; 
  end;
end;


//YA SE DISPONE (PRUEBA) - CARGA DE ARBOL
procedure cargar_arbol(var a:arbol);
var
emp:empleado;
begin
   leer_info(emp);
   while(emp.legajo<>0)do begin
     crear_arbol(a,emp);
     leer_info(emp);
   end;  
end;  


procedure cargar_vector(var v:vector; var diml:integer; e:empleado);
var
emp:empleado2;
begin
  if(diml < dimF)then begin
    emp.legajo:= e.legajo;
    emp.dni:= e.dni;
    diml:=diml+1;
    v[diml]:=emp;
  end;  
end;


procedure modulo_A(a:arbol; var v:vector; var diml:integer; inf:integer; sup:integer ; cat:integer);
begin
  if(a<>nil)then begin
    if(a^.elem.legajo > inf)then 
       modulo_A(a^.HI,v,diml,inf,sup,cat);
    if(a^.elem.legajo >=inf) and (a^.elem.legajo <=sup) and (a^.elem.cat = cat)then 
      cargar_vector(v,diml,a^.elem);
    if(a^.elem.legajo < sup)then
      modulo_A(a^.HD,v,diml,inf,sup,cat);     
  end;
end;


//YA SE DISPONE (PRUEBA) - LEECTURA DE CARGA VECTOR DE MANERA RECURSIVA
procedure leer_vector(v:vector; diml:integer; pos:integer);
begin
  if(pos<=diml)then begin
    writeln('Legajo: ', v[pos].legajo);
    writeln('Dni: ', v[pos].dni);
    writeln;
    leer_vector(v,diml,pos+1);
  end;  
end;


function sumaDNI(v:vector; diml:integer; pos:integer):real;
begin
  if(pos<=diml)then 
    sumaDNI:= v[pos].dni + sumaDNI(v,diml,pos+1)
  else
    sumaDNI:=0   
end;


function modulo_B(v:vector; diml:integer):real;
begin
  if(diml=0)then
    modulo_b:=0    
  else 
    modulo_B:= sumaDNI(v,diml,1) /diml
end;

//-------------------

var
a:arbol; // YA SE DISPONE (PRUEBA) 
v:vector;
diml:integer;
begin
randomize;
a:=nil;  // YA SE DISPONE (PRUEBA) 
diml:=0;
cargar_arbol(a);  // YA SE DISPONE (PRUEBA) 
writeln('<< ARBOL CARGADO ORDENADO POR NUMERO DE LEGAJO: >>'); // (PRUEBA) 
inOrden(a); // (PRUEBA) 
modulo_A(a,v,diml,5,15,8); // A:5 B:15 categoria:8
writeln('<< VECTOR CARGADO ORDENADO POR NUMERO DE LEGAJO: >>');  //(PRUEBA) 
leer_vector(v,diml,1);   // (PRUEBA) 
writeln('<< PROMEDIO DNI: >>');
writeln(modulo_B(v,diml):0:2);
end.

