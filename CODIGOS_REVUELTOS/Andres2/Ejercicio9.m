clc
clear all
%datos
a=2;
b=0;
h=0.1;
N=(b-a)/h;
t(1)=a;
x(1)=3;
y(1)=1;
%programa
for k=1:N
    t(k+1)=t(k)+h;
    x(k+1)=x(k)+h*y(k);
    y(k+1)=y(k)-h*x(k);
end
%salida
hold on
plot(t,x,'r')
z=dsolve('Dz=-2*t^3+12*t^2-20*t+8.5','z(0)=3')
ezplot(z,[0,5])
hold off
