clc;clear all;close all
format long
f=inline('cos(x)/(x+1)')
a=0;b=6;
k=2; %modificar para los tipos de intervalos
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
%error
abs(Integral_trapecio-Integral_exacta/Integral_exacta)*100
