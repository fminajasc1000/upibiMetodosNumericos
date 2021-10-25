clc;clear all;clc
t=[-3,-2,-1,0,0.5,1,1.5,3,4.5];
v=[4.1,2.5,0.3,-0.4,-1,-3.6,0,2.3,5.9];
 
%numero de trapecios
k=100000;
%sumatoria
s=0;
%h
h=(v(1)-v(length(t)-1))/k;
 
for i=1:length(t)-1
    s=s+(v(i)+i*h);
end
d=h/2*(v(1)+2*s+v(length(t)-1))