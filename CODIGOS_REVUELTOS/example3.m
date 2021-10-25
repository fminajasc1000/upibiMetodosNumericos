clc
clear all;
m=3;
n=3;

for i=1:m %filas
    for ii=1:n %columnas
        if i==ii || i>ii %esta linea nos colocara 1 en la diagonal y en posiciones de la matriz donde el valor de la columna sea menor que la fila
                         %ejemplo (1,1), (2,1),(2,2)
            fprintf('%d ',1);
        else
            fprintf('%d ',0);
        end
    end
    fprintf('\n');
end