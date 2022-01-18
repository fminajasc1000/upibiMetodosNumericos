%EL FLUJO DE CORRIENTE ELECTRICA EN UN CIRCUITO RLC, PARA DETERMINADOS
%VALORES DE LA RESISTENCIA R, INDUCTANCIA L, Y LA CAPACITANCIA C, VIENE
%DADA POR LA EXPRESION i(t)=10e^-(t/2)*cos(3t); ¿En que instante de tiempo
%la corriente es de 2mA
%ENTOCES LA FUNCION PUEDE QUEDAR COMO f(t)=0.002-10e^-(t/2)*cos(3t) con una
%tolerancia de 1*10^-6 1e-10
%%----------------INICIAR PROGRAMA---------------------------------------%%
clear all, clc;
f=@(t)0.002-10*exp(-t/2)*cos(3*t);
%graficando la funcion 
fplot(f,[0,3]);
%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
%la tolarancia.
%a=input('Ingrese a= ');
%b=input('Ingrese b= ');
%tol=input('Ingrese tolerancia= ');
a=0;
b=0.7;
tol=(1e-10);
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