clc; clear all;
x= [0.24 1.04 1 1.80 2.05];
y= [2.38 3.64 4.80 5.88 7.15];
plot(x,y,'r*');

n=1;
p=polyfit(x,y,n);
grid
hold on;
r=roots(p)
x2=-2:0.1:3;
y2=polyval(p,x2);
plot(x2,y2,'g-');

n=2;
p2=polyfit(x,y,n);
grid
hold on;
r2=roots(p2)
x3=-2:0.1:3;
y3=polyval(p2,x3);
plot(x3,y3,'m+');

legend('Puntos Experimentales','Ajuste de Grado 1','Ajuste de Grado 2')
