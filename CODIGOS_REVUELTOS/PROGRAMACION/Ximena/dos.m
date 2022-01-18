%Elaborado por Bautista Solis Jimena
%Examen IFM1
%Segundo Parcial
close all; clear; clc

contador = 0;
num = input('Ingrese un numero (debe ser entero y postivo): ');
if rem(num,1)==0 && num>0
    for i=1:num
        aleatorio = randi(100, 1, 1);
        if rem(aleatorio,3)==0
            fprintf('El numero generado %g, es multiplo de tres\n', aleatorio);
            contador = contador + 1;
        end
    end
    fprintf('De los %g generados %g, son multiplon de tres\n', num, contador);
else
    fprintf('El numero no es entero y/o positivo');
end