%% FCN_apertura apertura de una imagen
% imagen_dapertura=fcn_apertura(imagen,kernel);
% descripcion: esta funcion devuelve una imagen en apertura,la apertura es
% erosionar la imagen y despues dilatar con el mismo elemento
% estructurante
% para ejecutarla es nesesario ingresar la imagen y el elemento estructurante

% ejemplo:
% imagen=imread('GRIM.BMP');
% kernel=[0 255 255; 255 255 0; 0 255 0];
% [imagen_apertura]=fcn_apertura(imagen,kernel);
% _________________________________________________________________________

%%
function[imagen_apertura]=fcn_apertura(imagen,kernel);

imagen_erosionada=fcn_erosion(imagen,kernel);%primero erosion
imagen_apertura=fcn_dilatacion(imagen_erosionada,kernel);%despues dilatar


figure;imshow(uint8(imagen_apertura)),title('imagen apertura');