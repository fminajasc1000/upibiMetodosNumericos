%Matriz inversa
clear all;
clc;
A=[1.19000000000000,2.11000000000000,-100,0.330000000000000,0.500000000000000,1;14.2000000000000,-0.122000000000000,12.2000000000000,-1.24000000000000,0.250000000000000,-1;0,100,-99.9000000000000,0.0600000000000000,0.200000000000000,1;15.3000000000000,0.110000000000000,-13.1000000000000,-39.1500000000000,-0.125000000000000,-1;0.230000000000000,0,11.1000000000000,-70.2000000000000,-0.100000000000000,1;-10.1000000000000,-28.4000000000000,0.0800000000000000,50,0,-1];
b=[-1.12000000000000;-3.44000000000000;-2.15000000000000;-4.16000000000000;-8.75000000000000;9.01000000000000];
%matriz aumentada a=[A,b]
format long
%a=[A b]
a=[A eye(size(A))]
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
A_inv=a(:,tam+1:tam*2);
X=A_inv*b
inv(A);

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



