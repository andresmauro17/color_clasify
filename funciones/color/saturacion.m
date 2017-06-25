
% [imagen_saturada]=saturacion(N,imagen) %
% descripcion: esta funcion devuelve el una imagen saturada de acuerdo a N.
% N=1 es la imagen sin saturar a N desimales, la imagen se le quita
% saturacion
% ejemplo:
% imagen_saturada=saturacion(5,imagen);
% figure;
% imshow(imagen);


function imagen_saturada=saturacion(N,imagen) % Define el nombre de la funci�n ,N es el nivel en que se va
%hacer la escala la imagen

[h,s,v] = rgb2hsv(imagen); %  Cambia el formato de rgb a hsv
[r, g, b] = hsv2rgb(h,N*s,v); %  Cambia de hsv a rgb
imagen_saturada(:,:,1)=r; %  Define r (rojo) en la posici�n 1 de la imagen
imagen_saturada(:,:,2)=g; %  Define g (verde) en posici�n 2 de la imagen
imagen_saturada(:,:,3)=b; %  Define b (azul) en posici�n 3 de la imagen


