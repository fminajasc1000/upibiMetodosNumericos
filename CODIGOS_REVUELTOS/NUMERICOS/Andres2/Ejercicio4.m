clc;clear all;close all
format long
f=inline('sin(x+2)');
a=-pi;b=pi;
k=8
h=(b-a)/k;
%escribimos nuestro acumulador
suma=0;
for i=1:k-1
	suma=suma+f(a+i*h);
end
%Valor de la integral para cada valor de “k”, dado por:
Integral_trapecio=(h/2)*(f(a)+2*suma+f(b))
syms x
Integral_exacta=double(int(f(x),a,b))
abs(Integral_trapecio-Integral_exacta/Integral_exacta)*100
%Cuidado en esta ecuacion hay discontinuidades

