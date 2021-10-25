clc
clear all

mat=[2,3;5,2];
disp(mat)
vec=0;
l = size(mat);
cont=1;


for i=1:l(1)
    for j=1:l(2)
        vec(cont) = mat(i,j);
        cont = cont+1;
    end
end

disp(vec)
