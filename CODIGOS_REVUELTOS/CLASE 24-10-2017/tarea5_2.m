%resolver e ejercicio con todos los dayos 
clear all
clc
y=[0,30000,60000];
g=[9.81,9.7487,9.6879];
%graficamos
plot(y,g,'o','MarkerSize',5,'MarkerFaceColor','g','MarkerEdgeColor','g');
%calcullar los langrangianos
syms Y
G=0;
for j=1:length(y)
    L=1;
    for i=1:length(y)
        if i~=j
            L=L*(Y-y(i))/(y(j)-y(i));
        end
    end
    G=G+expand(L)*g(j);
end
L=expand(L);
G=vpa(G,8)
hold on
ezplot(G,[9.7,12.1e4]);
grid on
altura=2250;
Gravedad=subs(G,altura)
plot(altura,Gravedad,'+','MarkerSize',5,'MarkerFaceColor','r','MarkerEdgeColor','r');