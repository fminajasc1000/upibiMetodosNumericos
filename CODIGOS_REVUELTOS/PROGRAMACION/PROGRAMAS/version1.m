%programa que solicita una serie de numeros y los clasifica en pares e impares
%ademas nos muestra la cantidad y la lista de como quedaron clasificados
clc
%
num=1
vecPar=[];
vecImpar=[];
vecDes=[];
while num!=0 
    num=input('Dame un numero');
    if num==-1 | num==1
      vecImpar(end+1)=num;
    elseif mod(num, 2)==0
      vecPar(end+1)=num;
    elseif fix(num)~=num %elimina la parte decimal del numero y la comparamos
      vecDes(end+1)=num;
    else
      vecImpar(end+1)=num;
    end
end
fprintf('Tenemos en total de numeros pares %g, y son: \n', length(vecPar));
disp(vecPar());
fprintf('Tenemos en total de numeros impares %g, y son: \n', length(vecImpar));
disp(vecImpar());
fprintf('Tenemos en total de numeros desconocidos %g, y son: \n', length(vecDes));
disp(vecDes());
%fin del programa
