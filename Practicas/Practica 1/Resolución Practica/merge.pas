program ManejoListas;

type
  { Definición de tipos de datos para los registros y listas }
  registro1 = record
    cod_pro: integer;  { Código de producto }
    cod_ven: integer;  { Código de venta }
    cant: integer;     { Cantidad vendida }
  end;

  lista = ^nodo;
  nodo = record
    elem: registro1;
    sig: lista;
  end;

  lista2 = ^nodo2;
  nodo2 = record
    elem: registro1;
    sig: lista2;
  end;

  vector = array[1..10] of lista;

var
  dimf: integer = 10;  { Dimensión del vector (puedes ajustarla según tus necesidades) }

  
// --------------------------- INICIALIZAR LISTAS EN NIL -------------------------------- //
// Procedimiento que inicializa un vector de listas a nil para asegurarse que todas las listas estén vacías al principio.
procedure inicializar_listas(var v: vector);
var
  i: integer;
begin
  for i := 1 to dimf do
    v[i] := nil;  // Asigna nil a todas las posiciones del vector
end;

// --------------------------- FIN DE INICIALIZAR LISTAS EN NIL ------------------------- //


// --------------------------- IMPRIME LISTAS DE VECTOR -------------------------------- //
// Procedimiento que imprime una lista enlazada mostrando el código de producto, código de venta y cantidad de cada elemento.
procedure imprimir_lista(l: lista);
begin
  if (l <> nil) then begin
    writeln('{COD PRODUCTO}: ', l^.elem.cod_pro, ' | ', 
            '{COD VENTA}: ', l^.elem.cod_ven, ' | ', 
            '{CANTIDAD}: ', l^.elem.cant);
    imprimir_lista(l^.sig);  // Recursión para imprimir el siguiente nodo
  end;
end;

// Procedimiento que imprime todas las listas dentro de un vector de listas.
procedure imprimir_vector_listas(ve: vector);
var
  i: integer;
begin
  for i := 1 to dimf do begin
    if (ve[i] <> nil) then begin
      writeln(''); 
      writeln('{LIBROS} DE LISTA ', i, ':');
      imprimir_lista(ve[i]);  // Llama a imprimir lista
      writeln('');
    end else begin
      writeln('');
      writeln('NO HAY {LIBROS} EN LISTA: ', i);
    end;
  end;
end;

// --------------------------- FIN DE IMPRIME LISTAS DE VECTOR ------------------------- //


// ---------------------------- CARGA DE VECTORES DE LISTA ---------------------------- //
// Procedimiento para insertar un nuevo elemento en una lista de manera ordenada.
procedure insertar_ordenado(var l: lista; x: registro1);
var
  nue: lista;
  ant: lista;
  act: lista;
begin
  new(nue);
  nue^.elem := x;
  nue^.sig := nil;

  if (l = nil) then begin  // Si la lista está vacía, insertar el primer elemento.
    l := nue;
  end else begin
    ant := l;
    act := l;
    while (act <> nil) and (act^.elem.cod_pro < nue^.elem.cod_pro) do begin  // Ordenar por código de producto
      ant := act;
      act := act^.sig;
    end; 

    if (act = l) then begin  // Primer nodo de la lista
      nue^.sig := l;
      l := nue;
    end else begin
      ant^.sig := nue;  // Insertar en el medio o al final
      nue^.sig := act;
    end;
  end;
end;

// Procedimiento para leer los datos de ventas (simulados aquí con valores aleatorios).
procedure leer_info(var x: registro1);
begin
  x.cod_ven := random(5);  // Número aleatorio para código de venta
  if (x.cod_ven <> 0) then begin
    x.cod_pro := random(20);  // Número aleatorio para código de producto
    x.cant := random(15);     // Número aleatorio para cantidad vendida
  end;
end;

// Procedimiento para cargar datos en un vector de listas.
procedure cargar_listas(var vec: vector);
var
  x: registro1;
begin
  leer_info(x);
  while (x.cod_ven <> 0) do begin  // Si el código de venta no es cero
    insertar_ordenado(vec[x.cod_ven], x);
    leer_info(x);
  end;
end;

// ---------------------------- FIN DE CARGA DE VECTORES DE LISTA --------------------- //


// ------------------ MERGE ACUMULADOR GENERA NUEVA LISTA ORDENADA ---------------------- //
// Procedimiento que agrega un nuevo elemento al final de la lista2, asegurándose de que la lista esté ordenada.
procedure agregar_atras(var l: lista2; var ult: lista2; regis: registro1);
var
  nue: lista2;
begin
  new(nue);
  nue^.elem := regis;
  nue^.sig := nil;
  if (l = nil) then begin
    l := nue;
  end else begin
    ult^.sig := nue;
  end;
  ult := nue;  // Actualiza el último nodo
end;

// Procedimiento que busca el mínimo código de producto entre varias listas.
procedure minimo(var ve: vector; var min: integer; var cant_ventas: integer);
var
  i: integer;
  indice_minimo: integer;
begin
  min := 9999;  // Valor alto para encontrar el mínimo
  indice_minimo := -1;
  for i := 1 to dimf do begin
    if (ve[i] <> nil) and (ve[i]^.elem.cod_pro <= min) then begin  // Si la lista no está vacía y el código es menor al mínimo
      min := ve[i]^.elem.cod_pro;
      indice_minimo := i; 
    end;  
  end;

  if (indice_minimo <> -1) and (min <> 9999) then begin
    cant_ventas := ve[indice_minimo]^.elem.cant;  // Guarda la cantidad de ventas
    ve[indice_minimo] := ve[indice_minimo]^.sig;  // Avanza al siguiente nodo
  end;  
end;

// Procedimiento que fusiona varias listas ordenadas en una nueva lista, acumulando las ventas por producto.
procedure merge_acumulador(ve: vector; var l_nueva: lista2);
var
  codigo_actual: integer;
  contador_total: integer;
  cant_ventas: integer;
  min: integer;
  ult: lista2;
  regis: registro1;
begin
  min := 9999;  // Inicializa el valor mínimo
  minimo(ve, min, cant_ventas);
  while (min <> 9999) do begin  // Mientras no se haya procesado todas las listas
    codigo_actual := min;
    contador_total := 0;
    while (min <> 9999) and (codigo_actual = min) do begin  // Acumula las ventas con el mismo código de producto
      contador_total := contador_total + cant_ventas;
      minimo(ve, min, cant_ventas);
    end;
    regis.cod_pro := codigo_actual;
    regis.cant := contador_total;
    agregar_atras(l_nueva, ult, regis);  // Inserta el resultado acumulado en la nueva lista
  end;
end;

// -------------------------- FIN DE MERGE ACUMULADOR NUEVA LISTA ORDENADA ------------- //

