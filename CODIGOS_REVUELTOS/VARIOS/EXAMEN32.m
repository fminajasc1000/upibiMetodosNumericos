clear all
clc
t=[2.50000000000000,3.50000000000000,5,6,7.50000000000000,10,12.5000000000000,15,17.5000000000000,20];
k=[4.30000000000000,4.60000000000000,4.80000000000000,5.20000000000000,6.20000000000000,7,8.20000000000000,8.50000000000000,11,13];
%plot(t,k,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
y=log(k);
x=log(t);
plot(x,y,'o','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
A=[length(x), sum(x);sum(x),sum(x.^2)];
B=[sum(y); sum(y.*x)];
a=[A B];
X=inv(A)*B;
a_0=X(1);
a_1=X(2);

Z=exp(a_0);
E=a_1;

K=@(T) Z*T.^E;

plot(t,k,'o','MarkerSize',4,'MarkerFaceColor','b','MarkerEdgeColor','b');
hold on
bacteriasxvolumen=K(9.0)
format long
Sr=sum((k-K(t)).^2);
St=sum((k-mean(k)).^2);
r=sqrt((St-Sr)/St);
