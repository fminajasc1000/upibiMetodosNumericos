clc, clear, close all
t=0:0.1:6;
q=1-exp(-2*(t-1)).*heaviside(t-1)-(1-exp(-2*(t-3)).*heaviside(t-3))
plot(t,q,'r','LineWidth',0.8)
grid on
xlabel('tiempo(seg)')
ylabel('Carga del capacitor (Coulomb)')
legend('Carga del capacitor')