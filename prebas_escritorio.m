clear all
clc


he = imread('IMG_0001.jpg');

he(:,:,2)



% 
% imagen=imread('soccer-ball.JPG');
% 
% [imagen_normalizada] = fcn_normalizar( imagen );
% imagen_hsl=rgb2hsl(imagen_normalizada);

he = imread('hestain.png');
imshow(he), title('H&E image');
text(size(he,2),size(he,1)+15,...
    'Image courtesy of Alan Partin, Johns Hopkins University', ...
    'FontSize',7,'HorizontalAlignment','right');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imagen=imread('lenna.png');
imagen_saturada=saturacion(10,imagen);
figure;
imshow(imagen);

figure;
imshow(imagen_saturada);

[x y]= imhist(ima(:,:,1)); %  Obtiene el histograma de la imagen
plot(y,x,'r') %  Grafica el histograma color rojo
hold on %  Mantiene la ventana gráfica de dibujos
[x y]= imhist(ima(:,:,2));%  Obtiene el histograma de la imagen
plot(y,x,'g') %  Grafica histograma color verde
[x y]= imhist(ima(:,:,3));  Obtiene el histograma de la imagen
plot(y,x,'b') %  Grafica histograma color azul

