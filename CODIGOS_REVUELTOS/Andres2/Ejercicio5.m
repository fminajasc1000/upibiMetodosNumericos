%Metodos numericos
%Simpson 1/3
clear all;
clc;
format long
f=inline('x^2/(sqrt(1-x^2))');
a=-1; b=1;
k=10 ;
h=(b-a)/(2*k);
s1=0; %se establecen dos sumadores 
s2=0; 
for i=1:2*k-1
    if rem(i,2)==1
        s1=s1+f(a+i*h); %sumando impares
    else
        s2=s2+f(a+i*h); %sumando pares
    end
end
syms x
ve=double(int(f(x),a,b)) %se calcula el valor exacto de la integral
I=h/3*(f(a)+4*s1+2*s2+f(b)) %simpson 1/3
%cuidado con los limites de la ecuacion
