%Para la funcion f(x) arcsen (x) -1<x<1
%a)Determinar el polinomio de grado 3
%b)Grafique la función f(x) y el polinomio anterior juntos.
%c)Estime arcsin(?0.51) y arcsin(0.8) con seis cifras significativas, y calcule sus correspondientes errores absoluto
%y relativo verdadero.
clear all;
close all;
clc;
%primero definimos nuestra funciona anonima
f=@(x)1/(2*x-1);
%punto alrededor del cual giraremos
%en el caso de Maclaurin no es necesario
a=3/2;
%declaramos una variable simbolica para derivar
syms x
%Vamos a contruir nuestro polinomio
%---------------INSISO A Grado 4--------------%
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
%------------------GRAFICACION---------------%
%graficando la funcion
f1=vectorize('1/(2*x-1)');
fplot(f1,[a-2,a+2],'r');
%graficar ensima de la otra
hold on
%
g=ezplot(P_4,[a-2,a+2]);
set(g,'Color','g');
%--------------APROXIMACIONES----------------%
V_aprox=subs(P_4,1)%valor aprox
format long %para obtener todos los valores significativos
V_a=1/3
V_e=f(2)
%--------------ERROR ABSOLUTO VERDADERO Y RELATIVO----%
E_a=vpa(abs(V_a-V_aprox),6);%Valor verdadero
e_a=vpa(E_a/abs(V_a)*100,2);