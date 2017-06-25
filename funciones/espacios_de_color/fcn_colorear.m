%% FCN_COLOREAR colorea la segmentacion hecha
% [imagen_colorizada]=fcn_colorear(capa_segmentada,imagen_original);
% descripcion: esta funcion recibe como parametro una imagen binarizada(capa),
%con respecto a una original, para pintar la segmentacion con el color
%original
% ejemplo:
% imagen_original=imread('GRIM.jpg');
% [imagen_colorizada]=fcn_colorear(capa_segmentada,imagen_original);

% _________________________________________________________________________

function[imagen_colorizada]=fcn_colorear(capa_segmentada,imagen_original);

% ------sepacion de capas e la original--------
R=imagen_original(:,:,1);
G=imagen_original(:,:,2);
B=imagen_original(:,:,3);

[filas,columnas]=size(capa_segmentada);%filas columnas de la segmentada

CAPA1=(ones(filas,columnas))*255;% capa nueva color blanco
CAPA2=(ones(filas,columnas))*255;% capa nueva color blanco
CAPA3=(ones(filas,columnas))*255;% capa nueva color blanco

for i=1:filas % recorre filas
    for j=1:columnas % recorre filas
        
        if(capa_segmentada(i,j)==255) % si el pixel de la imagen segmentada es 255
            CAPA1(i,j)=R(i,j);%coloque el color original en la capa R
            CAPA2(i,j)=G(i,j);%coloque el color original en la capa G
            CAPA3(i,j)=B(i,j);%coloque el color original en la capa B        
        end        
    end
end

imagen_colorizada=uint8(cat(3,CAPA1,CAPA2,CAPA3));%concatenar las 3 capas
% figure;
% imshow(uint8(imagen_colorizada));