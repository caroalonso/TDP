{
9.Implemente un programa que invoque a un módulo que genere un árbol con nombres de personas que se leen desde teclado. 
La lectura finaliza con el nombre ‘ZZZ’ que no debe procesarse. 
También debe un módulo que reciba el árbol generado y un nombre, y retorne 
verdadero si existe o falso en caso contrario.
}

program imperativo_nueve;
type

arbol=^nodo;

nodo=record
  elem:String[4];
  sig:arbol;
  HI:arbol;
  HD:arbol;
end;

//-------------------------------

//CREAR ARBOL CON ELEMENTOS REPETIDOS.
procedure crear_arbol(var a:arbol; nombre:String);
begin
  if(a=nil)then begin
    new(a);
    a^.elem:=nombre;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else begin
    if(nombre < a^.elem)then
      crear_arbol(a^.HI,nombre)
    else //no evita nombres repetidos.
      crear_arbol(a^.HD,nombre);
  end;
end;

//LEEO INFORMACION.
procedure leer_info(var nombre:String);
begin
  writeln('ingrese 3 letras <<corte de carga letras ZZZ>> :');
  readln(nombre);
end;

//CARGAR INFORMACION EN EL ARBOL.
procedure crear_arbol(var a:arbol);
var
nombre:String;
begin
   leer_info(nombre);
   while(nombre <> 'ZZZ')do begin
      crear_arbol(a,nombre);
      leer_info(nombre);
   end;   
end;  

//PRUEBA PARA VER ARBOL FINAL CREADO.
procedure enOrden(a:arbol);
begin
  if(a<>nil)then begin
    enOrden(a^.HI);
    write(a^.elem ,' - ');
    enOrden(a^.HD);
  end;
end;

//(BUSQUEDA ORDENADA) VERIFICACION DE NOMBRE EXISTENTE EN EL ARBOL 
function nombreExistente(a: arbol; nombre: String): boolean;
begin
  if(a=nil)then
    nombreExistente:= false
  else if(a^.elem=nombre)then
    nombreExistente:= true
  else if(nombre<a^.elem)then
    nombreExistente:= nombreExistente(a^.HI, nombre)
  else
    nombreExistente:= nombreExistente(a^.HD, nombre);
end;

var
a:arbol;
begin
a:=nil;
crear_arbol(a);
writeln('<<prueba de muestra arbol cargado>>');
enOrden(a); 
writeln;
writeln('Nombre existente : ', nombreExistente(a,'car'));
end.
