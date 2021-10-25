clc;
h=[50,75,100,150,200,250]; 
d=[214.500000000000,318.700000000000,423.500000000000,635.600000000000,854.200000000000,1085.80000000000];
  
%plot(l,p,figura,tamaño de la figura,tamaño,color de relleno, color, color del borde, color)
plot(h,d,'o','MarkerSize',4,'MarkerFaceColor','r','MarkerEdgeColor','r')
%suma de todas los elementos de un vector
format long
A=[length(h), sum(h), sum(h.^2); sum(h), sum(h.^2), sum(h.^3);sum(h.^2), sum(h.^3), sum(h.^4)];
B=[sum(d);sum(d.*h);sum(d.*h.^2)];
x=inv(A)*B; %valores a0 a1 y a2
%extraccion de coeficientes del modelo
a_0=x(1);
a_1=x(2);
a_2=x(3);
  
syms ll
%POLINOMIO DE GRADO 2
P_2=a_2*ll^2+a_1*ll+a_0;
vpa(P_2,5)
%grado 3
%suma de todas los elementos de un vector
format long
A=[length(h), sum(h), sum(h.^2), sum(h.^3); sum(h), sum(h.^2), sum(h.^3), sum(h.^4);sum(h.^2), sum(h.^3), sum(h.^4), sum(h.^5);sum(h.^3),sum(h.^4), sum(h.^5), sum(h.^6)];
B=[sum(d);sum(d.*h);sum(d.*h.^2);sum(d.*h.^3)];
x=inv(A)*B; %valores a0 a1 y a2
%extraccion de coeficientes del modelo
a_0=x(1);
a_1=x(2);
a_2=x(3);
a_3=x(4);
syms ll
%POLINOMIO DE GRADO 3
P_3=a_3*ll^3+a_2*ll^2+a_1*ll+a_0;
vpa(P_3,5)
%GRAFICANDO
hold on
aa=ezplot(P_2,[0,max(h)]);
set(aa,'Color','g');
a2=ezplot(P_3,[0,max(h)]);
set(a2,'Color','b');
legend('Pts. experimentales', 'P_2(ll)', 'P_3(ll)');
% r^2 POLINOMIO DE SEGUNDO GRADO
sr=vpa(sum((d-subs(P_2,h)).^2),5)
st=vpa(sum((d-mean(d)).^2),5)
r=sqrt((st-sr)/st)
sr=vpa(sum((d-subs(P_3,h)).^2),5)
st=vpa(sum((d-mean(d)).^2),5)
r=sqrt((st-sr)/st)
disp('ENTALPIA P_2:')
disp(vpa(subs(P_3,110)))
disp('ENTALPIA P_3:')
disp(vpa(subs(P_3,100)))
  
%el de grado tres numericamente es el mejor
%pero decidimos con respecto a la grafica y a numericamente.
