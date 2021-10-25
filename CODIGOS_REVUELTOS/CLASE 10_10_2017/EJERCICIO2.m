%PARA CALIBRAR UN MEDIDOR DE ORIFICIO SE MIDE LA VELOCIDAD V DE UN FLUIDO Y
%LA CAIDA DE PRESION DEL TAPE.
%LOS DATOS EXPERIMENTALES SE DAN A CONTINUACION Y SE BUSCAN LOS MEJORES
%PARAMETROS A Y B, DE LA ECUACION QUE REPRESENTE A ESTOS DATOS
%V(P/S)=[3.83,4.17,4.97,6.06,6.71,7.17,7.51,7.98,8.67,9.39,9.89];
%AP(MMHG)=[30.00,35.5,50.5,75.0,92.0,105.0,115.0,130.0,153.5,180.0,199.5];
% LA ECUACION ES v=a(AP)^b
% DONDE V ES LA VELOCIDAD PROMEDIO EN PIES/S
% Y AP ES LA CAIDA DE PRESION EN MMHG
%ENCUENTRE LOS PARAMETROS YINDICADOS A Y B Y CON EL MODELO, ESTIME LA
%VELOCIDAD PROMEDIO, CUANDO LA CAIDA DE PRESION ES DE 140 MMHG.
%HACER LAS GRAFICAS
%MODELO POTENCIAL
clc
clear all;
v=[3.83,4.17,4.97,6.06,6.71,7.17,7.51,7.98,8.67,9.39,9.89];
p=[30.00,35.5,50.5,75.0,92.0,105.0,115.0,130.0,153.5,180.0,199.5];
%LINEALIZANDO EL MODELO TENEMOS

plot(p,v,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
figure
loglog(p,v,'x','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
grid on
x=log(p);
y=log(v);

A=[length(x),sum(x);sum(x),sum(x.^2)]
B=[sum(y);sum(y.*x)]
    
X=inv(A)*B;

a_0=X(1)
a_1=X(2)

a=exp(a_0)
b=a_1

V=@(P) a*P.^b;
figure
plot(p,v,'o','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
hold on
fplot(V,[0,200],'g');
velocidad=V(140)

sr=sum((v-V(p)).^2)
st=sum((v-mean(v)).^2)
r=sqrt((st-sr)/st)