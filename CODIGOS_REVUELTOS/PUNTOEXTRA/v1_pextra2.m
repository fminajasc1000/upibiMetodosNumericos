%Nombre: Minajas Carbajal Francisco Javier
%Grupo: 4FV3
clear all;
clc;
A=[1.77245385090552,0,0.200000000000000,0.443113462726379;
   0.500000000000000,1.41421356237310,-1.41421356237310,-2.45107271907545;
   0,0.500000000000000,3.14159265358979,2.43448587240325;
   0,0,0,1.57079632679490];
b=[1.41421356237310;-1;-1.37000000000000;7526.2000000000];
%matriz aumentada a=[A,b]
format long
%a=[A b]
a=[A eye(size(A))];
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
A_inv=a(:,tam+1:tam*2)
X=A_inv*b;
inv(A)

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

