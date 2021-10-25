clc
clear all;
v=[57.5900000000000,108.110000000000,149.570000000000,227.840000000000,778.140000000000,1427,2870.30000000000,4499.90000000000,5909];
p=[87.9900000000000,224.700000000000,365.260000000000,686.980000000000,4332.40000000000,10759,30648,60188,90710];
%LINEALIZANDO EL MODELO TENEMOS

plot(p,v,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
figure
loglog(p,v,'x','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
grid on
x=log(p);
y=log(v);

A=[length(x),sum(x);sum(x),sum(x.^2)]
B=[sum(y);sum(y.*x)]
    
X=inv(A)*B;

a_0=X(1)
a_1=X(2)

a=exp(a_0)
b=a_1

V=@(C) a*C.^b;
figure
plot(p,v,'o','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
hold on
fplot(V,[0,100000],'g');
velocidad=V(140)

sr=sum((v-V(p)).^2)
st=sum((v-mean(v)).^2)
r=sqrt((st-sr)/st)