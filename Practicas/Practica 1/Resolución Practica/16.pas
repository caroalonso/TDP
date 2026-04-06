{
El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que:

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. // dimF=300
De cada oficina se ingresa:
- código de identificación
- DNI del propietario
- valor de la expensa. 
La lectura finaliza con código de identificación -1.

b. Ordene el vector, aplicando alguno de los métodos vistos en la teoría, para obtener el
vector ordenado por código de identificación de la oficina.

c. Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de
identificación de oficina y retorne si dicho código está en el vector. 
En el caso de encontrarlo, se debe informar el DNI del propietario
en caso contrario informar que el código buscado no existe.
}

program imperativo_dieciseis;
const
  dimf=300;
type

  expensa=record
    cod:integer;
    dni:integer;
    costo:real;
  end;
  
  vector=array[1..dimf] of expensa;   

//--------------

//LERR INFORMACION.
procedure leer_info(var e:expensa);
begin
  writeln('Ingresar Codigo: (corte con -1)');
  readln(e.cod);
  if (e.cod <> -1)then begin
    e.dni:=random(100)+1; // dni de 1 a 100
    e.costo:= random(201) + 200;// 200 a 400
  end;
end;


//CREACION DE VECTOR Y CARGA DE INFORMACION.
procedure crear_vector(var v:vector; var diml:integer);
var
e:expensa;
begin
  leer_info(e);
  while(diml<dimf)and(e.cod<>-1)do begin
    diml:=diml+1;
    v[diml]:=e;
    leer_info(e); 
  end;  
end;


//IMPRIMIR VECTOR (PRUEBA)
procedure imprimir_vector(v:vector; diml:integer);
var
i:integer;
begin
  for i :=1 to diml do begin
   writeln('Codigo :', v[i].cod ,'  Dni :', v[i].dni);
  end;
end;


//ORDENA VECTOR DE MENOR A MAYOR CON ORDEN POR INSERCION
procedure orden_Insercion(var v:vector; diml:integer);
var 
i,j:integer;
actual:expensa;
begin
  for i:= 2 to diml do begin
    actual:=v[i]; 
    j:=i-1;  
    while(j>0)and(actual.cod < v[j].cod)do begin 
     v[j+1]:=v[j];
     j:=j-1;
    end;
    v[j+1]:=actual;
  end;  
end;


//BUSQUEDA DICOTOMICA RECURSIVA CON FUNTION 
function buscarCodigo(v:vector; diml:integer; cod:integer):integer;
var
  pri,ult,medio: integer;
begin
  pri:= 1;
  ult:= diml;

  while(pri<= ult)and(v[(pri+ult)div 2].cod <> cod) do begin 
  
    medio:=(pri + ult) div 2;
    if (cod < v[medio].cod) then
      ult:=medio-1
    else
      pri:=medio+1;
  end;

  if (pri<=ult) then
    BuscarCodigo:=v[(pri+ult) div 2].dni
  else
    BuscarCodigo:=-1
end;

//-----------------------

var
v:vector;
diml:integer;
dni:integer;
begin
randomize;
diml:=0;
crear_vector(v,diml);
writeln;
writeln('<< VECTOR DESORDENADO: >>'); //PRUEBA
imprimir_vector(v,diml); //PRUEBA
orden_insercion(v,diml);
writeln('<< VECTOR ORDENADO: >>'); //PRUEBA
imprimir_vector(v,diml); //PRUEBA
writeln;
dni:=buscarCodigo(v,diml,5);
if(dni = -1)then
  writeln('<< DNI INEXISTENTE >>')
else
  writeln('<< DNI: ',dni,' >>');  
end.
