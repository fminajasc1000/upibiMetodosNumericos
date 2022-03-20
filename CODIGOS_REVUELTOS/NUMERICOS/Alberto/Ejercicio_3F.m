clc; close all; clear all;
syms Ta  
f=(-139.344411+(1.575701.*10.^5./Ta)-(6.642308.*10.^7./Ta.^2)+(1.243800.*10.^10./Ta.^3)-(8.621949.*10.^11./Ta.^4)); 
F=diff(f);
ezplot(f,[185,195]);
grid on
tol=0.0001;
r(1)=185;
e(1)=inf;
%Calculando la derivada
%Se utiliza el double para que se convierta en decimal.
while e>tol
    aux=r;
    r=double(r-subs(f,r)/subs(F,r));
    e=abs(r-aux);
end
fprintf('La intersección positiva de las funciones es %f5.5 con un error de %f5.5',r,e)
