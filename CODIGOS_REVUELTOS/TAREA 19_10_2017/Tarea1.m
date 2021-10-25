%Se estudia la tasa de respiración (en No. de moles de O2/(g/min)) del liquen Parmelia Saxatilis bajo puntos
%de goteo con un recubrimiento galvanizado. El agua que cae sobre el liquen contiene zinc y potasio (en ppm), que
%utilizamos como variables explicativas. (Fuente de datos: Wainwright (1993), J. Biol. Educ.). Encuentre un modelo
%de regresión lineal múltiple entre la tasa de respiración y las concentraciones de zinc y potasio. Estime la tasa de
%respiración del liquen si recibe por goteo 360 y 6939 ppm de potasio y zinc, respectivamente.

%para exportar los datos desde excel hacer lo siguiente.
clc;
clear all;
%modelo para hombres
[datos, titulo]=xlsread('datos_Tarea_4_SP.xlsx','Ejercicio 1');
%modelo propuestp
T=datos(1,:);
P=datos(2,:);
Z=datos(3,:);
%Al no poseer un modelo propio del sistema se propone de forma general
%y=f(x1,x2,x3)
x_1=T;
x_2=P;
y=Z;
%poponemos la matriz solucion
A=[length(x_1),sum(x_1),sum(x_2);sum(x_1),sum(x_1.^2),sum(x_1.*x_2);sum(x_2),sum(x_1.*x_2),sum(x_2.^2)];
B=[sum(y);sum(y.*x_1);sum(y.*x_2)];
X=inv(A)*B;
%obtenemos la matriz solucion
a_0=X(1)
a_1=X(2)
a_2=X(3)
%procedemos a construir el modelo
s=@(t,p)a_0+a_1*t+a_2*p;

%para estimar la tasa de respiracion
mi_respiracion=s(6939,36)

%graficando funcion de dos variables
%PASO 1 NO OLVIDAR, GRAFICACION EL FENOMENO
plot3(T,P,Z,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
%dibujando el modelo
 hold on
%generar los intervalos en ejes de x y y
 x=min(T):10:max(T);
 y=min(P):10:max(P);
 [Tasa,Potasio]=meshgrid(x,y);
 Zinc=s(Tasa,Potasio);
 mesh(Tasa,Potasio,Zinc); %o utilizar surf o mesh
%colocar xlabel
%colocar titulo