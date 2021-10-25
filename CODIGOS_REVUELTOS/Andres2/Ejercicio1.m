clc
clear all
f=inline('3*x*exp(x)-cos(x)'); 

xi=pi;
h=0.01;%,0.025;

syms x
%1derivada centrada
c1=(f(xi+h)-f(xi-h))/(2*h)
ve=double(subs(diff(f(x)),xi))
error1=abs(((ve-c1)/ve)*100)

%2derivada centrada
c2=(f(xi+h)-2*f(xi)+f(xi-h))/(h^2)
ve2=double(subs(diff(f(x),2),xi))
error2=abs(((ve2-c2)/ve2)*100)

%3derivada centrada
c3=(f(xi+3*h)-3*f(xi+2*h)+3*f(xi+h)-f(xi))/(h^3)
ve3=double(subs(diff(f(x),3),xi))
error3=abs(((ve3-c3)/ve3)*100)