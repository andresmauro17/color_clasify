
clc 
clear all

imagen=imread('cherpol_1.jpg');



[capa_x,capa_y,capa_z,imagen_xyz]=fcn_rgb_xyz_d65_1931(imagen);

[capa_l,capa_a,capa_b,imagen_lab]=fcn_xyz_lab_d65_1931(imagen_xyz);
[capa_l,capa_c,capa_h,imagen_lch]=fcn_lab_lch_d65_1931(imagen_lab);

figure, imshow(imagen) , title('original');
impixelinfo

figure, imshow(uint8(imagen_lab)) , title('imagen_lab');
impixelinfo







RgbI=imread('IMG_0010.jpg');


XYZTransformation = makecform('srgb2xyz'); 

XyzI = applycform(RgbI,XYZTransformation);

%seperate X,Y,Z

X = XyzI(:,:,1);
Y = XyzI(:,:,2);
Z = XyzI(:,:,3);

figure, imshow(X) , title('X');
impixelinfo
figure, imshow(Y) , title('Y');
impixelinfo
figure, imshow(Z) , title('Z');
impixelinfo

xyz = cat(3, X,Y,Z);

figure, imshow(xyz) , title('xyz');
impixelinfo

figure, imshow(RgbI) , title('xyz');
impixelinfo
