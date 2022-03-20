clc; close all; clear all;
syms v  
f=(59.68-(4.2481./v.^2)).*(v-0.037847)-50.74; 
F=diff(f);
ezplot(f,[1,1.5]);
grid on
tol=0.001;
r(1)=1;
e(1)=inf;
%Calculando la derivada
%Se utiliza el double para que se convierta en decimal.
while e>tol
    aux=r;
    r=double(r-subs(f,r)/subs(F,r));
    e=abs(r-aux);
end
fprintf('La intersección positiva de las funciones es %f5.5 con un error de %f5.5',r,e)
