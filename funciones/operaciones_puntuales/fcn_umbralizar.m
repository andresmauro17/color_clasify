%% FCN_UMBRALIZAR binarizacion de una imagen
% imagen_binaria=fcn_umbralizar(imagen,umbral,tol);
% descripcion: esta funcion devuelve una imagen binaria, dendiendo del
% valor e umbral y una toleracncia, que indica un rngo de histograma. es
% ideal para segmentar por umbralizacion.
% para ejecutarla es nesesario ingresar la imagen, el valor de umbral y la
% tolerancia, y devuelve un imagen binaria con valor 255 en el rango del
% histograma seleccionado.

% ejemplo:
% imagen=imread('GRIM.BMP');
% imagen_brillo=fcn_brillo(imagen,20,10);%tomara valores entre10 y 30
% _________________________________________________________________________



%%


function [imagen_binaria]=fcn_umbralizar(imagen,umbral,tol);

[filas,columna]=size(imagen);

imagen_binaria=zeros(filas,columna);

for i=1:filas% recorre filas
    for j=1:columna %recorre columnas       
        if (imagen(i,j)>=umbral-tol) && (imagen(i,j)<=umbral+tol)%si el pixel esta en el rango             
           imagen_binaria(i,j)=255;%el pixel sera 255        
        end   
    end   
end

figure('name', 'plot de fcn_umbralizacion');
subplot(1,2,1);imshow(imagen);title ('original ');
subplot(1,2,2);imshow(imagen_binaria);title ('binaria ');

