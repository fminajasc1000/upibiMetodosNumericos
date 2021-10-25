clear all;
clc;
syms ll

l=[600,550,450,312,240];
t=[0,3,5,7,8];

%plot(l,p,figura,tamaño de la figura,tamaño,color de relleno, color, color del borde, color)
plot(l,t,'o','MarkerSize',4,'MarkerFaceColor','r','MarkerEdgeColor','r');

format long
A=[length(l), sum(l), sum(l.^2); sum(l), sum(l.^2), sum(l.^3);sum(l.^2), sum(l.^3), sum(l.^4)];
B=[sum(t);sum(t.*l);sum(t.*l.^2)];

x=inv(A)*B; %valores a0 a1 y a2

%extraccion de coeficientes del modelo
a_0=x(1);
a_1=x(2);
a_2=x(3);

syms ll
%POLINOMIO DE GRADO 2
P_2=a_2*ll^2+a_1*ll+a_0;
vpa(P_2,5)

%GRAFICANDO
hold on
aa=ezplot(P_2,[0,max(l)]);
set(aa,'Color','g');

%substituyendo el valor de la temperatura en la ecuacion
vpa(subs(P_2, 4),5)

%calculando el coeficiente de pearson
sr=vpa(sum((t-subs(P_2,l)).^2),5)
st=vpa(sum((t-mean(t)).^2),5)
r=sqrt((st-sr)/st)