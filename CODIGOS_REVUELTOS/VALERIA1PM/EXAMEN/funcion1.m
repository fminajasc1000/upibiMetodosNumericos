function [outputArg1,outputArg2] = funcion1(inputArg1,inputArg2)

letras = ['a', 'e', 'i', 'o', 'u', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w','x', 'y', 'z'];
salida = zeros;
salida2 = zeros;

for i=1:length(inputArg2)
   for j=1:length(letras)
       if(letras(j) == inputArg2(i))
        salida(i) = j;
       end
   end
end


for i=1:inputArg1
    salida2(i) = randi(26);
end

salida3 = char()
for i=1:length(letras)
    
   for j=1:length(salida2)
      
       if(i == salida2(j))
         disp(letras(i))
         salida3(j) = letras(i);
         %disp(letras(i))
       end
   end
end

salida2

outputArg1 = salida;
outputArg2 = salida2;
end

