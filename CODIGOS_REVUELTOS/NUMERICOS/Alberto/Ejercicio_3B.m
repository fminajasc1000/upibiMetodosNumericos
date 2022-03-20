clear all; clc;
%declarando de forma anonima la funcion
f=@(Ta)(-139.344411+(1.575701.*10.^5./Ta)-(6.642308.*10.^7./Ta.^2)+(1.243800.*10.^10./Ta.^3)-(8.621949.*10.^11./Ta.^4));
%graficando la funcion
fplot(f,[180,195]);
%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
%la tolarancia.
a=180;
b=195;
%definimos la tolerancia
tol=0.05;
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
