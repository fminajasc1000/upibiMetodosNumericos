clc; clear all;
t=[-1,-0.5,0,1,1.75,2.5,3.5];
v=[2,-3,1.5,-1,0.5,0.75,-2];
	 
%numero de trapecios
k=1;
%sumatoria
s=0;
s1=0;
s2=0;
%h
h=(v(1)-v(7))/(3*k);
 
for i=1:7
    if rem(i,3)==0
        s2=s2+(v(i)+i*h);
    else
        s1=s1+(v(i)+i*h);
    end
end
format long
I=(3*h)/8*(v(1)+3*s1+2*s2+v(7))
