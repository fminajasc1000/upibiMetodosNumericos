clc
clear all
y=[0,0.002,0.004,0.006,0.008];
u=[0,0.006180,0.0111756,0.016180,0.019021];

plot(y,u)

h=0.002;
mu=0.001;

du(1)=(u(2)-u(1))/h;
du(2)=(u(3)-u(1))/(2*h);
du(3)=(u(4)-u(2))/(2*h);
du(4)=(u(5)-u(3))/(2*h);
du(5)=(u(5)-u(4))/h;

T=mu*du