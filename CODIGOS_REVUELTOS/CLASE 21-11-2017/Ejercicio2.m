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
%EN QUE MOMENTO LA CORRIENTE TIEME UN VALOR DE 3.5 AMP
%-------------------------------------------------------------------------
i=1;
while I(i)<=3.5
    t(i+1)=t(i)+h;
    I(i+1)=I(i)+h*f(t(i),I(i));
    i=i+1;
end
%solucion
SOL_EULER=[t',I'];
figure
plot(t,I,'dk');
grid on
hold on
disp (t(i)) %instante donde la corriente es 3.5, debe salir 60.8085