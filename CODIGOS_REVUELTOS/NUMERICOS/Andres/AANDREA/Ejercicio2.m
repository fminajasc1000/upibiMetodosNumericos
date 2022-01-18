clc
clear all;
t=[0 0.1 0.2 0.3 0.4 0.5];
v=[1 7 4 3 5 2];
%numero de trapecios
k=100000;
%sumatoria
s=0;
%h
h=(v(1)-v(5))/k;
for i=1:6
    s=s+(v(i)+i*h);
end
trapecio=h/2*(v(1)+2*s+v(5))
%simpson 3/8
s1=0;s2=0;
%sumatoria
s=0;
%h
h=(v(1)-v(6))/(3*k);
 
for i=1:5
    if rem(i,3)==0
        s2=s2+(v(i)+i*h);
    else
        s1=s1+(v(i)+i*h);
    end
end
format long
IS38=(3*h)/8*(v(1)+3*s1+2*s2+v(6))
%simpson 1/8
s1=0;s2=0;
%sumatoria
s=0;
%h
h=(v(1)-v(6))/(3*k);
for i=1:5
    if rem(i,3)==0
        s2=s2+(v(i)+i*h);
    else
        s1=s1+(v(i)+i*h);
    end
end
format long
IS31=(h)/3*(v(1)+4*s1+2*s2+v(6))
