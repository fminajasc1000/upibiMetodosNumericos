clear all
clc
 t= [1, 5,  13];
 v=[0.80, 3.09, 4.75];
%graficamos
plot(t,v,'o','MarkerSize',5,'MarkerFaceColor','g','MarkerEdgeColor','g');
%calcullar los langrangianos
syms Y
G=0;
n=2;
for j=1:n
    L=1;
    for i=1:n
        if i~=j
            L=L*(Y-v(i))/(v(j)-v(i));
        end
    end
    G=G+expand(L)*t(j);
  
end
hold on
fprintf('\n POLINOMIO INTERPOLANTE: \n')
   disp(G)
   ezplot(G,[0,60])
   grid on