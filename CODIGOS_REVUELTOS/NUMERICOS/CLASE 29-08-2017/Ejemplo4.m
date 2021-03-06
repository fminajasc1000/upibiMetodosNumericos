%CDC
clear all;
clc;
syms w
%funcion simbolica
f=1.7+32.17/(2*w^2)*((exp(5*w)-exp(-5*w))/2-sin(5*w))+1.7;

%derivando la funcion
F=diff(f);
%graficando una simbolica
ezplot(f,[-3,0])
grid on
%0.75^2-h^2>0
%(0.75-h)>0 (0.75+h)>0
%se debe de cumplir
%0.75>h y 0.75>h
%se debe evaluar de 
%[-0.75 a 0.75]
%semilla
r=-1;
e=inf;
tol=0.005/100;
format long

while e>tol
    rant=r;
    r=double(r-subs(f,r)/subs(F,r)); %poner double para convertir de simbolica a numero
    e=abs(r-rant);  
end
disp(subs(r));
fprintf('La raiz es %5.5f el error es %5.5f\n', r,e);