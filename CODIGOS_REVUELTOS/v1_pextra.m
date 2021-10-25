%Densidad del aire respecto a la altura
clc; close all; clear all
format long
h=[0,3,6,9,12,15,18,21,24,27,30,33]; %Altura en km
d=[1.91000000000000,1.21000000000000,0.770000000000000,0.470000000000000,0.310000000000000,0.190000000000000,0.120000000000000,0.0750000000000000,0.0460000000000000,0.0290000000000000,0.0180000000000000,0.0110000000000000]; %Densidad en kg/m3
%Graficar para verificar la tendencia
plot(h,d,'o','MarkerSize',2,'MarkerFaceColor','r','MarkerEdgeColor','r')
grid on
%Cálculo de los coeficientes del polinomio de segundo grado
A=[length(d),sum(h),sum(h.^2);sum(h),sum(h.^2),sum(h.^3);sum(h.^2),sum(h.^3),sum(h.^4)];
b=[sum(d);sum(d.*h);sum(d.*h.^2)];
[fil,col]=size(A); %Se cuentan las filas y columnas y se otorgan a variables
%Matriz de resultados no homogéneos
M=[A eye(size(A))]; %Formación de la matriz aumentada
for j=1:col
    for i=j:fil-1 %Ciclo de burbuja
        for u=j:fil-1
            if abs(M(u,j))<abs(M(u+1,j))
            aux=M(u,:);
            M(u,:)=M(u+1,:);
            M(u+1,:)=aux;
            end
        end
    end
    M(j,:)=M(j,:)/M(j,j); %Dividiendo entre el valor importante
    for k=1:fil
         if k~=j
             M(k,:)=M(k,:)-M(j,:)*M(k,j);%Convirtiendo las filas no importantes en ceros
         end
    end
end
inv_A=M(:,col+1:2*fil);
x=inv_A*b;
syms D
a_0=x(1);a_1=x(2);a_2=x(3);
P_2=vpa(a_2*D^2+a_1*D+a_0,5);% O bien P=x(3)*L^2+x(2)*L+x(1)
disp('El polinomio de regresión de grado 2 es')
disp(P_2)
%Cálculo de los coeficientes del polinomio de tercer grado
A=[length(d),sum(h),sum(h.^2),sum(h.^3);sum(h),sum(h.^2),sum(h.^3),sum(h.^4);sum(h.^2),sum(h.^3),sum(h.^4),sum(h.^5);sum(h.^3),sum(h.^4),sum(h.^5),sum(h.^6)];
b=[sum(d);sum(d.*h);sum(d.*h.^2);sum(d.*h.^3)];
[fil,col]=size(A); %Se cuentan las filas y columnas y se otorgan a variables
%Matriz de resultados no homogéneos
M=[A eye(size(A))]; %Formación de la matriz aumentada
for j=1:col
    for i=j:fil-1 %Ciclo de burbuja
        for u=j:fil-1
            if abs(M(u,j))<abs(M(u+1,j))
            aux=M(u,:);
            M(u,:)=M(u+1,:);
            M(u+1,:)=aux;
            end
        end
    end
    M(j,:)=M(j,:)/M(j,j); %Dividiendo entre el valor importante
    for k=1:fil
         if k~=j
             M(k,:)=M(k,:)-M(j,:)*M(k,j);%Convirtiendo las filas no importantes en ceros
         end
    end
end
inv_A=M(:,col+1:2*fil);
x=inv_A*b;
syms L
a_0=x(1);a_1=x(2);a_2=x(3);a_3=x(4);
P_3=vpa(a_3*D^3+a_2*D^2+a_1*D+a_0,5);% O bien P=x(3)*L^2+x(2)*L+x(1)
disp('El polinomio de regresión de grado 3 es')
disp(P_3)
hold on
g1=ezplot(P_2,[min(h),max(h)]); %Para graficar el polinomio de grado 2
set(g1,'color','g')%Se definen las características de la gráfica
g2=ezplot(P_3,[min(h),max(h)]); %Para graficar el polinomio de grado 2
set(g2,'color','b')%Se definen las características de la gráfica
title('Densidad del aire en función de la altura')
%Coeficiente de correlación de Pearson
%Polinomio de grado 2
Sr_2=sum((d-subs(P_2,h)).^2);%Se obtiene la suma de residuales
St_2=sum((d-mean(d)).^2); %Sumas totales
r_2=sqrt((St_2-Sr_2)/St_2); %Coeficiente de correlación
disp('El coeficiente de correlación obtenido para el polinomio de grado 2 es de')
disp(r_2)
%Polinomio de grado 3
Sr_3=sum((d-subs(P_3,h)).^2);%Se obtiene la suma de residuales
St_3=sum((d-mean(d)).^2); %Sumas totales
r_3=sqrt((St_3-Sr_3)/St_3); %Coeficiente de correlación
disp('El coeficiente de correlación obtenido para el polinomio de grado 3 es de')
disp(r_3)
%Cálculo de densidad en CDMX y Everest
%Sustitución de datos
CDMX=2.25; dCD_2=subs(P_2,CDMX); dCD_3=subs(P_3,CDMX);
plot(CDMX,dCD_2,'y*')
plot(CDMX,dCD_3,'b*')
fprintf('La densidad del aire en CDMX en base al polinomio 2 es de %f kg/m3 \n',dCD_2)
fprintf('La densidad del aire en CDMX en base al polinomio 3 es de %f kg/m3 \n',dCD_3)
volcan=5.426; 
dvol_2=subs(P_2,everest); 
dvol_3=subs(P_3,everest);

plot(everest,dvol_2,'r*')
plot(everest,dvol_3,'k*')
fprintf('La densidad del aire en el Everest en base al polinomio 2 es de %f kg/m3 \n',dvol_2)
fprintf('La densidad del aire en el Everest en base al polinomio 3 es de %f kg/m3 \n',dvol_3)
legend('datos experimentales','P_2','P_3','P_2(h_1)','P_3(h_1)','P_2(h_2)','P_3(h_2)')
