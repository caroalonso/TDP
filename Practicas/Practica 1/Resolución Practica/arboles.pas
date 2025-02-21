
// ESTRUCTURA DEL NODO DEL ÁRBOL
Type
    arbol = ^nodo;
    nodo = record
        dato: venta; // Tipo de dato almacenado en el nodo (puede ser modificado según necesidad)
        HI, HD: arbol; // Hijos izquierdo y derecho
    end;

// PROCEDIMIENTO PARA CREAR UN ÁRBOL BINARIO DE BÚSQUEDA SIN ELEMENTOS REPETIDOS
Procedure crear_arbol (var a: arbol; x: venta); 
begin
    if (a = nil) then 
    begin  
        new(a);
        a^.dato := x;      
        a^.HD := nil;
        a^.HI := nil;
    end
    else 
    begin 
        if (x.cod < a^.dato.cod) then  // Se ordena por el campo "cod"
            crear_arbol (a^.HI, x)
        else if (x.cod > a^.dato.cod) then // Condición para evitar duplicados
            crear_arbol (a^.HD, x);
    end;
end;

// PROCEDIMIENTO PARA LEER INFORMACIÓN Y CARGARLA EN UNA VARIABLE TIPO "venta"
procedure leer_info(var x: venta);
begin
    x.dni := random(10);
    if (x.dni <> 0) then 
    begin
        x.cod := random(10);
        x.obra := random(4) + 1; // Valores entre 1 y 5
        x.costo := random(10);
    end;
end;

// PROCEDIMIENTO PARA CREAR UN ÁRBOL BINARIO DE BÚSQUEDA LEYENDO DATOS
procedure crear_abb(var a: arbol);
var
    x: venta;
begin
    leer_info(x);
    while (x.dni <> 0) do
    begin
        crear_arbol(a, x);
        leer_info(x);
    end;
end;

// PROCEDIMIENTO PARA MODIFICAR UN NODO EN CASO DE QUE SE REPITA EL "cod"
procedure Modificarnodo(var a: arbol; x: venta);
begin 
    a^.dato.cant_unidad_vendida_abb := a^.dato.cant_unidad_vendida_abb + x.cant_unidad_vendida;
    a^.dato.monto_total_ventas := a^.dato.monto_total_ventas + x.monto;
end;

// PROCEDIMIENTO PARA CREAR UN ÁRBOL BINARIO DE BÚSQUEDA CON MODIFICACIÓN SI HAY DUPLICADOS
Procedure crear_arbol_modificado(var a: arbol; x: venta);
begin
    if (a = nil) then
    begin  
        new(a);
        a^.dato := x;
        a^.HD := nil;
        a^.HI := nil;
    end
    else 
    begin
        if (x.cod < a^.dato.cod) then
            crear_arbol_modificado(a^.HI, x)
        else if (x.cod > a^.dato.cod) then
            crear_arbol_modificado(a^.HD, x)
        else // Si "cod" es igual, se modifica el nodo existente
            Modificarnodo(a, x);
    end;
end;

// RECORRIDOS DEL ÁRBOL

// RECORRIDO INORDEN (IMPRIME LOS ELEMENTOS DE MENOR A MAYOR)
Procedure enOrden(a: arbol);
begin 
    if (a <> nil) then 
    begin   
        enOrden(a^.HI);
        write(a^.dato.cod, '|');
        enOrden(a^.HD);
    end;
end;

// RECORRIDO EN ORDEN INVERSO (IMPRIME LOS ELEMENTOS DE MAYOR A MENOR)
Procedure enOrdenInverso(a: arbol);
begin 
    if (a <> nil) then 
    begin   
        enOrdenInverso(a^.HD);
        write(a^.dato.cod, '|');
        enOrdenInverso(a^.HI);
    end;
end;

// RECORRIDO PREORDEN (IMPRIME PRIMERO EL NODO, LUEGO SUBÁRBOL IZQUIERDO Y DERECHO)
Procedure PreOrden(a: arbol);
begin 
    if (a <> nil) then 
    begin   
        write(a^.dato.cod, '|');
        PreOrden(a^.HI);  
        PreOrden(a^.HD);     
    end;
end;

