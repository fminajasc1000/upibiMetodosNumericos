clc
clear all;
m=3;
n=3;
a=0;

for i=1:m
    for ii=1:n
        if i==ii
            a=round(rand(1)*9); %se determina un numeroaleatorio
            while rem(a,2)~=0 %se valida si es par
              a=round(rand(1)*9);   %en caso de no serlo se genera otro
            end
            fprintf('%d ', a); %se imprime el numero par
        else
            fprintf('%d ',0);
        end
    end
    fprintf('\n');
end