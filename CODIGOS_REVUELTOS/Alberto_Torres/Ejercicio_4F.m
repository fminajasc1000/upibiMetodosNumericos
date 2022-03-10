clc; close all; clear all;
syms l  
f=(10.^6.*exp(l)+((0.435.*10.^6)./(l)).*(exp(l)-1)-1.54*10.^6); 
F=diff(f);
ezplot(f,[0,1]);
grid on
tol=0.0001;
r(1)=0.000001;
e(1)=inf;
%Calculando la derivada
%Se utiliza el double para que se convierta en decimal.
while e>tol
    aux=r;
    r=double(r-subs(f,r)/subs(F,r));
    e=abs(r-aux);
end
fprintf('La intersección positiva de las funciones es %f5.5 con un error de %f5.5',r,e)
