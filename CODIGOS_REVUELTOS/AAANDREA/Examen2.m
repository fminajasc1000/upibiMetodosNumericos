clc
clear all;
N=input('Introduzca el tamaño de la muestra N: ');
while N<=0 || rem(N,1)~=0
    N=input('\nIntroduzca el valor de N ENTERO Y POSITIVO\n: ');
end

llenado(N);

function [vector, promedio] = llenado(n)
    vector=zeros;
    suma = 0;
    for i=1:n
        a = input('Introduzca el valor del vector: ');
        while a<=0 || rem(a,1)~=0
            a=input('\nIntroduzca el valor del vector\n: ');
        end
        vector(i) = a;
        suma = a+suma;
    end
    
    promedio=suma/n
    vector
end