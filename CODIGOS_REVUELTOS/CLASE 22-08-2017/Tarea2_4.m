%Una partícula parte del reposo sobre un plano inclinado uniforme, cuyo ángulo ? cambia
%con una rapidez constante de dteta/dt=w<0
%Al final de t segundos, la posicion del objeto esta dada por
%x(t)=-(g/2*w^2)((exp(w*t)-exp(-w*t))/(2)-sin(w*t))
clear all; clc;
%declarando de forma anonima la funcion
f=@(w)-32.17/2*w^2*((exp(3*w)-exp(-3*w))/(2)-sin(3*w))-1.7;
%graficando la funcion 
fplot(f,[-0.5,0.5]);
%colocar cuadricula
grid on
%definimos el intervalo de trabajo
a=-0.1;
b=-0.9;
%definimos la tolerancia
tol=0.005;
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