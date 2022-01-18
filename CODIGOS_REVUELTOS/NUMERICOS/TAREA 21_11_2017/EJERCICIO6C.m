clc;
%simpson3/8
chi=1;
f=@(y)1/(chi*sqrt(2*pi))*exp((-0.5*((y-1)/chi)));
a=1.49;
b=2.08;
%numero de trapecios
k=100000;
%numero de trapecios
k=100000;
%sumatoria
s1=0;
s2=0;
%h
h=(b-a)/(3*k);
for i=1:3*k-1
    if rem(i,3)==0
        s2=s2+f(a+i*h);
    else
        s1=s1+f(a+i*h);
    end
end
format long
I=(3*h)/8*(f(a)+3*s1+2*s2+f(b))

syms x
Integral_exacta=vpa(int(f(x),[a,b]),10)
