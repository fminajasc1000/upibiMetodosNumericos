clear all; clc;
%declarando de forma anonima la funcion
%f=@(x)7^3*sqrt(pi)*x^9-2/3*x^8+1/exp(3)*x^7-pi*x^6-sqrt(11)*x^4+log(6)*x^3-4*exp(x^2)+exp(2)*x+5*sqrt(pi);
f=@(x)7*(pi^(1/3))*x^9-2*(x^8)/3+(x^7)/exp(3)-pi*x^6+sqrt(2)*x^5-sqrt(11)*x^4+log(6)*x^3-4*exp(1)*x^2+exp(2)*x+5*sqrt(pi)
%graficando la funcion 
fplot(f,[-5,5]);
%colocar cuadricula
grid on
%definimos el intervalo de trabajo
a=3;
b=-3;
%definimos la tolerancia
tol=0.00001;
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
disp(f(5))