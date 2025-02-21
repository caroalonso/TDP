{5. Escribir un programa que:
a. Implemente un módulo que genere un vector de 20 números enteros.
b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
en el vector.}

program punto5;
const
dimf=20; 

type
  rango= 1..dimf;
  vector=array[rango]of integer;

//PROCESOS
procedure cargar_vector_total (var v:vector);
var
  i:integer;
begin
  for i := 1 to dimf do begin //carga hasta el final del vector 
    writeln('ingrese un numero: ');
    readln (v[i]);
  end;
end;


function maximo (v:vector; max:integer;pos:integer):integer;
begin
  if(pos < 1)or(pos > dimf) then begin // caso base cuando pos sea menor a uno o mayor a dimencion fisica. 
    maximo := max;
  end
  else begin
    if(v[pos] > max) then begin
      max := v[pos];
    end;  
    maximo := maximo(v,max,(pos+1));
  end; 
end;


function sumador (v:vector;suma:integer;pos:integer):integer;
begin
  if(pos < 1)or(pos > dimf)then begin
    sumador:= suma;
  end 
  else begin
    suma:=suma+v[pos];
    sumador:= sumador (v,suma,(pos+1));  
  end;  
end;


//PROGRAMA PRINCIPAL
var
  v:vector;
  max:integer;
  pos:integer;
  suma:integer;
begin
  suma:=0;
  pos:=1;
  max:=-9999;
  cargar_vector_total(v);
  writeln('elemento maximo del vector: ', maximo(v,max,pos));
  writeln('suma de los elementos del vector: ',sumador(v,suma,pos));
end.