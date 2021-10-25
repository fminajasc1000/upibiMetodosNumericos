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
aux=0;
pos=1;
for ii=1:tam
    pos=ii;
    for iii=1:tam
        if iii==0
            aux = a(ii,iii);
        else
            if (iii>1)
                if abs(a(ii,iii))<abs(aux)
                    pos=iii;
                    aux = a(ii,iii);
                end
            end
        end
    end
    pos
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
    a
end
A_inv=a(:,tam+1:tam*2);
X=A_inv*b;
inv(A);