%Método de GAUSS JORDAN 
clc
clear all;
%matriz de los coeficientes
A=[1,-1,2,4;-4,-2,3,1;1,-1,2,2;6,-3,0,8];
b=[1;2;-2;0];
%Matriz aumentada
format long
a=[A b]
aux=a(4,:); %se guarda el renglón 6 en la variable auxiliar
a(4,:)=a(1,:);
a(1,:)=aux;% se vacía lo que había en la variable auxiliar
a(1,:)=a(1,:)/a(1,1);% ya buscado el mejor candidato, el renglón donde se quiere tener el "1" se divide entre el pivote(el mejor pivote)
for i=1:4
    if i~=1
        a(i,:)=a(i,:)-a(1,:)*a(i,1);
    end
end
a(2,:)=a(2,:)/a(2,2);
for i=1:4
    if i~=2
        a(i,:)=a(i,:)-a(2,:)*a(i,2);
    end
end
aux=a(3,:);
a(3,:)=a(4,:);
a(4,:)=aux;
a(3,:)=a(3,:)/a(3,3);
for i=1:4
    if i~=3
        a(i,:)=a(i,:)-a(3,:)*a(i,3);
    end
end
a(4,:)=a(4,:)/a(4,4);
for i=1:4
    if i~=4
        a(i,:)=a(i,:)-a(4,:)*a(i,4);
    end
end
x=a(:,5)
rref ([A b])
