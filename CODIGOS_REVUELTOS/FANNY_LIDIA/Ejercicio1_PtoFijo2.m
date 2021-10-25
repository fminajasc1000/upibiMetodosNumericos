clc
clear all;

f=inline('log(2+z)-z.^2');
z=-3:0.00001:3;
y=f(z);
 
plot(z,y)
grid on

hold on
g=inline('sqrt(log(2+z))');

z0=2;

z1=g(z0)
e=abs(z1-z0)

z2=g(z1)
e=z2-z1

z3=g(z2)
e=z3-z2

z4=g(z3)
e=z4-z3

z5=g(z4)
e=z5-z4

z6=g(z5)
e=z6-z5

z7=g(z6)
e=z7-z6
