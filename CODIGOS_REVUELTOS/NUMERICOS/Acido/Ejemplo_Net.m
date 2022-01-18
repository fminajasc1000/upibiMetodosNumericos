%M�todo de Newton-Raphson
%Hallar una aprox. a la ra�z de la EC x^3-3*x^2*2^(-x)+3x*4^(-x)-8^8(-x)=0
%con una tolerancia del error de 0.00001
clear all;close all;clc
f=vectorize(inline('x.^3-3.*x.^2.*2.^(-x)+3.*x.*4.^(-x)-8.^8.*(-x)'));
x=-1.5:0.001:3;%Intervalo aproximado
y=f(x);%Evaluar la funci�n
plot(x,y);grid on%Construir la gr�fica
pause
r(1)=input('escribe un valor inicial para aproximar la ra�z : ')
tol=0.000001;%Marcando tolerancia
e(1)=inf;%Asignar valor inicial al error
syms x%Variable simbolica 
n=1;%Se inicia 
while e(n)>tol
    n=n+1;
    r(n)=r(n-1)-f(r(n-1))/subs(diff(f(x)),r(n-1));%F�rmula para aproximar la ra�z
    e(n)=abs(r(n)-r(n-1));
end
fprintf('La ra�z es %5.8f con un error de   %5.8f\n',r(n),e(n))
    