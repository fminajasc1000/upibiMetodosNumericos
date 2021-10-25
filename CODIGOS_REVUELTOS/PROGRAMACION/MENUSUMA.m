%prueba de menu en una operacion
clc
clear all;
a=input('Dame un numero1: ');
b=input('Dame un numero2: ');
op=menu('Operaciones', 'Suma', 'Resta', 'Multiplicacion', 'Division');
if op==1
    r=a+b;
    disp(r);
else
    if op==2
        r=a-b;
        disp(r);
    else
        if op==3
            r=a*b;
            disp(r);
        else
            r=a/b;
            disp(r);
        end
    end
end
