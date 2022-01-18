%Nombre: Minajas Carbajal Francisco Javier
%Grupo: 4FV3
clear all;
clc;
format rat
A=[pi,0,1/5,sqrt(pi)/4;
   1/2,sqrt(2),-sqrt(2),(1/18-sqrt(2)*sqrt(pi));
   0,1/2,pi,(-sqrt(2)/2+pi);
   0,0,0,pi/2];
b=[36.0448172;-25.062208;5.178933;0.7*pi];
%matriz aumentada a=[A,b]
a=[A b];
%a=[A eye(size(A))];
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
