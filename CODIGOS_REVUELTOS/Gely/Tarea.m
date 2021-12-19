clear all
clc
t= [0 0.5 1.0 1.5 2.0 2.5 3.0];
f= [0 0.5 1.0 1.5 2.0 2.5 3.0];
g= [0 0.25 1.0 2.25 4.0 6.25 9];

%graficamos
plot(t,f,'o','MarkerSize',5,'MarkerFaceColor','g','MarkerEdgeColor','g');
hold on
plot(t,g,'o','MarkerSize',5,'MarkerFaceColor','r','MarkerEdgeColor','r');
%calcullar los langrangianos
syms X
G=0;
F=0;

for j=1:length(t)
    L=1;
    for i=1:length(t)
       if i~=j
            L=L*(X-t(i))/(t(j)-t(i));
        end
    end
    F=F+expand(L)*f(j);
    G=G+expand(L)*g(j);
end

% fprintf('\n POLINOMIOS INTERPOLANTE: \n')
% disp(F)
% disp(G)
hold on
ezplot(F,[0,3])
ezplot(G,[0,9])
grid on

%trapecio simple
chi=1;
f=@(X) (2*pi*G*sqrt(diff(F).^2)+diff(G).^2);
%cuidado con las variables y erificar si no hay disconinuidades
a=0;
b=3;
%numero de trapecios
k=10000;
%sumatoria
s=0;
%h
h=(b-a)/k;
for i=1:k-1
   s=s+f(a+i*h);
end
format long
I=h/2*(f(a)+2*s+f(b))
