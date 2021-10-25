%el usuario debe adivinar un numero que piense la maquina
disp('-------------Adiviname--------');
num=randi([1,100],1);
cont=0;
ok=0;
while cont~=10 && ok==0
    n=input('Por favor introduzca un numero: ');
    if n==num
        ok=1;
    else
        if n>num
            disp('por abajo');
        else 
            disp('por arriba');
        end
    end
    cont=cont+1;
    
end
if ok==1
    fprintf('Adivinaste en %g veces',cont);
else
    disp('Fallaste :(');
end
%fin del programa
    