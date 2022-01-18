%Generar un modelo multilineal que permita estimar el peso de una persna en
%funcion de su edat y talla.
%de ser posible gratique la dispersion de los puntos y el modelo.
%use el modelo para estimar su peso y el del objeto de su posicion.

%para exportar los datos desde excel hacer lo siguiente.
clc;
clear all;
%modelo para hombres
[datos, titulo]=xlsread('Datos.xlsx','Mujeres');
%modelo propuestp
E=datos(:,1);
T=datos(:,2);
P=datos(:,3);
A=[length(E),sum(E),sum(T);sum(E),sum(E.^2),sum(E.*T);sum(T),sum(E.*T),sum(T.^2)];
B=[sum(P);sum(P.*E);sum(P.*T)];

X=inv(A)*B;

a_0=X(1);
a_1=X(2);
a_2=X(3);

p=@(e,t)a_0+a_1*e+a_2*t;

%para estimar mi peso

mi_peso=p(25,170);

%graficando funcion de dos variables
%PASO 1 NO OLVIDAR, GRAFICACION EL FENOMENO
plot3(E,T,P,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
%dibujando el modelo
hold on
%generar los intervalos en ejes de x y y
x=min(E):0.1:max(E);
y=min(T):0.5:max(T);
[Edad,Talla]=meshgrid(x,y);
Peso=p(Edad,Talla);
mesh(Edad,Talla,Peso); %o utilizar surf o mesh
%colocar xlabel
%colocar titulo