%% fcn_crear_imagen
% [out_c1,out_c2,out_c3,imagen_creada]=fcn_crear_imagen(valor1,valor2,valor3);
% descripcion: esta funcion crea

% ejemplo:
% imagen=imread('office_5.jpg');
% [L,C,H,imagen_lch]=fcn_RGB_LCH(imagen);
% _________________________________________________________________________


function[out_c1,out_c2,out_c3,imagen_creada]=fcn_crear_imagen(valor1,valor2,valor3,filas,columnas);

%% ---------conversion de la imagen a double de 0 a 1--------------------

out_c1=ones(filas,columnas)*valor1;
out_c2=ones(filas,columnas)*valor2;
out_c3=ones(filas,columnas)*valor3;
%---- uno las capas -------
imagen_creada(:,:,1)=out_c1;
imagen_creada(:,:,2)=out_c2;
imagen_creada(:,:,3)=out_c3;
   

