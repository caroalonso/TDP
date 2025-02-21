{4. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta.
Implementar un programa que:

a. Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en
venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la
marca y el modelo.

b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la
cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.

c. Contenga un módulo que reciba el árbol generado en a) y retorne una estructura con la
información de los autos agrupados por año de fabricación.

d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el
año de fabricación del auto con dicha patente. Mostrar el resultado.}

program tp1punto17;

type
    anios = 2010..2018;
    cadena10 = string [10];
    
    auto = record
        patente: integer;
        anio: anios;
        marca: cadena10;
        modelo: cadena10;
    end;

    arbol = ^nodo; 
    nodo = record
        dato: auto;
        HI, HD: arbol;
    end;
    
    lista = ^nodo2; 
    nodo2 = record
        dato: auto;
        sig: lista;
    end;

type
    vector = array [anios] of lista; 

// PROCESOS
procedure AgregarALista(var l: lista; a: auto);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := a;
    nuevo^.sig := l;
    l := nuevo;
end;

procedure CargarLista(var l: lista);
var
    a: auto;
    i: integer;
begin
    l := nil;
    for i := 1 to 5 do begin
        writeln ('ingresar patente:');
        readln(a.patente);
        a.anio := 2010 + Random(9); 
        a.marca := 'Marca' + Chr(65 + Random(5)); 
        a.modelo := 'Modelo' + Chr(65 + Random(5)); 
        AgregarALista(l, a);
    end;
end;

Procedure crear(var a: arbol; au: auto);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := au;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (au.patente < a^.dato.patente) then 
        crear(a^.HI, au)
    else 
        crear(a^.HD, au);
end;

procedure cargar_arbol(var abb: arbol; l: lista);
begin
    while (l <> nil) do begin
        crear(abb, l^.dato);
        l := l^.sig;
    end;
end;

procedure cant_marca(abb: arbol; marca: cadena10; var cantidad: integer);
begin
    if (abb <> nil) then begin
        if (abb^.dato.marca = marca) then
            cantidad := cantidad + 1;
        cant_marca(abb^.HI, marca, cantidad);
        cant_marca(abb^.HD, marca, cantidad);
    end;
end;

procedure agrupar_por_anio(abb: arbol; var v: vector);
begin
    if (abb <> nil) then begin
        AgregarALista(v[abb^.dato.anio], abb^.dato);
        agrupar_por_anio(abb^.HI, v);
        agrupar_por_anio(abb^.HD, v);
    end;
end;

function encontrar_anio(abb: arbol; patente: integer): integer;
begin
    if (abb = nil) then
        encontrar_anio := -1
    else if (abb^.dato.patente = patente) then
        encontrar_anio := abb^.dato.anio
    else if (patente < abb^.dato.patente) then
        encontrar_anio := encontrar_anio(abb^.HI, patente)
    else
        encontrar_anio := encontrar_anio(abb^.HD, patente);
end;

// PROGRAMA PRINCIPAL
var
    abb: arbol;
    l: lista;
    cantidad: integer;
    marca: cadena10;
    v: vector;
    patente: integer;
    anio_fabricacion: integer;
begin
    randomize;
    CargarLista(l);
    abb := nil;
    cargar_arbol(abb, l);
    
    marca := 'FORD';
    cantidad := 0;
    cant_marca(abb, marca, cantidad);
    writeln('Cantidad de autos de la marca ', marca, ': ', cantidad);
    
    agrupar_por_anio(abb, v);
  
    patente := 5000; // ingresar patente 5000 por consola para probar
    anio_fabricacion := encontrar_anio(abb, patente);
    if anio_fabricacion <> -1 then
        writeln('El auto con patente ', patente, ' fue fabricado en ', anio_fabricacion)
    else
        writeln('No se encontro un auto con la patente ', patente);
end.
