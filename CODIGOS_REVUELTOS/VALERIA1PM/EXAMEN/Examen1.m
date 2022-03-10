clear all; clc;
%declarando de forma anonima la funcion
Nmax = 300;
No=1;
t0=0;
r0=0.20;
f0=@(x)Nmax/((1+Nmax/No -1).*exp(-r0.*(x-t0)))
%graficando la funcion
fplot(f0, [0, 400]);
%colocar cuadricula
grid on
hold on
xlabel('Tiempo (dias)')
ylabel('Contagiados')
%declarando de forma anonima la funcion
Nmax1 = 300;
No1=1;
t01=0;
r01=0.32;
f01=@(x)Nmax1/((1+Nmax1/No1 -1).*exp(-r01.*(x-t01)))
%graficando la funcion
fplot(f01, [0, 400]);
%colocar cuadricula
grid on
hold on
xlabel('Tiempo (dias)')
ylabel('Contagiados')
%declarando de forma anonima la funcion
Nmax2 = 300;
No2=1;
t02=10;
r02=0.32;
f02=@(x)Nmax2/((1+Nmax2/No1 -1).*exp(-r02.*(x-t02)))
%graficando la funcion
fplot(f02, [0, 400]);
%colocar cuadricula
grid on
hold on
xlabel('Tiempo (dias)')
ylabel('Contagiados')
legend ('Grafica de contagios 0 dias','Grafica de contagios 0 dias','Grafica de contagios 10 dias')

