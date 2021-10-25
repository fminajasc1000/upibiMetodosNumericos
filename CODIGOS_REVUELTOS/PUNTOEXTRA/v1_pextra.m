%Nombre: Minajas Carbajal Francisco Javier
%Grupo: 4FV3
clear all;
clc;
A=[3.14159265358979,2.71828182845905,0.693147180559945,0.142857142857143;
20.0855369231877,-0.333333333333333,0.400000000000000,-0.888888888888889;
0.270000000000000,0.0200000000000000,0,-1.22000000000000;
100,142,-3521,1820];

b=[1.41421356237310;-1;-1.37000000000000;7526.20000000000];
%matriz aumentada a=[A,b]
format long
a=[A b]
tam=size(a,1);
pos=1;

for ii=1:tam
    pos=0;
    aux=a(:,ii);
    aux=transpose(aux);
    pos=posicion(aux,ii);
    aux2=a(pos,:);
    a(pos,:)=a(ii,:);
    a(ii,:)=aux2;
    %pivoteamos
    for iii=1:tam
        if a(ii,ii)~=0
            a(ii,iii)=a(ii,iii)/a(ii,ii);
        else
            a(ii,iii)=0;
        end
    end
    
    for i=1:tam
        if i~=ii
            a(i,:)=a(i,:)-a(ii,:)*a(i,ii);
        end
    end
    %a
    
end
format long 
a

function y=posicion(a,b)
    format rat
    [m n]=size(a);
    for c=1:b
        if c<b
            a(1,c)=0;
        end
    end
    for c=1:n
        a(1,c)=abs(a(1,c));
    end
    
    numeromayor=a(1,1);
    iposicion=1;
    
    for x=1:n
        if a(1,x)>numeromayor
            numeromayor=a(1,x);
            iposicion=x;
        end
    end
    y=iposicion;
end