clc;
clear all;
t=[-2 -1 0 1 2 3 4 8];
salida = 0;
promedio = 0;

for i=1:length(t)
    salida = (20.*(t(i).^(2./3)))./(t(i)+5)-((t(i)+5).^2./(exp(0.3.*t(i)+5)))+(2./t(i)+5);
    fprintf("salida: %f\n", salida);
    promedio = promedio + salida;
end

promedio = promedio/length(t);