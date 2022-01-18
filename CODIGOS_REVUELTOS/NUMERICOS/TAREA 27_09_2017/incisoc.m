%Se sabe que la solucion general de una ecuacion diferencial esta dada por
%y(t)=c1*exp(0.01*t)+c2*exp(-0.01*t)+c3*exp(pi*t)+c4*exp(-pi*t)
%Determine los valores de las constantes si se sabe que las condiciones iniciales son
%y(0)=0
%y´(0)=-exp
%y´´(0)=-log(3)
%y´´´(0)=sqrt(2)
%Establezca el sistema de ecuaciones que le permitan encontrar los coeficientes Ci
%, i = 1, ..., 4, y utilice el Metodo de Gauss-Jordan para resolverlo. Escriba la solucion particular que satisface las condiciones iniciales.
clear all;
clc;
syms t
y=@(t)c1*exp(0.01*t)+c2*exp(-0.01*t)+c3*exp(pi*t)+c4*exp(-pi*t);
diff c2*exp(-0.01*t)




