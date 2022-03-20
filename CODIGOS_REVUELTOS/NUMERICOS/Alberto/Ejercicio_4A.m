clc
clear all
f=inline('10.^6.*exp(l)+((0.435.*10.^6)./(l)).*(exp(l)-1)-1.54*10.^6')
ezplot(f)
grid on