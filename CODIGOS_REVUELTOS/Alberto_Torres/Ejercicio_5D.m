clear all
close all
clc
f=vectorize(inline('0.8.*exp(x./2)-sin(x)'));
x=-4:0.0001:-2;
y=f(x);
plot(x,y)
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