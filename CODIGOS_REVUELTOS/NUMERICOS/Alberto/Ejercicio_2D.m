clear all
close all
clc
f=vectorize(inline('(59.68-(4.2481./v.^2)).*(v-0.037847)-50.74'));
v=1:0.0001:1.5;
y=f(v);
plot(v,y)
grid on
pause
r(1)=input('escribe un valor inicial para ´proxima la raíz; ')
tol=0.00001;
e(1)=inf;
syms v
n=1;
while e(n)>tol
    n=n+1;
    r(n)=r(n-1)-f(r(n-1))/subs(diff(f(v)),r(n-1));
    e(n)=abs(r(n)-r(n-1));
end
fprintf('La raíz es %5.8f con un error de %5.8f\n',r(n),e(n))