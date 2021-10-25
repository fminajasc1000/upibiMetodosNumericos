function Crear_Gases()
%CREAR_GASES Summary of this function goes here
%   Detailed explanation goes here
    clc
    disp('Crear Gas en Archivo');
    disp(' ');
    nombre=input('Por Favor Ingrese el Nombre del Gas: ' ,'s');
    formula=input('Por Favor Ingrese la Formula del Gas: ', 's');
    temperatura=input('Por Favor Ingrese la Temperatura del Gas: ','s');
    presion=input('Por Favor Ingrese la Presión del Gas: ','s');
    factor=input('Por Favor Ingrese el Factor Acéntrico (w): ','s');
    %se obtiene la infomacion en forma de cadena
    
    a=strcat(nombre,{','},formula,{','},temperatura,{','},presion,{','},factor);%se une cada elemento para que al final tenga la forma de 
    %Helio,He,200,30,0.12
    name=strcat({'Gases.txt'});%archivo de gas
    name=name{1:1};%se obtiene el valor desde una forma de matriz
    contador=0;%se inicializa el contador en cero
    if exist(name,'file')==2%aqui se verifica la existencia del archivo, si existe regresa un 2.
        %existo
        fid = fopen('Gases.txt');%se abre el archivo de gases
        tline = fgetl(fid);%se obtienen los elemntos
        while ischar(tline)%esta linea nos sirve para movernos entre las filas, mientas existan
            %disp(tline)
            tline = fgetl(fid);%se obtiene la info de las demas lineas.
            contador=contador+1;%se cuentan las lineas
        end
        fclose(fid);%se cierra el archivo
        %Leer datos
        contador;%cantidad de linas en el archvo

        vector = strings(contador+1,1);%se crea un vector de cadenas de tamano del las filas del archivo +1, para el nuevo elemento.
        fid = fopen('Gases.txt');%se abre el archivo
        tline = fgetl(fid);%se obtiene la primea linea
        vector(1,1)=tline;%se guarda la linea en el vector.

        n=1;%el contador esta en uno
        while ischar(tline)
            %disp(tline)
            tline = fgetl(fid);%se obtienen las siguientes lineas con info de gases
            vector(n+1,1) = tline;%se guardan en el vector.
            n=n+1;%se aumenta el contador en 1
        end
        fclose(fid);%se cierra el archivo
        vector(n,1)=a;%se agrega el nuevo gas al vector
        %Escribir el archivo
        nvoarchivotam=size(vector,1);%se fija la cantidad de filas en el archivo, incluido el nuevo gas

        fid = fopen(name, 'wt' );%se abre el archivo para escritura.
        for k=1:nvoarchivotam% este es ciclo fijo desde 1 al tamaño del vector 
            fprintf(fid, '%s\n', vector(k,1));%se escriben los gases en el archivo.
        end
        fclose(fid);% se cierra el archivo

    else
        %en caso de que no exista el archivo se crea uno nuevo.
        fid = fopen(name, 'wt' );% se abre el archivo
        fprintf(fid, '%s\n', a);%se escribe el primer y unico gas
        fclose(fid);% se cierra el archivo
    end
    % se limpia la consola.
    close all;
    clear all;
    clc
end

