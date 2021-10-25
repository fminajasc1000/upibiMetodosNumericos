%Un abrevadero de longitud ? tiene una sección transversal en forma de semicírculo con
%radio r (véase la figura). Cuando se llena de agua hasta una distancia h de la parte
%superior, el volumen v de agua es
%1=10*(1/2*pi*0.75^2*arcsin(h/2*0.75)-h*sqrt(0.75^2-h^2)
clear all; clc;
%declarando de forma anonima la funcion
f=@(h)10*(1/2*pi*0.75^2*asin(h/2*0.75)-h*sqrt(0.75^2-h^2))-1;
%graficando la funcion 
fplot(f,[-5,5]);
%colocar cuadricula
grid on
%definimos el intervalo de trabajo
a=0.5;
b=0.8;
%definimos la tolerancia
tol=0.001;
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