// RECORRIDO POSORDEN (IMPRIME PRIMERO LOS HIJOS Y AL FINAL EL NODO PADRE)
Procedure PosOrden(a: arbol);
begin 
    if (a <> nil) then 
    begin
        PosOrden(a^.HI);
        PosOrden(a^.HD);
        write(a^.dato.cod, '|');
    end;
end;

// BUSCAR UN ELEMENTO EN UN ARBOL ACOTADO - Devuelve un puntero al nodo encontrado
// Puede utilizarse cuando se necesita acceder al nodo para modificarlo posteriormente.
function Buscar (a:arbol; {num: integer} ):arbol; // devuelve un puntero
begin
  if (a=nil) then  
    Buscar:=nil
  else
    if ( {num} = a^.dato.{num}) then
      Buscar:=a                           // devuelve un puntero de un nodo
    else
      if (dato < a^.dato.{num}) then
         Buscar:=Buscar(a^.HI ,{num})
      else
        Buscar:=Buscar(a^.HD ,{num});
end;

// BUSCAR UN ELEMENTO EN UN ARBOL ACOTADO - Devuelve un booleano indicando si el elemento está presente.
// Útil cuando solo se necesita saber si un elemento existe sin necesidad de modificar el árbol.
function Buscar (a:arbol; {num: integer}):boolean; // devuelve boolean
begin
  if (a=nil) then  
    Buscar:=false
  else
    if ({num}= a^.dato.{cod_par}) then
      Buscar:=true
    else
      if ({num} < a^.dato.{cod_par}) then
         Buscar:=Buscar(a^.HI ,{num})
      else
        Buscar:=Buscar(a^.HD ,{num});
end;

// BUSCAR UN ELEMENTO Y MODIFICAR UN CAMPO DEL NODO ENCONTRADO
// Permite actualizar un campo de un nodo específico en base a una clave de búsqueda.
procedure Buscar (var a:arbol; {num: integer}; var ok:boolean; nuevo_dato:integer ); 
begin
  if (a=nil) then  
    ok:=false
  else
    if ({num}= a^.dato.{cod_par}) then begin
       ok:=true;
       a^.dato.legajo := nuevo_dato;
    end
    else begin
      if ({num} < a^.dato.{cod_par}) then
          Buscar(a^.HI ,{num},ok,nuevo_dato)
      else
          Buscar(a^.HD ,{num},ok,nuevo_dato);
    end;
end;  

// BUSQUEDA EFICIENTE DEL MAXIMO EN UN ARBOL
// Útil para encontrar el mayor elemento de un árbol ordenado de manera eficiente.
function Busqueda_eficiente_max(a:arbol):integer;
begin
 if (a=nil)then 
   Busqueda_eficiente_max:=-1 // devuelve -1  si el arbol se encuentra vacio.
 else
   if(a^.HD=nil)then
     Busqueda_eficiente_max:=a^.dato
   else
     Busqueda_eficiente_max:=Busqueda_eficiente_max(a^.HD)
end;

// BUSQUEDA EFICIENTE DEL MINIMO EN UN ARBOL
// Similar a la búsqueda del máximo, pero encuentra el menor elemento del árbol.
function Busqueda_eficiente_min(a:arbol):integer;
begin
 if (a=nil)then 
   Busqueda_eficiente_min:=-1 // devuelve -1  si el arbol se encuentra vacio.
 else
   if(a^.HI=nil)then
     Busqueda_eficiente_min:=a^.dato
   else
     Busqueda_eficiente_min:=Busqueda_eficiente_min(a^.HI)
end;

// RECORRER EL ARBOL COMPLETO EN ORDEN ASCENDENTE
// Se puede modificar para realizar alguna acción sobre cada nodo visitado.
Procedure recorrido_total (a:arbol; {var num:integer});
begin 
    if ( a <> nil ) then begin
        recorrido_total(a^.HI,{num});
        if(a^.dato.edad=1)then begin  // Condición para realizar acción  
          num:=a^.dato.edad;          // Acción que realiza 
        end;
        recorrido_total(a^.HD,{num});
    end;
end;

