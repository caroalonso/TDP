{4. Escribir un programa que:
a. Implemente un módulo que genere una lista a partir de la lectura de números
enteros. La lectura finaliza con el número -1.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
se encuentra en la lista o falso en caso contrario.
}

program punto4;
type
  lista=^nodo;
  nodo=record
    elem:integer;
    sig:lista;
  end;

//PROCESOS
procedure agregar_nodo(var l:lista; num:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.elem:=num;
  nue^.sig:=l;
  l:=nue;
end;


procedure cargar_lista(var l :lista);
var
  num:integer;
begin
   writeln('ingrese un numero:');
   read(num);
   while(num <> -1 )do begin
     agregar_nodo(l,num);
     writeln('ingrese un numero:');
     readln(num);
   end;  
end; 


function maximo (l:lista; max:integer):integer;
begin
  if(l <> nil) then begin
    if(l^.elem > max) then begin
      max := l^.elem;
    end;  
    maximo := maximo(l^.sig,max);
  end
  else begin
    maximo := max;
  end;  
end;


function minimo (l:lista; min:integer):integer;
begin
  if(l <> nil) then begin
    if(l^.elem < min) then begin
      min := l^.elem;
    end;  
    minimo := minimo (l^.sig,min);
  end
  else begin
    minimo:= min;
  end;  
end;


{function maximo (l:lista; var max:integer):integer; // otra forma de implementar que funciona tmb
begin
  if(l = nil) then begin // caso base .
    maximo := max;
  end
  else begin
    if(l^.elem > max) then begin
      max := l^.elem;
    end;  
    maximo := maximo(l^.sig,max);
  end;  
end; }
   

function buscar_elemento (l:lista; x:integer):boolean;
begin
  if(l=nil)then begin
    buscar_elemento:=false;
  end
  else begin
    if(l^.elem=x)then begin
      buscar_elemento:=true;
    end
    else begin
      buscar_elemento:=buscar_elemento(l^.sig,x) ;
    end;
  end;     
end;


//PROGRAMA PRINCIPAL
var
  l:lista;
  min:integer;
  max:integer;
  x:integer;
begin
  randomize; // para que no se repitan dos veces al ejecutar el mismo numero.
  l:=nil;
  min:=9999;
  max:=-9999;
  cargar_lista(l); //A
  writeln('el valor minimo de la lista es : ', minimo(l,min)); //B
  writeln('el valor maximo de la lista es : ', maximo(l,max)); //C
  x:=random(1000); // genera un numero random de 1 a 999
  if(buscar_elemento(l,x))then begin //D
    writeln('se encontro el elemento ',x,' en la lista.');
  end
  else begin
    writeln('no se encontro el numero ',x,' en la lista.');
  end; 
end.
