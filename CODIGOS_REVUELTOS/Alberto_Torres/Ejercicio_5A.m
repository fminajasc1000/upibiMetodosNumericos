clc
clear all
f=inline('0.8.*exp(x./2)-sin(x)')
ezplot(f)
grid on