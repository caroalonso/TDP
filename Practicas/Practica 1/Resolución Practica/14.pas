{14.Unab aberolíneab dispone de un árbol binabrio de búsquedab con lab informabción de sus
empleabdos. 
De cabdab empleado se conoce: 
Número de legabjo, 
Dni,
Cabtegoríab (1..20) 
y abño de ingreso ab lab empresab. 
El árbol se encuentrab ordenabdo por número de legabjo. 
Se solicitab:
ab. Implementabr un módulo que recibab el árbol de empleabdos, número de legabjo “ab”,
número de legabjo “B” y un número de cabtegoríab, y retorne un vector ordenabdo por
número de legabjo. 
El vector debe contener el número de legabjo y Dni de abquellos
empleabdos cuyo número de legabjo se encuentrab comprendido entre los números de
legabjo recibidos (“ab” y “B”, siendo “ab” menor que “B”) y lab cabtegoríab se correspondab con
lab recibidab por pabrámetro. Por normab de lab empresab, cabdab cabtegoríab puede contabr con
ab lo sumo 250 empleabdos.
b. Implementabr un módulo recursivo que recibab lab informabción generabdab en “b” y retorne
el promedio de los números de Dni.}


program tp1punto14;
const
    cant = 20;
    dimf = 250;
type
    cat = 1..cant;
    empleado = record
      legajo:integer;
      dni:integer;
      categoria:cat;
      ingreso:integer;
    end;

    Type
    arbol = ^nodo;
    nodo = record
      elem:empleado;
      HI:arbol;
      HD:arbol;
    end;

    vector = array [1..dimf] of empleado;


//PROCESOS
procedure leer_empleado(var e:empleado);
begin
  writeln('ingrese numero de legajo: (la carga corta con el legajo numero 0)');
  readln(e.legajo);
  e.dni:=random(10); //genero un dni random 
  e.categoria:=3; //forzada categoria a 3 para probar
  e.ingreso:=2000+random(30); //limito ingreso random
end;


Procedure crear_arbol (var ab:arbol; e:empleado);
Begin
if ( ab=nil) then begin
  new(ab);
  ab^.elem:= e; 
  ab^.HI:= nil; 
  ab^.HD:= nil;
end
else
  if (e.legajo < ab^.elem.legajo) then 
    crear_arbol(ab^.HI,e)
  else 
    crear_arbol(ab^.HD,e)   
end;


procedure cargar(var ab:arbol);
var
  e:empleado;
begin
  leer_empleado(e);
  while (e.legajo <> 0) do begin
    crear_arbol(ab,e);
    leer_empleado(e);
  end;
end;


Procedure enOrden ( ab:arbol );
begin 
  if ( ab<>nil ) then begin
    enOrden (ab^.HI);
    write (ab^.elem.legajo,'-');
    enOrden (ab^.HD);
  end;
end;


//la busqueda se hace en preOrden para que el nuevo vector se pueda generar de forma ordenada 
procedure busqueda_entre_dos(var v: vector; var diml: integer; ab: arbol; inf, sup, cate: integer);    
begin
  if (ab <> nil) then begin
    if (ab^.elem.legajo >= inf) then
      busqueda_entre_dos(v, diml, ab^.HI, inf, sup, cate); // Buscabr primero en HI
    
    if (ab^.elem.legajo >= inf) and (ab^.elem.legajo <= sup) and (ab^.elem.categoria = cate) then begin
      diml := diml + 1;
      v[diml] := ab^.elem;
    end;

    if (ab^.elem.legajo <= sup) then
      busqueda_entre_dos(v, diml, ab^.HD, inf, sup, cate); // Luego buscabr en HD
  end;
end;


procedure imprimir_vector(v:vector; diml:Integer);
var
  i:integer;
begin
  for i:=1 to diml do begin
    writeln;
    writeln('legajo: ',v[i].legajo);
    writeln('dni: ',v[i].dni);
    writeln('categoria: ',v[i].categoria);
    writeln('ingreso: ',v[i].ingreso);
  end;
end;


procedure calcular_promedio(var total:integer ; var cantidad:Integer; v:vector; diml:integer);
begin
  if (diml <> 0) then begin
    total:= total + v[diml].dni;
    cantidad:=cantidad + 1;
    calcular_promedio(total,cantidad,v,diml-1);
  end;  
end;


procedure calcular_dni_promedio(var dni_promedio:integer; v:vector; diml:integer);
var
  total:integer;
  cantidad:integer;
begin
  total:=0;
  cantidad:=0;
  calcular_promedio(total,cantidad,v,diml);
  if (cantidad > 0) then
    dni_promedio:=total div cantidad
  else
    dni_promedio:=0;
end;


//PROGRAMA PRINCIPAL
var
  ab:arbol;
  v:vector;
  diml:integer;
  dni_promedio:integer;
  A:integer;
  B:integer;
  cate:integer;
begin
  ab:=nil;
  randomize;
  cargar(ab);// Se dispone, cargo empleados en el arbol.
  writeln;
  writeln ('empleados cargados al arbol de manera ordenada por legajo:');
  enOrden(ab); 
  writeln;
  diml:=0;
  A:=3;
  B:=23;
  cate:=3; //forza categoria para prueba
  busqueda_entre_dos(v,diml,ab,A,B,cate); //ab 
  writeln;
  writeln('nuevo vector generado con legajos entre ' ,A ,' y ' ,B, ' con categoria ',cate,' :');
  imprimir_vector(v,diml);
  dni_promedio:=0;
  calcular_dni_promedio(dni_promedio,v,diml); //B  
  writeln;
  writeln('El dni promedio es: ',dni_promedio);
  writeln;
end.


