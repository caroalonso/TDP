{Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

program punto6;
const
dimf=5; // dimf original 20

type
  rango= 1..dimf;
  vector=array[rango]of integer;

//PROCESOS
procedure cargar_vector_total (var v:vector);
var
  i:integer;
begin
  for i := 1 to dimf do begin //carga hasta el final del vector 
    writeln('ingrese un numero de manera ordenada: ');
    readln (v[i]);
  end;
end;


procedure busquedaDicotomica (v: vector; pri:integer; ult:integer; dato:integer; var pos: integer); // ini =pri fin=ult.
var
  medio:integer;
begin
  if(pri > ult)then begin  // se sale del rango.
    pos:= -1;
  end
  else begin  
    medio:=(pri+ult) div 2;
    if(v[medio]=dato)then begin
      pos:=medio;
    end
    else begin
      if(dato<v[medio])then begin
        ult:= medio -1;
        busquedaDicotomica(v,pri,ult,dato,pos);
      end 
      else begin
        pri:= medio+1;
        busquedaDicotomica(v,pri,ult,dato,pos);
      end;   
    end; 
  end;  
end;


//PROGRAMA PRINCIPAL
var
  v:vector;
  dato:integer;
  pos:integer;
  pri:integer;
  ult:integer;
begin
  cargar_vector_total(v); 
  pos:=-1;
  pri:=1;
  ult:= dimf;
  writeln('ingrese dato a buscar en el vector : ');
  read(dato);
  busquedaDicotomica (v,pri,ult,dato,pos);
  if(pos=-1)then begin
    writeln('No se encontro el elemento ', dato ,' en el vector');
  end
  else begin
    writeln('el elemento ',dato,'  se entontro en la posicion ', pos ,' del vector.');
  end;
end.