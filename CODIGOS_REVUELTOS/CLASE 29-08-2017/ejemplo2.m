%CDC
clear all;
clc;
syms x
%funcion simbolica
f=x*log(x)-1;
%derivando la funcion
F=diff(f);
%graficando una simbolica
ezplot(f,[0.1,3])
grid on
%1.7632
%semilla
r=2;
e=inf;
tol=10e-4;
format long

while e>tol
    rant=r;
    r=double(r-subs(f,r)/subs(F,r)); %poner double para convertir de simbolica a numero
    e=abs(r-rant);  
end
%disp(subs(r));
fprintf('La raiz es %5.5f el error es %5.5f\n', r,e);