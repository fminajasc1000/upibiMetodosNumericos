close all; clear all; clc

%
actual=cd;
direccion=[actual,'\head_ct'];
dirOutput=dir(direccion);
fileNames = {dirOutput.name};
nombres=(fileNames(3:end))';
cd(direccion)

imagen=input('Inserte numero de paciente:  ');

I=imread(nombres{imagen});
[rows,cols,layers]=size(I);

%Binariza y hace operaciones morfologicas
im_gray2=mat2gray(rgb2gray(I));
im_gray=imsharpen(im_gray2);
im_bw=im2bw(im_gray,0.75);
im_sin_peques=bwareaopen(im_bw,200);
disco=strel('disk',12); im_abierta=imopen(im_sin_peques,disco);
im_previa=bwareaopen(im_abierta,200);

%Calculo de propiedades de objetos
componentes = bwconncomp(im_previa);
statsTumor = regionprops(componentes,'Perimeter');
idxTumor= find([statsTumor.Perimeter]>2100);
estTumor = ismember(labelmatrix(componentes), idxTumor);
mask_craneo=estTumor;


%Segmentacion del craneo
im_no_craneo=im_gray.*(1-double(mask_craneo));
disquito=strel('disk',5);
im_tumor=imclose(imopen(im_no_craneo,disco),disquito);

[aux,mcng]=graycomatrix(im_tumor);
gray_coo=mat2gray(mcng);
im_seg=im2bw(gray_coo,0.75);


BW=edge(im_seg,'Canny');

b=labeloverlay(im_gray,im_seg);
A=bwarea(im_seg);

figure(imagen)
subplot(1,2,1); imshow(mat2gray(I)); title(['Original']);
subplot(1,2,2); imshow(b); title(['Zona de derrame']); legend(sprintf('?rea de derrame:  %f', A));