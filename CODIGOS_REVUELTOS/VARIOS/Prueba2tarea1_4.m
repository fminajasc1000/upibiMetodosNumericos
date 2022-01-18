I=[1,0,0,0,0;0,1,0,0,0;0,0,1,0,0;0,0,0,1,0;0,0,0,0,1];
A=[1.77245385090552,0,0.200000000000000,0.443113462726379;0.500000000000000,1.41421356237310,-1.41421356237310,-2.45107271907545;0,0.500000000000000,3.14159265358979,2.43448587240325;0,0,0,1.57079632679490];
format long
a=[A I];
a=[A eye(size(a))];

% aux=a(4,:); %se guarda el reglon 4 en la variable auxiliar 
% a(4,:)=a(1,:);
% a(1,:)=aux;% se vacia lo que habia en la variablñe auxiliar
a(1,:)=a(1,:)/a(1,1);% ya buscado el mejor candidator, el reglon donde se quiere tener el "1" se divide entre el pivote(el mejor pivoteo ) ah esto de le llama pivoteo
% % a(2,:)=a(2,:)-a(1,:)*a(2,1);
% % a(3,:)=a(3,:)-a(1,:)*a(3,1);
% % a(4,:)=a(4,:)-a(1,:)*a(4,1);
% %Se observa que lo anterior es repetitivo
% a
for i=1:5
    if i~=1
        a(i,:)=a(i,:)-a(1,:)*a(i,1);
    end
end

% aux=a(5,:);
% a(5,:)=a(2,:);
% a(2,:)=aux;
a(2,:)=a(2,:)/a(2,2);
% % a(1,:)=a(1,:)-a(2,:)*a(1,2);
% % a(3,:)=a(3,:)-a(2,:)*a(3,2);
% % a(4,:)=a(4,:)-a(2,:)*a(4,2);
for i=1:5
    if i~=2
        a(i,:)=a(i,:)-a(2,:)*a(i,2);
    end
end
% aux=a(3,:);
% a(3,:)=a(4,:);
% a(4,:)=aux;
a(3,:)=a(3,:)/a(3,3);
for i=1:5
    if i~=3
        a(i,:)=a(i,:)-a(3,:)*a(i,3);
    end
end
a(4,:)=a(4,:)/a(4,4);
% for i=1:4
%     if i~=4
%         a(i,:)=a(i,:)-a(4,:)*a(i,4);
%     end
% end
% A_inv=a(:,5:8);
% inv(A);
% x=A_inv*b
a(5,:)=a(5,:)/a(5,5);
for i=1:5
    if i~=5
        a(i,:)=a(i,:)-a(5,:)*a(i,5);
    end
end
a
inv(A)
A_inv=a(:,6:10);
X=A*B;
fprintf('El Resultado de la ecuación es la siguiente',X);
X