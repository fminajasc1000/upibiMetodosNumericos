clc
clear all;
n = input("\nIntroduzca un numero entero y positivo (n): ");
while (n<0)
    n = input("\nIntroduzca un numero entero y positivo (n): ");
end


acum2 = n;
suma = 0;
for acum=0:n/2
    suma = n+acum;
    fprintf('\n %d = %d + %d',n,acum,acum2);
    acum2 = acum2 -1;
end
fprintf('\n');
