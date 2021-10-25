% practica 2 mediciones del error en aproximación
% de funciones con la serie de traylor objetivo
% el alummno empleara el polinomio de taylor
% para aproximar el valor de una funcion y 
% teorema
%  si f(x)es una funcion analitica con infinito 
%  numero de derivadas en un punto x0 contenido en un intervalo(a,b)
%  entonces f(x)se representa en la serie 
%para un numero finito de n terminos tenemios el llamado
% polinomio de taylor: f(x)=pn(x)+rn(x)
clear all; close all;clc
disp('polinomio de taylor para f(x)=tanh(x/2)')
disp('para -4<=x<=4 en x0=pi/2 de grado 3')
syms x
f=tanh(x/2);
a=pi/2 %valor fijo alrededor donde se construye el polinomio
p=0;%acumulador para la suma de términos
for i=0:3
    p=p+subs(diff(f,i),a)/factorial(i)*(x-a)^i;
end
disp('el ploinomio de taylor de grado 3 es:')
disp(p)
pretty(p)
g=ezplot(f,[-4,4])% grafica de tnah(x/2)
set(g,'color','m')
hold on;grid on
v=ezplot(p,[-4,4])
set(v,'color','r')
legend('f(x)=tanh(x/2)','p3(x):pol. de taylor grado 3')
disp('evalúa tanh(2)')
ve=double(subs(f,4))%valor exacto
va=double(subs(p,4))
ER=abs(va-ve)/ve