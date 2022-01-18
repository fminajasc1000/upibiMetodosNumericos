%para exportar los datos desde excel hacer lo siguiente.
clc;
clear all;
%modelo para hombres
[datos, titulo]=xlsread('datos_Tarea_3_SP.xlsx','Ejercicio 4');
%modelo propuestp
U=datos(1,:);
H=datos(2,:);
K=datos(3,:);

x_1=log(U);
x_2=log(H);
y=log(K);

A=[length(x_1),sum(x_1),sum(x_2);sum(x_1),sum(x_1.^2),sum(x_1.*x_2);sum(x_2),sum(x_1.*x_2),sum(x_2.^2)];
B=[sum(y);sum(y.*x_1);sum(y.*x_2)];
X=inv(A)*B;

a_0=X(1);
a_1=X(2);
a_2=X(3);

alfa=exp(a_0);
beta=a_1;
gamma=a_2;
%p=@(e,t)a_0+a_1*e+a_2*t;
%para estimar mi peso

%modelo
k=@(u,h)alfa*u.^beta.*h.^gamma;

%graficando funcion de dos variables
%PASO 1 NO OLVIDAR, GRAFICACION EL FENOMENO
plot3(U,H,K,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
%dibujando el modelo
hold on
%generar los intervalos en ejes de x y y
x=min(U):0.5:max(U);
y=min(H):0.05:max(H);
[Vel,Tray]=meshgrid(x,y);
Coef=k(Vel,Tray);
mesh(Vel,Tray,Coef); %o utilizar surf o mesh
%colocar xlabel
%colocar titulo