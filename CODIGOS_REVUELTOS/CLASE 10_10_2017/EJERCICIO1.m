   % UN INVESTIGADOR AH REPORTADO LOS SIGUIENTES DATOS
   % C=0.5,0.8,1.5,2.5,4
   % K=1.1,2.5,5.3,7.6,8.9
   %QUE CORRESPONDEN A UN EXPERIMENTO PARA DETERMINAR LA TASA DE
   %CRECIMIENTO K DE UNA BACTERIA COMO FUNCION DE LA CONCENTRACION DE
   %OXIGENO (C). SE SABE QUE TALES DATOS PUEDEN SER MODELADOS POR LA
   %SIGUIENTE ECUACION:
   % K=(KMAXC^2)/CS+C^2
   %ENCUENTRE EL SISTEMA MATRICIAL DE KMAX Y CS INTENTANDO LINEALIZAR EL
   %MODELO, PARA PREDECIR LA TASA DE CRECIMIENTO CUANDO LA CONCENTRACION DE
   %OXIGENO ES DE 2 MG/L.
   %ESTABLEZCA EL SISTEMA MATRICIAL QUE PERMITA RESOLVER EL PROBLEMA Y UNA
   %GRAFICA QUE MUESTRE LA DISPERSION DE LOS DATOS Y EL MODELO DE AJUSTE.
clc;
clear all;
c=[0.5,0.8,1.5,2.5,4];
k=[1.1,2.5,5.3,7.6,8.9];
plot(c,k,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
x=1./c.^2;
y=1./k;
figure
plot(x,y,'x','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
%si satisface por que el comportamiento es linea
%encontrando a a_1 y a_0 
A=[5,6.22944444444445;6.22944444444445,18.6684433641975];
B=[1.74170865230415;4.37329618220070];

a=[A B];

aux=a(2,:);
a(2,:)=a(1,:);
a(1,:)=aux;

a(1,:)=a(1,:)/a(1:1);
a(2,:)=a(2,:)-a(1,:)*a(2,1);

%parte 2
a(2,:)=a(2,:)/a(2,2);
a(1,:)=a(1,:)-a(2,:)*a(1,2);
%continuando con el programa
x=inv(A)*B;

a_0=x(1);
a_1=x(2);

k_max=1/a_0;
c_s=a_1*k_max;

K=@(c) k_max*c.^2./(c_s+c.^2);

figure
plot(c,k,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
hold on
fplot(K,[0,5],'g');
%evaluar una funcion anonimo
tasa=K(2);

sr=sum((k-K(c)).^2)
st=sum((k-mean(k)).^2)
r=sqrt((st-sr)/st)