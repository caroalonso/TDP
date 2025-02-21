{ 3. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que:

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada
oficina se ingresa código de identificación, DNI del propietario y valor de la expensa. La
lectura finaliza cuando llega el código de identificación -1.

b. Ordene el vector, aplicando alguno de los métodos vistos en la teoría, para obtener el
vector ordenado por código de identificación de la oficina.

c. Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de
identificación de oficina y retorne si dicho código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que
el código buscado no existe.}

program tp1punto16;
const
    dimf = 300;
type
    oficina = record
      codigo:integer;
      dni:integer;
      valor:integer;
    end;

    vector = array [1..dimf] of oficina;

//PROCESOS
procedure leer_oficina(var o:oficina);
begin
  writeln('ingrese codigo  identificacion : (la carga finaliza con codigo -1)');
  readln(o.codigo);
  o.dni:=random(10);
  o.valor:=random(100);
end;


procedure cargar_vector(var v:vector; var diml:integer);
var 
  o:oficina;
begin
  leer_oficina(o);
  while (o.codigo <> -1) and (diml < dimf) do begin
    diml:=diml+1;
    v[diml]:=o;
    leer_oficina(o);
  end;
end;


Procedure insercion ( var v: vector; diml: Integer );
var 
  i, pos: Integer; 
  actual:oficina;
begin
    actual.codigo:=0;
    for i:=2 to diml do begin 
        actual:= v[i];
        pos:= i-1; 
        while (pos > 0) and (v[pos].codigo > actual.codigo) do begin
            v[pos+1]:= v[pos];
            pos:=pos-1;
        end;  
        v[pos+1]:= actual; 
    end;
end;


procedure imprimir_vector(v:vector; diml:integer);
var
  i:integer;
begin
  for i:=1 to diml do begin
    writeln('Codigo: ',v[i].codigo);
    writeln('Dni: ',v[i].dni);
    writeln('Valor: ',v[i].valor);
    writeln('__________________________');
  end;
end;


Procedure  BusquedaBin (var v: Vector; var pos:integer; diml,x: integer);
Var 
  primero, ult, medio: integer;
Begin
    pos :=0 ;
    primero:= 1;
    ult:= diml;
    medio := (primero + ult) div 2 ; 
    While (primero <= ult) and (x <> v [medio].codigo) do begin
        If (x < v[medio].codigo) then 
            ult:= medio -1 
        else
            primero:= medio+1 ;
        medio := (primero + ult) div 2 ;
    end;
    If (primero <= ult) then
        pos := medio
    else
        pos := 0;
End;  


//PROGRAMA PRINCIPAL
var
  v:vector;
  diml:integer;
  num:integer;
  pos:integer;
begin
  randomize;
  diml:=0;
  cargar_vector(v,diml);
  insercion(v,diml);
  writeln();
  imprimir_vector(v,diml);
  num:=random(10);
  writeln;
  writeln('CODIGO A BUSCAR: ', num);
  BusquedaBin(v,pos,diml,num); 
  if (pos <> 0) then
    writeln('El codigo ', num,' esta en la posicion: ', pos)
  else
    writeln('El codigo no existe');
  writeln;
end.