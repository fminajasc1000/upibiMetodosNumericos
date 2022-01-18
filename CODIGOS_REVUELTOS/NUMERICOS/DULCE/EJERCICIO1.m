%%EJERICICO 5 
clc
clear all
x1=[40 27 40 73 64 34 9 8 23 63 65 41 21 38 58] 
x2=[3 3 10 6 6 6 6 10 1 03 10 6 3 3 10] 
y=[273.3 363.8 164.3 40.8 94.3 230.9 366.7 300.6 237.8 121.4 31.4 203.5 441.1 323.0 52.5] 
n=15; 
Sx1=sum(x1) 
Sx2=sum(x2) 
Sy=sum(y) 
Sx12=sum(x1.^2) 
Sx22=sum(x2.^2) 
Sy2=sum(y.^2) 
Sx1y=sum(x1.*y) 
Sx2y=sum(x2.*y) 
Sx1x2=sum(x1.*x2) 
%matriz inversa 
A=[n Sx1 Sx2 Sy; Sx1 Sx12 Sx1y Sx1x2; Sy Sx2y Sy2 Sx22] 
A(1,:)=A(1,:)/A(1,1); 
A(2,:)=A(2,:)-A(1,:)*A(2,1); 
A(3,:)=A(3,:)-A(1,:)*A(3,1) 
%CONVERTIT RL 2,2 EN 1 Y SUS ELEMENTOS RSTANTES EN CERO 
A(2,:)=A(2,:)/A(2,2); 
A(1,:)=A(1,:)-A(2,:)*A(1,2); 
A(3,:)=A(3,:)-A(2,:)*A(3,2) 
%CONVERTIR EL 3,3 EN 1 SUS RESTANTES EN CERO 
A(3,:)=A(3,:)/A(3,3); 
A(2,:)=A(2,:)-A(3,:)*A(2,3); 
A(1,:)=A(1,:)-A(3,:)*A(1,3) 
a0=A(1,4) 
a1=A(2,4) 
a2=A(3,4) 
%ecuaciones 
fY=@(X1,X2)n*a0+a1*X1+a2*X2
ezplot(P_2,[0,max(h)])
fX1y=@(X1,X2)a0*X1+a1.*X1^2+a2*X1X2 
fX2y=@(X1,X2)a0*X2+a1*X1X2+a2*X2^2