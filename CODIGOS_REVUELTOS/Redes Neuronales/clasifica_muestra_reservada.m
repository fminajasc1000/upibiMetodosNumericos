%Realiza clasificación con la red neuronal entrenada

muestras=load('vector_muestras.txt');
muestras(1,:)
[r,c]=size(muestras(1,:));

for i=1:r
    vec_salida=my_first_ANN(muestras(i,1:end-1));
    [val,categoria_red]=max(vec_salida);
    disp(['La red clasifico como ',num2str(categoria_red),' y el experto como ',num2str(muestras(i,end))])
end