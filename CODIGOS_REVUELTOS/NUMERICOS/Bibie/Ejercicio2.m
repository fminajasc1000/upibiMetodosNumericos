clear all
a=0; %definir los limites de integracion
b=2;
f=@(t,x)[20-5*x];
F1=@(t,x,h)[h*f(t,x)];
t(1)=a; x1(1)=1;
h=0.5;
N=(b-a)/h;
for k=1:N
    t(k+1)=t(k)+h;
    x1(k+1)=x1(k)+f(t(k),x1(k))*h;
end
plot(t,x1,'b')%solucion en azul para el metodo de Euler
hold on

syms y(t)
eqn = diff(y,t) == 20-5*y;
z = dsolve(eqn)
ezplot(z,[0,2])
legend ('Euler','Analitica')
hold off