// BUSQUEDA DE ELEMENTOS MAYORES/MENORES QUE UN VALOR DADO
// Útil cuando se necesita filtrar los elementos de un árbol en función de un umbral.
procedure busqueda_menor_a_un_numero (a:arbol; {num:integer});
begin
  if(a <> nil)then begin
    if(a^.dato.{legajo} < {num})then begin
      writeln('nombre:', a^.dato.{nombre});
      busqueda_menor_a_un_numero (a^.HI, {num});
      busqueda_menor_a_un_numero (a^.HD, {num});
    end
    else begin
      busqueda_menor_a_un_numero (a^.HI, {num});
    end;
  end;
end;

// BUSQUEDA EN UN RANGO ENTRE DOS VALORES
// Recorre el árbol de manera eficiente encontrando elementos dentro de un intervalo dado.
procedure busqueda_entre_dos(a:arbol; inf:integer; sup:integer);    
begin
  if (a<>nil) then begin
    if (a^.dato.{cod} >= inf)then begin
      if (a^.dato.{cod} <= sup) then begin
        writeln('Dato:', a^.dato.{nombre});
        busqueda_entre_dos(a^.HI,inf,sup);
        busqueda_entre_dos(a^.HD,inf,sup);
      end
      else begin
        busqueda_entre_dos(a^.HI,inf,sup);
      end;
    end
    else begin
       busqueda_entre_dos(a^.HD,inf,sup);
    end;
  end;
end;

// RECORRIDO COMPLETO DEL ÁRBOL PARA CONTAR ELEMENTOS EN UN RANGO
// Se puede utilizar para obtener estadísticas o métricas sobre los valores almacenados.
procedure Busquedatotal(a:arbol ; inf:integer; sup:integer; var suma); // suma= 0 pp
begin
  if( a <> nil ) then begin
    Busquedatotal (a^.HI,inf,sup,suma);
    if(a^.dato.{monto} >= inf) then begin
      if(a^.dato.{monto} <= sup)then begin
         suma:= suma + 1;  
      end;     
    end;           
    Busquedatotal(a^.HD,inf,sup,suma);
 end;
end;


// Procedimiento que recorre un árbol binario en orden y almacena en un vector
// los elementos cuyo DNI esté en un rango y coincida con un plan específico.
// Luego, ordena el vector resultante.
procedure enOrden(a: arbol; num1, num2, num_plan: integer; var v_5: vector; var diml: integer);
var
  re: afiliado_v;
begin
  if (a <> nil) and (diml < dimf) then begin
    enOrden(a^.HI, num1, num2, num_plan, v_5, diml);
    
    if (a^.elem.dni >= num1) and (a^.elem.dni <= num2) and (a^.elem.plan = num_plan) then begin
      crear_registro_vector(re, a^.elem);
      if (diml < dimf) then begin
        diml := diml + 1;
        v_5[diml] := re;
      end;
    end;
    
    enOrden(a^.HD, num1, num2, num_plan, v_5, diml);
  end;

  if (a = nil) then ordenar_vector(v_5, diml);  // Se ordena solo al final
end;


// Procedimiento que cuenta los nodos de un árbol cuyo código está entre codA y codB.
// Se aprovecha la estructura del árbol para evitar recorrer ramas innecesarias.
procedure entreNumeros(a: arbol; codA, codB: integer; var cantidad_par: integer);
begin
  if (a <> nil) then begin
    if (a^.dato.cod > codA) then  // Explorar izquierda si aún puede haber valores dentro del rango
      entreNumeros(a^.HI, codA, codB, cantidad_par);

    if (a^.dato.cod >= codA) and (a^.dato.cod <= codB) then
      cantidad_par := cantidad_par + 1;

    if (a^.dato.cod < codB) then  // Explorar derecha si aún puede haber valores dentro del rango
      entreNumeros(a^.HD, codA, codB, cantidad_par);
  end;
end;


// Procedimiento que recorre todo un árbol binario y crea una lista con los nodos que cumplen una condición.
// La lista se construye de forma eficiente agregando elementos al final.
procedure recorrer_entero_abb(a: arbol; var l: lista; num: integer; var ult: lista);
begin
  if (a <> nil) then begin
    recorrer_entero_abb(a^.HI, l, num, ult);

    if (a^.dato.cod_cui = num) then
      agregar_ATRAS_eficiente(l, ult, a^.dato);

    recorrer_entero_abb(a^.HD, l, num, ult);
  end;
end;


