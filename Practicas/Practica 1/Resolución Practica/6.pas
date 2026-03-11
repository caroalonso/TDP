{Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

program imperativo_seis;
const
 dimF=5;
type 
 vector=array[1..dimF]of integer;
 
//--------------------------

//CARGA DE VECTOR ORDENADA. 
procedure carga_vector (var v:vector);
var
i:integer;
begin
  for i := 1 to dimF do begin
     v[i]:=i;
  end;   
end;

//RETORNAR POSICION DE VALOR EN VECTOR DE MANERA RECURSIVA.
procedure buscar(v:vector; pri,ult:integer; dato:integer; var pos:integer);
var
  medio:integer;
begin
  if(pri>ult) then
    pos := -1
  else begin
    medio := (pri + ult) DIV 2;

    if(v[medio] = dato) then
      pos := medio
    else if (v[medio] < dato)then 
      buscar(v,medio+1,ult,dato,pos)
    else 
      buscar(v,pri,medio-1,dato,pos);
  end;
end;

//----------------------

var
v:vector;
valor:integer;
pos:integer;
begin
randomize;
pos:=-1;
carga_vector(v);
valor:=random(7)+1;
buscar(v,1,dimF,valor,pos);
writeln('posicion de ',valor,': ',pos);
end.
