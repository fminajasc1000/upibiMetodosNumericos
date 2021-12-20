clc;clear all; close all
A=[1 -5;-1 5];
B=[0;0];
Solucion=inv(A)*B
%Determinante
DET=det(A)
disp('Sin solucion')