clc
clear all
f=inline('sqrt(x)'); 

xi=1;
h=0.1;%,0.025;

syms x
disp('1er derivada hacia atras')
a1=(f(xi)-f(xi-h))/h
ea1=(double(subs(diff(f(x),2),xi))*h/factorial(2))*100
ve=double(subs(diff(f(x)),xi))

disp('2nd derivada hacia atras')
a2=(f(xi)-2*f(xi-h)+f(xi-2*h))/h^2
ea2=(double(subs(diff(f(x),3),xi))*h)*100
ve2=double(subs(diff(f(x),2),xi))