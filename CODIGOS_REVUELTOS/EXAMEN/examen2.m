%CDC
clear all;
clc;
syms T
%funcion simbolica
f=@(T)+100000-(8.31441)*T*(log(T/4.44418)^5/2);
%graficando la funcion 
fplot(f,[50,100]);
%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
%la tolarancia.
%definimos el intervalo de trabajo
a=90;
b=100;
%definimos la tolerancia
tol=0.000001;
%numero de pasos a realizar
%entero mayor ceil
%definimos el formato largo
format long
r=(a+b)/2;
e=(b-a)/2;
while e>tol
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