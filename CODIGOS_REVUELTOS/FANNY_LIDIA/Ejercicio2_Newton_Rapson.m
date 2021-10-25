clc; close all; clear all;
syms x  
f1=-3.*x.^2+3;
ezplot(f1,[-2,2]);
grid on
hold on
syms x
g=exp(-x^2);
ezplot(g,[-2,2])
%para encontrar estos puntos igualamos las funciones y obtenemos una nueva
%funcion f(x)
h=(-3.*x.^2+3)-exp(-x^2);
ezplot(h,[-2,2])

legend('-3.*x.^2+3', 'exp(-x^2)', '(-3.*x.^2+3)-exp(-x^2)');

f=inline('(-3.*x.^2+3)-exp(-x.^2)');
x=-3:(1e-5):3;
y=f(x);
% plot(x,y)
% grid on
%  
%disp('Raiz 1')
x0=0.1;
syms x
fp= diff(f(x));
fp = inline(fp);

x1=x0-f(x0)/fp(x0);
e=abs(x1-x0);
x2=x1-f(x1)/fp(x1);
e=abs(x2-x1);
x3=x2-f(x2)/fp(x2);
e=abs(x3-x2);
x4=x3-f(x3)/fp(x3);
e=abs(x4-x3);
fprintf('La intersección positiva de las funciones es %f5.5 con un error de %f5.5\n',x4,e);
%disp('Raiz 2')

x0=-0.1;
syms x
fp= diff(f(x));
fp = inline(fp);

x1=x0-f(x0)/fp(x0);
e=abs(x1-x0);
x2=x1-f(x1)/fp(x1);
e=abs(x2-x1);
x3=x2-f(x2)/fp(x2);
e=abs(x3-x2);
x4=x3-f(x3)/fp(x3);
e=abs(x4-x3);
fprintf('La intersección negativa de las funciones es %f5.5 con un error de %f5.5\n',x4,e);