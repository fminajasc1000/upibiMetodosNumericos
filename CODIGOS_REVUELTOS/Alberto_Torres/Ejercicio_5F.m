clc; close all; clear all;
syms x  
f=(0.8.*exp(x./2)-sin(x)); 
F=diff(f);
ezplot(f,[-4,-2]);
grid on
tol=0.00001;
r(1)=-4;
e(1)=inf;
%Calculando la derivada
%Se utiliza el double para que se convierta en decimal.
while e>tol
    aux=r;
    r=double(r-subs(f,r)/subs(F,r));
    e=abs(r-aux);
end
fprintf('La intersección positiva de las funciones es %f5.5 con un error de %f5.5',r,e)
