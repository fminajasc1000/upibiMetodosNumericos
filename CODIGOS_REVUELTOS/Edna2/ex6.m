clc
clear all
a=3;
b=4;
f=@(t,x)[-(t)/(x)];
F1=@(t,x,h)[h*f(t,x)];
F2=@(t,x,h)[h*f(t+h/2,x+F1(t,x,h)/2)];
F3=@(t,x,h)[h*f(t+h/2,x+F2(t,x,h)/2)];
F4=@(t,x,h)[h*f(t+h,x+F3(t,x,h))];
t(1)=a; x1(4)=3;x2(4)=3;x3(4)=3;
h=0.02;
N=(b-a)/h;
for k=1:N
    t(k+1)=t(k)+h;
    x1(k+1)=x1(k)+f(t(k),x1(k))*h;
end
hold on
plot(t,x1,'b')%solucion en azul para el metodo de Euler

z=dsolve('Dy*y=(x)','y(4)=3','x');
simplify(z)
syms x
ezplot(z,[3,4]);
legend ('Euler','Analitica')
hold off