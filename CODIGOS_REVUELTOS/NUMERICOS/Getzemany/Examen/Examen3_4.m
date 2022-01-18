clc;clear all; close all
A=[1 2 -2 1;-3 14 1 -2;-3 14 1 -7;6 12 -12 -6];
B=[1;4;3;5];
Solucion=inv(A)*B
% Determinante
DET=det(A)
M=[A,B]
% Cero en M (2,1)
% Pivote M(1,1)
M(2,:)=M(1,1)*M(2,:)-M(2,1)*M(1,:)
% Cero en M (3,1)
% Pivote M(1,1)
M(3,:)=M(1,1)*M(3,:)-M(3,1)*M(1,:)
% Pivote M(1,1)
M(4,:)=M(1,1)*M(4,:)-M(4,1)*M(1,:)
% Pivote M(2,2)
M(3,:)=M(2,2)*M(3,:)-M(3,2)*M(2,:)
disp('Incosistencia')
