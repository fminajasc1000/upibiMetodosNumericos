%Metodos numericos
%Simpson 1/3
clear all;
clc;
chi=1;
f=@(y)1/(chi*sqrt(2*pi))*exp((-0.5*((y-1)/chi)));
%cuidado con las variables y erificar si no hay disconinuidades
a=1.49;
b=10;
%numero de trapecios
k=100000;
%sumatoria
s1=0;
s2=0;
%h
h=(b-a)/(2*k);
for i=1:2*k-1
    if rem(i,2)==0
        s2=s2+f(a+i*h);
    else
        s1=s1+f(a+i*h);
    end
end
format long
I=h/3*(f(a)+4*s1+2*s2+f(b))

syms x
Integral_exacta=vpa(int(f(x),[a,b]),10)
