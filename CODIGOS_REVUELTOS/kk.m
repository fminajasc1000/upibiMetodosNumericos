clear all
clc
t=[50.4000000000000;43.8000000000000;37.2000000000000;30.6000000000000;21.8000000000000;13.1000000000000;6.40000000000000;-0.200000000000000;-4.60000000000000;-9];
k=[10.9500000000000;9.18000000000000;5.84000000000000;1.45000000000000;10.4500000000000;8.41000000000000;16.0500000000000;34.1700000000000;66.3100000000000;113.880000000000];
%plot(t,k,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');

y=log(k);
x=t;

plot(x,y,'o','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
A=[length(x), sum(x);sum(x),sum(x.^2)];
B=[sum(y); sum(y.*x)];

a=[A B];
X=inv(A)*B;

a_0=X(1)
a_1=X(2)

Z=exp(a_0)
E=-a_1
K=@(T)Z.*exp(-E.T);

plot(t,k,'o','MarkerSize',4,'MarkerFaceColor','b','MarkerEdgeColor','b');
hold on
fplot(K,[280,max(t)],'g');
format long
Sr=sum((k-K(t)).^2)
St=sum((k-mean(k)).^2)
r=sqrt((St-Sr)/St)
