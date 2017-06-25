%% FCN_contraste modificacion de contraste de una imagen
%imagen_contraste=fcn_brillo(imagen,contraste)
% descripcion: esta funcion devuelve una imagen con el contraste modificado,
% para ejecutarla es nesesario ingresar la imagen y el parametro de la
% cantidad de contraste a modificar, esta funcion realiza un escalado al
% histograma (compresion o dilatacion).
% ejemplo:
% imagen=imread('GRIM.BMP');
% imagen_brillo=fcn_contraste(imagen,0.5);
% _________________________________________________________________________


%%
function[imagen_contraste]=fcn_contraste(imagen,contraste);
x=imagen;
[fila,columna]=size (x);%guarda el numero de filas y columnas

%++++++++++++++++++++++++++calcular brillo++++++++++++++++++++++++++++++++++

for i=1:fila%recorre filas     
        for j=1:columna%recorre columnas
            temp=0;
            temp=double(x(i,j));%cambio el tipo de dato
            temp=temp*contraste;%aumento el brillo del pixel
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
    
imagen_contraste=x;


