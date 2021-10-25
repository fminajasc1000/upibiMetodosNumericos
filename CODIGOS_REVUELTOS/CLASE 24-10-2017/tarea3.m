clear all
clc
y=[0,-10,-20,-40,-60,-80];
g=[0.02,0.05,0.065,0.085,0.10,0.11];
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
G=vpa(G,4)
hold on
ezplot(G,[-2.1e4,12.1e4]);
grid on
temperatura=-30;
coeficiente=subs(G,temperatura)
plot(temperatura,coeficiente,'+','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','r');