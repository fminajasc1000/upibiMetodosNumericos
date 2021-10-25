clc; close all; clear all;
syms x  
f=10*exp(-x/2)*cos(3.2*x-pi/2); 
F=diff(f);
ezplot(f,[-100,-50]);
grid on
tol=10e-4;
r(1)=-95;
e(1)=inf;
%Calculando la derivada
%Se utiliza el double para que se convierta en decimal.
while e>tol
    aux=r;
    r=double(r-subs(f,r)/subs(F,r));
    e=abs(r-aux);
end
fprintf('La primer anulificacion dela funcion esta dada en %f5.5 con un error de %f5.5',r,e)
