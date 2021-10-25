function [b, c, d] = Leer_Gases()
%LEER_GASES Summary of this function goes here
%   Detailed explanation goes here
    clc
    b=0;
    d=0;
    disp('Leer Gas en Archivo');
    disp(' ');
    nombre=input('Por Favor Ingrese el Nombre del Gas: ' ,'s');
    
    %existo
    contador=0;
    fid = fopen('Gases.txt');
    tline = fgetl(fid);
    while ischar(tline)
        %disp(tline)
        tline = fgetl(fid);
        contador=contador+1;
    end
    fclose(fid);
    
    %Leer datos
    vector = strings(contador,1);
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
    
    bb=contains(vector,nombre);
    for kk=1:size(bb)
        if bb(kk)==1
            b=1;
            d=kk;
        end
    end
    c=vector;
    
end

