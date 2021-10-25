%eN LA FIGURA DE MUESTRA UN CIRCUITO, EL CUAL TIENE UNA AUTOINDUCTANCIA DE
%100 HENRYES, UNA RESISTENCIA DE 2 OHMS Y UNA FUENTE DE VOLTAJE DE
%CORRIENTE DIRECTA DE 10 VOLTS. SI EL CIRCUITO SE CIERRA EN EL INSTANTE
%T=0, LA CORRIENTE CAMBIA SEGUN LA FORMULA: LDI/DT+R*I=V. CONSIDERANDO UN
%TAMAÑO DE PASO DE 0.02 (H), APLIQUE
%A) EULAER HACIA DELANTE
%B)R-K SEGUNDO ORDEN
%C)R-K TERCER ORDEN
%D)R-K CUARTO ORDEN
%E) COMPARE CON LA SOLUCION EXACTA DE LA ECUACION DIFERENCIAL
%--------------------------------EULER---------------------------------%
clc;
clear all;
%funcion de dos variables
V=10;
R=2;
L=100;
f=@(t,I)(V-R*I)/L;
%segundo ingrediente condicion inicial
t(1)=0;
I(1)=0;
%tercer ingrediente tamaño de paso "h"
h=0.002; %dismunuirla garantiza mayor exactitud
%intervalo para resolver "FALTO DEFINIR EN EL PLANTEAMIENTO DEL PROBLEMA"
%0<=t<5
i=1;
while t(i)<=500
    t(i+1)=t(i)+h;
    I(i+1)=I(i)+h*f(t(i),I(i));
    i=i+1;
end
%solucion
SOL_EULER=[t',I'];
plot(t,I,'rx');
grid on
hold on
for i=1:50/h:length(t)
    fprintf(' %3.3f\t%3.5f\n',t(i),I(i));
end
%--------------------------------rk-2---------------------------------%
clear t I i
%primer paso
t(1)=0;
I(1)=0;
i=1;
%ciclo while para el calculo de los parametros
while t(i)<=500
    t(i+1)=t(i)+h;
    k1=h*f(t(i),I(i));
    k2=h*f(t(i+1),I(i)+k1); 
    I(i+1)=I(i)+0.5*(k1+k2);
    i=i+1;
end
SOL_K_2=[t',I'];
plot(t,I,'bo');
grid on
for i=1:50/h:length(t)
    fprintf(' %3.3f\t%3.5f\n',t(i),I(i));
end
%--------------------------------rk-3---------------------------------%
clear t I i
%primer paso
t(1)=0;
I(1)=0;
i=1;
%ciclo while para el calculo de los parametros
while t(i)<=500
    t(i+1)=t(i)+h;
    k1=h*f(t(i),I(i));
    k2=h*f(t(i)+h/2,I(i)+k1/2); 
    k3=h*f(t(i),I(i)-k1+2*k2); 
    I(i+1)=I(i)+1/6*(k1+4*k2+k3);
    i=i+1;
end
SOL_K_3=[t',I'];
plot(t,I,'g*');
grid on
for i=1:50/h:length(t)
    fprintf(' %3.3f\t%3.5f\n',t(i),I(i));
end
%--------------------------------rk-4---------------------------------%
clear t I i
%primer paso
t(1)=0;
I(1)=0;
i=1;
%ciclo while para el calculo de los parametros
while t(i)<=500
    t(i+1)=t(i)+h;
    k1=h*f(t(i),I(i));
    k2=h*f(t(i)+h/3,I(i)+1/3*k1); %ok
    k3=h*f(t(i)+2/3*h,I(i)+1/3*k1+1/3*k2);
    k4=h*f(t(i+1),I(i)+k1-k2+k3);
    I(i+1)=I(i)+1/8*(k1+3*k2+3*k3+k4);
    i=i+1;
end
SOL_K_3=[t',I'];
hold on
plot(t,I,'m*');
grid on
for i=1:50/h:length(t)
    fprintf(' %3.3f\t%3.5f\n',t(i),I(i));
end
% %EN QUE MOMENTO LA CORRIENTE TIEME UN VALOR DE 3.5 AMP
% %-------------------------------------------------------------------------
% %segundo ingrediente condicion inicial
% t(1)=0;
% I(1)=0;
% %tercer ingrediente tamaño de paso "h"
% h=0.002; %dismunuirla garantiza mayor exactitud
% %intervalo para resolver "FALTO DEFINIR EN EL PLANTEAMIENTO DEL PROBLEMA"
% %0<=t<5
% %EN QUE MOMENTO LA CORRIENTE TIEME UN VALOR DE 3.5 AMP
% %-------------------------------------------------------------------------
% clear I t
% i=1;
% while I(i)<=3.5
%     t(i+1)=t(i)+h;
%     I(i+1)=I(i)+h*f(t(i),I(i));
%     i=i+1;
% end
% %solucion
% SOL_EULER2=[t',I'];
% figure
% plot(t,I,'dk');
% disp (t(i)) %instante donde la corriente es 3.5, debe salir 60.8085
%-------------------------------EXACTA------------------------------------
clear I t
syms I(t)
sol_exacta=dsolve(diff(I)==(10-2*I)/100,I(0)==0);
ezplot(sol_exacta,[0,200]);
legend('Euler','RK-2','RK-3','R-K4','Sol_exacta');
