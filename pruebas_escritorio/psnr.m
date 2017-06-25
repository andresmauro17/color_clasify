clc
clear all

A = im2double(imread('canon_2a.jpg')); %fotografia canon
B = im2double(imread('logitech_2a.jpg')); %fotografia logitech

error_diff = A - B;%diferencia
decibels = 20*log10(1/(sqrt(mean(mean(error_diff.^2)))));%calculo psnr
disp(sprintf('PSNR = +%5.2f dB',decibels))



