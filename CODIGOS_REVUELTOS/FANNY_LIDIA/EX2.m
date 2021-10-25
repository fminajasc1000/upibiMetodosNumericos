clc
clear all;
f=inline('x.^2-exp(-2.*x)');
a=-5;
b=5;
tol=0.005;
x0=0.1;

x=a:tol:b;
y=f(x);
 
plot(x,y)
grid on

x1=f(x0)
e=abs(x1-x0)

x2=f(x1)
e=x2-x1

x3=f(x2)
e=x3-x2