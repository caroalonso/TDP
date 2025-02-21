(*
  Procedimiento de Ordenamiento por Selección (Poco Eficiente)
  Recorre el vector buscando el elemento mínimo y lo intercambia con el actual.
  Complejidad: O(n^2)
*)
procedure ordenar_seleccion(var v: vector; diml: integer);
var
  i, j, pos, info: integer;
begin
  for i := 1 to diml - 1 do
  begin
    pos := i;
    for j := i + 1 to diml do
      if (v[j] < v[pos]) then
        pos := j;
    
    (* Intercambio de valores *)
    info := v[pos];
    v[pos] := v[i];
    v[i] := info;
  end;
end;

(*
  Procedimiento de Ordenamiento por Inserción (Más Eficiente)
  Inserta cada elemento en su posición correcta dentro de la parte ordenada del vector.
  Complejidad: O(n^2) en el peor caso, pero más eficiente para casi ordenados.
*)
procedure ordenar_insercion(var v: vector; diml: integer);
var
  i, j: integer;
  actual: tipo;
begin
  for i := 2 to diml do
  begin
    actual := v[i];  
    j := i - 1;     
    while (j > 0) and (v[j].edad > actual.edad) do
    begin
      v[j + 1] := v[j];
      j := j - 1;
    end;
    v[j + 1] := actual;
  end;              
end;
