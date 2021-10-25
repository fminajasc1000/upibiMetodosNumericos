clc
clear all;
x = linspace(-30,30,100);
y = -x;
plot(x,y);

hold on
y = x;
plot(x,y);

hold on
y = x/2;
plot(x,y);

hold on
y = 2*x;
plot(x,y);