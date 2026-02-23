{
1.El administrador de un edificio de oficinas cuenta con la información del pago de
las expensas de dichas oficinas.

Implementar un programa modularizado que:

a.Genere un vector de a lo sumo las 300 oficinas. 
De cada oficina se ingresa:
cód de identificación
DNI del propietario
valor de expensa. 

*La lectura finaliza cuando se ingresa el cód -1, no debe procesarce.

b.Ordene el vector, aplicando el método de INSERCION, por cód. de oficina.

c.Ordene el vector aplicando el método de SELECCION , por cód de oficina.
}

program imperativo_uno;
const
  dimF=300;
type
  rango=1..dimF;
  
  oficina=record
    cod:integer;
    dni:integer;
    valor:real;
  end;
  
  vector=array[rango]of oficina;
  
//------------------------------------

procedure leer_oficina(var ofi:oficina);
begin
  writeln('Ingresar cod oficina (corta con cod -1) : ');
  read(ofi.cod);
  if(ofi.cod <> -1)then begin
    writeln('ingresar dni unico:');
    read(ofi.dni);
    ofi.valor:=random(10)+1;
  end;  
end;

procedure cargar_vector(var v:vector; var diml:integer);
var
ofi:oficina;
begin
   leer_oficina(ofi);
   while(diml<dimF)and(ofi.cod <> -1)do begin
     diml:=diml+1;
     v[diml]:=ofi;
     leer_oficina(ofi);
   end;
end;    
   
procedure imprimir_vector(v:vector; diml:integer);
var
i:integer;
begin
  for i := 1 to diml do begin
    writeln('COD: ', v[i].cod);
	writeln('DNI: ',v[i].dni);
	writeln('VALOR: ',v[i].valor:2:2);
	writeln('-------------');
  end;
end;   

procedure orden_insercion (var v:vector; diml:integer);
var
i,j:integer;
actual:oficina;
begin
  for i:= 2 to diml do begin
    actual:=v[i];
    j:= i-1;
    while(j>0)and(actual.cod < v[j].cod)do begin // menor a mayor cod
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=actual;
  end;  
end;


procedure orden_seleccion(var v:vector; diml:integer);
var
i,j,pos:integer;
info:oficina;
begin
  for i:= 1 to diml-1 do begin
    pos:=i;
    
    for j:= i+1 to diml do begin
      if(v[j].cod < v[pos].cod)then // menor a mayor por cod
        pos:=j
    end;    
    
    //if(i <> pos)then begin       if opcional: si min ya no esta en la pos actual,intercambia.
      info:=v[pos];
      v[pos]:= v[i];
      v[i]:=info;
    //end;
  end; 
end;

    
  
var
v:vector; 
diml:integer; 
begin
  randomize;
  diml:=0;
  cargar_vector(v,diml);
  writeln;
  writeln('VECTOR SIN ORDEN:');
  writeln;
  imprimir_vector(v,diml);
  writeln;
  writeln('VECTOR CON ORDEN DE INSERCION:');
  orden_insercion(v,diml);
  imprimir_vector(v,diml);
  writeln;
  writeln('VECTOR CON ORDEN DE SELECCION ORDEN:');
  orden_seleccion(v,diml);
  imprimir_vector(v,diml);
  writeln;
end.
