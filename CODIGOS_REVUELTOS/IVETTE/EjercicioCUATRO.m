clc
clear all;
A=-2:0.2:2;
X = matriz(A)
Y = transpose(X);
Z= X.*exp(-X.^2-Y.^2);
plot3(X,Y,Z)
grid on

function y = traspose(A)
     y=zeros(21,21);
     for r=1:21
         for s=1:21
             y(r,s)=A(s,r);
         end
     end
end
function y = matriz(A)
    y=zeros(21,21);
     for r=1:21
         for s=1:21
             y(r,s)=A(s);
         end
     end
end
