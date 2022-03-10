clear all; clc;
%declarando de forma anonima la funcion
f0=@(x)3.*x^2-2.*x+1;
%graficando la funcion
fplot(f0,[-2,2]);
%colocar cuadricula
grid on
hold on
%declarando de forma anonima la funcion
f1=@(x)5.*exp(-x);
%graficando la funcion
fplot(f1,[-2,2]);
%colocar cuadricula
grid on

clear all; clc;
%declarando de forma anonima la funcion
f=@(x)3.*x^2-2.*x+1-5.*exp(-x);
a=0.9;
b=1;
%definimos la tolerancia
tol=0.0001;
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
