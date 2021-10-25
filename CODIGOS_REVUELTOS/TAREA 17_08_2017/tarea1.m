%Para la funcion f(x) arcsen (x) -1<x<1
%a)Determinar el polinomio de grado 3
%b)Grafique la función f(x) y el polinomio anterior juntos.
%c)Estime arcsin(?0.51) y arcsin(0.8) con seis cifras significativas, y calcule sus correspondientes errores absoluto
%y relativo verdadero.
clear all;
close all;
clc;
%primero definimos nuestra funciona anonima
f=@(x)asin(x);
%punto alrededor del cual giraremos
%en el caso de Maclaurin no es necesario
a=0;
%declaramos una variable simbolica para derivar
syms x
%Vamos a contruir nuestro polinomio
%---------------INSISO A Grado 3--------------%
P=0;
k=3;
%escribir nuestro ciclo for
for n=0:k
    %substituir la ecuacion
    P=P+subs(diff(f(x),n),a)/factorial(n)*(x-a)^n;
end
%desarrollamos el polinomio
%valores de presion
P_3=vpa(expand(P),3)
%------------------GRAFICACION---------------%
%graficando la funcion
fplot(f,[a-1,a+1],'r');
%graficar ensima de la otra
hold on
%
g=ezplot(P_3,[a-1,a+1]);
set(g,'Color','g');

legend('f(x)','P_3(x)')
%--------------APROXIMACIONES----------------%
V_aprox=subs(P_3,1);%valor aprox
format long %para obtener todos los valores significativos
V_a=asin(-0.51);
V_b=asin(0.8);
fprintf("Valor real de arcsen(-0.51) es %f",V_a);
fprintf("\nValor real de arcsen(0.8) es %f\n\n",V_b);
%--------------ERROR ABSOLUTO VERDADERO Y RELATIVO----%
E_a=vpa(abs(V_a-V_aprox),6);%Valor verdadero
E_b=vpa(abs(V_b-V_aprox),6);%Valor verdadero
fprintf("Error verdadero de arcsen(-0.51) y P_3 es: %f",E_a);
fprintf("\nError verdadero de arcsen(0.8) y P_3 es: %f\n\n",E_b);
e_a=vpa(E_a/abs(V_a)*100,2);
e_b=vpa(E_b/V_b*100,2);
fprintf("Error relativo de arcsen(-0.51) y P_3 es: es %f",e_a);
fprintf("\nError relativo de arcsen(0.8) y P_3 es: %f\n\n",e_b);