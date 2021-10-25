%Para la funcion f(x) arcsen (x) -1<x<1
%a)Determinar el polinomio de grado 3
%b)Grafique la función f(x) y el polinomio anterior juntos.
%c)Estime arcsin(?0.51) y arcsin(0.8) con seis cifras significativas, y calcule sus correspondientes errores absoluto
%y relativo verdadero.
clear all;
close all;
clc;
%primero definimos nuestra funciona anonima
f=@(x)tanh(x/2);
%punto alrededor del cual giraremos
%en el caso de Maclaurin no es necesario
a=pi/2;
%declaramos una variable simbolica para derivar
syms x
%Vamos a contruir nuestro polinomio
%---------------INSISO A Grado 2--------------%
P=0;
k=2;
%escribir nuestro ciclo for
for n=0:k
    %substituir la ecuacion
    P=P+subs(diff(f(x),n),a)/factorial(n)*(x-a)^n;
end
%desarrollamos el polinomio
%valores de presion
P_2=vpa(expand(P),3);
%---------------INSISO A Grado 3------------------%
P=0;
k=3;
%escribir nuestro ciclo for
for n=0:k
    %substituir la ecuacion
    P=P+subs(diff(f(x),n),a)/factorial(n)*(x-a)^n;
end
%desarrollamos el polinomio
%valores de presion
P_3=vpa(expand(P),3);
%--------------INSISO B GRADO 4--------------%
P=0;
k=4;
%escribir nuestro ciclo for
for n=0:k
    %substituir la ecuacion
    P=P+subs(diff(f(x),n),a)/factorial(n)*(x-a)^n;
end
%desarrollamos el polinomio
%valores de presion
P_4=vpa(expand(P),3);
%--------------INSISO B GRADO 6--------------%
P=0;
k=6;
%escribir nuestro ciclo for
for n=0:k
    %substituir la ecuacion
    P=P+subs(diff(f(x),n),a)/factorial(n)*(x-a)^n;
end
%desarrollamos el polinomio
%valores de presion
P_6=vpa(expand(P),3);
%------------------GRAFICACION--------------%
%Graficando la funcion origina
fplot(f,[a-4,a+4],'r');
%
hold on
g=ezplot(P_4,[a-4,a+4]);
set(g,'Color','m');
g1=ezplot(P_6,[a-4,a+4]);
set(g1,'Color','b');
legend('f(x)','P_4(x)', 'P_6(x)');
%-----------------APROXIMACIONES------------%
V_aprox(1)=subs(P_4,1);
V_aprox(2)=subs(P_6,1);
format long
V_exacto=tanh(2);
%-----------------ERROR absoluto verdader y relativo
E=vpa(abs(V_exacto-V_aprox),8)