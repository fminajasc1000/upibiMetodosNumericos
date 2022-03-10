clc
clc
clear all
a=0;
b=24;
f=@(t,x)[(1-cos(pi*t./12))/(2.*x)];
F1=@(t,x,h)[h*f(t,x)];
F2=@(t,x,h)[h*f(t+h/2,x+F1(t,x,h)/2)];
F3=@(t,x,h)[h*f(t+h/2,x+F2(t,x,h)/2)];
F4=@(t,x,h)[h*f(t+h,x+F3(t,x,h))];
t(1)=a; x1(2)=10;x2(2)=10;x3(2)=10;
h=0.01;
N=(b-a)/h;
for k=1:N
    t(k+1)=t(k)+h;
    x3(k+1)=x3(k)+(F1(t(k),x3(k),h)+2*F2(t(k),x3(k),h)+2*F3(t(k),x3(k),h)+F4(t(k),x3(k),h))/6;
end
hold on
plot(t,x3,'k')%solucion en negro para Runge-Kutta

z=dsolve('Dy*(2+x)=(1-cos(pi*t)/12)','y(0)=10','t');
simplify(z)
syms z
ezplot(z,[0,24]);
legend ('Runge-kutta','Analitica')
hold off
