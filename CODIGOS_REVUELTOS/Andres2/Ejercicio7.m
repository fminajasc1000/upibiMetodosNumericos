clear all
%Datos de entrada
f=@(t)[-2*t^3+12*t^2-20*t+8.5];
a=0;
b=2*pi;
h=0.5;
N=(b-a)/h;
t(1)=a;
x(1)=1;%Programa Principal
 
for k=1:N
    t(k+1)=t(k)+h;
    x(k+1)=x(k)+f(t(k))*h;
end
 
%Salida
hold on
plot(t,x,'*')% solución aproximada
z=dsolve('Dz=-2*t^3+12*t^2-20*t+8.5','z(0)=1');%solución exacta en color azul
ezplot(z,[a,b])
hold off
 