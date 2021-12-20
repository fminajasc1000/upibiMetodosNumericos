clc;clear all; close all
A=[2 -1;-3 4];
B=[0;0];
Solucion=inv(A)*B
%Determinante
DET=det(A)
M=[A,B]
%Cero en M (2,1)
%Pivote M(1,1)
M(1,:)=M(1,:)/M(1,1)
M(2,:)=M(1,1)*M(2,:)-M(2,1)*M(1,:)
% Cero en M (2,1)
M(2,:)=M(2,:)/M(2,2)
% % Pivote M(2,2)
M(1,:)=-M(1,2)*M(2,:)+M(1,:)