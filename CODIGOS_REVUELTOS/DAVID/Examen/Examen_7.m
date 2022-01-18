clc;clear all;close all
format long
f=inline('1./sqrt(2.*pi).*exp((-x.^2)/2)');
a=0;b=2;
k=10
h=(b-a)/k;
%escribimos nuestro acumulador
suma=0;
for i=1:k-1
	suma=suma+f(a+i*h);
end
%Valor de la integral para cada valor de "k”, dado por:
Integral_trapecio=(h/2)*(f(a)+2*suma+f(b))
