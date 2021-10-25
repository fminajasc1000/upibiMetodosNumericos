clc
clear all
a=1;
b=5;
f=@(t,x)[((exp(t))-x)/t];
F1=@(t,x,h)[h*f(t,x)];
F2=@(t,x,h)[h*f(t+h/2,x+F1(t,x,h)/2)];
F3=@(t,x,h)[h*f(t+h/2,x+F2(t,x,h)/2)];
F4=@(t,x,h)[h*f(t+h,x+F3(t,x,h))];
t(1)=a; x1(1)=2;x2(1)=2;x3(1)=2;
h=0.05;
N=(b-a)/h;
for k=1:N
    t(k+1)=t(k)+h;
    x1(k+1)=x1(k)+f(t(k),x1(k))*h;
    x3(k+1)=x3(k)+(F1(t(k),x3(k),h)+2*F2(t(k),x3(k),h)+2*F3(t(k),x3(k),h)+F4(t(k),x3(k),h))/6;
end
hold on
plot(t,x1,'b')%solucion en azul para el metodo de Euler
plot(t,x3,'k')%solucion en negro para Runge-Kutta

syms y(t)
eqn = diff(y,t) == ((exp(t))-y)/t;
z = dsolve(eqn)
ezplot(z,[1,5])
legend ('Euler','Runge-kutta','Analitica')
hold off