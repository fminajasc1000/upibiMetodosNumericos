%El factor de friccion para el flujo turbulento en un tubo circular, o 
%factor de friccion de Fanning f, esta dado por la ecuación de Karman
%1/sqrt(f)=4*log(RE*sqrt(f))-0.4
%Los valores t ??picos para el numero de Reynolds Re van de 10,000 a 500,000, 
%y para el factor de friccion de Fanning van de 0.001 a 0.01. 
%Escriba un programa que use el Metodo de Newton-Raphson para
%encontrar el factor de Fanning f dado un valor del numero de Reynolds, ingresado por teclado por el
%usuario, en el intervalo indicado.
clear all;clc;
syms f;
%definimos nuestra funcion
RE=input('Por favor ingrese un numero entre 10,000 y 500,000: ');
if RE>=10000
    if RE<=500000
        %q=4*log10(RE*sqrt(f))-0.4-1/sqrt(f);
        q=sqrt(f)*(4*log10(RE*sqrt(f))-0.4)-1;
        %graficamos la funcion
        ezplot(q,[0.001,0.01]);
        grid on
        d=diff(q);
        tol=0.001;
        %asignamos valores a r1
        r(1)=-1.2;
        e(1)=inf;
        while e>tol
            aux=r;
            r=double(r-subs(q,r)/subs(d,r));
            e=abs(r-aux);
        end
        fprintf('La raiz es %1.8f,con un error de %1.7f\n',r,e)
    else
        fprintf('Intentelo mas tarde\n');
    end
else
    fprintf('Intentelo mas tarde\n');
end