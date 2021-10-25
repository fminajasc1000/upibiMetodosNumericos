clc
clear all
f=inline('0.8*x^3+1.2*x^2-4.5*x-5.1'); 

xi=0.8;
h=0.1;%,0.025;

syms x
%1derivada atras
a1=(f(xi)-f(xi-h))/h
ve=double(subs(diff(f(x)),xi))
error1=abs(((ve-a1)/ve)*100)

%2derivada atras
a2=(f(xi)-2*f(xi-h)+f(xi-2*h))/h^2
ve2=double(subs(diff(f(x),2),xi))
error2=abs(((ve2-a2)/ve2)*100)