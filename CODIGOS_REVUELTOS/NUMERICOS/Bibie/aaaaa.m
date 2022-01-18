z=dsolve('Dy*(x^2-1)=(y^2-2)','y(2)=2','x');
simplify(z)
syms x
ezplot(z,[2,7]);
legend ('Euler')
