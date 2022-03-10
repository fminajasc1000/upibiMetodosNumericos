x = -30:pi/100:9*pi;
y = (x-1/8).^2.*(exp(x.^2));
plot(x,y)

hold on

y2 = exp(-x.^2)+sqrt(pi);
plot(x,y2,'-')
legend('1','2')