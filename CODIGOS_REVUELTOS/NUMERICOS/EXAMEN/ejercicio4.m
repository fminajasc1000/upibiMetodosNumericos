clear all
a=0;
b=1.5;
f=@(t,x)[2*x^3+12*x^2-20*x+8.5];
F1=@(t,x,h)[h*f(t,x)];
F2=@(t,x,h)[h*f(t+h/2,x+F1(t,x,h)/2)];
F3=@(t,x,h)[h*f(t+h/2,x+F2(t,x,h)/2)];
F4=@(t,x,h)[h*f(t+h,x+F3(t,x,h))];
t(1)=a; x1(1)=1;x2(1)=1;x3(1)=1;
h=0.15;
N=(b-a)/h;
for k=1:N
    t(k+1)=t(k)+h;
    x1(k+1)=x1(k)+f(t(k),x1(k))*h;
    x2(k+1)=x2(k)+h/2*(f(t(k),x2(k))+f(t(k+1),x2(k)+h*f(t(k),x2(k))));
    x3(k+1)=x3(k)+(F1(t(k),x3(k),h)+2*F2(t(k),x3(k),h)+2*F3(t(k),x3(k),h)+F4(t(k),x3(k),h))/6;
end
hold on
plot(t,x1,'b')%solucion en azul para el metodo de Euler
plot(t,x2,'r')%solucion en rojo para euler mejorado
plot(t,x3,'k')%solucion en negro para Runge-Kutta

z=dsolve('Dy=2*x^3+12*x^2-20*x+8.5','y(0)=1','x');
simplify(z)
syms x
ezplot(z,[0,1.5]);
% legend ('Euler','Analitica')
legend ('Euler','Euler Mejorado','Runge-kutta','Analitica')
hold off