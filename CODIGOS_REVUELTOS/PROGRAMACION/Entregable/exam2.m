clear all;
clc
v1=2*pi;
v2=2*pi/3;
v3=(3*pi)/100
vt=v1+v2+v3;

areatotal=15598;%internet
a=pi*(areatotal/2)*13;

piezashexa=16000;
caben=a/piezashexa;

fprintf("El volumen total del museo es: %f m^3\n", vt*1000);
fprintf("El Area total del museo es: %f m^2\n", a);
fprintf("Caben aprox, suponiendo que son del mismo tamaño: %d piezas\n", round(caben));