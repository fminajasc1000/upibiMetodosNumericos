clc
clear all;
f=inline('10.^6.*exp(l)+((0.435.*10.^6)./(l)).*(exp(l)-1)-1.54*10.^6');
a=0;
b=1;
tol=0.0001;
x0=2;

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

x4=f(x3)
e=x4-x3

x5=f(x4)
e=x5-x4

x6=f(x5)
e=x6-x5

x7=f(x6)
e=x7-x6
