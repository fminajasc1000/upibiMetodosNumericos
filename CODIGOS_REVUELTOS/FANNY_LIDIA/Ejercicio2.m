clc;
clear all;
%PROBLEMA N0.
%PARA DETERMINAR LA CONSTANTE DE NACIOMIENTOS DE UNA POBLACION DADA, SE
%NECESITA CALCULAR EL VALOR DE LA CONSTANTE LANMDA[0.1 A 0.9] DE LA
%SIGUIENTE FUNCION: 1.564*10^6=10e^y+(0.435*10^6+(e^y-1))/y, donde y
%representa a landa
%DONDE:
a = 0.1;
b = 0.9;
%Despejando
f=@(y) 10.*exp(y)+((0.435*10^6+(exp(y)-1))/y)-1.564*10.^6;
%Graficando
fplot(f,[0.1,0.9])
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

fprintf('Y es %5.5f con un error de %1.5f\n',x9,error)