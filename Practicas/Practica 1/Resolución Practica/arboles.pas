// DECLARACION EN TYPE DEL ARBOL:
type
persona=record
  dni:integer;
  nombre:String[10];
  edad:integer;
end;  
  
arbol=^nodo;

nodo=record
  elem:persona;
  HI:arbol;
  HD:arbol;
end;


// CREACION DE ARBOL SIN ELEMENTOS REPETIDOS
procedure crear_arbol(var a:arbol; var elem:persona);
begin
  if(a=nil)then begin
    new(a);
    a^.elem:=elem;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.elem.dni > elem.dni)then
    crear_arbol(a^.HI,elem)
  else if( a^.elem.dni < elem.dni)then
    crear_arbol(a^.HD,elem)
end;      


// CREACION DE ARBOL CON ELEMENTOS REPETIDOS
procedure crear_arbol(var a:arbol; var elem:persona);
begin
  if(a=nil)then begin
    new(a);
    a^.elem:=elem;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.elem.dni > elem.dni)then
    crear_arbol(a^.HI,elem)
  else 
    crear_arbol(a^.HD,elem)
end; 


// LECTURA DE INFORMACION DE CARGA MAS CARGA DEL ARBOL
procedure leer_info (var p:persona);
begin
  writeln('Ingrese num dni: (corte de carga dni 0)');
  readln(p.dni);
  if(p.dni <> 0)then begin
    writeln('Ingrese nombre');
    readln(p.nombre);
    p.edad:=random(100)+1; 
  end;
end;

procedure cargar_arbol(var a:arbol);
var
p:persona;
begin
   leer_info(p);
   while(p.dni<>0)do begin
     crear_arbol(a,p);
     leer_info(p);
   end;  
end;


// LOS 3 RECORRIDOS COMPLETOS DE UN ARBOL:
// PRE-ORDEN (1 FORMA)
// IN-ORDEN (2 FORMAS - CRECIENTE Y DECRECIENTE)
// POS-ORDEN (1 FORMA)
procedure pre_Orden(a: arbol);
begin 
    if(a <> nil)then begin   
        write(a^.elem.dni, '|');
        pre_Orden(a^.HI);  
        pre_Orden(a^.HD);     
    end;
end;


procedure inOrden_Creciente(a:arbol);   //FORMA CRECIENTE
begin 
    if(a <> nil)then begin   
        inOrden_Creciente(a^.HI);  //IZQUIERDA
        write(a^.elem.dni, '|');
        inOrden_Creciente(a^.HD); //DERECHA
    end;
end;


procedure inOrden_Decreciente(a: arbol);  //FORMA DECRECIENTE
begin 
    if(a <> nil) then begin   
        inOrden_Decreciente(a^.HD); //DERECHA
        write(a^.dato.cod, '|');
        inOrden_Decreciente(a^.HI); //IZQUIERDA
    end;
end;


Procedure pos_Orden(a: arbol);
begin 
    if (a <> nil) then 
    begin
        pos_Orden(a^.HI);
        pos_Orden(a^.HD);
        write(a^.elem.dni, '|');
    end;
end;


//RECORRIDO TOTAL DE ARBOL CONTADOR DE UN CAMPO (FUNCTION) 
function contador (a:arbol ; edad:integer): integer;
begin
  if(a=nil)then
    contador:=false
  else if (a^.elem.edad=edad) then
    contador:= 1 + contador(a^.HI,edad) + contador(a^.HD,edad)
  else
    contador:= contador(a^.HI,edad) + contador(a^.HD,edad);
end;


//RECORRIDOS TOTAL (3) DE ARBOL CONTADOR DE UN CAMPO CON (PROCEDURE)
procedure preOrden(a:arbol; edad:integer ;var cant:integer); //(1)
begin
  if(a<>nil)then begin
    if(a^.elem.edad=edad)then
        cant:=cant+1;
    preOrden(a^.HI,edad,cant);
    preOrden(a^.HD,edad,cant);
  end;
