%% fcn_ecualizado_especial modifica el histograma de una imagen con respecto a otra
%[imagen_ecualizada]=fcn_ecualizar_histograma(imagen_original,imagen2);
% descripcion: esta funcion devuelve una imagen con el histograma
% ecualizado,pero se obtiene por medio de una segunda imagen
% para ejecutarla es nesesario ingresar la imagen original y la segunda imagen
% como parametro.
% ejemplo:
% imagen_original=imread('baboon.png');
% imagen2=imread('lena.png');
% [ecualizado]= fcn_ecualizado_especial(imagen_original,imagen2);
% _________________________________________________________________________

function [ecualizado]= fcn_ecualizado_especial(imagen_original,imagen2);

 
[histograma_2]=fcn_histograma(imagen2); % hallo histograma de la imagen externa


histograma_2=cumsum(histograma_2);  % rutina que acumula la señal
histograma_2= histograma_2./max(histograma_2); % normalizar el histograma acumulado dejandolo entre 0 y 1
q_k_2=round(255*histograma_2); % normaliza el histograma  acumulado dejando entre 0 y 255

[fil,col]=size(imagen_original);


for k=1:256;
    for i=1:fil % proceso de mapeo donde se halla la nueva matriz xs asignandole los valores correspodientes
        for j=1:col;
            
            if imagen_original(i,j)==k-1 
                s_k(i,j)=q_k_2(k);% hallo el ecualizado de la original apartir una imagen externa
                
            end
            
        end
    end
end



ecualizado= uint8(s_k);