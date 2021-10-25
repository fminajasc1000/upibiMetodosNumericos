%Elaborado por Bautista Solis Jimena
%Examen IFM1
%Segundo Parcial
close all; clear; clc
num = input('Ingrese un numero (debe ser entero y postivo): ');
resultado = 0;
if rem(num,1)==0 && num>0
    for i=1:num
        if rem(i,2)==0
            fprintf(' - %g', i);
            resultado = resultado - i;
        else
            fprintf(' + %g', i);
            resultado = resultado + i;
        end
    end
    fprintf(' = %g\n', resultado);
else
    fprintf('El numero no es entero y/o positivo');
end