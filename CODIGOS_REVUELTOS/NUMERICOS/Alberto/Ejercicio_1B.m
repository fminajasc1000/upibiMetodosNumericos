clear all;
close all;
clc;
%primero definimos nuestra funciona anonima
f=@(x)(x.^3-12.*x.^2-3.*x-15);
%punto alrededor del cual giraremos
%en el caso de Maclaurin no es necesario
a=2;
%declaramos una variable simbolica para derivar
syms x
%Vamos a contruir nuestro polinomio
%---------------INSISO A Grado 7--------------%
P=0;
k=7;
%escribir nuestro ciclo for
for n=0:k
    %substituir la ecuacion
    P=P+subs(diff(f(x),n),a)/factorial(n)*(x-a)^n;
end
%desarrollamos el polinomio
%valores de presion
P_7=vpa(expand(P),3);
%------------------GRAFICACION--------------%
%Graficando la funcion origina
fplot(f,[a-4,a+4],'r');
%
hold on
g=ezplot(P_7,[a-4,a+4]);
set(g,'Color','m');
legend('f(x)','P_7(x)');
%-----------------APROXIMACIONES------------%
V_aprox(1)=subs(P_7,1);
format long
V_exacto=f(2);
%-----------------ERROR absoluto verdader y relativo
E=vpa(abs(V_exacto-V_aprox),8)
