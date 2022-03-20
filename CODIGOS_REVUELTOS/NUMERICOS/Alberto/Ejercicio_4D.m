clear all
close all
clc
f=vectorize(inline('10.^6.*exp(l)+((0.435.*10.^6)./(l)).*(exp(l)-1)-1.54*10.^6'));
l=0:0.0001:1;
y=f(l);
plot(l,y)
grid on
pause
r(1)=input('escribe un valor inicial para ´proxima la raíz; ')
tol=0.00001;
e(1)=inf;
syms Ta
n=1;
while e(n)>tol
    n=n+1;
    r(n)=r(n-1)-f(r(n-1))/subs(diff(f(v)),r(n-1));
    e(n)=abs(r(n)-r(n-1));
end
fprintf('La raíz es %5.8f con un error de %5.8f\n',r(n),e(n))