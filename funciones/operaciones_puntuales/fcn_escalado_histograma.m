%% fcn_escalado_histograma normalizacion o expancion dinamica del histograma a una imagen
%[imagen_normalizada]=fcn_escalado_histograma(imagen);
% descripcion: esta funcion devuelve una imagen con el histogramanormalizado,
% para ejecutarla es nesesario ingresar la imagen como parametro. esta funcion
% realiza una expancion dinamica al histograma.
% ejemplo:
% imagen=imread('GRIM.BMP');
% [imagen_ecualizada]=fcn_ecualizar_histograma(imagen);
% _________________________________________________________________________
%%
function[imagen_normalizada]=fcn_escalado_histograma(imagen);

y2=double(imagen);
capa1=y2(:,:,1)
capa1=y2(:,:,2)
capa1=y2(:,:,3)

%  aqui la imagen queda con valores negativos hay que normalizar histograma

y2=y2-min(min(y2));%quitamos negativos pero pone sobrevalores positivos
y2=y2./max(max(y2));%normaizo el rango de 0  a 1
y2=y2*255;%de 0 a 255 normaliza
y2=uint8(y2);

imagen_normalizada=y2;
% figure;imshow(resultado);title('normalzada');
% figure; imshow(imagen);title('original');



