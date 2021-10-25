clear all
a=0;
b=10;
f=@(t,x)[-4*t^3*x];
F1=@(t,x,h)[h*f(t,x)];
t(1)=a; x1(1)=7;x2(1)=7;x3(1)=7;
h=0.2;
N=(b-a)/h;
for k=1:N
    t(k+1)=t(k)+h;
    x1(k+1)=x1(k)+f(t(k),x1(k))*h;
end
hold on
plot(t,x1,'b')%solucion en azul para el metodo de Euler
legend ('Euler')
hold off
