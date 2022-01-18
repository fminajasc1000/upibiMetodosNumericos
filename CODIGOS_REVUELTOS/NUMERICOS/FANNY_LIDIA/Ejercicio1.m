clc;
clear all;
%PROBLEMA N0.
%UNA MASA DE 1KG DE CO ESTA CONTENIDA EN UN RECIPIENTE A T = 222 °K Y P=68
%BAR/MOL. LA ECUACION DE ESTADO DE VAN DER WAALS PARA UN GAS ESTA DADA POR:
% (p+a/v^2)(v-b)=RT
%DONDE:
a = 1.572;
b = 0.0411;
%Despejando
f=@(v) 68*v+1.572./v-0.0646./v^2-15.6552;
%Graficando
fplot(f,[-1,1])
grid on
%---------------------------------------
tol=0.01;
r=(a+b)/2;
e=(b-a)/2;
fprintf('El valumen es de es %5.5f m^2/kg con un error de %1.5f\n',r,e)

