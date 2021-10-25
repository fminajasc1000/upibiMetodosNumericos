clc
clear all;
n = input("\nIntroduzca(n): ");
salida=0;
suma=0;
fprintf('\n');
for i=1:n
    salida=salida+3;
    suma=salida^n+suma;
    fprintf('%d^%d +', salida,n);
end
fprintf('\nSuma: %d',suma);
fprintf('\n');