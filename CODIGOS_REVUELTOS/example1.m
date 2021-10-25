n=input('INGRESE EL LIMITE: ');
A=[];
i=1;
cont=0;
while cont<n %el contador se detendra cuando existan 10 numeros primos
    if isprime(i)==1 %funcion es primo, nos dice si un numero es primo
        A=[A,i];    %almacena los valores primos en un vector
        cont=cont+1;%cuenta la cantidad de primos 
    end
    i=i+1;%contador infinito
end
display(A)