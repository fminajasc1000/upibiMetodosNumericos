%CDC
clear all;
clc;
syms x
%funcion simbolica
f=x*log(x)-1;
%graficando una simbolica
ezplot(f,[0.1,3])
grid on
%1.7632
%semilla
r(1)=2;
e(1)=inf;
%derivando la funcion
F=diff(f);
format long
r(2)=r(1)-subs(f,r(1))/subs(F,r(1));
e(2)=abs(r(2)-r(1));

r(3)=r(2)-subs(f,r(2))/subs(F,r(2));
e(3)=abs(r(3)-r(2));

r(4)=r(3)-subs(f,r(3))/subs(F,r(3));
e(4)=abs(r(4)-r(3));

fprintf('La raiz es %5.5f, el error es %5.5f\n', r(4), e(4));