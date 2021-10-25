close all; clear; clc
num=input('Ingrese el numero de elementos: ');
x=input('Ingrese el valor de X: ');
while ((num<=0 || x<=0) || (rem(num,1)~=0 || rem(x,1)~=0))
    num=input('Ingrese el numero de elementos: ');
    x=input('Ingrese el valor de X: ');
end

syms y
for i=1:num
    if i==1
        y = (i*sin(i*pi*x)/2);
    else
        if mod(i,2)==0
            y = y+(i*sin(i*pi*x)/2);
        else
            y = y+(i*cos(i*pi*x)/2);
        end
    end
end
fprintf('y= %s\n',y);