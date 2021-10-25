% las densidades de sodio para 3 temperaturas estan dadas como sigue:
%t(°c)=94,205,371
%p(kg/m^3)=929,902,860
%determine el polinomio de iterpolacion de lagrange y aproxime los 3 datos
%y con el estime la densidad a una temperatura de 251 °c
clc;
clear all;
t=[94,205,371];
d=[929,902,860];

plot(t,d,'o','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','r')
%calculo de los lagranjianos
syms T
l1=expand((T-t(2))*(T-t(3))/((t(1)-t(2))*(t(1)-t(3))));
pretty(l1)
l2=expand((T-t(1))*(T-t(3))/((t(2)-t(1))*(t(2)-t(3))));
pretty(l2)
l3=expand((T-t(1))*(T-t(2))/((t(3)-t(1))*(t(3)-t(2))));
pretty(l2)

D=vpa(l1*d(1)+l2*d(2)+l3*d(3),8);
hold on
ezplot(D,[-90,500]);
grid on
temperatura=251;
densidad=subs(D,temperatura)

plot(temperatura,densidad,'x','MarkerSize',10,'MarkerFaceColor','g','MarkerEdgeColor','g');
%ciclo rapido

l=1;
D1=0;
for ii=2:length(t)
    for i=1:length(t)
        if i~=ii
            l=l*(T-t(i))/(t(ii)-t(i));
        end
    end
    D1=D1+expand(l)*d(ii);
end
format long
D1