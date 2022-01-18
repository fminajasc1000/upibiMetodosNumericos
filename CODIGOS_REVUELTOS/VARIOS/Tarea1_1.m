clear;close all;clc
f=@(x)1/(2*x-1);
a=3/2;%alrededor de
k=4;%grado
syms x
p=0;%acumulador 
for n=0:k
    p=p+subs(diff(f(x),n),a)/factorial(n)*(x-a)^n;%taylor
end
p
P_2=vpa(expand(p),3)
fplot(f,[a-3,a+3],'m')
hold on 
box on
d=ezplot(P_2,[a-3,a+3])
set(d,'Color','k')
legend('f(x)','P_2(x) Polinomio de grado 2')
V_aprox=subs(P_2,1/3)
V_exacto=f(1/3)
E=vpa(abs(V_exacto-V_aprox),4)
E_relativo=E/V_exacto*100

