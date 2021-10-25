clc;
clear all;
tama=input('Ingrese el mayor exponente del polinomio A: ');
tamb=input('Ingrese el mayor exponente del polinomio B: ');
tama=tama+1;
tamb=tamb+1;
val=0;
disp('POLINOMIO A');
for i=1:tama
  val=input('Ingrese el valor del polinomio A: ');
  if rem(val,1)~=0
    val=input('Ingrese el valor del polinomio A como numero ENTERO: ');
  end
  p(i)=val;
end
disp('POLINOMIO B');
for i=1:tamb
  val=input('Ingrese el valor del polinomio B: ');
  if rem(val,1)~=0
    val=input('Ingrese el valor del polinomio B como numero ENTERO: ');
  end
  q(i)=val;
end

%p=[2 0 5 -3];
%q=[2 -3 4 0];
suma=p+q;
disp('La suma es es\n ');
disp(suma);
resta=p-q;
disp('La resta es es\n ');
disp(resta);
multiplicacion=conv(p,q);
disp('La multiplicacion es es\n ');
disp(multiplicacion);
division=deconv(p,q);
disp('La division es es\n ');
disp(division);