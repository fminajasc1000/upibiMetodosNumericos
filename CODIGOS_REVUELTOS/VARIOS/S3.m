%M�todo de GAUSS JORDAN 
clc
clear all;
%matriz de los coeficientes
A=[1,2,5;2,1,4;1,2,3];
b=[2;4;1];
%Matriz aumentada
format long
a=[A b]
aux=a(3,:); %se guarda el rengl�n 6 en la variable auxiliar
a(3,:)=a(1,:);
a(1,:)=aux;% se vac�a lo que hab�a en la variable auxiliar
a(1,:)=a(1,:)/a(1,1);% ya buscado el mejor candidato, el rengl�n donde se quiere tener el "1" se divide entre el pivote(el mejor pivote)
for i=1:3
    if i~=1
        a(i,:)=a(i,:)-a(1,:)*a(i,1);
    end
end
a(2,:)=a(2,:)/a(2,2);
for i=1:3
    if i~=2
        a(i,:)=a(i,:)-a(2,:)*a(i,2);
    end
end
aux=a(3,:);
a(3,:)=a(3,:);
a(4,:)=aux;
a(3,:)=a(3,:)/a(3,3);
for i=1:3
    if i~=3
        a(i,:)=a(i,:)-a(3,:)*a(i,3);
    end
end
a(3,:)=a(3,:)/a(3,3);
for i=1:3
    if i~=3
        a(i,:)=a(i,:)-a(3,:)*a(i,3);
    end
end
x=a(:,4)
rref ([A b])
