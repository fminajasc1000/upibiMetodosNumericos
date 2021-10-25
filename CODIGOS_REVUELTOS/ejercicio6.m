clear all; clc;
%declarando de forma anonima la funcion
f=@(x)-1.54*10^6+10^6+((0.435*10^6/x)*(exp(x)-1));
%graficando la funcion 
fplot(f,[0.4,0.5]);
%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
a=0.41;
b=0.42;
tol=0.001;
%calculando
format long
r=(a+b)/2;
e=(b-a)/2;
while e>tol
    if f(r)==0
        e=0;
    else
        if f(0)*f(r)<0
            b=r;
        else
            a=r;
        end
        r=(a+b)/2;
        e=(b-a)/2;
    end
end
fprintf('La raiz es %5.5f con un error de %1.5f\n', r, e);