%Método de Newton-Raphson
%Hallar una aprox. a la raíz de la EC (300-(m.*g/k)+(m.^2.*g/k.^2).*(1-exp(-(k.*t/(m)))))=0
%con una tolerancia del error de 0.00001
clear all;close all;clc
tol=0.00001;
%declaracion de la funcion
f=vectorize(inline('(300-(0.25.*32.17/0.1)+(0.25.^2.*(32.17)/(0.1).^2).*(1-exp(-(0.1.*t/(0.25)))))'));
t=-1.5:0.001:3;%Intervalo aproximado
y=f(t);%Evaluar la función
plot(t,y);grid on%Construir la gráfica
%pause
r(1)=input('escribe un valor inicial para aproximar la raíz : ')
e(1)=inf;%Asignar valor inicial al error
syms x%Variable simbolica 
n=1;%Se inicia 
while e(n)>tol
    n=n+1;
    r(n)=r(n-1)-f(r(n-1))/subs(diff(f(x)),r(n-1));%Fórmula para aproximar la raíz
    e(n)=abs(r(n)-r(n-1));
end
fprintf('La raíz es %5.8f con un error de   %5.8f\n',r(n),e(n))
    