program RecursionMetodos;

// Calcula la potencia de un número de manera recursiva
function potencia(x, n: integer): real;
begin
    if (n = 0) then
        potencia := 1
    else
        potencia := x * potencia(x, n - 1);
end;

// Encuentra el dígito máximo dentro de un número de manera recursiva
procedure digitoMaximoRec(n: integer; var max: integer);
var
    dig: integer;
begin
    if (n <> 0) then
    begin
        dig := n mod 10;
        if (dig > max) then
            max := dig;
        digitoMaximoRec(n div 10, max);
    end;
end;

// Imprime una lista en orden de manera recursiva
procedure ImprimirEnOrden(l: lista);
begin
    if (l <> nil) then
    begin
        write(l^.datos, ' | ');
        ImprimirEnOrden(l^.sig);
    end;
end;

// Imprime una lista en orden inverso de manera recursiva
procedure ImprimirEnOrdenInverso(l: lista);
begin
    if (l <> nil) then
    begin
        ImprimirEnOrdenInverso(l^.sig);
        write(l^.datos, ' | ');
    end;
end;

// Encuentra el mínimo en una lista de manera recursiva
function minimo(l: lista; min: integer): integer;
begin
    if (l = nil) then
        minimo := min
    else
    begin
        if (l^.elem.campo < min) then
            min := l^.elem.campo;
        minimo := minimo(l^.sig, min);
    end;
end;

// Encuentra el máximo en una lista de manera recursiva
function maximo(l: lista; max: integer): integer;
begin
    if (l = nil) then
        maximo := max
    else
    begin
        if (l^.elem.campo > max) then
            max := l^.elem.campo;
        maximo := maximo(l^.sig, max);
    end;
end;

// Busca un elemento en una lista de manera recursiva
function buscar(l: lista; x: integer): boolean;
begin
    if (l = nil) then
        buscar := false
    else if (l^.elem.campo = x) then
        buscar := true
    else
        buscar := buscar(l^.sig, x);
end;

// Encuentra el mínimo en un vector de manera recursiva
function Encontrar_Minimo(v: vector; min, pos, dimL: integer): integer;
begin
    if (pos > dimL) then
        Encontrar_Minimo := min
    else
    begin
        if (v[pos] < min) then
            min := v[pos];
        Encontrar_Minimo := Encontrar_Minimo(v, min, pos + 1, dimL);
    end;
end;

// Encuentra el máximo en un vector de manera recursiva
function Encontrar_Maximo(v: vector; max, pos, dimL: integer): integer;
begin
    if (pos > dimL) then
        Encontrar_Maximo := max
    else
    begin
        if (v[pos] > max) then
            max := v[pos];
        Encontrar_Maximo := Encontrar_Maximo(v, max, pos + 1, dimL);
    end;
end;

// Calcula el promedio de los elementos de un vector de manera recursiva
function Encontrar_Promedio(v: vector; total, pos, dimL: integer): real;
begin
    if (pos > dimL) then
        Encontrar_Promedio := total / dimL
    else
        Encontrar_Promedio := Encontrar_Promedio(v, total + v[pos], pos + 1, dimL);
end;

// Suma los elementos de un vector de manera recursiva
function suma(v: vector; pos, sumaTotal, dimL: integer): integer;
begin
    if (pos > dimL) then
        suma := sumaTotal
    else
        suma := suma(v, pos + 1, sumaTotal + v[pos], dimL);
end;

// Búsqueda dicotómica en un vector de manera recursiva
procedure buscarDicotomico(v: vector; ini, fin, dato: integer; var pos: integer);
var
    medio: integer;
begin
    if (ini > fin) then
        pos := -1
    else
    begin
        medio := (ini + fin) div 2;
        if (v[medio] = dato) then
            pos := medio
        else if (v[medio] < dato) then
            buscarDicotomico(v, medio + 1, fin, dato, pos)
        else
            buscarDicotomico(v, ini, medio - 1, dato, pos);
    end;
end;
