%CONSIDERE LAS FUNCIONES GRAFIQUE Y ENCUENTRE POR EL EL METODO DE
%NEWTON-RAPHSON CON PRESICION DE 1X10^-4 SUS PUNTOS DE INTERSECCION
clear all;clc
syms x;
%definimos nuestra funcion
g=exp(-x^2)+sqrt(pi);
%grafiamos la funcion
ezplot(g,[-2,2]);
grid on;
d=diff(g);
tol=1*10^-4;
%asignamos valores a r1
r(1)=-1;
e(1)=inf;
while e>tol
    aux=r;
    r=double(r-subs(g,r)/subs(d,r));
    e=abs(r-aux);
end
fprintf('La raiz es %1.5f,con un error de %1.7f\n',r,e)