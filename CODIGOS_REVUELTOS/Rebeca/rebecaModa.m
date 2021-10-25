function [salida] = rebecaModa(entrada)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
longuitud = length(entrada);
mitad = round(longuitud/2);
%ordenar vector de entrada
B = sort(entrada);
%ahora obtenemos un vector con los elementos no repetidos
C= unique(B);
%obtenemos la longuitud de este nuevo vector y la compararemos con el
%anterior.
R = C;
if(length(B)==length(C)) %no hay numeros repetidos
    %MOSTRAR MODA DEPENDIENDO DE LA CANTIDAD DE DATOS
    if(rem(longuitud,2)==0)%entrada par
        salida = [B(mitad), B(mitad+1)];
    else%entrada impar
        salida = B(mitad);
    end
else %hay numeros repetidos
    cont = 0;
    for i=1:length(C)
        for ii=1:length(B)
            if(C(i)==B(ii))
                cont=cont+1;
                R(i)=cont;
            else
                cont=0;
            end
        end
    end
   valor = max(R);
   cont5=0;
   for i=1:length(R)
       if(R(i)==valor)
           cont5 = cont5+1;
           Y(cont5) = C(i);
       end
   end
   
   salida=Y;
end
end

