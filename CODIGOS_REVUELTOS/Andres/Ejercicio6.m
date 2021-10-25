clear all
clc
%Simpson multiple
f=@(x)log(x)*log(x+1);
a=1;b=6;
%Para simpson 3/8
k=10e2;%cuantas vecesse va a plicar la formula, AUMENTAR PARA MEJORAR LA PRECICION
%simple
h=(b-a)/3;
I_simple=(3*h)/8*(f(a)+3*f(a+h)+3*f(a+2*h)+f(b))
h=(b-a)/(3*k);
s1=0;s2=0;
for i=1:3*k-1
    if rem(i,3)==0
        s2=s2+f(a+i*h);
    else
        s1=s1+f(a+i*h);
    end
end
format long
I_compuesta=(3*h)/8*(f(a)+3*s1+2*s2+f(b))
%Obteniendo el error
Error_abs=abs(I_simple-I_compuesta)/I_compuesta*100
