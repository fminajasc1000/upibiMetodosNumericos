%Para el calculo de la integral númerica.
%La longitud de unaa curva y=f(x)
clear all
clc
%Trapecio simple
f=@(x)(x^3/(1+x^(1/2)));
a=1;b=2;
k=100000;%cuantas vecesse va a plicar la formula
s=0;
h=(b-a)/k;
for i=1:k-1
    s=s+f(a+i*h);
end
format long
I=h/2*(f(a)+2*s+f(b))
%Para simpson 1/3
h=(b-a)/(2*k);
s1=0;s2=0;
for i=1:2*k-1
    if rem(i,2)==0
        s2=s2+f(a+i*h);
    else
        s1=s1+f(a+i*h);
    end
end
    Is=h/3*(f(a)+4*s1+2*s2+f(b))
%Para simpson 3/8
h=(b-a)/(3*k);
s1=0;s2=0;
for i=1:3*k-1
    if rem(i,3)==0
        s2=s2+f(a+i*h);
    else
        s1=s1+f(a+i*h);
    end
end
% Is=h/3*(f(a)+3*s1+2*s2+f(b))
format long
Is=(3*h)/8*(f(a)+3*s1+2*s2+f(b))
