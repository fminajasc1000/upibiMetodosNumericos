clc
clear all
f=inline('(59.68-(4.2481./v.^2)).*(v-0.037847)-50.74')
ezplot(f)
grid on