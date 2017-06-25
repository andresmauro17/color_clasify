%% fcn_ecualizar_histograma ecualizacion del histograma de una imagen
%[imagen_ecualizada]=fcn_ecualizar_histograma(imagen);
% descripcion: esta funcion devuelve una imagen con el histograma ecualizado,
% para ejecutarla es nesesario ingresar la imagen como parametro ,esta funcion
% realiza una ecualizacion al histograma.
% ejemplo:
% imagen=imread('GRIM.BMP');
% [imagen_ecualizada]=fcn_ecualizar_histograma(imagen);
% _________________________________________________________________________


%%
function[imagen_ecualizada]=fcn_ecualizar_histograma(imagen);
X=imagen;

[histograma]=fcn_histograma(X); % calcular histograma
hist_acumulado=cumsum(histograma); % distribucion acumulativa del histograma
hist_acumulado= hist_acumulado./max(hist_acumulado); % normalizar el histograma acumulado de 0 a 1
q_k=round(255*hist_acumulado);% normalizar el histograma acumulado de 0 a 255

[fil,col]=size(X);
s_k=zeros(fil,col);%imagen ecualizada


for k=1:256;
    for i=1:fil %recorro filas
        for j=1:col;%recorro columnas            
            if X(i,j)==k-1
               s_k(i,j)=q_k(k);                
            end            
        end
    end
end


[h]=fcn_histograma(X); % histograma original
[h1]=fcn_histograma(s_k);% histograma ecualizado
[h2]=255*(h1./max(h1));% histograma ecualizado expandido dinamicamente


imagen_ecualizada=uint8(s_k);