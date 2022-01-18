clc;clear all;clc
t=[-4,-1,0,1,1.5,2,2.5];
v=[-8,-3,1,2.5,-5,-1,6];
 
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

 
