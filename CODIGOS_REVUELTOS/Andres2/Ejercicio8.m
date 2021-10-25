%EJERCICIO 1 EULER-tarea
clc
clear all
close all
h=0.1;
x0=0;%condiciones iniciales
y=1;%condiciones iniciales
xf=3; 
k=1;
f=inline('x+y^2-y/x');
for x=x0:h:xf
    xs(k)=x;
    ys(k)=y;
    y=y+h*f(x,y);
    k=k+1;
end
figure (1)
plot(xs,ys,'r','LineWidth',2)
hold on 
x=0:0.5:3;
y=exp(2*x.^2);
plot(x,y,'k','LineWidth',2)
legend ('Euler')
grid