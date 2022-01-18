clc;
clear all;
A=[1 -1 0 0; 0 1 1 0; 0 0 1 2; 2 0 0 -3];
b=[-6;3;4;5]
res=gauss(A,b)

function x = gauss(A,b)
s = length(A);
for j = 1:(s-1)cdsdsddddd
    for i = s:-1:j+1
        m = A(i,j)/A(j,j);
        A(i,:) = A(i,:) - m*A(j,:);
        b(i) = b(i) - m*b(j);
    end
end 
x = zeros(s,1);
x(s) = b(s)/A(s,s);               
for i = s-1:-1:1                    
    sum = 0;
    for j = s:-1:i+1                
        sum = sum + A(i,j)*x(j);    
    end 
    x(i) = (b(i)- sum)/A(i,i);
end 
end