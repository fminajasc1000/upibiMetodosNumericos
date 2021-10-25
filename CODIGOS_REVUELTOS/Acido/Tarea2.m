clear all; close all;clc
disp('polinomio de taylor para f(x)=(1-x).*log(x)')
disp('para el rango propuesto [-1,5] f(0.5) en x0=1 de grado 3')
syms x
f=(1-x).*log(x);
a=1 %valor fijo alrededor donde se construye el polinomio
p=0;%acumulador para la suma de términos
for i=0:3
    p=p+subs(diff(f,i),a)/factorial(i)*(x-a)^i;
end
disp('el ploinomio de taylor de grado 3 es:')
disp(p)
pretty(p)
g=ezplot(f,[-1,5])% grafica de exp(x).*cos(x)
set(g,'color','m')
hold on;grid on
v=ezplot(p,[-1,5])
set(v,'color','r')
legend('f(x)=(1-x).*log(x))','p3(x): pol. de taylor grado 3')
disp('evalúa (1-x).*log(x)) en 0.5')
ve=double(subs(f,0.5))%valor exacto
va=double(subs(p,0.5))
ER=abs(va-ve)/ve