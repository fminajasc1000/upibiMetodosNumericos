clc; close all; clear all;
syms t  
f=300-((0.25.*32.17*t)./0.1)+((32.17.*(0.25).^2)./(0.1.^2)).*(1-exp(-0.1.*t./0.25)); 
F=diff(f);
ezplot(f,[0,300]);
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
