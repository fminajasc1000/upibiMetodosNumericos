clc;
Clear all
x=[-1 0.45 1.7 2.1 3.45 6.1 7.8 9.7]
y=[0.501 0.157 0.099 0.0887 0.0649 0.043 0.0355 0.03]
plot(x,y,'*')
%figure(2)
%Plot(log(x),y,'*')
%figure(3)
%plot(x,log(y),'*')
%figure(4)
%plot(log(x),log(y),'*')
%figure(5)
%plot(x,1./y,'*')
n=length(x)
Sx=sum(x)
Sx2=sum(x.^2)
Sy=sum(1./y)
Sxy=sum(x.*1./y)
A=[n Sx Sy Sx Sx2 Sxy]
A(1,:)=A(1,:)/A(1,1)
A(2,:)=A(2,:)-A(1,:)*A(2,1)
A(2,:)=A(2,:)-A(2,2)
A(1,:)=A(1,:)-A(2,:)*A(1,2)
b=A(1,3)
m=A(2,3)
Y=@(X)1./(b+m*X)
X=min(x):0.1: max(x)
figure(1)
hold on
plot(X,Y(X))