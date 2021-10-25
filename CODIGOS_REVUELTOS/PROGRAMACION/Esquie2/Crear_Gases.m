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
    a=strcat(nombre,{','},formula,{','},temperatura,{','},presion,{','},factor);

    name=strcat({'Gases.txt'});
    name=name{1:1};
    a=a{1:1};
    contador=0;
    if exist(name,'file')==2
        %existo
        fid = fopen('Gases.txt');
        tline = fgetl(fid);
        while ischar(tline)
            %disp(tline)
            tline = fgetl(fid);
            contador=contador+1;
        end
        fclose(fid);
        %Leer datos
        contador;

        vector = strings(contador+1,1);
        fid = fopen('Gases.txt');
        tline = fgetl(fid);
        vector(1,1)=tline;

        n=1;
        while ischar(tline)
            %disp(tline)
            tline = fgetl(fid);
            vector(n+1,1) = tline;
            n=n+1;
        end
        fclose(fid);
        vector(n,1)=a;
        %Escribir el archivo
        nvoarchivotam=size(vector,1);

        fid = fopen(name, 'wt' );
        for k=1:nvoarchivotam
            fprintf(fid, '%s\n', vector(k,1));
        end
        fclose(fid);

    else
        %no existo
        fid = fopen(name, 'wt' );
        fprintf(fid, '%s\n', a);
        fclose(fid);
    end

    close all;
    clear all;
    clc
end

