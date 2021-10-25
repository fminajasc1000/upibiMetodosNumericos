clc
clear all;
f=inline('20.*exp(-2.5*t).*sin(5.1.*t)');
t=-2:0.00001:1;
i=f(t);
plot(t,i)
grid on
 
i0=0.2;
syms t
fp= diff(f(t));
fp = inline(fp);

i1=i0-f(i0)/fp(i0)
e=abs(i1-i0)
i2=i1-f(i1)/fp(i1)
e=abs(i2-i1)
i3=i2-f(i2)/fp(i2)
e=abs(i3-i2)
i4=i3-f(i3)/fp(i3)
e=abs(i4-i3)

fprintf('La raiz de la funcion es %f5.5 con un error de %f5.5\n',i4,e);