close all;
clear all;
clc;
%lectura de la moneda
nombre='dos.jpg';
A=imread(nombre);
%conversion a escala de grises
B=rgb2gray(A);
%conversion  a blanco y negro
C=im2bw(B,0.5);
%aplicamos la operacion morfologica de radio13
s1=strel('disk',13);
%dilatamos la imagen C segun la estructura morfologica
E=imdilate(C,s1);
%rellenamos los huecos
F=imfill(E,'holes');

%figure, imshow(A), title('Imagen inicial');
%figure, imshow(B), title('Imagen en Escala de Grises');
%figure, imshow(C), title('Imagen Umbralizada');
%figure, imshow(E), title('Imagen dilatada con un disco');
%figure, imshow(F), title('Imagen Relleno');
%etiquetado y coeccion de los componentes conectados
[L Ne]=bwlabel(double(F));
%propiedades de medida de las areas de la imagen
prop=regionprops(L,'Area','Centroid');
%contador de dinero
total=0;
%muestra la imagen inicial
figure,imshow(imread(nombre));
numg=zeros;
for n=1:size(prop,1)
    cent=prop(n).Centroid;
    X=cent(1);
    Y=cent(2);
    fo=prop(n).Area;
    numg(n)=fo;
    if prop(n).Area>10000
        %visualiza el area de las monedas en la ventana
        fo=prop(n).Area;
        
        %si el area es mayor a 97160 es una moneda de 10
        if prop(n).Area>1900000
            text(X-20,Y,'$ 10');
            total=total+10;
        end
        
        if prop(n).Area>1508000
            if prop(n).Area<1739000
                text(X-20,Y,'$ 5');
                total=total+5;
            end
        end
        
        if prop(n).Area>1240000
            if prop(n).Area<1453000
                text(X-20,Y,'$ 2');
                total=total+2;
            end
        end
        
        if prop(n).Area>1150000
            if prop(n).Area<1283000
                text(X-20,Y,'$ .50');
                total=total+.5;
            end
        end
        
        if prop(n).Area<750000
            text(X-20,Y,'$ .50');
            total=total+.5;
        end
        
        if prop(n).Area>1054000
            if prop(n).Area<1160000
                text(X-20,Y,'$ 1');
                total=total+1;
            end
        end
    end
end
max(numg)
title(['Dinero Total: ',num2str(total), ' Pesos']);