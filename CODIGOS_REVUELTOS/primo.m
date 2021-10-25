% Programa numeroprimo.m
% Programa para identificar si un número es primo o no
n=input('introduce un número natural: ');
t='el numero es primo';        % definimos la variable de salida
for i=2:floor(sqrt(n))         % bucle para comprobar divisores 
 if rem(n,i)~=0               
    continue                  % i no es divisor
end   
t='el numero no es primo';
end
disp(t)