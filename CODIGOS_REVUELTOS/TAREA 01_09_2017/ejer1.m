%CONSIDERE LAS FUNCIONES GRAFIQUE Y ENCUENTRE POR EL EL METODO DE
%NEWTON-RAPHSON CON PRESICION DE 1X10^-4 SUS PUNTOS DE INTERSECCION
clear all;clc
syms x
%definimos nuestra funcion
f=(x-1/8)^2*exp(x^2);
%graficamos la funcion
ezplot(f,[-1,1]);
grid on;
d=diff(f);
tol=1*10^-4;
%asignamos valores a r1
r(1)=-0.4;
e(1)=inf;
while e>tol
    aux=r;
    r=double(r-subs(f,r)/subs(d,r));
    e=abs(r-aux);
end
fprintf('La raiz es %1.5f,con un error de %1.7f\n',r,e)