{7. Realizar un programa que lea números y que utilice un procedimiento recursivo que
escriba el equivalente en binario de un número decimal. 
El programa termina cuando el usuario ingresa el número 0 (cero).

Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es
menor a 2.
 ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos
el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa
debe mostrar: 10111.
}

program punto7;

//PROCESOS
procedure binario (num:integer);
begin
  if (num <> 0) then begin
    binario(num div 2);
    write(num mod 2);
  end;
end;    


//PROGRAMA PRINCIPAL
var
  num:integer;
begin
  writeln('ingrese un numero para convertir a binario :');
  read(num);
  while (num <> 0)do begin
    binario(num);
    writeln('');
    writeln('ingrese un numero :');
    read(num);
  end;  
end.