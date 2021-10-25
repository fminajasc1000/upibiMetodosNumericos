clc;
clear all;
a = 2;
b = 3;
%Variables
s0=70; %pies
m=0.8; %lb
k=0.1; %lb*s/ft
g=32.17; %32.17 ft/s^2
%Despejando
f=@(t) (s0-(m.*g/k)+(m.^2.*g/k.^2).*(1-exp(-(k.*t/(m)))));
%Graficando
fplot(f,[2,3])
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

fprintf('La raiz es %5.5f con un error de %1.5f\n',x9,error)

