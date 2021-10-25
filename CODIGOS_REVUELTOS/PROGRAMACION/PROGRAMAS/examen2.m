%examen 3
clc;
clear all;
disp('-------------Ejercicio de Examen1--------');
r='si';
m=12;
n=5;
sum=0;
mat(m,n)=zeros;
for m1=1:m
    for n1=1:n
        mat(m1,n1)=input('Introduce el elemento de la celda ');
    end
end
disp(mat);
for m1=1:m
    for n1=1:n
        sum=mat(m1,n1);
    end
end
p=sum/m*n;
fprintf('El promedio es %g ', p);
fprintf('\nAdios');
%fin del programa