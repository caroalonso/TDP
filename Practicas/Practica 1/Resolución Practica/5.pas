{ Escribir un programa que:
a. Implemente un módulo que genere un vector de 20 números enteros.
b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
en el vector}

program imperativo_cinco;
const
 dimF=20;
 
type
  rango=1..dimF;
  vector=array[rango]of integer;

//-------------------------

//CARGAR VECTOR
procedure cargar_vector(var v:vector; var diml:integer);
var
valor:integer;
begin
   valor:=random(9)+1;
   while(diml<dimF)do begin
     diml:=diml+1;
     v[diml]:=valor;
     valor:=random(9)+1;
   end;  
end;

//IMPRIMIR VECTOR 
procedure imprimir_vector(v:vector;diml:integer);
var
i:integer;
begin
  for i := 1 to diml do begin
    write(v[i],' - ');
  end;  
end;

//VALOR MAXIMO DE VECTOR DE MANERA RECURSIVA.
function valor_maximo(v:vector; diml:integer; max:integer; pos:integer):integer;
begin
  if(pos<1)or(pos>diml)then
    valor_maximo:=max
  else begin  
    if (v[pos]> max)then
      max:=v[pos];
    valor_maximo:= valor_maximo(v,diml,max,pos+1);
  end;    
end;

//SUMA DE VALORES DE TODO EL VECTOR DE MANETA RECURSIVA.
function sumaTotal(v:vector; diml:integer; suma:integer; pos:integer):integer;
begin
  if(pos<1)or(pos>diml)then 
    sumaTotal:=suma
  else begin
    suma:=suma+v[pos];
    sumaTotal:= sumaTotal(v,diml,suma,pos+1);
  end;  
end;

//--------------------------------------

var
v:vector;
diml:integer;
max:integer;
pos:integer;
suma:integer;
begin
randomize;
suma:=0;
diml:=0;
max:=-1;
pos:=1;
cargar_vector(v,diml);
writeln('<<VECTOR:>>');
imprimir_vector(v,diml);
writeln;
writeln('valor max: ', valor_maximo(v,diml,max,pos));
writeln('suma total: ', sumaTotal(v,diml,suma,pos));
end.
