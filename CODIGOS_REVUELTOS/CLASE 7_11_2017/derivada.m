clear all; 
close all; 
clc
x=[1.81 3.29 4.72 5.51 6.25 6.99 7.43 7.94 8.35];
t=[1 2 3.2 4 4.9 6 6.8 7.9 9];
i=1;
xp(i)=(x(i+1)-x(i))/(t(i+1)-t(i));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    %derivada primer progresiva, termino 1
for i=2:length(x)-1 %va de 2 a n-1
    xp(i)=(x(i+1)-x(i-1))/(t(i+1)-t(i-1)); %derivada primer centrada
end
i=length(x)
xp(i)=(x(i-1)-x(i))/(t(i-1)-t(i))
plot(t,xp,'*r')

format long
m=[ sum(x.^2)  sum(x)    length(x) sum(xp); 
    sum(x.^3)  sum(x.^2) sum(x)    sum(xp.*x);
    sum(x.^4)  sum(x.^3) sum(x.^2) sum(xp.*(x.^2))]  %Formación de matriz

m(2,:)=-m(2,1)/m(1,1)*m(1,:)+m(2,:)
r=m(2,3)/m(2,2)
k=(m(1,3)-m(1,2)*r)/m(1,1)

x1=dsolve('Dx1=1.8809-0.1809*x1','x1(0)=0'); %Resolución de la ecuación diferencial
xi=vpa(x1,6)

figure
plot(t,x,'*r')
hold on
a=0:0.01:10;
y=subs(x1,a);
plot(a,y)