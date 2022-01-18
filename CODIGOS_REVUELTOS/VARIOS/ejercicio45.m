clc 
clear all; 
%declarando de forma anonima la funcion
f2=@(x)(exp(-x^2)+sqrt(pi));
fplot(f2,[-20,20], 'g');
hold on

f1=@(x)(x-1/8)^2*(exp(x^2));
fplot(f1,[-20,20], 'r');
hold on
axis([-5 5 -10 10])

f3=@(x)(exp(-x^2)+sqrt(pi))-(x-1/8)^2*(exp(x^2));

%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
a=0
b=-1
tol=0.001
%calculando
format long
r=(a+b)/2
e=(b-a)/2
fprintf('Fin Iteracion\n');
while e>tol
    f_3=f3(r)
    if f_3==0
        e=0;
    else
        f_32=f3(0)*f3(r)
        if f_32<0
            b=r;
        else
            a=r;
        end
        r=(a+b)/2
        e=(b-a)/2
    end
    fprintf('Fin Iteracion\n');
end
fprintf('La raiz 1 es %5.5f con un error de %1.5f\n', r, e);
fprintf('INICIO RAIZ DOS\n');
a=0;
b=0;
r=0;
e=0;
f_3=0;
f_32=0;
%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
a=0.5
b=2
tol=0.001
%calculando
format long
r=(a+b)/2
e=(b-a)/2
fprintf('Fin Iteracion\n');
while e>tol
    f_3=f3(r)
    if f_3==0
        e=0;
    else
        f_32=f3(0)*f3(r)
        if f_32<0
            b=r;
        else
            a=r;
        end
        r=(a+b)/2
        e=(b-a)/2
    end
    fprintf('Fin Iteracion\n');
end
fprintf('La raiz 2 es %5.5f con un error de %1.5f\n', r, e);

