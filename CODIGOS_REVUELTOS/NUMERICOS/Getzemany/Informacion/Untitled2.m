clc; clear; close all
f=((0.00001/2)*(cos(0.00001*(pi/2))));
x=-1:0.01:7;
plot(x,subs(f,x))
x0=2.5;
syms x
f1=diff(subs(f,x));
f1=subs(f1);
