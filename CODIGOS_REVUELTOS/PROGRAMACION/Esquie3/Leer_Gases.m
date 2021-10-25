function [b, c, d] = Leer_Gases()
%LEER_GASES Summary of this function goes here
%   Detailed explanation goes here
    clc
    b=0;
    d=0;
    disp('Leer Gas en Archivo');
    disp(' ');
    nombre=input('Por Favor Ingrese el Nombre del Gas: ' ,'s');
    
    %
    contador=0;%se inicializa en cero el contador de los diferentes gases
    fid = fopen('Gases.txt');%se abre el archivo de gases
    tline = fgetl(fid);%se obtiene la informacion del primer gas
    while ischar(tline)%se obtiene la informacion por fila del archivo.
        %disp(tline)
        tline = fgetl(fid);%se obtiene la informacion del n gases
        contador=contador+1;%se cuenta caga gas nuevo obtenido pero en este ciclo no se guardan
    end
    fclose(fid);% se cierra el archivo
    
    %
    vector = strings(contador,1);%Se inicializa un vector con la cantidad de gases detectados
    fid = fopen('Gases.txt');%se reabre el archivo de gases
    tline = fgetl(fid);%se obtiene el primer gas
    vector(1,1)=tline;%se guarda este primer gas en el primer elemento del vector

    n=1; %el valor de n vale uno por que ya se guardo un gas
    while ischar(tline)%lee fila x fila de cada gas en el archivo
        %disp(tline)
        tline = fgetl(fid);%se obtiene el gas
        vector(n+1,1) = tline;%se guarda el gas en el vector
        n=n+1;%se incrementa el valor de n
    end
    fclose(fid);%se cierra el archivo
    
    bb=contains(vector,nombre);%se pregunta si en el vector existe el nombre del gas y se regresa un vector con el resultado
    for kk=1:size(bb)%se busca el resultado 
        if bb(kk)==1%si se encuentra en el vector un 1 en x fila, se guarda dicha informacion para saber donde esta el gas, de lo contrario sera 0
            b=1;%valor de que si existe el gas VERDADERO
            d=kk;%Posicion del gas
        end
    end
    c=vector; %datos del archivo en forma de vector
    
end

