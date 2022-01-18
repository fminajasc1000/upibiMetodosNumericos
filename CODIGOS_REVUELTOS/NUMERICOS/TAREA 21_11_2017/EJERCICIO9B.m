t=[0,6,12,18,24,30,36,42,48,54,60,66,72];
v=[124,134,148,156,147,133,121,109,99,85,78,89,104];

%numero de trapecios
k=1;
%sumatoria
s=0;
%h
h=(v(1)-v(13))/(3*k);

for i=1:12
    if rem(i,3)==0
        s2=s2+(v(i)+i*h);
    else
        s1=s1+(v(i)+i*h);
    end
end
format long
I=(3*h)/8*(v(1)+3*s1+2*s2+v(13))