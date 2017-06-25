%% **********************************************************
% prueba tonalidades colores blancos
%% **********************************************************

clc
clear all
close all

imagen=imread('soccer-ball.JPG');
imagen_grises=rgb2gray(imagen);

%Red component
R = imagen(:,:,1);

%Green Component
G = imagen(:,:,2);
figure;

%Blue component
B = imagen(:,:,3);
figure;


recorte1=imagen(1:100,1:200,:)
figure();imshow(recorte1),title('original');

%% ****************** plots*************************
figure();imshow(imagen),title('original');
figure();imshow(imagen_grises),title('grises');
title('de un solo click en el borde y luego enter')
[columna,fila]=getpts()
columna=round (columna);
fila=round(fila);

image(R),colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]), colorbar;
image(G), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;
image(B), colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;



pixel_R=R(fila,columna)
pixel_G=G(fila,columna)
pixel_B=B(fila,columna)