%este programa determina si el numero es primo
clc
clear all;
disp('Este programa evalua si el numero es primo o no');
r='si';
while strcmp(r,'si')==1
    n=input('Ingrese el numero a evaluar: ');
    while n<=0||rem(n,1)~=0
        n=input('Recuerde que para que sea un numero primo este debe ser positivo intente de nuevo un numero: ');
    end
    c=0;
    k=1;
    while k<=n
        if rem(n,k)==0
            c=c+1;
        end
            k=k+1;
    end
    if c==2||c==1
        disp('Es primo')
    else
        disp('No es primo')
    end
    r=input('Desea ingresar otro numero: ', 's');
end
disp('Fin del programa');
%fin del programa
