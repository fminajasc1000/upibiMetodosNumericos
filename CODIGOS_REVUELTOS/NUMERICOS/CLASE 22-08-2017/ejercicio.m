%ENCUENTRE LA RAUZ POSITIVA MAS PEQUEÑA DE LA FUNCION
%ln(x)=1
%la funcion queda definida como f(x)=xln(x)-1
%la raiz graficamente sera de 1.7631 con una tolerancia de 0.0001
%reescribiendo tenemos
%xln(x)
%%--------------------INICIANDO EL PROGRAMA------------------------------%%
clear all; clc,
%declarando de forma anonima la funcion
f=@(x)x*log(x)-1;
%graficando la funcion 
fplot(f,[0.001,3]);
%colocar cuadricula
grid on
%podemos pausar para ingresar de forma manual el valor de a y b e incluso
%la tolarancia.
a=input('Ingrese a= ');
b=input('Ingrese b= ');
tol=input('Ingrese tolerancia= ');
%definimos el intervalo de trabajo
%a=1.7;
%b=1.8;
%definimos la tolerancia
%tol=0.0001;
%numero de pasos a realizar
%entero mayor ceil
%definimos el formato largo
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