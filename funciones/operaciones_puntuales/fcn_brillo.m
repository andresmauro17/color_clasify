%% FCN_BRILLO modificacion de brillo de una imagen
%imagen_brillo=fcn_brillo(imagen,brillo)
% descripcion: esta funcion devuelve una imagen con el brillo modificado,
% para ejecutarla es nesesario ingresar la imagen y el parametro de la
% cantidad de brillo a modificar, esta funcion realiza un desplazamiento al
% histograma.
% ejemplo:
% imagen=imread('GRIM.BMP');
% imagen_brillo=fcn_brillo(imagen,20);
% _________________________________________________________________________



%%
function[imagen_brillo]=fcn_brillo(imagen,brillo);
x=imagen;
[fila,columna]=size (x);%guarda el numero de filas y columnas


for i=1:fila%recorre filas     
        for j=1:columna%recorre columnas
            temp=0;
            temp=double(x(i,j));%cambio el tipo de dato
            temp=temp+brillo;%aumento el brillo del pixel
                  %-------el brillo va solo de 0 a 255-------
                   if temp > 255
                     temp = 255;
                   elseif temp < 0
                     temp = 0;
                   else
                     temp = temp + 0;
                   end
                  %-------------------------------------
            x(i,j)=temp;     
        end
end
    
imagen_brillo=x;


