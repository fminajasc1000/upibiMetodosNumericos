clc; clear all; close all;
%Se crean los vectores con los datos, se omiten los datos 0 para >>%obtener un Polinomio sin que sea igual a cero
t=[0 5 10 15 20 25 30 35 40 45 50];
v=[300 159 104 83 75 72 71 70.3 70.1 70.04 70.01];
%Se grafican los datos para observar su comportamiento
plot(t,v, 'o', 'markerfacecolor', 'r'); grid on;
hold on
syms T
%Se obtienen los lagrangianos para cada dato
L(1)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(1)-t(2))*(t(1)-t(3))*(t(1)-t(4))*(t(1)-t(5)));
L(2)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(2)-t(1))*(t(2)-t(3))*(t(2)-t(4))*(t(2)-t(5)));
L(3)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(3)-t(1))*(t(3)-t(2))*(t(3)-t(4))*(t(3)-t(5)));
L(4)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(4)-t(1))*(t(4)-t(2))*(t(4)-t(3))*(t(4)-t(5)));
L(5)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(5)-t(1))*(t(5)-t(2))*(t(5)-t(3))*(t(5)-t(4)));
 
P=v(1)*L(1)+v(2)*L(2)+v(3)*L(3)+v(4)*L(4)+v(5)*L(5)

%Se grafica el Polinomio obtenido, el cual será muy parecido al >>%gráfico de los datos
hold on;
ezplot(P,[min(t),max(t)]); grid on;
xlabel('tiempo (min)'); ylabel('temperatura(C)'); title('Radiacion n');
%Una vez se tiene el modelo/polinomio que describe el comportamiento >>%de los datos, se tiene F(x) que es la función a integrar para conocer >>%el trabajo hecho por el resorte
f=inline(P);
a=0; b=50; k=300;
%Se calcula la longitud para cada trapecio
h=(b-a)/k;
%Se declara un acumulador en donde se obtendrá el valor de la >>%integral por medio de la regla de trapecios 
suma=0;
for i=1:k-1
   suma=suma+f(a+i*h);
end
integ_trap=h/2*(f(a)+2*suma+f(b))
%Por último, se comprueba la integral obtenida con la integral >>%exacta
syms xi
integ_exacta=double(int(f(xi),a,b))
