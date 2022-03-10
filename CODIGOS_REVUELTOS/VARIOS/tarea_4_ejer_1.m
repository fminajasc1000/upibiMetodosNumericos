%Se disen  ?o un experimento para comparar varios tipos de monitores de contaminaci ?on atmos ?erica. Se prepar ?o el
%monitor y luego se expuso a varias concentraciones de ozono que var ??an entre 15 y 230 partes por mill ?on (ppm),
%para periodos de 8 a 72 horas. Se analizaron los filtros de los monitores y midi ?o la cantidad, en microgramos, de
%nitrato de sodio (N aNO3) que registr ?o el monitor. En la tabla siguiente se muestras los datos registrados en un
%tipo de monitor:
%a) Encuentre la recta de regresi ?on por el m ?etodo de m ??nimos cuadrados para los datos de la tabla.
%b) Grafique los datos experimentales y la curva de ajuste en una sola figura. ¿El ajuste proporciona suficiente
%evidencia para indicar una relaci ?on entre las dos variables?
%c) Calcule la cantidad de nitrato de sodio cuando se detectan 2.0 ppm/h de ozono en un filtro.
%d) Determine el coeficiente de correlaci ?on de Pearson.
clear all;
clc;
x=[0.800000000000000,1.30000000000000,1.70000000000000,2.20000000000000,2.70000000000000,2.90000000000000]
y=[2.44000000000000,5.20000000000000,6.07000000000000,8.98000000000000,10.8200000000000,12.1600000000000]
x2=x;
y2=y;
n=[sum(x.^2) sum(x) sum(x.*y);sum(x) length(x) sum(y)];
format long
%si r2>r1 se intercambia mi r1 con r2
n1=n(2,:);% vvector 3 tiene el renglon uno
% renglon 3 columna tal se guarda en u1, : significa j=1,2,3...n
n2=n(1,:);% renglon 1 tiene al renglon 3
% remplazar los renglones, se le llama pivoteo
n(1,:)=n1;
n(2,:)=n2;
%como renglon uno es el mayor no se cambia nada
n;
n(2,:)=-n(2,1)/n(1,1)*n(1,:)+n(2,:);
%despejar a b y sustituir en la ecuacion para encontrar a m
b=n(2,3)/n(2,2);
m=(n(1,2)-n(1,2)*b)/n(1,1);
%-----inciso b-----%
plot(x,y,'*r');
syms x
y=m*x+b;
x=0:0.5:3;
yr=subs(y,x);
hold on
plot(x,yr);
%-----Inciso c----%
vpa(subs(y,2),5);
%----Inciso d----%
corr(x2(:),y2(:))