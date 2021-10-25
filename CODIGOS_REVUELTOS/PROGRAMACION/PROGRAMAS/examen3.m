%examen 1
clc;
clear all;
disp('-------------Ejercicio de Examen1--------');
r='si';
cont=0;
x=0;
while strcmp(r,'si') || strcmp(r,'SI') || strcmp(r,'sI') || strcmp(r,'Si')
    x=0;
    n=input('Introduzca el valor de n: ');
    while n<=0 || rem(n,1)~=0
        n=input('\nIntroduzca el valor de n ENTERO Y POSITIVO\n: ');
    end
    while cont<=n
        cont=cont+x;
        x=x+1;
    end
    fprintf('El numero que excede a %g es %g ', n, x);
    fprintf('\n');
    r=input('Desea volver a intentarlo: ','s');
end
fprintf('Adios');
%fin del programa