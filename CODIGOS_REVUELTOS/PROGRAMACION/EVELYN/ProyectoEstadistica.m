clc
clear all;

disp('Estadistica');
disp('Opciones');
disp('0. Frecuencias Absolutas');
disp('1. Medidas de tendencia central');
disp('2. Función de Probabilidad');
disp('3. Muestra');
opcion= input('Ingrese una Opcion: ');
switch opcion
    case 0
        clc;
        clear all;
        disp('Tabulación de Datos');
        disp('1. Frecuencia Absoluta');
        disp('2. Tamaño de Muestra');
        disp('3. Frecuencia Relativa');
        disp('4. Frecuencia Absoluta Acumulada');
        disp('5. Frecuencia Relativa Acumulada');
        opcion1= input('Ingrese una Opcion: ');
        switch opcion1
            case 1
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                fa = mode(vec1);
                veces=0;
                for i=1:length(vec1)
                    if vec1(i)==fa
                        veces = veces+1;
                    end
                end
                fprintf('El número que mas se repite es: %d y se repite %d veces\n',fa,veces);
            case 2
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                fa = mode(vec1);
                veces = 0;
                clases = length(vec1);
                for i=1:length(vec1)
                    veces = veces+vec1(i);
                end
                fprintf('El tamaño de la muestra es: %d y el numero de clases es: %d\n',veces,clases);
            case 3
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                fa = mode(vec1);
                fr= fa/length(vec1);
                fprintf('La frecuencia relativa es: %f \n',fr);
            case 4
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                vec1 = sort(vec1);
                vec2 = unique(vec1);
                vec3 = vec2;
                vec4 = vec2;
                veces=0;
                veces2=0;
                
                for i=1:length(vec2)
                    for ii=1:length(vec1)
                        if vec1(ii)==vec2(i)
                            veces=veces+1;
                            veces2=veces2+1;
                            vec3(i)=veces;
                            vec4(i)=veces2;
                        else
                            veces =0;
                        end
                    end
                end 
                disp('Vector sin repeticiones');
                disp(vec2);
                disp('Frecuencia Absoluta');
                disp(vec3);
                disp('Frecuencia Absoluta Acumulada');
                disp(vec4);
            case 5
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                vec1 = sort(vec1);
                vec2 = unique(vec1);
                vec3 = vec2;
                vec4 = vec2;
                vec5 = vec2;
                veces=0;
                veces2=0;
                
                for i=1:length(vec2)
                    for ii=1:length(vec1)
                        if vec1(ii)==vec2(i)
                            veces=veces+1;
                            veces2=veces2+1;
                            vec3(i)=veces;
                            vec4(i)=veces2;
                            vec5(i)=veces2/length(vec1);
                        else
                            veces =0;
                        end
                    end
                end 
                disp('Vector sin repeticiones');
                disp(vec2);
                disp('Frecuencia Absoluta');
                disp(vec3);
                disp('Frecuencia Absoluta Acumulada');
                disp(vec4);
                disp('Frecuencia Relativa Acumulada');
                disp(vec5);
        end
    case 1
        clc;
        clear all;
        disp('Medidas de Tendencia Central');
        disp('1. Media');
        disp('2. Mediana');
        disp('3. Moda');
        disp('4. Desviación Estandar');
        disp('5. Rango');
        opcion1= input('Ingrese una Opcion: ');
        switch opcion1
            case 1
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                veces=0;
                for i=1:length(vec1)
                    veces = vec1(i)+veces;
                end
                media=veces/length(vec1);
                fprintf('La media del vector es: %f \n',media);
            case 2
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                vec1 = sort(vec1);
                mediana = 0;
                if mod(vec1,2)==0
                    sup=vec1(round(length(vec1)/2));
                    inf=vec1(round(length(vec1)/2)-1);
                    mediana = (sup/inf)/2;
                else%impar
                    mediana=vec1(round(length(vec1)/2));
                end
                fprintf('La mediana del vector es: %f \n',mediana);
            case 3
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                vec1 = sort(vec1);
                vec2 = unique(vec1);
                vec3 = vec2;
                vec4 = vec2;
                veces=0;
                veces2=0;
                
                for i=1:length(vec2)
                    for ii=1:length(vec1)
                        if vec1(ii)==vec2(i)
                            veces=veces+1;
                            vec3(i)=veces;
                        else
                            veces =0;
                        end
                    end
                end 
                buscar=max(vec3);
                ant =0;
                pos =0;
                for j=1:length(vec3)
                    if buscar==vec3(j)
                        pos = j;
                    end
                end
                %disp('Vector sin repeticiones');
                %disp(vec2);
                %disp('Frecuencia Absoluta');
                %disp(vec3);
                
                fprintf('La moda es: %d \n',vec1(pos));
            case 4
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                desviacion=desvE(vec1);
                fprintf('La desviacion estandar del vector es: %f \n',desviacion);
            case 5
                clc
                clear all;
                vec1= input('Ingrese una Vector []: ');
                maximo=max(vec1);
                minimo=min(vec1);
                rango=maximo-minimo;
                fprintf('El rango del vector es: %f \n',rango);
        end
    case 2
        clc;
        clear all;
        disp('Función de Probabilidad');
        disp('1. Función de distribución');
        opcion1= input('Ingrese una Opcion: ');
        switch opcion1
            case 1
                clc
                clear all;
                mu= input('Ingrese mu: ');
                x= input('Ingrese x: ');
                Per=(exp(-x)*(mu)^x)/factorial(x);
                fprintf('La probabilidad es: %f \n',Per);
        end
    case 3
        clc;
        clear all;
        disp('Muestra');
        disp('1. Intervalo de Confianza media población');
        disp('2. Intervalo de Confianza varianza población');
        disp('3. Chi-cuadrada');
        disp('4. Kolmogorov - Smirnov');
        opcion1= input('Ingrese una Opcion: ');
        switch opcion1
            case 1
                clc
                clear all;
                tm= input('Tamaño de la muestra: ');
                var=input('Varianza de la muestra: ');
                mee=input('Media muestral: ');
                mu = input('Intervalo de confianza %: ');
                vd=1.96;
                
                alfa=-(mu/100)+1;
                res1=(mee-vd*((sqrt(var))/sqrt(tm)));
                res2=(mee+vd*((sqrt(var))/sqrt(tm)));
                fprintf('Confianza 1: %f Confianza 2: %f \n',res1 ,res2);
            case 2
                clc
                clear all;
                tm= input('Tamaño de la muestra: ');
                var1=input('Varianza de la muestra1: ');
                var2=input('Varianza de la muestra2: ');
                inter=input('Intervalo de confianza %: ');
                
                alfa=-(inter/100)+1;
                alfa2=alfa/2;
                
                %falta el calculo de x1,s2
                fprintf('Confianza 1: %f Confianza 2: %f \n',alfa ,alfa2);
            case 3
                clc
                clear all;
                dn= input('Distribucion normal: ');
                ma=input('Muestra aleatoria: ');
                de=input('Desviación estandar: ');
                alfa=input('Nivel de significacion: ');
                
                RC=16.919;
                X_a=(ma-1)*de/(dn-alfa);
                fprintf('Resultado %f \n',X_a);
            case 4
        end
end

function des=desvE(x)
    n=length(x);
    med=sum(x)/n;
    des=sqrt(sum((x-med).^2/(n-1)));
end