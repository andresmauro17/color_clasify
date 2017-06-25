%% fcn__histograma calcula histograma de una imagen
%[histograma]=fcn_histograma(imagen)
% descripcion: esta funcion devuelve el histograma de una imagen,
% para ejecutarla es nesesario ingresar la imagen como parametro. y tiene
% la posibilidad de graficarlo.
% ejemplo:
% imagen=imread('GRIM.BMP');
% [histograma]=fcn_histograma(imagen)
% _________________________________________________________________________
%%

function[histograma]=fcn_histograma(imagen)
x=imagen;
hist=zeros(1,256);% aqui se guarda el histograma a plotear
[fila,columna]=size (x);%guarda el numero de filas y columnas


for m=0:255;%permite contar el numero de pixeles con el tono escojido
    
    for i=1:fila%recorre filas
        for j=1:columna%recorre columnas
            if x(i,j)==m %si el pixel es del tono cuente
            hist(m+1)=hist(m+1)+1;%m+1 por que las posiciones empiezan en 1
            end
        end
    end
    
end
histograma=hist;
figure;plot(histograma)
xlabel('TONO DE ILUMINACION')
ylabel('PIXELES')
title('HISTOGRAMA')

