clc
clear
close all

he = imread('recorte7a.JPG');
% he = imread('hestain.png');
imshow(he), title('H&E image');
text(size(he,2),size(he,1)+15,...
'Image courtesy of Alan Partin, Johns Hopkins University', ...
'FontSize',7,'HorizontalAlignment','right');

cform = makecform('srgb2lab');
lab_he = applycform(he,cform);

figure;imshow(lab_he), title('H&E image L*A*B');



ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);


nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
                                  
                                  
                                  
                                  
pixel_labels = reshape(cluster_idx,nrows,ncols);
figure;imshow(pixel_labels,[]), title('image labeled by cluster index');


[fila,columna]=size (pixel_labels);%guarda el numero de filas y columnas
grupo_1=pixel_labels;
grupo_2=pixel_labels;
grupo_3=pixel_labels;
% grupo_4=pixel_labels;
% grupo_5=pixel_labels;
% grupo_6=pixel_labels;
% grupo_7=pixel_labels;

for i=1:fila%recorre filas     
        for j=1:columna%recorre columnas
            temp=pixel_labels(i,j);
                      %-------el brillo va solo de 0 a 255-------
                   if temp==1
                     grupo_1(i,j)=255;
                     grupo_2(i,j)=0;
                     grupo_3(i,j)=0;
                     grupo_4(i,j)=0;
                     grupo_5(i,j)=0;
                     grupo_6(i,j)=0;
                     grupo_7(i,j)=0;
                     
                   elseif temp ==2
                     grupo_1(i,j)=0;
                     grupo_2(i,j)=255;
                     grupo_3(i,j)=0;
                     grupo_4(i,j)=0;
                     grupo_5(i,j)=0;
                     grupo_6(i,j)=0;
                     grupo_7(i,j)=0;
                     
%                    elseif temp ==2
%                      grupo_1(i,j)=0;
%                      grupo_2(i,j)=255;
%                      grupo_3(i,j)=0;
%                      grupo_4(i,j)=0;
%                      grupo_5(i,j)=0;
%                      grupo_6(i,j)=0;
%                      grupo_7(i,j)=0;
%                                          
                   elseif temp ==3
                     grupo_1(i,j)=0;
                     grupo_2(i,j)=0;
                     grupo_3(i,j)=255;
                     grupo_4(i,j)=0;
                     grupo_5(i,j)=0;
                     grupo_6(i,j)=0;
                     grupo_7(i,j)=0;
%                    elseif temp ==4
%                      grupo_1(i,j)=0;
%                      grupo_2(i,j)=0;
%                      grupo_3(i,j)=0;
%                      grupo_4(i,j)=255;
%                      grupo_5(i,j)=0;
%                      grupo_6(i,j)=0;
%                      grupo_7(i,j)=0;
%                 elseif temp ==5
%                      grupo_1(i,j)=0;
%                      grupo_2(i,j)=0;
%                      grupo_3(i,j)=0;
%                      grupo_4(i,j)=0;
%                      grupo_5(i,j)=255;
%                      grupo_6(i,j)=0;
%                      grupo_7(i,j)=0;
%                  elseif temp ==6
%                      grupo_1(i,j)=0;
%                      grupo_2(i,j)=0;
%                      grupo_3(i,j)=0;
%                      grupo_4(i,j)=0;
%                      grupo_5(i,j)=0;
%                      grupo_6(i,j)=255;
%                      grupo_7(i,j)=0;
%                      
%                  elseif temp ==7
%                      grupo_1(i,j)=0;
%                      grupo_2(i,j)=0;
%                      grupo_3(i,j)=0;
%                      grupo_4(i,j)=0;
%                      grupo_5(i,j)=0;
%                      grupo_6(i,j)=0;
%                      grupo_7(i,j)=255;
                   else 
                     grupo_1(i,j)=0;
                     grupo_2(i,j)=0;
                     grupo_3(i,j)=0;
                     grupo_4(i,j)=0;
                     grupo_5(i,j)=0;
                   end
                  %-------------------------------------
                
        end
end
                                  
figure;imshow(grupo_1,[]), title('grupo_1');
figure;imshow(grupo_2,[]), title('grupo_2');
figure;imshow(grupo_3,[]), title('grupo_3');
% figure;imshow(grupo_4,[]), title('grupo_4');
% figure;imshow(grupo_5,[]), title('grupo_5');
% figure;imshow(grupo_6,[]), title('grupo_6');
% figure;imshow(grupo_7,[]), title('grupo_7');
                                                                                                      