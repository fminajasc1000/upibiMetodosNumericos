%programa para crear una matriz n*m
clc
clear all;
disp('-------------Programa para rellenar una matriz-----------------');
n=input('Ingrese el numero de filas: ');
m=input('Ingrese el numerp de columnas: ');
while ((n<=0 || m<=0) || (rem(n,1)~=0 || rem(m,1)~=0))
    n=input('Ingrese el numero de filas: ');
    m=input('Ingrese el numerp de columnas: ');
end
H(n,m)=zeros;
for r=1:n
    for s=1:m
        H(r,s)=input('Ingrese un elemento: ');
    end
end
disp('----------------La matris es--------------------------');
%disp(H);
for r=1:n
    for s=1:m
        fprintf('%g ',H(r,s));
    end
    fprintf('\n');
end
[a,b,c,d]=miFuncion(H)

function [A, B, C, D] = miFuncion(H)
    [g,h]=size(H);
    n=g;
    m=h;
    %Insiso a
    A(4)=zeros;
    %insiso b
    B(4)=zeros;
    %insiso c
    C(4)=zeros;
    %insiso d
    D(4)=zeros;
    %variables auxiliares
    cont1=1;
    cont2=1;
    cont3=1;
    cont4=1;
    
    for r=1:n
        for s=1:m
            if cont1<5
                if mod(H(r,s),2)==0
                    A(cont1)=H(r,s);
                    cont1=cont1+1;
                end
            end
            if cont2<5
                if(H(r,s)>1)
                    if (primo(H(r,s))==0)
                        B(cont2)=H(r,s);
                        cont2=cont2+1;
                    end
                end
            end
            
            if (mod(H(r,s),1))
                C(cont3)=H(r,s);
                cont3=cont3+1;
            end

            if mod(H(r,s),7)==0
                D(cont4)=H(r,s);
                cont4=cont4+1;
            end
            
        end
    end

[bb, tam1] = size(C);
[cc, tam2] = size(D);
tam1
tam2
cont1=1;
cont2=1;
CC=zeros;
DD=zeros;

[bb, tamm] = size(C);
[bb, tamn] = size(D);

if tam1>4
    tam1=tam1-4;
    for ii=(1+tam1):tamm
        if cont1<5
            CC(cont1)=C(ii);
            cont1=cont1+1;
        end
    end
    C=CC;
end

if tam2>4
    tam2=tam2-4;
    for ii=(1+tam2):tamn
        if cont2<5
            DD(cont2)=D(ii);
            cont2=cont2+1;
        end
    end
    D=DD;
end


end



function t = primo(n)
%n=input('introduce un número natural: ');
t=0;        % definimos la variable de salida
for i=2:floor(sqrt(n))         % bucle para comprobar divisores 
 if rem(n,i)~=0               
    continue                  % i no es divisor
end   
t=1;
end
end


