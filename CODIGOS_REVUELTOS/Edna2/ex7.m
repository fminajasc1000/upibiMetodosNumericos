%simpson 3/8
clc;clear all;
format long
NN=10;
f=@(x)x;
a=2; b=4;
k=6; %numero de intervalos
h=(b-a)/(3*k);
f=f+x;
s1=0;
s2=0;
for i=1:3*k-1
	if rem(i,3)==0
    	s2=s2+f(a+i*h);
	else
    	s1=s1+f(a+i*h);
	end
end
syms x
I=(3*h)/8*(f(a)+3*s1+2*s2+f(b))
ve=double(int(f(x),a,b))
abs((I-ve)/ve)*100