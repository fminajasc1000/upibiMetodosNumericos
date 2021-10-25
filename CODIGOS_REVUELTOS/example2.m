clc
clear all;
m=3;
n=3;

for i=1:m
    for ii=1:n
        if i==ii
            fprintf('%d ',1);
        else
            fprintf('%d ',0);
        end
    end
    fprintf('\n');
end