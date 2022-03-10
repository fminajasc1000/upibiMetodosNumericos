clear all;
close all;
clc;
%inciso a) tipo anonima
f=@(x)sqrt(2-x^2); %definiendo funcion
a=0.2; %punto alrededor del cual se calcula el polinomio de Taylor
%codigo principal
%declaramos una variable simbolica para derivar
syms x;
%construir el po0lionomio de Taylor
%declarando el acumulador en 0 y se almacenara la suma del polinomio
%---------------------- POLINOMIO DE GRADO 4------------------------------%
P=0;
k=4; %grado del polinomio de Taylor
%escribiendo el ciclo for
for n=0:k
    %substituir(derivada de orden n)/factorial(n)*(x-a)^n+P
    P=subs(diff(f(x),n),a)/factorial(n)*(x-a)^n+P;
end
%expand desarrolla el binomio
%valor de presion aritmetica
P_4=vpa(expand(P),3);%expandir 3 decimales POLINOMIO DE GRADO DOS
%----------------------POLINOMIO DE GRADO 7-------------------------------%
k=7;
P=0;
%escribiendo el ciclo for
for n=0:k
    %substituir(derivada de orden n)/factorial(n)*(x-a)^n+P
    P=subs(diff(f(x),n),a)/factorial(n)*(x-a)^n+P;
end
%expand desarrolla el binomio
%valor de presion aritmetica
P_7=vpa(expand(P),3);%expandir 3 decimales POLINOMIO DE GRADO 3
%--------------------ZONA DE GRAFICACION----------------------------------%
%graficando la funcion
fplot(f,[a-3,a+3],'r');
%grafucar encima de el otro grafico
hold on
%graficando un simbolico con atributos de color
g=ezplot(P_4,[a-3,a+3]);
set(g,'Color','g');
hold on
h=ezplot(P_7,[a-3,a+3]);
set(h,'Color','b');
%respuestas de insiso a con atributos de color
%leyendas en las graficas
legend('F(x)', 'P_4(x)', 'P_7(x)');
%---------------------APROXIMACIONES--------------------------------------%
V_aprox(1)=subs(P_4,0);%valor aprox
V_aprox(2)=subs(P_7,0);%valor aprox
format long %formato largo
V_exacto=f(0);%valor exacto
%---------------------ERROR absoluto verdadero y relativo-----------------%
E=vpa(abs(V_exacto-V_aprox),6);% errores verdadero
e=vpa(E/V_exacto*100,2);% error relativabo 
%---------------------ERROR ABSOLUTO Y RELATIVO APROXIMADO----------------%
Ea=vpa(abs(V_aprox(2)-V_aprox(0)),6); %valor absoluto aproximado
Er=vpa(Ea/V_aprox(2)*100,6); %valor relativo aproximado
%---------------------FIN-------------------------------------------------%