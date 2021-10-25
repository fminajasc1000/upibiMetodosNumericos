%examen 1
clc;
clear all;
disp('-------------Ejercicio de Examen1--------');
r='si';
acum=1;
aux=0;
while strcmp(r,'si') || strcmp(r,'SI') || strcmp(r,'sI') || strcmp(r,'Si')
	m=input('Introduzca el valor de m: ');
    n=input('Introduzca el valor de n: ');
    while m<=0 || n<=0 || rem(m,1)~=0 || rem(n,1)~=0
        m=input('\nIntroduzca el valor de m ENTERO Y POSITIVO\n: ');
        n=input('\nIntroduzca el valor de n ENTERO Y POSITIVO\n: ');
    end
    if m>n
        aux=m;
    else
        aux=n;
    end
    for i=2:aux
        if mod(m,i)==0
            acum=acum*i;
        else
            if mod(n,i)==0
                acum=acum*i;
            end
        end
    end
    fprintf('\nEl mcm es: %g', acum);
    acum=0;
    r=input('\nDesea ingresar otro numero: ','s');
end
fprintf('\nAdios gracias por usar el programa\n');

%fin del programa
    