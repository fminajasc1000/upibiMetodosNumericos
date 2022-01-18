clc;clear all; close all
A=[1 2 -1;2 -4 3;3 7 -1];
B=[0;0;0];
Solucion=inv(A)*B
%Determinante
DET=det(A)
M=[A,B]
%Cero en M (2,1)
%Pivote M(1,1)
M(2,:)=M(1,1)*M(2,:)-M(2,1)*M(1,:)
%Cero en M (3,1)
%Pivote M(1,1)
M(3,:)=M(1,1)*M(3,:)-M(3,1)*M(1,:)
%Cero en M(3,2)
%Pivote en (2,2)
M(3,:)=M(2,2)*M(3,:)-M(3,2)*M(2,:)
%Sustitucion 
z=M(3,4)/M(3,3)
y=(M(2,4)-M(2,3)*z)/M(2,2)
x=(M(1,4)-M(1,2)*y-M(1,3)*z)/M(1,1)
%Grafico 3D
xx=-9:0.1:9;
yy=-9:0.1:9;
[X,Y]=meshgrid(xx,yy);
z1=-X-Y;
z2=(-2*X+4*Y)/3;
z3=3*X+7*Y;
mesh(X,Y,z1)
hold on
mesh(X,Y,z2)
mesh(X,Y,z3)
plot3(x,y,z,"m^")
fprintf('x=%g \n y=%g \n z=%g',x,y,z)