function [im_salida] = proc_derrame(im_entrada)
    
    %Binariza y hace operaciones morfologicas
    im_gray=mat2gray(rgb2gray(im_entrada));
    im_bw=im2bw(im_gray,0.6);
    im_sin_peques=bwareaopen(im_bw,200);
    disco=strel('disk',4); im_abierta=imopen(im_sin_peques,disco);
    im_previa=bwareaopen(im_abierta,200);
    
    %Calculo de propiedades de objetos  
    componentes = bwconncomp(im_previa);
    statsTumor = regionprops(componentes,'Area','Perimeter','Euler','Centroid',...
        'Eccentricity');
    idxTumor= find([statsTumor.Perimeter]>1000);
    estTumor = ismember(labelmatrix(componentes), idxTumor);
    mask_craneo=estTumor;
    
    %Le quitamos la porción del cráneo
    im_no_craneo=im_gray.*(1-double(mask_craneo));
    
    %Difuminamos con operaciones morfologicas la imagen
    im_tumor=imclose(imopen(im_no_craneo,disco),disco);
    
    [counts,x] = imhist(im_tumor,16);
    stem(x,counts)
    T =  adaptthresh(im_tumor, 0.5);
    im_salida = imbinarize(im_tumor,T);
  %im_salida=im2bw(im_tumor,0.4);

      
 end