end;


procedure inOrden(a:arbol; edad:integer ;var cant:integer); //(2)
begin
    if(a<>nil)then begin
      inOrden(a^.HI,edad,cant);
      if(a^.elem.edad=edad)then
        cant:=cant+1;
      inOrden(a^.HD,edad,cant);
    end;
end;

procedure posOrden(a:arbol; edad:integer ;var cant:integer); //(3)
begin
  if(a<>nil)then begin
    posOrden(a^.HI,edad,cant);
    posOrden(a^.HD,edad,cant);
    if(a^.elem.edad=edad)then
        cant:=cant+1;
  end;
end;


//BUSQUEDA EFICIENTE DE MAX EN ABB (POR CRITERIO DE ORDEN DE ARBOL) 
function max(a:arbol):integer;
begin
  if(a=nil)then
    max:=9999
  else if (a^.HD=nil) then
    max:=a^.elem.dni
  else  
    max:= max (a^.HD=nil);
end;


//BUSQUEDA EFICIENTE DE MIN EN ABB (POR CRITERIO DE ORDEN DE ARBOL) 
function min(a:arbol):integer;
begin
  if(a=nil)then
    min:=-1
  else if (a^.HI=nil) then
    min:=a^.elem.dni
  else  
    min:= min (a^.HI=nil);
end;


//BUSQUEDA EFICIENTE DE ELEMENTO EN ABB (POR CRITERIO DE ORDEN DE ARBOL) RETORNA : BOOLEAN 
function existente(a:arbol; dni:integer):Boolean
begin
  if(a=nil)then
    existente:=false
  else if (a^.elem.dni=dni)then
    existente:=true
  else if (a^.elem.dni < dni)then
    existente:=existente(a^.HD,dni)
  else     
     existente:=existente(a^.HI,dni);
end;


//BUSQUEDA EFICIENTE DE ELEMENTO EN ABB (POR CRITERIO DE ORDEN DE ARBOL) RETORNA : PUNTERO
function existente(a:arbol; dni:integer): arbol
begin
  if(a=nil)then
    existente:=nil
  else if (a^.elem.dni=dni)then
    existente:=a
  else if (a^.elem.dni < dni)then
    existente:=existente(a^.HD,dni)
  else     
     existente:=existente(a^.HI,dni);
end;

//BUSQUEDA EFICIENTE DE TODO LOS DNI MENORES A UN DNI EN CONCRETO (CRITERIO DE ORDEN DEL ARBOL DNI):
procedure dni_inferiores(a:arbol; d:integer)
begin
  if(a<>nil)then begin
    if(a^.elem.dni < d )then begin
      dni_inferiores(a^.HI,d);
      writeln(a^.elem.dni);
      dni_inferiores(a^.HD,d);
    end
    else begin
      dni_inferiores(a^.HI,d);
  end;
end;

//BUSQUEDA EFICIENTE TODO LOS DNI MAYORES A UN DNI EN CONCRETO (CRITERIO DE ORDEN DEL ARBOL DNI):
procedure dni_mayores(a:arbol; d:integer)
begin
  if(a<>nil)then begin
    if(a^.elem.dni > d )then begin  
      dni_mayores(a^.HD,d);
      writeln(a^.elem.dni);
      dni_mayores(a^.HI,d);
    end
    else begin
      dni_mayores(a^.HD,d);
  end;
end;

//BUSQUEDA EFICIENTE DE VALORES ENTRE UN RANGO (RNAGO INFERIOR Y SUPERIOR INCLUIDOS):
procedure entreRango(a:arbol; inf:integer; sup:integer);
begin
  if(a<>nil)then begin
    if(a^.elem.dni > inf)then
       entreRango(a^.HD,inf,sup);
    if(a^.elem.dni >= inf)and(a^.elem.dni <= sup)then
       writeln(a^.elem.dni);
    if(a^.elem.dni < sup)then
       entreRango(a^.HI,inf,sup);
  end;
end;


