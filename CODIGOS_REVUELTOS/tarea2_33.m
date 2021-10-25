clear;close all;clc
f=@(x)7*(pi^(1/3))*x^9-2*(x^8)/3+(x^7)/exp(3)-pi*x^6+sqrt(2)*x^5-sqrt(11)*x^4+log(6)*x^3-4*exp(1)*x^2+exp(2)*x+5*sqrt(pi)

% d1=7*(pi^(1/3))*x^9;
% d2=2*(x^8)/3;
% d3=(x^7)/exp(3);
% d4=pi*x^6;
% d5=sqrt(2)*x^5;
% d6=sqrt(11)*x^4;
% d7=log(6)*x^3;
% d8=4*exp(1)*x^2;
% d9=exp(2)*x;
% d10=5*sqrt(pi);
% %f=@(x)d1-d2+d3-d4+d5-d6+d7-d8+d9-d10
f(0)
fplot(f,[-5,5]);
hold on
syms x
t=vpa(diff(f(x)),5)
g=ezplot(t,[-5,5]);
set(g,'Color','g')
a=3;
b=1;
r=(a+b)/2;
e=(b-a)/2;
tol=0.00001;
while e>tol
    if f(r)==0
        e=0;
    else
        if f(a)*f(r)<0 %por una ultiplicacion
            a=r;
        else
            b=r;
        end
        r=(a+b)/2;% Se aproxima a raiz hasta obtener e=0, es decir. la f(r)=0
        e=(b-a)/2;% se calcula el error
    end
end %Para funcion anonima 
r
t=vpa(f(a),5)
% pause
%         
% 
% %p=vpa(diff(t(x)),5)
% %ezplot(p)
% while e>tol
%         if f(a) & f(b) > f(r)
%             if f(a)<f(b)
%                 b=r;
%             else
%                 a=r;
%             end
%         end
%         r=(a+b)/2;
%         e=(b-a)/2;
%     
% end
% r
% %subs(f,r)
% t(r)