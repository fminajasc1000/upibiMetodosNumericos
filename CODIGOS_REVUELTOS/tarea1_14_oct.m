%----AJUSTE POR MINIMO CUADRADOS MULTIPLE----%
%Ejercicio UNO
%y=consumo del agua
%s=salinidad
%t=dias
s=[0;0;0;0;0;0;6;6;6;6;6;6;12;12;12;12;12;12];
t=[14;14;21;21;28;28;14;14;21;21;28;28;14;14;21;21;28;28];
y=[2.20000000000000;3.30000000000000;5;5.70000000000000;13.2000000000000;12.4000000000000;3.70000000000000;4.50000000000000;5.90000000000000;7.20000000000000;9.40000000000000;11;2.80000000000000;3.40000000000000;4.50000000000000;5.90000000000000;7.60000000000000;8.30000000000000];
%Graficar
plot3(s,t,y,'*g')
grid on
%al ser el metodo de minimo cuadrados multiple y quedar la misma ecuacion
%la matriz se escribe de la misma forma
m=[length(s) sum(s) sum(t) sum(y);sum(s) sum(s.^2) sum(s.*t) sum(s.*y);sum(t) sum(s.*t) sum(t.^2) sum(t.*y)]
format long
%intercambiamos el 3 con el 1
 m3=m(1,:)
 m1=m(3,:)
 m(1,:)=m1
 m(3,:)=m3
m(2,:)=-m(2,1)/m(1,1)*m(1,:)+m(2,:)
m(3,:)=-m(3,1)/m(1,1)*m(1,:)+m(3,:)
m(3,:)=-m(3,2)/m(2,2)*m(2,:)+m(3,:)
%despejar
c=m(3,4)/m(3,3)
b=(m(2,4)-m(2,3)*c)/m(2,2)
a=(m(1,4)-m(1,3)*c-m(1,2)*b)/m(1,1)
[s1,t1]=meshgrid([0:1:15],[10:1:30])

%evaluar mi funcion. SE MULTIPLICA ESCLAR POR MATRIZ se crea una matriz
z=a+b*s1+c*t1
hold on
%graficar las superficies las tres deben de ser matrizes
surfc(s1,t1,z);shading interp;%puedes poner shading interp para difuminar los colores de la cuadricula
%Inciso c