clear all
clc
t=[280,310,340,370,400];
cp=[4.87,5.02,5.16,5.25,5.30];
%graficamos
figure(1)
plot(t,cp,'o','MarkerSize',5,'MarkerFaceColor','g','MarkerEdgeColor','g');
legend('Cambio de entropia');
%calculo con pocos puntos
syms X
P=0;
for j=1:length(t)
    L=1;
    for i=1:length(t)
        if i~=j
            L=L*(X-t(i))/(t(j)-t(i));
        end
    end
    P=P+expand(L)*cp(j);
end
L=expand(L);
P=vpa(P,8)
figure(1)
hold on
ezplot(P,[min(t):max(t)]);
legend('Puntos de los datos','Función obtenida');
%caluclo de la integral trapecio
f=@(x)(2.5720165e-9*x^4 - 0.000003590535*x^3 + 0.0018483025*x^2 + 0.41209362*x + 38.359671);
a=300;b=380;
k=100000;%cuantas vecesse va a plicar la formula
s=0;
h=(b-a)/k;
for i=1:k-1
    s=s+f(a+i*h);
end
format long
I=h/2*(f(a)+2*s+f(b))
%Para simpson 1/3
h=(b-a)/(2*k);
s1=0;s2=0;
for i=1:2*k-1
    if rem(i,2)==0
        s2=s2+f(a+i*h);
    else
        s1=s1+f(a+i*h);
    end
end
Is=h/3*(f(a)+4*s1+2*s2+f(b))
%Para simpson 3/8
h=(b-a)/(3*k);
s1=0;s2=0;
for i=1:3*k-1
    if rem(i,3)==0
        s2=s2+f(a+i*h);
    else
        s1=s1+f(a+i*h);
    end
end
   % Is=h/3*(f(a)+3*s1+2*s2+f(b))
    format long
Is=(3*h)/8*(f(a)+3*s1+2*s2+f(b))


