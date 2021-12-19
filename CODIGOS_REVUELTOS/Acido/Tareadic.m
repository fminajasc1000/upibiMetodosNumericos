clc;
clear all;
t=[1 2 4 6 8 9 10];
c=[24.95 43.80 68.89 85.95 104.38 118.32 139.23];
plot(t,c,'o','MarkerSize',5,'MarkerFaceColor','m','MarkerEdgeColor','m')
grid on
hold on
%Calculando los lagranjianos
syms T
D=0
for j=1:length(t)
L=1
for i=1:length (t)
    if i~=j
        L= L*(T-t(i))/(t(j)-t(i));
    end
end
D=D+expand(L)*c(j)
end
D=vpa(D)
conc=subs(D,7)%Con todos los datos
ezplot(D,[0,10])
plot(7,conc,'*','MarkerSize',5,'MarkerFaceColor','b','MarkerEdgeColor','b')
xlabel('Atmosferas(P)');ylabel('Volumenes especificos a 75 °C');
title('VOLUMEN ESPECIFICO')
