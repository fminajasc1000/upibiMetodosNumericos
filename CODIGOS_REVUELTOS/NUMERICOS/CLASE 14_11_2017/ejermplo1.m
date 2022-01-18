%Metodos numericos
%La longuitud de una curva Y=f(x), para x entre a y b.
%Esta dada por la formula
%L=int(a,b) de sqrt(1+dy/dx)
%calcule la longuitud del arco parabolico y^2=4x ede 0 a 2 x>0 pero x<0
%a)utilice las reglas del trapecio y simpson 1/3 y 3/8 simples
%b)aplique las formulas multiples para k=2,6,10,50 y 1000}
clear all;
clc;
%trapecio simple
f=@(x)sqrt(1+1/x);
%cuidado con las variables y erificar si no hay disconinuidades
a=0.01;
b=2;
%numero de trapecios
k=100000000;
%sumatoria
s=0;
%h
h=(b-a)/k;
for i=1:k-1
    s=s+f(a+i*h);
end
format long
I=h/2*(f(a)+2*s+f(b))
