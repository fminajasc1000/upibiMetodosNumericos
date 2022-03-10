clc, clear, close all
%Punto fijo
%Ejemplo 1
f=inline('(4.*acos((2-h)/2)-(2-h).*sqrt(4.*h-h.^2)).*5-8');
ezplot(f)
grid on
x0=0.6435;%Valor inicial
syms x
k=subs(diff(f(x),1),x0);
k=vpa(k,5)%Apto
%Iteracion 1
x1=f(x0)
er=abs(x1-x0)
%Iteracion 2
x2=f(x1)
er=abs(x2-x1)
%Iteracion 3
x3=f(x2)
er=abs(x3-x2)
%Iteracion 4
x4=f(x3)
er=abs(x4-x3)
%Iteracion 5
x5=f(x4)
er=abs(x5-x4)
%Iteracion 6
x6=f(x5)
er=abs(x6-x5)
%Iteracion 7
x7=f(x6)
er=abs(x7-x6)
%Iteracion 8
x8=f(x7)
er=abs(x8-x7)
%Iteracion 9
x9=f(x8)
er=abs(x9-x8)
