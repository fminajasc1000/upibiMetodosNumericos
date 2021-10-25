clc
clear all
t=[-3,-2,-1,0,0.5,1,1.5,3,4.5];
v=[4.1,2.5,0.3,-0.4,-1,-3.6,0,2.3,5.9];
	 
%numero de trapecios
k=1;
%sumatoria
s=0;
s1=0;
s2=0;
%h
h=(v(1)-v(9))/(3*k);
 
for i=1:9
    if rem(i,3)==0
        s2=s2+(v(i)+i*h);
    else
        s1=s1+(v(i)+i*h);
    end
end
format long
I=(3*h)/8*(v(1)+3*s1+2*s2+v(9))
