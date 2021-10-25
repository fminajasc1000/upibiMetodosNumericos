close all
clc
syms t
x=139.34411+(1.575701.*(10^5)./(t))-(6.642308.*(10.^7)./(t.^2))+(1.243800.*(10^10)./(t^3))-(8.621949.*(10^11)./(t.^4));
fplot(x,[-4,4])
hold on
f=exp(x)
fplot(f,[-4,4])
disp('Muestrame la raíz por el método gráfico: ')
grid on
title 'Concentración de saturación de oxígeno disuelto en agua dulce'
xlabel('Eje x')
ylabel('Eje y')