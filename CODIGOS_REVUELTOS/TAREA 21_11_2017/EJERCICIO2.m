%definimos los vectores con informacion
t=[160,180,200,220,240,260,280,300];
v=[10.293372,10.330671,10.368179,10.405925,10.443936,10.482245,10.520884,10.559888];
figure (1)
plot(t,v,'o','markerfacecolor','r');

syms T

L(1)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(1)-t(2))*(t(1)-t(3))*(t(1)-t(4))*(t(1)-t(5)));
L(2)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(2)-t(1))*(t(2)-t(3))*(t(2)-t(4))*(t(2)-t(5)));
L(3)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(3)-t(1))*(t(3)-t(2))*(t(3)-t(4))*(t(3)-t(5)));
L(4)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(4)-t(1))*(t(4)-t(2))*(t(4)-t(3))*(t(4)-t(5)));
L(5)=((T-t(2))*(T-t(3))*(T-t(4))*(T-t(5)))/((t(5)-t(1))*(t(5)-t(2))*(t(5)-t(3))*(t(5)-t(4)));

P=v(1)*L(1)+v(2)*L(2)+v(3)*L(3)+v(4)*L(4)+v(5)*L(5);

figure (2)
ezplot(P,[min(t),max(t)]);
vpa(abs(subs(P,t)))
vpa(abs(subs(P,100)))