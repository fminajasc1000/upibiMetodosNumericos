clc; 
clear all; 
close all
f=@(x)16.*x.^3+25.*x.^3+x.^2+5.*x-3;
a=1/5;
syms x
%Calculando P1
f1=diff(f(x),1);
f1=inline(f1);
p1=f(a)+f1(a)*(x-a);
p1=vpa(expand(p1),5);
% pretty(p1)
%Calculando P2
f2=diff(f(x),2);
f2=inline(f2);
p2=p1+f2(a)/factorial(2)*(x-a)^2;
p2=vpa(expand(p2),5);
pretty(p2)
%Calculando P3
f3=diff(f(x),3);
f3=inline(f3);
p3=p2+f3(a)/factorial(3)*(x-a)^3;
p3=vpa(expand(p3),5);
% pretty(p3)
%Calculando P4
f4=diff(f(x),4);
f4=inline(f4);
p4=p3+f4(a)/factorial(4)*(x-a)^4;
p4=vpa(expand(p4),5);
pretty(p4)
%Calculando P5
f5=diff(f(x),5);
f5=inline(f5);
p5=p4+f5(a)/factorial(5)*(x-a)^5;
p5=vpa(expand(p5),5);
pretty(p5)
%ERRORES
xe=1/3;
vr=f(xe);
%error p2
va=double(subs(p2,xe));
ep=abs(vr-va)/vr*100
%error p4
va=double(subs(p4,xe));
ep=abs(vr-va)/vr*100
%error p5
va=double(subs(p5,xe));
ep=abs(vr-va)/vr*100
%Graficar
x=-1:0.001:3;
%funcion original
plot(x,f(x))
hold on
%graficar p1
plot(x,subs(p1,x),'r')
%graficar p2
plot(x,subs(p2,x),'g')
%graficar p3
plot(x,subs(p3,x),'b')
%graficar p4
plot(x,subs(p4,x),'yellow')
%graficar p5
plot(x,subs(p5,x),'m')
legend('f(x)','p_1(x)','p_2(x)','p_3(x)','p_4(x)','p_5(x)')
