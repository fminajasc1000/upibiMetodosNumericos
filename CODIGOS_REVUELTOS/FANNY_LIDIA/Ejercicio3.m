clc;
clear all;
%PROBLEMA N0.
%UN OBJETO DE 60 KG DE MASA, DESPUES DE 10 SEGUNDOS EN CAIDA LIBRE ADQUIERE
%UNA VELOCIDAD DE 40 M/S^2 ¿CUAL SERA EL COEFICIENTE DE ROZAMIENTO DEL AIRE
%EN ESE MOMENTO CON 0.001 DE ERROR? POR LEYES DE LA FISICA SE SABE QUE PARA
%ESTE TIPO DE MOVIMIENTO LA VELOCIDAD ESTA DADA POR:
%v(t)=mg/c*(1-exp(-c/m*t))
%DONDE:
m = 60;
t = 10;
v = 40;
g = 9.81;

a = 0.1;
b = 0.9;
%Despejando
f=@(c) m*g/c*(1-exp(-c./m*t));
%Graficando
fplot(f,[-10,100])
grid on
%---------------------------------------
tol=0.001;
x0 = (a+b)/2
f(a)
f(b)
f(x0)
e0 = (b-a)/2
b = x0
x1 = (a+b)/2
f(x1)
e2 = (b-a)/2
f(a)
f(b)
a = x1
x2 = (a+b)/2
f(x2)
error = (b-a)/2
f(a)
f(b)
a = x2
x3 = (a+b)/2
error = (b-a)/2

f(a)
f(x3)
f(b)
b = x3
x4 = (a+b)/2
error = (b-a)/2

f(a)
f(x4)
f(b)
b = x4
x5 = (a+b)/2
error = (b-a)/2

f(a)
f(x5)
f(b)
a = x5 
x6 = (a+b)/2
error = (b-a)/2

f(a)
f(x6)
f(b)
b = x6
x7 = (a+b)/2
error = (b-a)/2

f(a)
f(x7)
f(b)
a = x7 
x8 = (a+b)/2
error = (b-a)/2

f(a)
f(x8)
f(b)
b = x8
x9 = (a+b)/2
error = (b-a)/2

fprintf('El coeficiente es %5.5f con un error de %1.5f\n',x9,error)