clc; clear; close all
f=@(x) ;
x=-1:0.01:7;
plot(x,subs(f,x))
x0=2.5;
syms x
f1=diff(subs(f,x));
f1=subs(f1);
