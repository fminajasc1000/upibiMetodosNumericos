%Método de Newton-Raphson
%Hallar una aprox. a la raíz de la EC (6.*exp(-t./2).*(8.6.*t-pi/2))
%con una tolerancia del error de 0.001
clear all;close all;clc
%variables a inicializar
tol=1e-4;  %s
%declaracion de la funcion
f=vectorize(inline('(6.*exp(-t./2).*(8.6.*t-pi/2))'));
t=1:0.001:5;%Intervalo aproximado
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
    