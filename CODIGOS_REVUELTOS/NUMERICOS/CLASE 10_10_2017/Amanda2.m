clc
clear all;

v=[26.4300000000000,22.4000000000000,19.0800000000000,16.3200000000000,14.0400000000000,12.1200000000000,10.5100000000000,9.15000000000000,8];
p=[14.7000000000000,17.5300000000000,20.8000000000000,24.5400000000000,28.8300000000000,33.7100000000000,39.2500000000000,45.4900000000000,52.5200000000000];
%LINEALIZANDO EL MODELO TENEMOS
plot(p,v,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
figure
loglog(p,v,'x','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
grid on
x=1.\p;
y=1.\v;

A=[length(x),sum(x);sum(x),sum(x.^2)];
B=[sum(y);sum(y.*x)];
    
X=inv(A)*B;

a_0=X(1)
a_1=X(2)

a=a_0
b=a_1

P2=@(pp) 1./(a+b*pp);
figure
plot(p,v,'o','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
hold on
fplot(P2,[0,20],'g');
Presionm2=vpa(P2(7))

sr=sum((v-P2(p)).^2)
st=sum((v-mean(v)).^2)
r=vpa(sqrt((st-sr)/st))