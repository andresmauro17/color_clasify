clc
clear all
close all

imagen = imread('Caramelo_G1.jpg');
imshow(imagen);title('de un solo click en el pixel y luego enter');
[b,a]=getpts();
fila=round (a)
columna=round(b)
valor_pixel_1=imagen(fila,columna,1)
valor_pixel_2=imagen(fila,columna,2)
valor_pixel_3=imagen(fila,columna,3)

[filas,columnas,capas]=size(imagen);

capa1= (uint8(ones(filas,columnas)))*valor_pixel_1;
figure();imshow(capa1)

capa2= (uint8(ones(filas,columnas)))*valor_pixel_2;
figure();imshow(capa2)

capa3= (uint8(ones(filas,columnas)))*valor_pixel_3;
figure();imshow(capa3)


capa123=cat(3,capa1,capa2,capa3)
figure();imshow(capa123)

