%--------------------------------------------------
clear all; 
close all; 
clc
x=[0.95,0.96,0.97,0.98,0.99,1];
t=[0.9,1.92,2.54,2.88,3.04,3.1];
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

x1=dsolve('Dx1=0.97+0.14*x1','x1(0)=0');
%x1=dsolve('Dx1=1.8809-0.1809*x1','x1(0)=0'); %Resolución de la ecuación diferencial
xi=vpa(x1,6)

figure
plot(t,x,'*r')
hold on
a=0:0.01:10;
y=subs(x1,a);
plot(a,y)
