%En la figura se muestran cinco reactores unidos por tuber ??as. Como puede ver, la tasa de transferencia de qu ??micos
%a trav ?es de cada conducto es igual a la tasa de flujo Q (con unidades de m3/s) multiplicado por la concentraci ?on c
%del reactor desde el cual el flujo se origina ( con unidades de mg/m3). Si el sistema est ?a en estado estacionario, el
%flujo de masa de entrada y de salida debe ser igual, por ejemplo, para el primer reactor el balance de masa es
clear all;
clc;
A=[0,0,3,0,0;4,-4,0,0,0;0,2,-180,0,0;0,1,120,-9,2;5,-5,0,0,0];
b=[60;0;-350;0;0];
%matriz aumentada a=[A,b]
format long
%a=[A b]
a=[A eye(size(A))]
k=0;
selectorcol=0;
pos=0;
tam=size(a,1);
for ii=1:tam
    pos=ii;
    for iii=1:tam
        a(ii,iii);
        pos=iii;
        aux = a(ii,iii);
        if (iii~=1)
            if abs(a(ii,iii))>abs(aux)
                pos=iii;
            end
        end
    end
    pos
    aux2=a(pos,:);
    a(pos,:)=a(ii,:);
    a(ii,:)=aux2;
    %pivoteamos
    a(ii,:)=a(ii,:)/a(ii,ii);
    for i=1:tam
        if i~=ii
            a(i,:)=a(i,:)-a(ii,:)*a(i,ii);
        end
    end
end
A_inv=a(:,tam+1:tam*2)
X=A_inv*b
inv(A)