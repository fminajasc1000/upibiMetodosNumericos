%CDC
clear all;
clc;
syms x
%funcion simbolica
f=x^2*exp(-x);
g=x*log(x);
h=-x^2*exp(-x)+x*log(x);
%derivando la funcion
F=diff(h);
%graficando una simbolica
gg=ezplot(f,[-3,8]);
set(gg,'Color','b');

hold on

bb=ezplot(g,[-3,8]);
set(bb,'Color','r');

hh=ezplot(h,[-3,8]);
set(hh,'Color','g');

legend('f(x)', 'g(x)', 'h(x)');
grid on
%semilla
r=1;
e=inf;
tol=0.01;
format long

while e>tol
    rant=r;
    r=double(r-subs(h,r)/subs(F,r)); %poner double para convertir de simbolica a numero
    e=abs(r-rant);  
end
disp(subs(r));
fprintf('La raiz es %5.5f el error es %5.5f\n', r,e);