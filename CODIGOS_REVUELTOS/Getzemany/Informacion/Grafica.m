clc; clear all; close all;
f=inline('(24/0.44<10.^5))+0.5407');
x=-3:0.01:3;
y=f(x);
plot(x,y)
grid on
hold on
plot(x,zeros(size(x)),'y*-')
a=0.1;
b=0.9;