A=[pi,2.71828182845905,-0.693147180559945,0.142857142857143;20.0855369231877,-0.333333333333333,0.400000000000000,-0.888888888888889;0.270000000000000,0.0200000000000000,0,-1.22000000000000;100,142,-3521,1820];
%Matriz b
b=[1.41421356237310;-1;-1.37000000000000;7526.20000000000];
%Matriz aumentada
format long
a=[A b];
a=[A eye(size(a))];
a
%v=[a(:,1)]
for k=1:4
    v=[1 1 1 1];
    v=a(:,k);
    n=length(v);
    for i=1:n-1
        for j=k:n-i
            if v(j)>v(j+1)
                x=v(j+1);
                v(j+1)=v(j);
                v(j)=x;
            end
        end
    end
    fprintf('El orden es');
    disp(v);
    for i=1:4
        if i~=4
        a(i,:)=a(i,:)-a(k,:)*a(i,k);
        end
    end
    aux=a(4,:); %se guarda el reglon 4 en la variable auxiliar 
    a(4,:)=a(k,:);
    a(k,:)=aux;% se vacia lo que habia en la variablñe auxiliar
    a(k,:)=a(k,:)/a(k,k);
end
a
A_inv=a(:,5:8);
inv(A);
x=A_inv*b