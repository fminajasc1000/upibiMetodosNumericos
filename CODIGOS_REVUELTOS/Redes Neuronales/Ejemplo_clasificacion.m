%Ejemplo clasificacion
close all
clear all
clc

datos=load('datos_crudos_vino.txt');

%Ultima columna es la clasificacion
[rows,cols]=size(datos);

%Se toman X muestras al azar para pruebas de la red
X=10;
indices=round(rand(1,X)*rows);
new_datos=zeros(rows-X,cols);
j=0;
for i=1:rows    
    if (sum(i==indices)<1)
        j=j+1;
        new_datos(j,:)=datos(i,:);    
    end
end

respuestas=zeros(length(new_datos),3);

for i=1:length(new_datos)
    respuestas(i,new_datos(i,cols))=1;
end

%Creacion de archivos
dlmwrite('predictores.txt',new_datos(:,1:cols-1),';')
dlmwrite('respuestas.txt',respuestas,';')

vector_muestras=zeros(X,cols);

for i=1:length(indices)
    vector_muestras(i,:)=datos(indices(i),:);
end

dlmwrite('vector_muestras.txt',vector_muestras)
