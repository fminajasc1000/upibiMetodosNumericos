clc;
clear all;
%modelo propuestp
E=[0,0,1,2,0,1,2,2,1];
T=[0,2,2,4,4,6,6,2,1];
P=[14,21,11,12,23,23,14,6,11];
A=[length(E),sum(E),sum(T);sum(E),sum(E.^2),sum(E.*T);sum(T),sum(E.*T),sum(T.^2)];
B=[sum(P);sum(P.*E);sum(P.*T)];

X=inv(A)*B;

a_0=X(1);
a_1=X(2);
a_2=X(3);

p=@(e,t)a_0+a_1*e+a_2*t;

%para estimar EN EL PUNTO (1,4

temperatura=p(25,170);

%graficando funcion de dos variables
%PASO 1 NO OLVIDAR, GRAFICACION EL FENOMENO
plot3(E,T,P,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
%dibujando el modelo
hold on
%generar los intervalos en ejes de x y y
x=min(E):0.1:max(E);
y=min(T):0.5:max(T);
[Ed,Ta]=meshgrid(x,y);
Pe=p(Ed,Ta);
mesh(Ed,Ta,Pe); %o utilizar surf o mesh
%colocar xlabel
%colocar titulo