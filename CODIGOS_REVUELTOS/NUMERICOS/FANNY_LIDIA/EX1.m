clc
clear all;
 
f=inline('(sin(x-2)/(x+1))');
a=1;

%Polinomio de grado 1
syms x
f1=diff(f(x));
f1=inline(f1);
 
p1=f(a)+f1(a)*(x-a);
p1=vpa(expand(p1),4)
 
%Polinomio de grado 2
f2=diff(f(x),2);
f2=inline(f2);
 
p2=p1+f2(a)/factorial(2)*(x-a)^2;
p2=vpa(expand(p2),4)
 
%Polinomio de grado 3
f3=diff(f(x),3);
f3=inline(f3);
 
p3=p2+f3(a)/factorial(3)*(x-a)^3;
p3=vpa(expand(p3),4)
 
%Gr·fica
x=-0.5:0.1:1;
y=f(x);
plot(x,y,'k') %FunciÛn original
 
hold on
p1=inline(p1);
p2=inline(p2);
p3=inline(p3);
 
plot(x,p1(x),'b')
plot(x,p2(x),'r')
plot(x,p3(x),'g')
 
legend('FunciÛn original','p1(x)','p2(x)','p3(x)')
 
 
%Obteniendo errores
vr=f(1);
va1=p1(1);
e1=abs( (vr-va1) / vr ) * 100
 
va2=p2(1);
e2=abs( (vr-va2) / vr ) * 100
 
va3=p3(1);
e3=abs( (vr-va3) / vr ) * 100