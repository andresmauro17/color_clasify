%% FCN_GAMMA modificacion de GAMMA de una imagen
%imagen_gamma=fcn_gamma(imagen,gamma);
% descripcion: esta funcion devuelve una imagen con el gamma modificado,
% para ejecutarla es nesesario ingresar la imagen y el parametro de la
% cantidad de gamma a modificar (de 0 a 1), 
% ejemplo:
% imagen=imread('GRIM.BMP');
% [imagen_gamma]=fcn_gamma(imagen,0.3);
% _________________________________________________________________________



%%
function[imagen_gamma]=fcn_gamma(imagen , gamma);
x=imagen;

[fila,columna]=size(x);%guarda el numero de filas y columnas


for i=1:1:fila%recorre filas   
    for j=1:1:columna%recorre columnas
      temp(i,j)=double(x(i,j))^(gamma);%eleva el pixel a el factor gamma
    end
end

temp=fcn_escalado_histograma(temp);%normaliza histograma
imagen_gamma=temp;%cambio de variable
