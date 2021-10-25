%Calcule la primera y segunda derivada de la función f(x)=X^3*e^senx en el
%punto pi/4 trabaje con un valor de h=0.5, 0.02,0.001.Compare con el valor
%exacto de la derivada
f=@(x)x^3*exp(sin(x));
x0=pi/4;
h=0.5;
%se calcula la primera derivada de la función
format long
d(1)=(f(x0)-f(x0-h))/h
d(2)=(f(x0+h)-f(x0-h))/(2*h)
d(3)=(f(x0+h)-f(x0))/h
syms x
derivada=vpa(subs(diff(f(x)),x0),5)
error=abs(derivada-d)

% h=0.02;
% %se calcula la primera derivada de la función
% format long
% d(1)=(f(x0)-f(x0-h))/h
% d(2)=(f(x0+h)-f(x0-h))/(2*h)
% d(3)=(f(x0+h)-f(x0))/h
% syms x
% derivada=vpa(subs(diff(f(x)),x0),5)
% error=abs(derivada-d)
% 
% h=0.001;
% %se calcula la primera derivada de la función
% format long
% d(1)=(f(x0)-f(x0-h))/h
% d(2)=(f(x0+h)-f(x0-h))/(2*h)
% d(3)=(f(x0+h)-f(x0))/h
% syms x
% derivada=vpa(subs(diff(f(x)),x0),5)
% error=abs(derivada-d)


%PARA LA SEGUNDA DERIVADA
f=@(x)x^3*exp(sin(x));
x0=pi/4;
h=0.5;
%se calcula la primera derivada de la función
format long
dd(1)=(f(x0)-2*f(x0-h)+f(x0-2*h))/h^2
dd(2)=(f(x0+h)-2*f(x0)+f(x0-h))/h^2
dd(1)=(f(x0+2*h)-2*f(x0+h)+f(x0-2*h))/h^2

syms x
dderivada=vpa(subs(diff(f(x)),x0),5)
error=abs(derivada-d)
