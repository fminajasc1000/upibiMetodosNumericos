clc; clear; close all
f=@(t) 10.*exp(t./2).*cos(3.2.*t-pi/2);
i=0:0.001:1.5;
plot(i,subs(f,i))
grid on
i0=0; %suponiendo que la corriente en cero es cero, es decir que en instante cero cuando
%aun no se enciende el interruptor la corriente es cero
syms t
f1=diff(subs(f,i));
f1=subs(f1);