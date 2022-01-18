%PROYECTO VERSION RECONOCIMIENTO
clear all;
close all;
A = imread(strcat('diesisiete','.jpg'));
A = rgb2gray(A);%histeq(rgb2gray(A));
%A = histeq(rgb2gray(A));
%figure, imshow(A);
%title('Imagen Original');
sel=graythresh(A)
if sel>0.5
    BW = im2bw(255 - A);
    BW2 = bwareaopen(BW, 80);
    se = strel('line',3,1);
    disk = imclose(BW2,strel('diamond',3));
    B=disk;
else
    B = im2bw(A);
    BW2 = bwareaopen(B, 80);
    se = strel('line',3,1);
    disk = imclose(BW2,strel('diamond',3));
    B=disk;
end

%figure, imshow(B);
C = imfill(B,'holes');
%figure,imshow(C);

label=bwlabel(C);
max(max(label))
im1=(label==1);
%figure,imshow(im1);

%figure,imshow(label==6);
%aa=zeros;
%objet=objetos;

for j=1:max(max(label))
    [row,col] = find(label==j);
    len = max(row) - min(row) + 2;
    breadth = max(col) - min(col) + 2;
    target = uint8(zeros([len breadth]));
    sy = min(col) - 1;
    sx = min(row) - 1;
    
    for i=1:size(row,1)
        x = row(i,1)-sx;
        y = col(i,1)-sy;
        target(x,y)= A(row(i,1),col(i,1));
    end
    mytitle = strcat(' Objeto numero: ',num2str(j));
    figure,imshow(target);title(mytitle);
    im=target;%aqui esta la imagen
    
end