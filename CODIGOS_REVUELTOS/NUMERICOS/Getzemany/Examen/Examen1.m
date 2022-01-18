clc;
clear;
close all

f=@(x) 3*sin(2*x)/(2*x);
%Polinomio de grado 1
x0 = 0.1;
syms x
f1 = diff ( f(x), 1);
P1 = f(x0) + subs(f1, x0) * (x-x0);
P1 = vpa(expand(P1), 5);
%Polinomio de grado 2
f2 = diff( f(x), 2);
P2 = P1 + subs(f1,x0)/factorial(2) * (x-x0)^2;
P2 = vpa(expand(P2), 5);
%Polinomio de grado 3
f3 = diff( f(x), 3);
P3 = P2 + subs(f3,x0) / factorial(3) * (x-x0)^3;
P3=vpa(expand(P3),5);
%polinomio de grado 4
f4 = diff( f(x), 4);
P4 = P3 + subs(f4,x0) / factorial(4) * (x-x0)^4;
P4=vpa(expand(P4),5);
%resultados
disp('El valor de el polinomio de Taylor de Segundo grado es: ')
disp(P2)
disp('El valor de el polinomio de Taylor de Cuarto grado es: ')
disp(P4)
%Errores
F_025 = subs(f, 0.25);
VaP2_025 = subs(P2, 0.25);
ErP2 = vpa(abs((F_025 - VaP2_025)/(F_025)),5);
VaP4_025 = subs(P4, 0.25);
ErP4 = vpa(abs((F_025 - VaP4_025)/(F_025)),5);
disp('El error del polinomio de Taylor de Segundo grado es: ')
disp(ErP2)
disp('El error del polinomio de Taylor de Cuarto grado es: ')
disp(ErP4)
disp('El error % del polinomio de Taylor de Segundo grado es: ')
disp(vpa(ErP2*100,5))
disp('El error % del polinomio de Taylor de Cuarto grado es: ')
disp(vpa(ErP4*100,5))
%Graficas
x1 = -1: 0.1 : 1;
plot(x1, f(x1), 'b');
hold on
plot(x1, subs(P2,x1), 'r')
plot(x1, subs(P4,x1), 'g')
legend('Función original','Polinomio segundo grado','Polinomio cuarto grado')
grid on
