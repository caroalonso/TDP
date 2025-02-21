program ListasEnPascal;

// Definición del tipo de dato para la lista


// Procedimiento para imprimir los códigos dentro de un vector de listas
procedure imprimir_codigos(v:vector);
var
  i: integer;
begin
  for i := 1 to dimf do begin
    writeln('Códigos del rubro ', i, ' : ');
    imprimir_lista(v[i]);
    writeln('-----------------');
  end;
end;


// Procedimiento para agregar un elemento al final de la lista de manera eficiente
procedure agregar_ATRAS_eficiente(var l: lista; var ult: lista; dato: {tipo});
var
  nue: lista;
begin
  new(nue);
  nue^.elem := dato;
  nue^.sig := nil; 
  if (l = nil) then
    l := nue
  else 
    ult^.sig := nue;
  ult := nue;
end;


// Procedimiento para agregar un elemento al inicio de la lista
procedure agregar_ADELANTE(var l: lista; dato: {tipo});
var
  nue: lista;
begin
  new(nue);
  nue^.elem := dato;
  nue^.sig := l;
  l := nue;
end;


// Procedimiento para agregar un elemento en orden en una lista ordenada
procedure agregar_ORDENADO_lista(var pri: lista; dato: {tipodedato});   
var 
  ant, nue, act: lista;
begin
  new(nue);
  nue^.elem := dato;
  act := pri;
  ant := pri;
  while (act <> nil) and (act^.elem.{campo} < nue^.elem.{campo}) do begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = act) then 
    pri := nue
  else 
    ant^.sig := nue;    
  nue^.sig := act;
end;


// Procedimiento para eliminar un elemento de una lista
procedure BorrarElemento(var pri: lista; dato: {tipodato}; var cumple: boolean);
var
  ant, act: lista;
begin
  cumple := false;
  act := pri;
  while (act <> nil) and (act^.dato <> dato) do begin
    ant := act;
    act := act^.sig;
  end;   
  if (act <> nil) then begin
    cumple := true;
    if (act = pri) then  
      pri := act^.sig
    else 
      ant^.sig := act^.sig;
    dispose(act); 
  end;
end;


// Procedimiento para imprimir una lista de manera secuencial
procedure imprimirlista(l: lista);
begin
  while (l <> nil) do begin
    writeln(l^.datos);
    l := l^.sig;
  end;
end;


// Función para buscar un elemento en una lista desordenada
function Buscar_elemento_desordenado(l: lista; x: {tipodedato}): boolean; 
var
  cumple: boolean;
begin
  cumple := false;
  while (l <> nil) and (cumple = false) do begin
    if (x = l^.dato) then
      cumple := true
    else
      l := l^.sig;
  end;
  Buscar_elemento_desordenado := cumple;
end;


// Función para buscar un elemento en una lista ordenada (de menor a mayor)
function Buscar_elemento_Ordenado(l: lista; num: integer): boolean; 
var
  cumple: boolean;
begin
  cumple := false;
  while (l <> nil) and (l^.elem < num) do begin 
    l := l^.sig;
  end;
  if (l <> nil) and (l^.elem = num) then 
    cumple := true;
  Buscar_elemento_Ordenado := cumple;
end;


// Procedimiento para leer información de un nodo de la lista
procedure leer_info(var p: {tipo});
begin
  writeln('Ingrese código de película: ');
  readln(p.cod);
  if (p.cod <> -1) then begin // Corte de carga 
    writeln('Ingrese género de película: ');
    readln(p.cod_genero);
    writeln('Ingrese fecha: ');
    readln(p.pun_promedio);
  end;
end;


// Procedimiento para realizar un corte de control y sumar elementos repetidos en una lista ordenada
procedure CorteDeControl(var l: lista);
var
  cantidad: integer;
  actual: integer;
begin
  while (l <> nil) do begin
    actual := l^.dato;
    cantidad := 0;
    while (l <> nil) and (actual = l^.dato) do begin
      cantidad := cantidad + 1;
      l := l^.sig;
    end;
    WriteLn('La cantidad de ', actual, ' es ', cantidad);
  end;
end;


