{5. Una cadena de gimnasios que tiene 5 sucursales necesita procesar las asistencias de los
clientes. Implementar un programa con:

a. Un módulo que lea la información de las asistencias realizadas en las sucursales y
genere una estructura con código de cliente, dni de cliente, fecha y cantidad de
minutos que asistió a la sucursal, agrupados por sucursal. Para cada sucursal, los
clientes deben estar ordenados por código de cliente. 

De cada asistencia se lee: código
de sucursal (1..5), dni del cliente, código del cliente, fecha y cantidad de minutos que
asistió. La lectura finaliza con el código de cliente -1, el cual no se procesa.

b. Un módulo que reciba la estructura generada en a) y utilizando la técnica de merge o
merge acumulador genere un árbol ordenado por dni que contenga el dni de cliente y
la cantidad total de veces que asistió a las sucursales del gimnasio.}

program tp1punto18;
const
  cant = 5;
type
    rango = 1..cant;
    asistencia = record
      sucursal: rango;
      codigo: integer;
      dni: integer;
      fecha: string;
      minutos: integer;
    end;

    lista = ^nodo;
    nodo = record
      dato: asistencia;
      sig: lista;
    end;

    vector = array [rango] of lista;

    tipo = record
      dni: integer;
      asistencias: integer;
    end;

    arbol = ^nodo2;
    nodo2 = record
      dato: tipo;
      HI, HD: arbol;
    end;


//PROCESOS
procedure inicializar_vector(var v: vector);
var
  i: Integer;
begin
  for i := 1 to cant do
    v[i] := nil;
end;
 

procedure imprimir_registro(r: tipo);
begin
  writeln('DNI: ', r.dni);
  writeln('Asistencias: ', r.asistencias);
  writeln;
end;


procedure leer_asistencia(var a: asistencia);
begin
  writeln('Ingresar codigo: (finaliza con codigo -1)');
  readln(a.codigo);
  if a.codigo <> -1 then begin
    a.sucursal := 1 + random(5);
    a.dni := random(100); 
    a.fecha := '01/01';   //un valor fijo de string
    a.minutos := random(100);
  end;
end;


procedure agregar_ORDENADO_lista(var pri: lista; x: asistencia);
var
  ant, nue, act: lista;
begin
    new(nue);
    nue^.dato := x;
    act := pri;
    ant := nil;
    while (act <> NIL) and (act^.dato.codigo < x.codigo) do begin
        ant := act;
        act := act^.sig;
    end;
    if (ant = nil) then
        pri := nue
    else
        ant^.sig := nue;
    nue^.sig := act;
end;


procedure cargar_vector(var v: vector);
var
  a: asistencia;
begin
  leer_asistencia(a);
  while (a.codigo <> -1) do begin
    agregar_ORDENADO_lista(v[a.sucursal], a);
    leer_asistencia(a);
  end;
end;


procedure minimo(var v: vector; var x: tipo);
var
  i, pos: integer;
begin
    x.dni := 9999;
    pos := -1;
    for i := 1 to cant do
        if (v[i] <> NIL) and (v[i]^.dato.dni < x.dni) then begin
            pos := i;
            x.dni := v[i]^.dato.dni;
        end;

    if (pos <> -1) then begin
        v[pos] := v[pos]^.sig;
    end;
end;


procedure insertar_o_actualizar(var a: arbol; num: tipo);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := num;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (num.dni < a^.dato.dni) then
        insertar_o_actualizar(a^.HI, num)
    else if (num.dni > a^.dato.dni) then
        insertar_o_actualizar(a^.HD, num)
    else
        a^.dato.asistencias := a^.dato.asistencias + num.asistencias;
end;


procedure merge(var a: arbol; v: vector);
var
  min, actual: tipo;
begin
    minimo(v, min);
    while (min.dni <> 9999) do begin
        actual.dni := min.dni;
        actual.asistencias := 0;

        while (min.dni <> 9999) and (min.dni = actual.dni) do begin
            actual.asistencias := actual.asistencias + 1;
            minimo(v, min);
        end;

        insertar_o_actualizar(a, actual);
    end;
end;


procedure enOrden(a: arbol);
begin
  if (a <> nil) then begin
    enOrden(a^.HI);
    imprimir_registro(a^.dato);
    enOrden(a^.HD);
  end;
end;


//PROGRAMA PRINCIPAL
var
  v: vector;
  a: arbol;
begin
  randomize;
  inicializar_vector(v);
  cargar_vector(v);
  a := nil;
  merge(a, v);
  writeln();
  writeln('Resultado del arbol en ordenado por dni:');
  writeln;
  enOrden(a);
end.
