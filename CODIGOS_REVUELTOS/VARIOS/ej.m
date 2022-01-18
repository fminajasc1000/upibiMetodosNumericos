%Problema 2 
%Ejercicio 1
clc
clear all 
close all 
syms x
syms b 
syms y
syms a 
syms c
c(x,y)=a*(x)+b*(y) 
q=simplify(c);
%Ejercicio 2
syms a
syms b 
syms x
syms y
d(x,y)=3*(a)*(x)-4*(b)*(y)*a*(x)
w=simplify (d);
%ejercicio 3
syms x
syms y 
syms c
syms a 
e(x,y)=c*(c*y)./d*(x*y)-a*(x)
p=simplify (e);
disp('El resultado del ej 1 es;')
disp(q)
disp('El resultado del ej 2 es;')
disp(w)
disp('El resultado del ej 3 es;')
disp(p)