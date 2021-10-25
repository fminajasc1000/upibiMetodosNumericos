%programa que adivina un numero proporcionado por elusuario
clc;
clear all;
disp('--------------------ADIVINA-------------------------------');
disp('Por favor piense un numero del 1 al 100');
pause(10);
a=1;
b=100;
r=randi([a,b],1);
fprintf('El numero que generado es: %g', r);
s=menu('¿Como es?', 'correcto', 'por arriba', 'por abajo');
while s~=1
    if s==2
        a=r+1;
    else
        b=r-1;
    end
    r=randi([a,b],1);
    fprintf('\nEl numero que generado es: %g', r);
    s=menu('¿Como es?', 'correcto', 'por arriba', 'por abajo');
end
fprintf('\n');
disp('--------------FELICIDADES--------------');
fprintf('-El numero que introdujo fue: %g\n', r);
disp('--------------FIN DEL PROGRAMA--------------');
%FIN DEL PROGRAMA
