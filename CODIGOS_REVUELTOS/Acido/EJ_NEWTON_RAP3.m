clear all
close all
clc
f=vectorize(inline('6*exp(-t/2)*cos(8.6*t-(pi/2))'));
t=-1.5:0.001:6;
y=f(t);
plot(t,y)
grid on
pause
r(1)=input('escribe un valor inicial para ´proxima la raíz; ')
tol=0.00001;
e(1)=inf;
syms t
n=1;
while e(n)>tol
    n=n+1;
    r(n)=r(n-1)-f(r(n-1))/subs(diff(f(t)),r(n-1));
    e(n)=abs(r(n)-r(n-1));
end
fprintf('La raíz es %5.8f con un error de %5.8f\n',r(n),e(n))