program BusquedaVector;

const
  dimf = 100; // Tamaño máximo del vector

type
  vector = array[1..dimf] of integer;

{ Carga los valores del vector leyendo desde la entrada estándar }
procedure cargar_vector_total(var v: vector; var diml: integer);
var
  i: integer;
begin
  write('Ingrese la cantidad de elementos (máximo ', dimf, '): ');
  readln(diml);
  for i := 1 to diml do begin
    readln(v[i]);
  end;
end;

{ Búsqueda desordenada: recorre el vector y devuelve la posición del elemento si lo encuentra, 0 si no }
function busqueda_desordenada(v: vector; diml, dato: integer): integer;
var
  i: integer;
begin
  for i := 1 to diml do begin
    if v[i] = dato then begin
      busqueda_desordenada := i;
      exit;
    end;
  end;
  busqueda_desordenada := 0;
end;

{ Búsqueda ordenada secuencial: recorre el vector ordenado y detiene la búsqueda si encuentra un número mayor }
function busqueda_ordenada_secuencial(v: vector; diml, dato: integer): integer;
var
  i: integer;
begin
  for i := 1 to diml do begin
    if v[i] = dato then begin
      busqueda_ordenada_secuencial := i;
      exit;
    end
    else if v[i] > dato then begin
      break;
    end;
  end;
  busqueda_ordenada_secuencial := 0;
end;

{ Búsqueda dicotómica (binaria): busca en un vector ordenado dividiendo el intervalo en mitades }
function busqueda_dicotomica(v: vector; diml, dato: integer): integer;
var
  inf, sup, medio: integer;
begin
  inf := 1;
  sup := diml;
  while inf <= sup do begin
    medio := (inf + sup) div 2;
    if v[medio] = dato then begin
      busqueda_dicotomica := medio;
      exit;
    end
    else if v[medio] < dato then begin
      inf := medio + 1;
    end
    else begin
      sup := medio - 1;
    end;
  end;
  busqueda_dicotomica := 0;
end;

