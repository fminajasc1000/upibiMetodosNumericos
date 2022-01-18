clc;clear all;close all
format long
f=inline('(x^1/3)*exp(x)');
a=0;b=4;
k=2; %cambiar aqui el numero de intervalos
h=(b-a)/(2*k);
%ncesitamos 2 acumuladores
s1=0;
s2=0;
for i=1:2*k-1
	if rem(i,2)==1
    	s1=s1+f(a+i*h);
	else
    	s2=s2+f(a+i*h);
	end
end
syms x
Integral_s13=h/3*(f(a)+4*s1+2*s2+f(b))
valor_exacto=double(int(f(x),a,b))
abs((Integral_s13-valor_exacto)/valor_exacto)*100