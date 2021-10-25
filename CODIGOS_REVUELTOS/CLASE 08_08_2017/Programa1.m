clc
clear all
%función anomina
%se puede evaluar la funcion en diferentes valores, 1,2,3,4,5,6,7,...,
f=@(x)sin(x)+3
f(0)
%como graficar una funcion dinamica, en el intervalo de 0 a 2*pi
fplot(f,[0,2*pi],'b')
%para graficar otra cosa colocar "encimadas"
hold on
%para derivar una funcion colocar una variable simbolica
%variable simbolica
syms x
%para saber todas las variables definidas, asi como su capacidad de memoria
whos
%para derivar es
%diff(f)
%conversion a variable simbolica es necesario para funcion diff
f(x)
%aplicando la derrivada
g=diff(f(x))
%graficar la derivada es decir una expresion simbolica
v=ezplot(g,[0,2*pi])
%Atributo a un objeto como ponerle color y grosor
set(v,'Color','g','LineWidth',3)
%para colocar un nuevo objeto en otra ventana
figure
%copiar de nvo
fplot(f,[0,2*pi],'r')
%evaluando g(0)
%g(0) asi no se evalua una expresion simbolica
%comando para substituir un valor en una expresion simbolica
n=subs(g,pi)
%convertir un valor numerico simbolico a entero normal
vpa(n,8)
clear x
%funcion inline
%una forma mas elegante de escribir relaciones
h=inline('tan(x)+x');
%graficar
fplot(h,[-5*pi,5*pi],'r')
%zoom en una regionm dandole las coordenadas axis([xini xfin yini yfin])
axis([-5*pi 5*pi -100 100])
ezplot(h)
%vectores del mismo tamaño
x=-2*pi:0.001:5;
y=h(x)
whos x y
%combinacion de las coordenasas
plot(x,y,'g');
%funcion con cosas extrañas
