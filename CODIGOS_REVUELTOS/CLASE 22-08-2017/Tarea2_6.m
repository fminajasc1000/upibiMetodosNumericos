clear all; clc;
%declarando de forma anonima la funcion
f=@(x)((1-x)*(3+x)^0.5)/(x*(x+1)^0.5*5*1/2)-3.06;
%graficando la funcion 
fplot(f,[0,3]);
%colocar cuadricula
grid on
%definimos el intervalo de trabajo
a=-0.5;
b=0.5;
%definimos la tolerancia
tol=0.001;
%numero de pasos a realizar
%entero mayor ceil
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