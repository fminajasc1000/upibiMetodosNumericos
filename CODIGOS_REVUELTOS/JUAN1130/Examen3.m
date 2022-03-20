clc;
clear all;
t=[0,200,400,650,1100,1900,2300];
c=[5.50,5.04,4.36,3.45,2.37,1.32,0.71];
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
conc=subs(D,2100)%Con todos los datos
ezplot(D,[0,2400])
plot(2100,conc,'*','MarkerSize',5,'MarkerFaceColor','b','MarkerEdgeColor','b')
xlabel('TIEMPO(S)');ylabel('CONCENTRACIÓN');
title('CONCENTRACIÓN  DE PENTÓXIDO DE NITRÓGENO')
