clc
clear all;

x=0:0.001:4.7;

y=(1).*((0<=x)&(x<2))+(((x-3).^2)/3+.67).*((2<=x)&(x<4))+(-real(sqrt(1.44*(x-4)))+1).*((4<=x)&(x<4.7));

plot(x,y)
cylinder(y)