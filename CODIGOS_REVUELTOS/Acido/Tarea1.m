%SE LIMPIA LA CONSOLA Y LAS VARIABLES
clear all; close all;clc
disp('polinomio de taylor para f(x)=exp(x).*cos(x)')
disp('para [0,2] f(0.5) en x0=0 de grado 3')
syms x %SE DEFINE X COMO SIMBOLICA
f=exp(x).*cos(x); %SE ESCRIBE LA ECUCACION
a=0 %valor fijo alrededor donde se construye el polinomio
p=0;%acumulador para la suma de términos
for i=0:3 %FOR QUE REALIZA EL POLINOMIO DE TAYLOR
    p=p+subs(diff(f,i),a)/factorial(i)*(x-a)^i;
end
disp('el ploinomio de taylor de grado 3 es:')
disp(p)
pretty(p)
g=ezplot(f,[0,2])% grafica de exp(x).*cos(x)
set(g,'color','m') %CONFIGURACION DEL COLOR MAGENTA
hold on;grid on %SE CONFIGURA EL MODO REGILLA Y EL MODO PARA GRAFICAR VARIAS GRAFICAS EN LA MISMA VENTANA
v=ezplot(p,[0,2]) %SE GRAFICA EL POLINOMIO EN LOS LIMITES [0.2]
set(v,'color','r') %A LA SEGUNDA GRAFICA SE LE CONFIGURA EL COLOR ROJO
%SE CONFIGURAN LEYENAS PARA DISTINGUIR E INFORMAR AL USUARIO SOBRE EL
%SIGNIFICADO DE LA GRAFICA
legend('f(x)=exp(x).*cos(x)','p3(x): pol. de taylor grado 3') 
disp('evalúa exp(x).*cos(x) en 0.5')
ve=double(subs(f,0.5))%SE EVALUA EL VALOR EXACTO
va=double(subs(p,0.5))%SE EVALUA EL VALOR EXPERIMENTAL
ER=abs(va-ve)/ve %SE CALCULA EL ERROR RELATIVO