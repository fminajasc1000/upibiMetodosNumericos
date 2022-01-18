function imagensal = funcioexp2(GetDir,dime)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

img_raw(:,:,:) = GetDir;
% Asign matlix for each RGB
img_raw_R = img_raw(:,:,1); 
img_raw_G = img_raw(:,:,2);
img_raw_B = img_raw(:,:,3);
% Image analysis 1 
% Find points which are black or white
% Make points white where all RGB values are less than a_b or more than a_w
% Asign matlix for each RGB
img_1(:,:,:) = img_raw(:,:,:);
img_R_1 = img_raw_R;
img_G_1 = img_raw_G;
img_B_1 = img_raw_B;
a_b = 100;
a_w = 200;
% Detect points where each RGB element value is less than a_b or more than a_w
xy_R_1_b = img_raw_R<a_b;
xy_G_1_b = img_raw_G<a_b;
xy_B_1_b = img_raw_B<a_b;
xy_R_1_w = img_raw_R>a_w;
xy_G_1_w = img_raw_G>a_w;
xy_B_1_w = img_raw_B>a_w;
% Detect points where all RGB element values are less than a_b or more than a_w 
xy_1_b = logical(xy_R_1_b.*xy_G_1_b.*xy_B_1_b); 
xy_1_w = logical(xy_R_1_w.*xy_G_1_w.*xy_B_1_w); 
xy_1 = xy_1_b | xy_1_w;
% Turn them white
img_R_1(xy_1) = 255;
img_G_1(xy_1) = 255;
img_B_1(xy_1) = 255;
img_1(:,:,1) = img_R_1;
img_1(:,:,2) = img_G_1;
img_1(:,:,3) = img_B_1;
% Image analysis 2 
% Make points white where the difference in RGB element values is less than b
% Asign matlix for each RGB
img_2(:,:,:) = img_raw(:,:,:);
img_R_2 = img_raw_R;
img_G_2 = img_raw_G;
img_B_2 = img_raw_B;
% Detect points where the difference in RGB element values is less than b
b = 30;
xy_2 = (abs(img_raw_R - img_raw_G)< b & abs(img_raw_R - img_raw_B)< b);
% Turn them white
img_R_2(xy_2) = 255;
img_G_2(xy_2) = 255;
img_B_2(xy_2) = 255;
img_2(:,:,1) = img_R_2;
img_2(:,:,2) = img_G_2;
img_2(:,:,3) = img_B_2;
% img_2
%% Image analysis 3 
% Image analysis 2 + Tips
% Make points white where the difference in RGB element values is less than b
% Surround information
% Asign matlix for each RGB
img_3(:,:,:) = img_raw(:,:,:);
img_R_3 = img_raw_R;
img_G_3 = img_raw_G;
img_B_3 = img_raw_B;
% Detect points where the difference in RGB element values is less than b
b = 30;
xy_3 = (abs(img_raw_R - img_raw_G)< b & abs(img_raw_R - img_raw_B)< b);
xy_3 = imfill(xy_3,'holes');
for i = 1:size(xy_3,1)-1
    for j = 1:size(xy_3,2)-1
        if xy_3(i,j)*xy_3(i+1,j)*xy_3(i,j+1) == 0
            xy_3(i,j) = 0;
        end
    end
end
% Turn them white
img_R_3(xy_3) = 255;
img_G_3(xy_3) = 255;
img_B_3(xy_3) = 255;
img_3(:,:,1) = img_R_3;
img_3(:,:,2) = img_G_3;
img_3(:,:,3) = img_B_3;
%figure;clf;
%----
salida1=img_raw;       %---------------------------
%----
%imshow(img_raw)
%axis equal tight;
%title('Original Data')
%figure;clf;
%----
salida2=img_1;       %---------------------------
%----
%imshow(img_1)
%axis equal tight;
% title('*****');
%figure;clf;
%----
salida3=img_2;       %---------------------------
%----
%imshow(img_2)
%axis equal tight;
% title('*****');
J=rgb2gray(img_2);
t=0;
[r,c]=size(J);
for i=1:r
    for j=1:c        
        outimage(i,j)=255-J(i,j);        
    end
end
%figure;clf;
%----
salida4=outimage;       %---------------------------
%----
%imshow(outimage,[]);
% title('*****');
Im=img_2;
gr = double(rgb2gray(Im));
I1 = cvtImage(gr);
P1 = cvtImage(gr.^2);
I2 = Integral45(gr);
P2 = Integral45(gr.^2);
%Create Separability Map
geoMap   = zeros(size(gr,1),size(gr,2));
arithMap = zeros(size(gr,1),size(gr,2));
for nR = 8:2:12, %multiple scales of separability filter's size (radius)
    P(:,:,1:2) = cfilter(I1,P1,nR);
    P(:,:,3:4) = cfilter45(I2,P2,nR);
    P(P<=0)=0;
    geoMap_tmp= (prod(P,3)).^(1/4);
    arithMap_tmp = sum(P,3)/4;
    geoMap = max(geoMap, geoMap_tmp);
    arithMap = max(arithMap, arithMap_tmp);    
end
%figure;clf;
%----
salida5=geoMap;       %---------------sds------------
%----
%imagesc(geoMap);
%axis equal tight;
% title('*****');
%figure;clf;
%imagesc(arithMap);
%axis equal tight;
%images
%----
salida6=arithMap;       %---------------sds------------
%----
% title('*****');
nTH = 0.4; % threshold for local peaks
S1 = imfuse(gr,geoMap);  % Find and draw local peak's marks for geoMap 
PL1 = FindLocal(geoMap,1,nTH);
for H=1:size(PL1,2)
    % draw cross at each local peak (cross size is relative to the peak value)
    S1 = draw(S1,PL1(2,H),PL1(1,H),round(8*PL1(3,H)),[255,255,255]); 
end
PL1(2,:)=PL1(2,:)./1000;
%figure;clf;
%image(S1);
%----
salida7=S1;       %---------------sds------------
%----
%axis equal tight;
% title('*****');
%figure;clf;
%stem(PL1(3,:))
% title('*****');
%figure;clf;
%stem(PL1(2,:))
% title('*****');
S2 = imfuse(gr,arithMap);   % Find and draw local peak's marks for arithMap 
PL2 = FindLocal(arithMap,1,nTH);
for H=1:size(PL2,2)
    % draw cross at each local peak (cross size is relative to the peak value)
    S2 = draw(S2, PL2(2,H),PL2(1,H),round(8*PL2(3,H)),[255,255,255]);
end
%figure;clf;
%----
salida8=S2;       %---------------sds------------
%----
%image(S2);
%axis equal tight;
% title('*****');
%figure;clf;
%stem(PL2(3,:));
% title('*****');
disp('  Distance error : ');disp( mean(PL1(2,:)));
disp('  Big mistake :');disp(mean(PL1(3,:)));
disp('  Area error  :');disp(mean(PL2(2,:)));
disp('  Shoulder and angle symmetry error :');disp(mean(PL2(3,:)));

switch dime
    case 1
        imagensal=salida1;
    case 2
        imagensal=salida2;
    case 3
        imagensal=salida3;
    case 4
        imagensal=salida4;
    case 5
        imagensal=salida5;
    case 6
        imagensal=salida6;
    case 7
        imagensal=salida7;
    case 8
        imagensal=salida8;
    otherwise
        disp('other value')
end
end

