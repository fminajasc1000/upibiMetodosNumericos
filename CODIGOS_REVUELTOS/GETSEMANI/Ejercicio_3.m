clc
clear all;
close all;

f =@(t) 6.*exp(-t./2)*cos(8.6.*t-pi/2);
syms t
f=f(t)

x1=1;
x2=x1-subs(f,x1)/subs(diff(f),x1)
x2=double(x1-subs(f,x1)/subs(diff(f),x1))
errorrelativoporcentual=abs((x2-x1)/x2)*100
errorrelativoporcentual1=abs((x2-x1)/x2)*100
x3=double(x2-subs(f,x2)/subs(diff(f),x2))
errorrelativoporcentual2=abs((x2-x1)/x2)*100
errorrelativoporcentual2=abs((x3-x2)/x3)*100
x4=double(x3-subs(f,x3)/subs(diff(f),x3))
errorrelativoporcentual3=abs((x4-x3)/x4)*100
x5=double(x4-subs(f,x4)/subs(diff(f),x4))
errorrelativoporcentual4=abs((x5-x4)/x5)*100
