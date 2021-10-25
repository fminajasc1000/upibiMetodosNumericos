clc
clear all;
H = randi(100,10)
disp(H);
fprintf('Los pares son %d\n',contarPar(H));
fprintf('Los impares son %d\n',contarImpar(H));
fprintf('Los primos son %d\n',contarPrimo(H));
fprintf('Las posiciones estan definidas  de la siguiente manera: \n');
fprintf('1-. Impar y Primo \n');
fprintf('2-. Impar y NO Primo \n');
fprintf('3-. Par y Primo \n');
fprintf('4-. Par y NO Primo \n');
disp(posiciones(H));

function y = posiciones(x)
    y = x; 
     for r=1:10
        for s=1:10
            if esParImpar(x(r,s))==0
                if esPrimo(x(r,s))==1
                    x(r,s) = 1; %impar con primo  =1
                else 
                    x(r,s) = 2; %impar
                end
            else
                if esPrimo(x(r,s))==1
                    x(r,s) = 3; %par con primo  =3
                else 
                    x(r,s) = 4; %par
                end 
            end
        end
     end
     y = x;
end
function y = contarImpar(x)
    y=0;
    for r=1:10
        for s=1:10
            if esParImpar(x(r,s))==1
                y = y +1;
            end
        end
    end
end

function y = contarPar(x)
    y = 0;
    for r=1:10
        for s=1:10
            if esParImpar(x(r,s))==0
                y = y +1;
            end
        end
    end
end

function y = contarPrimo(x)
    y = 0;
    for r=1:10
        for s=1:10
            if esPrimo(x(r,s))==1
                y = y +1;
            end
        end
    end
end

function y = esPrimo(n)
    if n==1
        y=0;
        return
    end
    if n==2
        y=1;
        return
    end
    i=3;
    val=3;
    prime=(1:3);
    while length(prime)~=n
        val=val+2;
        fac=length(factor(val));
        if fac==1
            prime(i+1)=val;
            i=i+1;
        end
    end
    i=1;
    while i<=length(prime)
        if n==prime(i)
            y=1;
            return; 
        end
        i=i+1;
    end
    y = 0;
end


function y= esParImpar(x)
    if mod(x,2)==0
        y = 1;
    else
        y = 0;
    end
end