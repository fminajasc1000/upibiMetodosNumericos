%*****************AJUSTE POLINOMIAL POR MÍNIMOS CUADRADOS.***************
%REGRESIÓN LINEAL
clc
clear all
h=[10,40,10,40,25];
t=[20,20,50,50,35];
w=[32.3500000000000,44.4700000000000,51.5300000000000,68.7200000000000,48.5300000000000];

plot(h,w,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r')
plot(t,w,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r')
grid on
%Para a)
%hacer un polinomio de segundo grado
%Sum= suma todos los elementos de un vector
A=[length(h),sum(h),sum(h.^2),sum(h.^3); sum(h),sum(h.^2),sum(h.^3),sum(h.^4);sum(h.^2),sum(h.^3),sum(h.^4),sum(h.^5);sum(h.^3),sum(h.^4),sum(h.^5),sum(h.^6)]
B=[length(t),sum(t),sum(t.^2),sum(t.^3); sum(t),sum(t.^2),sum(t.^3),sum(t.^4);sum(t.^2),sum(t.^3),sum(t.^4),sum(t.^5);sum(t.^3),sum(t.^4),sum(t.^5),sum(t.^6)]
format long
%PARA ESCRIBIR LA MATRIZ B
b=[sum(h);sum(h.*t);sum(t.*w);sum(w)]
x=inv(A).*b

bb=[sum(h);sum(h.*t);sum(t.*w);sum(w)]
xx=inv(B).*bb

a0=x(1);a1=x(2);a2=x(3);a3=x(3);    %Extrayendo los coeficientes del modelo

syms H
P2=vpa(a3*H^3+a2*H^2+a1*H+a0,5)
%:::::::::::::::::::::GRAFACANDO::::::::::::::::::::::::::::
hold on
a=ezplot(P2,[min(h),max(h)])
set(a,'Color','b')
legend('Pts. Experimentales','P2(h)')
%r^2 para el polinomio de segundo grado
sr=sum((t-subs(P2,h)).^2)
st=sum((t-mean(t)).^2)
r=sqrt((st-sr)/st)
