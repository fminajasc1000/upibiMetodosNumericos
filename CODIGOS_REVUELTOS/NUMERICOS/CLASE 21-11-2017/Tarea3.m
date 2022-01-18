%--------------------------------EULER---------------------------------%
clc;
clear all;
%funcion de dos variables
r=0.1;
g=32.1;
x=8;
A=64*pi;
%A=64*pi;
f=@(t,x)-0.6*pi*r^2*sqrt(2*g)*(sqrt(x)/A);
%segundo ingrediente condicion inicial
%primer paso
t(1)=0;
x(1)=8;
h=0.005;
i=1;
%ciclo while para el calculo de los parametros
while t(i)<=600
    t(i+1)=t(i)+h;
    k1=h*f(t(i),x(i));
    k2=h*f(t(i)+h/2,x(i)+k1/2); 
    k3=h*f(t(i),x(i)-k1+2*k2); 
    x(i+1)=x(i)+1/6*(k1+4*k2+k3);
    i=i+1;
end
SOL_K_3=[t',x'];
plot(t,x,'g*');
grid on
for i=1:50/h:length(t)
    fprintf(' %3.3f\t%3.5f\n',t(i),x(i));
end