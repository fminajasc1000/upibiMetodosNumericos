%Para la funcion f(x)=xsen(x), calcular:
%a)Polinomio de taylor de 2 grado
%b)Polinomio de taylor de 3 grado
%Ambas alrededor de 0
%c)Estime el valor de sen(1) con ambos polinomios y calcule el error
% absoluto verdadero d cada estimacion
%Calcule el error  absoluto y relativo aproximado con las aproximacioones
%ontenidos en c
clear all;
close all;
clc;
%inciso a) tipo anonima
f=@(x)tanh((x-2)/5); %definiendo funcion
a=2; %punto alrededor del cual se calcula el polinomio de Taylor
%codigo principal
%declaramos una variable simbolica para derivar
syms x;
%construir el po0lionomio de Taylor
%declarando el acumulador en 0 y se almacenara la suma del polinomio
%---------------------- POLINOMIO DE GRADO 5------------------------------%
P=0;
k=5; %grado del polinomio de Taylor
%escribiendo el ciclo for
for n=0:k
    %substituir(derivada de orden n)/factorial(n)*(x-a)^n+P
    P=subs(diff(f(x),n),a)/factorial(n)*(x-a)^n+P;
end
%expand desarrolla el binomio
%valor de presion aritmetica
P_5=vpa(expand(P),6);%expandir 3 decimales POLINOMIO DE GRADO DOS
%--------------------ZONA DE GRAFICACION----------------------------------%
%graficando la funcion
fplot(f,[a-11,a+4],'r');
%grafucar encima de el otro grafico
hold on
%graficando un simbolico con atributos de color
g=ezplot(P_5,[a-11,a+4]);
set(g,'Color','g');
legend('F(x)', 'P_5(x)');
grid on
%---------------------APROXIMACIONES--------------------------------------%
V_aprox(1)=subs(P_5,1);%valor aprox
format long %formato largo
V_exacto=tanh(-1);%valor exacto
P_5
%---------------------ERROR absoluto verdadero y relativo-----------------%
E=vpa(abs(V_exacto-V_aprox),8)
%---------------------FIN-------------------------------------------------%