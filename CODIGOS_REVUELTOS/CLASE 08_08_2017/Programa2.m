clear all
clc
%ln = log
%log10 =log10
%syms x
%operacion punto a punto con el .
%vectorizando
f=vectorize(inline('(x*log(x)+sin(x))/(x+pi)'))
fplot(f,[1,8])
x=1:0.001:8;
y=f(x);
plot(x,y,'g')