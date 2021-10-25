clc; close all; clear all;
syms x  
f=(x-1/8)^2*exp(x^2)-exp(1/x^2)- sqrt(pi); F=diff(f);
ezplot(f,[-30,30]);
grid on
tol=0.0001;
r(1)=25;
e(1)=inf;
%Calculando la derivada
%Se utiliza el double para que se convierta en decimal.
while e>tol
    aux=r;
    r=double(r-subs(f,r)/subs(F,r));
    e=abs(r-aux);
end
fprintf('La intersección positiva de las funciones es %f5.5 con un error de %f5.5',r,e)
d(1)=-25;
p(1)=inf;
while p>tol
    aux=d;
    d=double(d-subs(f,d)/subs(F,d));
    p=abs(r-aux);
end
fprintf('La intersección positiva de las funciones es %f5.5 con un error de %f5.5',d,p)