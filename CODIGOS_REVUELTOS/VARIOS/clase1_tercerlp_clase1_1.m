%ejeplo de como derivar datos
clear all

clc
u=[
h=0.002;
du(1)=(u(2)-u(1))/h
du(2)=(u(3)-u(1))/(2*h)
du(3)=(u(4)-u(2))/(2*h)
du(4)=(u(5)-u(3))/(2*h)
du(5)=(u(5)-u(4))/h
