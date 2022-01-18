%----AJUSTE POR MINIMO CUADRADO EN MULTIPLE VARIABLE MODELOLINEAL----%

%A)por metodo cuadrado multiple y(T,t)=a+bT+ct
%b)Grafique la superficie del modelo lineal junto diagrama de dispersion,
%para los datos de la tabla
%c)aproxime el porcentaje de impurezas cuando el tiempo de esterilizacion
%es de 23min con una temperatura de 90C
%d)determine el coeficiente de carl pearson multiple
clear all
%Inciso a
t=[15;15;20;20;25;25;15;15;20;20;25;25;15;15;20;20;25;25];
T=[75;75;75;75;75;75;100;100;100;100;100;100;125;125;125;125;125;125];
%y=porcentaje de impurezas
y=[14.0500000000000;14.9300000000000;16.5600000000000;15.8700000000000;22.4100000000000;21.6600000000000;10.5500000000000;9.48000000000000;13.6300000000000;11.7500000000000;18.5500000000000;17.9800000000000;7.55000000000000;6.59000000000000;9.23000000000000;8.78000000000000;15.9300000000000;16.4400000000000];
%Diagrama de dispersion en el orden primero la independiente (T) despues la
%otra indp (t) por ultimo la dependiente (y)
plot3(T,t,y,'*r')
grid on
m=[length(T) sum(T) sum(t) sum(y);sum(T) sum(T.^2) sum(T.*t) sum(T.*y);sum(t) sum(T.*t) sum(t.^2) sum(t.*y)]
format long
%intercambio del 2 al 1
m1=m(2,:);
m2=m(1,:);
m(1,:)=m1;
m(2,:)=m2;
%hacer ceros los dos de abajo
m(2,:)=-m(2,1)/m(1,1)*m(1,:)+m(2,:);
m(3,:)=-m(3,1)/m(1,1)*m(1,:)+m(3,:);
%intercambio de renglon 2 con 3
m2=m(3,:);
m3=m(2,:);
m(2,:)=m2;
m(3,:)=m3;
m(3,:)=-m(3,2)/m(2,2)*m(2,:)+m(3,:);
%despejar
c=m(3,4)/m(3,3)
b=(m(2,4)-m(2,3)*c)/m(2,2)
a=(m(1,4)-m(1,3)*c-m(1,2)*b)/m(1,1)
%Inciso b
%z(T1,t1)=
%generar el plano: (MATRIZ)
[T1,t1]=meshgrid([70:10:130],[10:5:30])
%evaluar mi funcion. SE MULTIPLICA ESCLAR POR MATRIZ se crea una matriz
z=a+b*T1+c*t1
hold on
%graficar las superficies las tres deben de ser matrizes
surfc(T1,t1,z);shading interp;%puedes poner shading interp para difuminar los colores de la cuadricula
%Inciso c
%sustituir manualmente
z=a+b*90+c*23
%Inciso d
ym=a+b*T+c*t
r2=sum((ym-mean(y)).^2)/sum((y-mean(y))).^2
r=sqrt(r2)
