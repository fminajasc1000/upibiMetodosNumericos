%CONSIDERE LAS FUNCIONES GRAFIQUE Y ENCUENTRE POR EL EL METODO DE
%NEWTON-RAPHSON CON PRESICION DE 1X10^-4 SUS PUNTOS DE INTERSECCION
clear all;clc;
syms L;
%definimos nuestra funcion
q=(exp(-180*0.2/(2*L))*cos(.2*(sqrt(1/(L*10e-4)-180/(2*L)^2))))-0.1;
%graficamos la funcion
ezplot(q,[-20000000,-100000]);
grid on;
d=diff(q);
tol=0.02478752177;
%asignamos valores a r1
r(1)=-1.2;
e(1)=inf;
while e>tol
    aux=r;
    r=double(r-subs(q,r)/subs(d,r));
    e=abs(r-aux);
end
fprintf('La raiz es %1.8f,con un error de %1.7f\n',r,e)
