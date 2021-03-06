%ejercicio 2 con metodo de biseccion
%lnp=A+B/T+ClnT+DT^E
f=@(T)50.078+(-3492.6/T)+(-6.0669*log(T))+(1.09e-5)*T^2;
fplot(f,[50,200]);
grid on;
tol=1/1000;
a=185;
b=187;
format long;
r=(a+b)/2;
e=(b-a)/2;
while abs(e)>tol
    if f(r)==0;
        e=0;
    else
        if f(0)*f(r)<0;
            b=r;
        else 
            a=r;
        end
        r=(a+b)/2;
        e=(b-a)/2;
    end
end
fprintf('La raiz es %1.3f,con un error de %1.7f\n',r,e)