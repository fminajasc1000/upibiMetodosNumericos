%simpson 3/8
clc;clear all;clc
format long
f=inline('(log(x))^3');
a=2; b=4;
k=3;  %intervalos
h=(b-a)/(3*k);
 
s1=0;
s2=0;
for i=1:3*k-1
	if rem(i,3)==0
    	s2=s2+f(a+i*h);
	else
    	s1=s1+f(a+i*h);
	end
end
I=(3*h)/8*(f(a)+3*s1+2*s2+f(b))
syms x
ve=double(int(f(x),a,b))
error=abs(ve-I/ve)*100