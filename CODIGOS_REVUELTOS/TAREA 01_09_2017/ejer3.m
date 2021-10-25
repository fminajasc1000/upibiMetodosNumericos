%CONSIDERE LAS FUNCIONES GRAFIQUE Y ENCUENTRE POR EL EL METODO DE
%NEWTON-RAPHSON CON PRESICION DE 1X10^-4 SUS PUNTOS DE INTERSECCION
clear all;clc;
syms t;
%definimos nuestra funcion
s=300-(.25*32.17/.1)*t+(.25*32.17^2*32.17/.1^2)*(1-exp((-.1*t)/.25));
%graficamos la funcion
ezplot(s,[-3,3]);
grid on;
d=diff(s);
tol=0.02478752177;
%asignamos valores a r1
r(1)=-1.7;
e(1)=inf;
while e>tol
    aux=r;
    r=double(r-subs(s,r)/subs(d,r));
    e=abs(r-aux);
end
fprintf('La raiz es %1.8f,con un error de %1.7f\n',r,e)