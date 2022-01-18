clc;
clear all;
c=[1,2,3,4,5,6,7,8,9,10];
k=[9.40000000000000,7.31000000000000,5.15000000000000,3.55000000000000,2.81000000000000,2.04000000000000,1.26000000000000,0.970000000000000,0.740000000000000,0.580000000000000];
plot(c,k,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
%identificamos
%la funcion es V=V0exp(-1/RC)
%Log(v)=Log(VO*exp(-1/RC))
%Log(v)=log(V0)+log(exp(-1/RC))
%Log(v)=log(V0)+(-1/RC)
%     Y=a0     + a1x
%suponiendo un capacitor de capacitor
x=-1./2000;
y=log(c);
figure
plot(x,y,'x','MarkerSize',3,'MarkerFaceColor','b','MarkerEdgeColor','b');
%si satisface por que el comportamiento es linea
%encontrando a a_1 y a_0
A=[length(c),sum(c);sum(c),sum(c.^2)];
B=[sum(k);sum(k.*c)];
 
X=inv(A)*B;
 
a_0=X(1)
a_1=X(2)
 
v_0=log(a_0)
vv=-1/2000*a_1
 
V=@(t) v_0.*exp(-t/vv);
 
figure
plot(x,y,'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r');
hold on
fplot(V,[0,5],'g');
%evaluar una funcion anonimo
tasa=V(10);
 
sr=sum((y-V(c)).^2)
st=sum((y-mean(k)).^2)
r=sqrt((st-sr)/st)
