// POTENCIA DE UN NUMERO DE MANERA RECURSIVA

program CalculoDePotencia;

Function potencia (x,n: integer): real;
begin
if (n = 0) then // caso base 
  potencia:= 1
else
  potencia := x * potencia(x,n-1);
end;

var
 n,x : integer;
begin
  writeln('ingrese un numero N :');
  readln(n);
  writeln('ingrese un numero X :');
  readln(x);
  writeln(potencia(x,n):2:2);
end.

___________________________________________________________________________________________________________________

// MAXIMO DENTRO DE UN NUMERO DE MANERA RECURSIVA

program CalculoDigitoMaximoRec;

type 

digito= -1..9; //un rango

procedure digitoMaximoRec(n:integer; var max:digito);
var
  dig:integer;
begin
  if (n <> 0) then begin           // n:5238
    dig:= n mod 10;               //  dig: 8 - 3 - 2 - 5 
    if (dig > max) then
       max:=dig;
    n:= n div 10;              // n:523 - 52 - 5 - 0
    digitoMaximoRec(n, max);
  end;
end;

var
  num:integer;
  max:digito;
begin
  read (num); //5238
  max :=-1;
  digitoMaximoRec(num,max);
  write ('El digito maximo de ', num, ' es: ', max);
  readln;
end.

____________________________________________________________________________________________________________________

// IMPRIMIR LISTA EN ORDEN DE MANERA RECURSIVA

Procedure ImprimirEnOrden(l:lista);    {en este caso agregar los elementos por atras de la lista}
Begin
    if (l <> nil) then begin
        write(l^.datos,' | ');
        ImprimirEnOrden(l^.sig);   //  ejemplo ingresa= 5 3 2 , imprime= 5,3,2
    end;
end; 

____________________________________________________________________________________________________________________

// IMPRIMIR LISTA EN ORDEN INVERSO RECURSIVA

Procedure ImprimirEnOrdenInverso(l:lista);
Begin
    if (l <> nil) then begin
        ImprimirEnOrdenInverso(l^.sig);  //  ejemplo ingresa= 5 3 2 , imprime= 2,3,5
        write(l^.datos,' | ');
    end;
end; 

___________________________________________________________________________________________________________________

// RECURSION BUSCA ELEMENTO MINIMO (integer) EN UNA LISTA , FUNCION :

function minimo (l:lista; min:integer):integer;  
begin
  if (l<>nil) then begin
    if(l^.elem.campo < min) then
      min:= l^.elem.campo; 

    minimo:= minimo (l^.sig, min);
  end
  else 
    minimo:=min;
end; 

______________________________________________________________________________________________________________________

// RECURSION BUSCA ELEMENTO MAXIMO (integer) EN UNA LISTA , FUNCION :

function maximo(l:lista; max:integer):integer;
begin
  if (l<>nil) then begin
    if (l^.elem.campo > max) then
      max:=l^.elem.campo;

    maximo:= maximo(l^.sig, max);
  end
  else
    maximo:=max;
end;

________________________________________________________________________________________________________________________
  
// BUSQUEDA RECURSIVA DE UN ELEMENTO EN UN CAMPO DE UNA LISTA:

function buscar(l:lista; x:integer):boolean;
begin
  if(l=nil)then
    buscar:=false
  else
    if(l^.elem.campo =x)then
      buscar:=true
    else
      buscar:=buscar(l^.sig,x);      
end;   

____________________________________________________________________________________________________________________________


// BUSQUEDA RECURSIVA DE UN MAXIMO DENTRO DE UN VECTOR.

function Encontrar_Maximo(v:vector;diml:integer;max:integer; pos:integer):integer;
begin
  if (pos<=diml) then begin
    if (v[pos].campo > max) then
      max:=v[pos].campo;

    Encontrar_Maximo:= Encontrar_Maximo(v, diml, max, pos+1);
  end
  else
    Encontrar_Maximo:= max;
end;

//pp
var
  pos,max,aux: integer;
begin
  pos:= 1;
  max:= -9999;  {valor chico inicial}
  aux:= Encontrar_Maximo(v, diml, max, pos);
  writeln('Numero maximo: ', aux);
end;

____________________________________________________________________________________________________________________________


// BUSQUEDA RECURSIVA DE UN MINIMO DENTRO DE UN VECTOR

function Encontrar_Minimo (v:vector;diml:integer;min:integer; pos:integer):integer;
begin
  if (pos <= diml) then begin
    if (v[pos].campo < min) then
      min:=v[pos].campo;

    Encontrar_Minimo:=Encontrar_Minimo(v, diml, min, pos+1);
  end
  else
    Encontrar_Minimo:= min;
end;


//pp
var
  pos,min,aux:integer;
begin
  pos:= 1;
  min:= 9999;{valor grande inicial}
  aux:=Encontrar_Minimo(v,diml,min,pos);
  writeln('Numero minimo: ',aux);
end;


_____________________________________________________________________________________________________________________________

// PROMEDIO RECURSIVO EN DE LOS ELEMENTOS DE UN VECTOR

function suma(v:vector;pos:integer;dimL:integer):integer;
begin
  if(pos>dimL)then
    suma := 0
  else
    suma:=v[pos] + suma(v,pos+1,dimL);
end;


//pp
var
  v:vector;
  dimL:integer;
  promedio:real;
begin
  dimL := 0;
  {cargarVector(v,dimL); }  {suponemos que ya está cargado}
  if(dimL <> 0)then
    promedio:= suma(v,1,dimL) / dimL
  else
    promedio:= 0;
  writeln('Promedio: ',promedio:0:2);
end.


___________________________________________________________________________________________________________________________________

// SUMA RECURSIVA DE ELEMENTOS DE UN VECTOR

function suma(v:vector;pos:integer;diml:integer):integer;
begin
  if(pos>diml)then
    suma:= 0
  else
    suma:=v[pos] + suma(v,pos+1,diml);
end;

____________________________________________________________________________________________________________________________________

//BUSQUEDA DICOTOMICA EN UN VECTOR ORDNEADO DE MANERA RECURSIVA CON PROCEDURE

procedure buscar (v:v_vector; pri,ult:integer; dato:integer; var pos:integer);
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


//pp
var
  v:v_vector;
  diml:integer;
  pri,ult:integer;
  dato:integer;
  pos:integer;
begin
  {supongamos que el vector ya está cargado y ordenado}
  pri:=1;
  ult:=diml;

  writeln('Ingrese dni a buscar: ');
  readln(dato);
  buscar(v, pri, ult, dato, pos);
  if (pos <> -1) then
    writeln('Se encontro en la posicion: ', pos)
  else
    writeln('No se encontro el elemento.');
end.

