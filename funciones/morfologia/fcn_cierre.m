%% FCN_cierre cierre de una imagen
% [imagen_cierre]=fcn_cierre(imagen,kernel);
% descripcion: esta funcion devuelve una imagen en cierre,la apertura es
% dilatar la imagen y despues erosionarlo con el mismo elemento
% estructurante
% para ejecutarla es nesesario ingresar la imagen y elelemento estructurante

% ejemplo:
% imagen=imread('GRIM.BMP');
% kernel=[0 255 255; 255 255 0; 0 255 0];
% [imagen_cierre]=fcn_cierre(imagen,kernel);
% _________________________________________________________________________

%%
function[imagen_cierre]=fcn_cierre(imagen,kernel);

imagen_dilatada=fcn_dilatacion(imagen,kernel);%primero dilatar
imagen_cierre=fcn_erosion(imagen_dilatada,kernel);%despueserosion 


figure;imshow(uint8(imagen_cierre)),title('imagen cierre');