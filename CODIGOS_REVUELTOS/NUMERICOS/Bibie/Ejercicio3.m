clear all
a=0; %definir los limites de integracion
b=10;
f=@(t,x)[cos(x).^2-tan(x)*t];
F1=@(t,x,h)[h*f(t,x)];
t(1)=a; x1(1)=1;
h=0.5;
N=(b-a)/h;
for k=1:N
    t(k+1)=t(k)+h;
    x1(k+1)=x1(k)+f(t(k),x1(k))*h;
end
hold on
plot(t,x1,'b')%solucion en azul para el metodo de Euler

hold on

syms y(t)
eqn = diff(y,t) == cos(t).^2-tan(t)*y;
z = dsolve(eqn)
ezplot(z,[0,10])
legend ('Euler','Analitica')
hold off