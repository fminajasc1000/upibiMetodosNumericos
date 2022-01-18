%Determine todas las raices de las siguientes ecuaciones con un error
%maximo de 10e-8
% a)x^3-3x^2*2^-x+3x*4^-x=8-x
% b)cos(x+sqrt(2))+x*(x/2+sqrt(2))=1
clear all; clc;
%declarando de forma anonima la funcion
f=@(x)cos(x+sqrt(2))+x*(x/2+sqrt(2))-1;
%graficando la funcion 
fplot(f,[-5,5]);
%colocar cuadricula
grid on
%definimos el intervalo de trabajo
a=-3.4;
b=-3.8;
%definimos la tolerancia
tol=10e-8;
%numero de pasos a realizar
%entero mayor ceil
%definimos el formato largo
format long
r=(a+b)/2;
e=(b-a)/2;
while abs(e)>tol
    if f(r)==0
        e=0;
    else
        if f(0)*f(r)<0
            b=r;
        else
            a=r;
        end
        r=(a+b)/2;
        e=(b-a)/2;
    end
end
fprintf('La raiz es %5.5f con un error de %1.5f\n', r, e); 
