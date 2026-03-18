{
10. Implementar un programa que contenga:

a.Un módulo que lea información de alumnos de Taller de Programación 
y almaceneen una estructura de datos sólo a aquellos alumnos con año de ingreso posterior al 2010.
Esta estructura debe estar ordenada por legajo y debe ser eficiente para la búsqueda por dicho criterio. 

De cada alumno se lee :
legajo, // orden
apellido,
nombre, 
DNI y 
año de ingreso. > 2010

b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo sea inferior a 15853.

c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo esté comprendido(inlcuidos) entre 1258 y 7692.
}

program imperativo_diez;
type

str=String[3];

alumno=record
 legajo:integer;
 apellido:str;
 nombre:str;
 dni:integer;
 ingreso:integer;
end;

arbol=^nodo;

nodo=record
  elem:alumno;
  sig:arbol;
  HI:arbol;
  HD:arbol;
end;   
 
//------------

//MODULO QUE GENERA STRING RANDOM.
procedure textoRandom(tamanio: integer; var palabra: string);
var
i:integer;
letras:string;
begin
  letras:= 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  palabra:='';

  for i := 1 to tamanio do
    palabra:= palabra + letras[Random(Length(letras)) + 1];
    
end;


//CREACION DEL ARBOL SIN LEGAJOS REPETIDOS.
procedure crear_arbol(var a:arbol; var elem:alumno);
begin
  if(a=nil)then begin
    new(a);
    a^.elem:=elem;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.elem.legajo > elem.legajo)then
    crear_arbol(a^.HI,elem)
  else if( a^.elem.legajo < elem.legajo)then
    crear_arbol(a^.HD,elem)
end;      
   
   
//LECTURA DE INFORMACION DE ALUMNOS.
procedure leer_alumno(var alu:alumno);
begin
  writeln('ingrese anio de ingreso (2005 a 2015): los menores a 2010 se ignoran en la carga');
  readln(alu.ingreso);   //años ingresados desde 2005 al 2015
  if(alu.ingreso > 2010)then begin
    writeln('ingrese num de legajo unico:');
    readln(alu.legajo);
    textoRandom(3,alu.apellido);
    textoRandom(3,alu.nombre);
    alu.dni:= random(123)+1; // 1 a 123
  end;
end;    


//CARGA DEL ARBOL.
procedure cargar_arbol(var a:arbol);
var
alu:alumno;
i:integer;
begin
  for i := 1 to 5 do begin // enunciado no tiene consigna de corte leo 5 alumnos.
    writeln('Iteracion: ', i);
    leer_alumno(alu);
    if(alu.ingreso > 2010)then
      crear_arbol(a,alu);
  end;      
end;
  
  
//IMPRESION DE TODO LOS LEGAJOS DEL ARBOL DE MANERA ASCENDENTE.  
procedure imprimirInOrden(a:arbol);
begin
  if(a<>nil)then begin
    imprimirInOrden(a^.HI);
    write(' - ',a^.elem.legajo);
    imprimirInOrden(a^.HD);
  end;  
end;


//IMPRESION DE NOMBRE Y APELLIDO DE LEGAJOS MENORES A 15853.
procedure imprimir_Info(a:alumno);
begin
  writeln('nombre:',a.nombre);
  writeln('apellido:',a.apellido);
  writeln('num legajo:',a.legajo); // para prueba
  writeln;
end;  


//LEGAJOS DEL ARBOL CON VALOR MENOR A 15853.
procedure legajo_inferior(a:arbol; inf:integer);
begin
  if(a<>nil)then begin
    if(a^.elem.legajo < inf)then begin
      legajo_inferior(a^.HI,inf);
      imprimir_Info(a^.elem);
      legajo_inferior(a^.HD,inf);
    end
    else 
       legajo_inferior(a^.HI,inf); 
  end;      
end;


//LEGAJOS DEL ARBOL CON VALORES COMPRENDIDOS ENTRE 1258 y 7692.
procedure legajo_entreNumeros(a:arbol; inf:integer; sup:integer);
begin
  if(a<>nil)then begin
    if(a^.elem.legajo > inf)then
       legajo_entreNumeros(a^.HI,inf,sup);

    if(a^.elem.legajo >= inf) and (a^.elem.legajo <= sup) then
       imprimir_Info(a^.elem);

	if (a^.elem.legajo < sup) then
	   legajo_entreNumeros(a^.HD, inf, sup);
  end;
end;

//---------------------------------------------------------

var
a:arbol;
begin
a:=nil;
randomize;
cargar_arbol(a);
writeln;
writeln('<< LEJAGOS CARGADOS DE ALUMNOS: >>');
imprimirInOrden(a);
writeln;
writeln;
writeln('<< LEGAJOS MENORES A 15853: >>');
legajo_inferior(a,15853);
writeln;
writeln('<< LEGAJOS ENTRE 1258 Y 7692: >>');
legajo_entreNumeros(a,1258,7692);
end.
