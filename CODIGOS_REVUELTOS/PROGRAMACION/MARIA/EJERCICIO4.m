clc;
clear all;
n=input("Ingrese cualquier numero positivo y entero: ");
if n<=0 || rem(n,1)~=0
    n=input("Ingrese cualquier numero positivo y entero: ");
else
    for i=1:n
        fprintf('%d= %d + %d %d', n, (i-1),(n-(i-1)));
        fprintf('\n');
     end    
end

 