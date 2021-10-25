clc
clear all;
p=[2.50000000000000,3.50000000000000,5,6,7.50000000000000,10,12.5000000000000,15,17.5000000000000,20];
v=[4.30000000000000,4.60000000000000,4.80000000000000,5.20000000000000,6.20000000000000,7,8.20000000000000,8.50000000000000,11,13];
%LINEALIZANDO EL MODELO TENEMOS
 
plot(p,v,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
figure
loglog(p,v,'x','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
grid on
x=log(p);
y=log(v);
 
A=[length(x),sum(x);sum(x),sum(x.^2)];
B=[sum(y);sum(y.*x)];
	   
X=inv(A)*B;
	 
a_0=X(1);
a_1=X(2);
 
a=exp(a_0);
b=a_1;
 
V=@(C) a*C.^b;
figure
plot(p,v,'o','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
hold on
fplot(V,[0,100000],'g');
bacteriasxvolumen=V(9.0)
	 
sr=sum((v-V(p)).^2);
st=sum((v-mean(v)).^2);
r=sqrt((st-sr)/st);
