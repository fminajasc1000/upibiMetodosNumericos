clear all;
clc;
format long
f=inline('exp(-x^2)','x');
a=0; b=1;
k=12 ; %se elige cualquiera de las dos k
h=(b-a)/(3*k);
	 
s1=0; %se establecen dos sumadores, uno para inicializar la sumatoria de
s2=0; %m�ltiplos de tres y el otro para los no m�ltiplos de tres
for i=1:3*k-1
    if rem(i,3)==0
        s2=s2+f(a+i*h); %sumador para los m�ltiplos de tres
    else
        s1=s1+f(a+i*h); %sumador para los no m�ltiplos de tres
    end
end
	 
syms x
ve=double(int(f(x),a,b)) %devuelve el valor exacto de la integral
I=(3*h)/8*(f(a)+3*s1+2*s2+f(b)) %da el valor de la integral por el m�todo
