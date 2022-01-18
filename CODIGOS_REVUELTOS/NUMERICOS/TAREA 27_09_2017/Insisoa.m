%Metodo por Gauss Jordan
clear all;
clc;
A=[25,-300,1050,-1400,630;-300,4800,-18900,26880,-12600;1050,-18900,79380,-117600,56700;-1400,26880,-117600,179200,-88200;630,-12600,56700,-88200,44100];
b=[1;0;1;0;1];
%matriz aumentada a=[A,b]
format long
a=[A b]
pos=0;
tam=size(a,1);
for ii=1:tam
    pos=ii;
    for iii=1:tam
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
a