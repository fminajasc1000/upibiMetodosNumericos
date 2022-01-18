clear all;clc;format short
x = [1750,1800,1850,1900,1950,1990,2000,2009];
y = [791,980,1260,1650,2520,5270,6060,6800];
% Polinomio Orden 1
p = polyfit(x,y,1); 
y_lin_fit = polyval(p,x);
lin_1975 = polyval(p,1975);
% spline fit
y_spline_fit = interp1(x,y,x,'spline');
spline_1975 = interp1(x,y,1975,'spline');
fprintf('Poblacion 1975:\n1) by Linear fit: %f million, 2) by Spline fit: %f million\n',lin_1975,spline_1975);
figure
scatter(x,y)
hold on
plot(x,y_lin_fit,'-r')
hold on
plot(x,y_spline_fit,'--g')
legend('Original Data','Linear fit','Spline fit')
grid on
xlabel('Year')
ylabel('Population (million)')