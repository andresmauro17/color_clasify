clc
clear all
i=imread('flowers.tif')
imshow(i)
impixelinfo%muestra el valor del pixel donde me pare
impixel(i,20,40)

imfinfo('flowers.tif')