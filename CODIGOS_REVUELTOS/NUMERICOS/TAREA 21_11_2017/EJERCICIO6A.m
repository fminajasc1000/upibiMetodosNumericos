%EJERCICIO 6_A
clear all;
clc;
%trapecio simple
chi=1;
f=@(y)1/(chi*sqrt(2*pi))*exp((-0.5*((y-1)/chi)));
%cuidado con las variables y erificar si no hay disconinuidades
a=-1.33;
b=2.72;
%numero de trapecios
k=10000;
%sumatoria
s=0;
%h
h=(b-a)/k;
for i=1:k-1
    s=s+f(a+i*h);
end
format long
I=h/2*(f(a)+2*s+f(b))
