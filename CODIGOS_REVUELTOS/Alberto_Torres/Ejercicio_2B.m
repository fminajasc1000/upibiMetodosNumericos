clear all; clc;
%declarando de forma anonima la funcion
f=@(v)(59.68-(4.2481./v.^2)).*(v-0.037847)-50.74;
%graficando la funcion
fplot(f,[1,1.5]);
%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
%la tolarancia.
a=1;
b=1.5;
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
