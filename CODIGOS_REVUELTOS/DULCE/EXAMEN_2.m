%obtener el valor de lamda (a) para que el sistema tenga solucion unica
clc
clear all;
syms a
A=[1 1 -1 2;
   1 2  1 3;
   1 1 (a.^2-5) a]
%HACEMOS CERO LA PRIMER COLUMNA DE LAS FILAS 2 Y 3
A(2,:)=A(2,:)-A(1,:)*A(2,1)
A(3,:)=A(3,:)-A(1,:)*A(3,1)
%HACEMOS CERO LA SEGUNDA COLUMNA DE LAS FILAS 2
A(2,:)=A(2,:)-A(1,:)*A(2,1)
%PARA EL ULTIMO PASO
%recordamos que (a^2-4)=(a+2)(a-2)
A(3,:)=A(3,:)/A(3,4)
%por lo que dividiendo ((a+2)(a-2)/(a-2))=(a+2)
A(3,3)=solve(A(3,3))
fprintf("El valor donde lamda(a) da un valor unico es: %g",A(3,3))
%Ahora resolvemos para el resto
A(3,:)=A(3,:)/A(3,3);
A(2,:)=A(2,:)-A(3,:)*A(2,3)
A(1,:)=A(1,:)-A(3,:)*A(1,3)
%Finalmente 
A(1,:)=A(1,:)-A(2,:)*A(2,2)
%SOLUCION
x=A(1,4)
y=A(2,4)
z=A(3,4)