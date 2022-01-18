clc
clear all
a=0; %definir los limites de integracion
b=3;
f=@(t,x)[4*t/x];
F1=@(t,x,h)[h*f(t,x)];
t(1)=a; x1(1)=2;
h=0.1;
N=(b-a)/h;
for k=1:N
    t(k+1)=t(k)+h;
    x1(k+1)=x1(k)+f(t(k),x1(k))*h;
end
hold on
plot(t,x1,'b')%solucion en azul para el metodo de Euler

syms y(t)
eqn = diff(y,t) == 4*y/t;
z = dsolve(eqn)
ezplot(z,[0,3])
legend ('Euler','Analitica')
hold off