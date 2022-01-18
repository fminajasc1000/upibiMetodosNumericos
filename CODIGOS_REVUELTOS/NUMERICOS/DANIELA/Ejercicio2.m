%Ejercicio 3 Concentración de saturación de oxigeno disuelto en agua dulce 
%Método de bisección 
clc;
clear all
syms t
o=-139.34411+((1.575701.*10.^(5))./t)-((6.6422308.*10.^(7))./t.^(2))+((1.243800.*10.^(10))./t.^(3))-((8.621949.*10.^(11))./t.^(4));
fplot(o)
hold on
f=exp(o);
fplot(f)
grid
a=180;
b=195;
tole=.05;
ni=ceil((log10(b-a)-log10(tole))/(log10(2)));
for u=1:ni
    r=(a+b)/2
    e=abs((b-a)/2);
    if subs(f,a)*subs(f,b)<0
        b=r;
    else 
        a=r;
    end
    V(u,:)=[u a r b e];
end
fprintf('\n\+k\+a\+p\+b\+e\n')
disp(V)
fprintf('La raíz para el intervalo [180,195] con una tolerancia de .05 es %g\n',r)