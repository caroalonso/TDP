{2. Un teatro tiene funciones los 7 días de la semana. 
Para cada día se tiene una lista con las entradas vendidas. 
Se desea procesar la información de una semana. 
Se pide:
a. Generar 7 listas con las entradas vendidas para cada día. 
De cada entrada se lee día (de 1 a 7), 
código de la obra, 
asiento, 
monto. 
La lectura finaliza con el código de obra iguala 0. 
Las listas deben estar ordenadas por código de obra de forma ascendente.
b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. 
Esta lista debe estar ordenada por código de obra de forma ascendente.
c. Realice un módulo recursivo que informe el contenido de la lista generada en .b }

program tp1punto15;
const
    cant_dias = 7;

type
    rango = 1..cant_dias;
    entrada = record
      dia: rango;
      codigo: integer;
      asiento: integer;
      monto: integer;
    end;

    lista = ^nodo;
    nodo = record
      elem: entrada;
      sig: lista;
    end;

    vector = array[rango] of lista;
    
    ventas_obras = record
      codigo: integer;
      cantidad_vendida: integer;
    end;
    
    lista_nueva = ^nodo2;
    nodo2 = record
      elem: ventas_obras;
      sig: lista_nueva;
    end;


//PROCESOS
procedure inicializar_vector(var v: vector);
var
  i: integer;
begin
    for i := 1 to cant_dias do
        v[i] := nil;
end;


procedure leer_entrada(var e: entrada);
begin
  e.dia := 1 + random(7);
  writeln('Ingresar codigo: (la carga finaliza con codigo 0)');
  readln(e.codigo);
  if e.codigo <> 0 the begin
    e.asiento := random(10);
    e.monto := random(10);
  end;
end;


procedure agregar_ORDENADO_lista(var pri: lista; elem: entrada);
var
  ant, nue, act: lista;
begin
    new(nue);
    nue^.elem := elem;
    act := pri;
    ant := nil;
    while (act <> nil) and (act^.elem.codigo < elem.codigo) do
    begin
        ant := act;
        act := act^.sig;
    end;
    if ant = nil then
        pri := nue
    else
        ant^.sig := nue;
    nue^.sig := act;
end;


procedure cargar_vector(var v: vector);
var
  e:entrada;
begin
  leer_entrada(e);
  while (e.codigo <> 0) do begin
    agregar_ORDENADO_lista(v[e.dia], e);
    leer_entrada(e);
  end;
end;


procedure imprimir_lista(l: lista);
begin
  while (l <> nil) do begin
    writeln('Dia: ', l^.elem.dia);
    writeln('Codigo: ', l^.elem.codigo);
    writeln('Asiento: ', l^.elem.asiento);
    writeln('Monto: ', l^.elem.monto);
    writeln('-------------');
    l := l^.sig;
  end;
end;


procedure imprimir_lista_nueva(l: lista_nueva);
begin
  if (l <> nil) then begin
    writeln('Codigo de obra: ', l^.elem.codigo);
    writeln('Cantidad vendidas de entradas: ', l^.elem.cantidad_vendida);
    writeln('--------------------------------');
    imprimir_lista_nueva(l^.sig);
  end;
end;


procedure imprimir_vector(v: vector);
var
  i: integer;
begin
  for i := 1 to cant_dias do begin
    imprimir_lista(v[i]);
  end;
end;


procedure agregar_ATRAS_eficiente(var l, ult: lista_nueva; e: ventas_obras);
var
  nue: lista_nueva;
begin
  new(nue);
  nue^.elem := e;
  nue^.sig := nil;
  if (l = nil) then
    l := nue
  else
    ult^.sig := nue;
  ult := nue;
end;


procedure minimo(var v: vector; var x: ventas_obras);
var
  i, pos: integer;
begin
    x.codigo := 9999;
    pos := -1;
    for i := 1 to cant_dias do
        if (v[i] <> nil) and (v[i]^.elem.codigo < x.codigo) then
        begin
            pos := i;
            x.codigo := v[i]^.elem.codigo;
        end;
    if (pos <> -1) then
    begin
        x.codigo := v[pos]^.elem.codigo;
        v[pos] := v[pos]^.sig;
    end;
end;


procedure merge(var l: lista_nueva; v: vector);
var
  ult: lista_nueva;
  min, actual: ventas_obras;
begin
    l := nil;
    ult := nil;
    minimo(v, min);
    while (min.codigo <> 9999) do
    begin
        actual.cantidad_vendida := 0; 
        actual.codigo := min.codigo;
        while (min.codigo <> 9999) and (min.codigo = actual.codigo) do
        begin
            actual.cantidad_vendida := actual.cantidad_vendida + 1;
            minimo(v, min);
        end;
        agregar_ATRAS_eficiente(l, ult, actual);
    end;
end;


// PROGRAMA PRINCIPAL
var
  v: vector;
  l: lista_nueva;
begin
  randomize;
  inicializar_vector(v);
  cargar_vector(v);
  writeln;
  writeln('Vector de listas cargado ordenado por codigo:');
  writeln;
  imprimir_vector(v);
  writeln;
  writeln('Nueva lista con codigos de obra y cantida de entradas vendidas:');
  writeln;
  merge(l, v);
  imprimir_lista_nueva(l);
end.