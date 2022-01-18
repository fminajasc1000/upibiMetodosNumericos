clc
clear all;

f=inline('0.8.*exp(x./2)-sin(x)');
x=-3:0.00001:3;
y=f(x);
 
plot(x,y)
grid on

hold on
g=inline('sin(x)./(0.8.*exp(x./2))');

x0=2;

x1=g(x0)
e=abs(x1-x0)

x2=g(x1)
e=x2-x1

x3=g(x2)
e=x3-x2

x4=g(x3)
e=x4-x3

x5=g(x4)
e=x5-x4

x6=g(x5)
e=x6-x5

x7=g(x6)
e=x7-x6
