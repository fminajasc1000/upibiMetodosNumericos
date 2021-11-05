%problema 3
clc
clear all;
syms a
A=[0.15 0.1 7.5;
   0.6 0.75 50]
%HACEMOS CERO LA PRIMER COLUMNA DE LAS FILAS 2 Y 3
A(1,:)=A(1,:)/A(1,1)
A(2,:)=A(2,:)-A(1,:)*A(2,1)
%HACEMOS UNO EL ELEMENTO 2,2
A(2,:)=A(2,:)/A(2,2)
A(1,:)=A(1,:)-A(2,:)*A(1,2)
proteina = A(1,3)
carbohirato = A(2,3)