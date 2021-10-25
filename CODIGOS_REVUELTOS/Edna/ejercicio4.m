clc
clear all
x=[0,0.002,0.004,0.006,0.008];
y=[0,0.006180,0.0111756,0.016180,0.019021];

f=@(x)polyfit(x,y,5);

xi=0.1;
h=0.001;%,0.1,0.0002;
syms x
disp('1er derivada hacia atras')
a1=(f(xi)-f(xi-h))/h;
%derivada centrada
c1=(f(xi+h)-f(xi-h))/(2*h)
%1er derivada adelante
d1=(f(xi+h)-f(xi))/h
ve=double(subs(diff(f(x)),xi))

disp('2nd derivada hacia atras')
a2=(f(xi)-2*f(xi-h)+f(xi-2*h))/h^2
%derivada centrada
c2=(f(xi+h)-2*f(xi)+f(xi-h))/(h^2)
%1er derivada adelante
d2=(f(xi+2*h)-2*f(xi+h)+f(xi))/h^2
ve2=double(subs(diff(f(x),2),xi))