clear all;
close all;
clc;
%primero definimos nuestra funciona anonima
f=@(x)0.5.*(cos(10.*x^2+1))/(10.*x^2+1);
%punto alrededor del cual giraremos
a=-0.1;
%declaramos una variable simbólica para derivar
syms x
%Vamos a construir nuestro polinomio
%---------------INSISO A Grado 2--------------%
P=0;
k=2;
%escribir nuestro ciclo for
for n=0:k
    %substituir la ecuación
    P=P+subs(diff(f(x),n),a)/factorial(n)*(x-a)^n;
end
P_3=vpa(expand(P),4)
%------------------GRAFICACIÓN---------------%
%graficando la función
fplot(f,[a-1,a+1],'r');
%graficar encima de la otra
hold on
%
g=ezplot(P_3,[a-1,a+1]);
set(g,'Color','g');
	 
legend('f(x)','P_3(x)')
