%Elaborado por Bautista Solis Jimena
%Examen IFM1
%Segundo Parcial
close all; clear; clc
num = input('Ingrese el numero de tres cifras (debe ser enterio y postivo): ');
if rem(num,1)==0 && num>0
    residuo = rem(num,10);
    unidades = residuo;
    num = num-residuo;
    
    residuo = rem(num,100);
    decenas = residuo/10;
    num = num-residuo;
    
    residuo = rem(num,1000);
    centenas = residuo/100;
    num = num-residuo;
    
    fprintf('Unidades: %g\n', unidades);
    fprintf('Decenas: %g\n', decenas);
    fprintf('Centenas: %g\n', centenas);
    %end
else
    fprintf('El numero no es entero y/o positivo');
end
