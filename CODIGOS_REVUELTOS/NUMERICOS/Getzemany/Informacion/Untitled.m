%estime el valor de sec (pi/4) con el polinomio de maclaurin de grado 6.
%¿Cual es el error absoluto y relativo? realizar la grafica del polinomio y de sec(x) en 0<=x<=pi/2
%datos: f(x)= sec(x), a=0, para calcular errores xe=(pi/4), intervalo para
%graficar (0,pi/2)
clc; clear all; close all;
f=inline('sec(x)');
a=0;
syms x
%calculando P1
f1=diff(f(x),1);
f1=inline(f1);
p1=f(a)+f1(a)*(x-a);
p1=vpa(expand(p1),5);
pretty(p1)
%calculando P2
f2=diff(f(x),2);
f2=inline(f2);
p2=p1+f2(a)/factorial(2)*(x-a)^2;
p2=vpa(expand(p2),5);
pretty(p2)
%calculando P3
f3=diff(f(x),2);
f3=inline(f3);
p3=p2+f3(a)/factorial(2)*(x-a)^3;
p3=vpa(expand(p3),5);
pretty(p3)
%calculando P4
f4=diff(f(x),2);
f4=inline(f4);
p4=p3+f4(a)/factorial(2)*(x-a)^4;
p4=vpa(expand(p4),5);
pretty(p4)
%calculando P5
f5=diff(f(x),2);
f5=inline(f5);
p5=p4+f5(a)/factorial(2)*(x-a)^5;
p5=vpa(expand(p5),5);
pretty(p5)

%error
xe= (pi/4);
vr=f(xe);
%error p1
va=double(subs(p1,xe));
ep=abs(vr-va)/vr*100
%error p2
va=double(subs(p2,xe));
ep=abs(vr-va)/vr*100
%error p3
va=double(subs(p3,xe));
ep=abs(vr-va)/vr*100
%error p4
va=double(subs(p4,xe));
ep=abs(vr-va)/vr*100
%error p5
va=double(subs(p5,xe));
ep=abs(vr-va)/vr*100

%graficar
x=0:0.01:pi/2;
%funcion original
plot(x,f(x))
%graficar p2
hold on
plot(x,subs(p2,x),'g')
%graficar p4
plot(x,subs(p2,x),'k')
%graficar p5
plot(x,subs(p5,x),'r')
legend('f(x)','p1(x)','p2(x)','p4(x)','p5(x)')