%% fcn_umbralizacion umbraliza una imagen
% umbralizada=fcn_umbralizacion(imagen,umbral);
% descripcion: esta funcion devuelve una imagen binarizada con respecto a
% un valor de umbral
% ejemplo:
% imagen=imread('GRIM.BMP');
% [umbralizada]=fcn_umbralizacion(imagen,125);
% _________________________________________________________________________
%%
function[umbralizada]=fcn_umbralizacion(imagen,umbral);
x=imagen;
[fila,columna]=size(x);%guarda el numero de filas y columnas



y=zeros(fila,columna);
y=uint8(y);

for i=1:fila%recorre filas     
        for j=1:columna%recorre columnas
            if x(i,j) >= umbral
               y(i,j) = 255;
            end        
        end
end
umbralizada=y;
figure,imshow(y);
