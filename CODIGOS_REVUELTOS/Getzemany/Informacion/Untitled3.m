clear all; clc; close all
format long
x=0:.06:2; 
y=0:.047:2; 
[x,y]=meshgrid(x,y); 
u1=0;
u2=0;
%Función u1
for n=1:220
u1=u1+(2*(n*pi-sin(n*pi))/(n^2*pi^2*sinh((n*pi))).*sinh(n*pi.*x/2).*sin(n*pi.*y/2));
end 
surf(x,y,u1)
xlabel('x')
ylabel('y')
zlabel('u(x,y)')
axis([0,2,0,2,0,1])
%Funcion u2
for n=1:180
Dn=((-2*(-1)^n/(n*pi))+(4/(n*pi)^3)*((-1)^n-1));
Cn=-Dn*coth(n*pi);
u2=u2+(Cn.*sinh(n*pi.*y/2)+Dn.*sinh(n*pi.*y/2)).*sin(n*pi.*x/2);
end
figure
surf(x,y,u2)
xlabel('x')
ylabel('y')
zlabel('u(x,y)')
axis([0,2,0,2,0,1])
%Funcion total
u3=u1+u2; 
figure
surf(x,y,u3)
xlabel('x')
ylabel('y')
zlabel('u(x,y)')
axis([0,2,0,2,0,1])
%Grafica de u contra x
figure
plot(x,u3)
xlabel('x')
ylabel('u(x,t)')
grid on
legend('Grafica u contra x')
%Grafica u contra y
figure
plot(y,u3)
xlabel('y')
ylabel('u(x,t)')
grid on
legend('Grafica u contra y')
%Grafica de contorno
figure 
contour(x,y,u3)
xlabel('x')
ylabel('y')
%Fusion de grafica de contorno y tridimensional
figure
surfc(x,y,u3)
xlabel('x')
ylabel('y')
zlabel('u(x,y)')
axis([0,2,0,2,0,1])
ylabel('y')
    