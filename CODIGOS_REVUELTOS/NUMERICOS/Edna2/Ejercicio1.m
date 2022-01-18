clc,clear all,close all
h=0.5;
x0=0;
y=2;
xf=2; k=1;
f=inline('20-5*y');
for x=x0:h:xf
    xs(k)=x;
    ys(k)=y;
    y=y+h*f(y);
    k=k+1;
end
tabla=[xs',ys']
figure(1)
plot(xs,ys,'r','LineWidth',2)
hold on 
h=0.1;
x0=0;
y=2;
xf=2; k=1;
f=inline('20-5*y');
for x=x0:h:xf
    xs(k)=x;
    ys(k)=y;
    y=y+h*f(y);
    k=k+1;
end
plot(xs,ys,'g','LineWidth',2)
h=0.01;
x0=0;
y=2;
xf=2; k=1;
f=inline('20-5*y');
for x=x0:h:xf
    xs(k)=x;
    ys(k)=y;
    y=y+h*f(y);
    k=k+1;
end
 
plot(xs,ys,'b','LineWidth',2)
x=0:0.001:2;
y1=(((10)*exp(-5*x)-20)/(-5));
grid on
plot(x,y1,'k','LineWidth',2)
legend('euler 0.5','euler 0.1','euler 0.01','analitica')clc;clear all;close all
format long
f=inline('cos(x)/(x+1)')
a=0;b=6;
k=1;%intervalos AQUI CAMBIAR PARA 1 o 6 intervalos
h=(b-a)/k;
%escribimos nuestro acumulador
suma=0;
for i=1:k-1
	suma=suma+f(a+i*h);
end
%Valor de la integral para cada valor de “k”, dado por:
Integral_trapecio=(h/2)*(f(a)+2*suma+f(b))
syms x
Integral_exacta=double(int(f(x),a,b))
abs((Integral_trapecio-Integral_exacta)/Integral_exacta)*100