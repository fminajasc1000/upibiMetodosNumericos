%programa para crear una matriz n*m
clc
clear all;
disp('-------------Programa para rellenar una matriz-----------------');
n=input('Ingrese el numero de filas: ');
m=input('Ingrese el numerp de columnas: ');
while ((n<=0 || m<=0) || (rem(n,1)~=0 || rem(m,1)~=0))
    n=input('Ingrese el numero de filas: ');
    m=input('Ingrese el numerp de columnas: ');
end
H(n,m)=zeros;
for r=1:n
    for s=1:m
        H(r,s)=input('Ingrese un elemento: ');
    end
end
disp('----------------La matris es--------------------------');
%disp(H);+
c=0;
for r=1:n
    for s=1:m
        fprintf('%g ',H(r,s));
        c=c+H(r,s);
    end
    fprintf('\n');
end
p=c/(n*m);
fprintf('El promedio es: %g\n',p);
%fin programa