clear
clc
t=[0.0 0.02 0.04 0.06 0.08];
i=[0.0 0.09180 0.01966 0.01928 0.01602];
n=length(t);

for k=1:n
 if k==1||k==2
 h=t(k+1)-t(k);
 vadx(k)=(i(k+1)-i(k))/h;
 fprintf('da= %4.6g\n',vadx(k))
 elseif k==n||k==n-1
 h=abs(t(k-1)-t(k));
 vatdx(k)=(i(k)-i(k-1))/h;
 fprintf('dat= %4.6g\n',vatdx(k))
 else
 h=t(k+1)-t(k);
 vcdx(k)=(i(k+1)-i(k-1))/(2*h);
 fprintf('dc= %4.6g\n',vcdx(k))
 end
end