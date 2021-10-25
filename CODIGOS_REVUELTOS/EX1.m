clear all; clc;
p=10;
a=3.599;
t=80;
b1=0.04267;
r=0.8205;
%declarando de forma anonima la funcion
f=@(x)(p+a/x^2)*(x-b1)-r*t;
%graficando la funcion
fplot(f,[-5,10]);
%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
%la tolarancia.
a=5;
b=10;
%definimos la tolerancia
tol=10e-4;
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