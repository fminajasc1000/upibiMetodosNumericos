%EJERCICIO 6
clear all;
clc;
l=[10.4210000000000,10.9390000000000,11.3210000000000,11.7940000000000,12.2420000000000,12.6628000000000];
p=[10.5000000000000,29.4900000000000,42.7000000000000,60.0100000000000,75.5100000000000,91.0500000000000];

%plot(l,p,figura,tamaño de la figura,tamaño,color de relleno, color, color del borde, color)
plot(l,p,'o','MarkerSize',4,'MarkerFaceColor','r','MarkerEdgeColor','r')

%inciso a
%de la forma P_2(l_1)=a_2l^2+a_1**l+a_0
%n=2 
%N SUM(l), sum(l^2)
%SUM(L)

%suma de todas los elementos de un vector
format long
A=[length(l), sum(l), sum(l.^2); sum(l), sum(l.^2), sum(l.^3);sum(l.^2), sum(l.^3), sum(l.^4)];
B=[sum(p);sum(p.*l);sum(p.*l.^2)];

x=inv(A)*B; %valores a0 a1 y a2

%extraccion de coeficientes del modelo
a_0=x(1);
a_1=x(2);
a_2=x(3);

syms ll
%POLINOMIO DE GRADO 2
P_2=a_2*ll^2+a_1*ll+a_0;
vpa(P_2,5)

%grado 3

%suma de todas los elementos de un vector
format long
A=[length(l), sum(l), sum(l.^2), sum(l.^3); sum(l), sum(l.^2), sum(l.^3), sum(l.^4);sum(l.^2), sum(l.^3), sum(l.^4), sum(l.^5);sum(l.^3), sum(l.^4), sum(l.^5), sum(l.^6)];
B=[sum(p);sum(p.*l);sum(p.*l.^2);sum(p.*l.^3)];
x=inv(A)*B; %valores a0 a1 y a2

%extraccion de coeficientes del modelo
a_0=x(1);
a_1=x(2);
a_2=x(3);
a_3=x(4);

syms ll
%POLINOMIO DE GRADO 3
P_3=a_3*ll^3+a_2*ll^2+a_1*ll+a_0;
vpa(P_3,5)

%grado 4

%suma de todas los elementos de un vector
format long
A=[length(l), sum(l), sum(l.^2), sum(l.^3), sum(l.^4); sum(l), sum(l.^2), sum(l.^3), sum(l.^4), sum(l.^5);sum(l.^2), sum(l.^3), sum(l.^4), sum(l.^5), sum(l.^6);sum(l.^3), sum(l.^4), sum(l.^5), sum(l.^6), sum(l.^7);sum(l.^4), sum(l.^5), sum(l.^6), sum(l.^7), sum(l.^8)];
B=[sum(p);sum(p.*l);sum(p.*l.^2);sum(p.*l.^3);sum(p.*l.^4)];
x=inv(A)*B; %valores a0 a1 y a2

%extraccion de coeficientes del modelo
a_0=x(1);
a_1=x(2);
a_2=x(3);
a_3=x(4);
a_4=x(5);
syms ll
%POLINOMIO DE GRADO 4
P_4=a_4*ll^4+a_3*ll^3+a_2*ll^2+a_1*ll+a_0;
vpa(P_4,5)

%GRAFICANDO
hold on
aa=ezplot(P_2,[min(l),max(l)]);
set(aa,'Color','g');

a2=ezplot(P_3,[min(l),max(l)]);
set(a2,'Color','b');

a3=ezplot(P_4,[min(l),max(l)]);
set(a3,'Color','m');

legend('Pts. experimentales', 'P_2(ll)', 'P_3(ll)', 'P_4(ll)');

% r^2 POLINOMIO DE SEGUNDO GRADO
sr=vpa(sum((p-subs(P_2,l)).^2),5)
st=vpa(sum((p-mean(p)).^2),5)
r=sqrt((st-sr)/st)

sr=vpa(sum((p-subs(P_3,l)).^2),5)
st=vpa(sum((p-mean(p)).^2),5)
r=sqrt((st-sr)/st)

sr=vpa(sum((p-subs(P_4,l)).^2),5)
st=vpa(sum((p-mean(p)).^2),5)
r=sqrt((st-sr)/st)

%el de grado cuatro numericamente es el mejor
%pero decidimos con respecto a la grafica y a numericamente.