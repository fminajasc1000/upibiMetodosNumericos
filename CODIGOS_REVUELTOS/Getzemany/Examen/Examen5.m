clc, clear all, close all 
format long
datos=xlsread('examen.xlsx','Hoja1')
%Variables independientes t
t=datos(:,1)' %X1 
v=datos(:,2)' %X2
%numero de trapecios
k=100000;
%sumatoria
s=0;
%h
h=(v(1)-v(16))/k;
 
for i=1:2:16
    s=s+(v(i)+i*h);
end
d=h/2*(v(1)+2*s+v(16))

