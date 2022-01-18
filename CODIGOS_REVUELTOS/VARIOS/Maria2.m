clc
clear all;

limitesup = 300;
divisor1=3;
divisor2=7;

for i=0:limitesup
    if rem(i,divisor1)==0 && rem(i,divisor2)==0
        fprintf('\n Multiplo= %d', i);
    end
end
fprintf('\n');