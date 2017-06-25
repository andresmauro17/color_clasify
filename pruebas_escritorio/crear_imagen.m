% codigo de prueba crar imagen
 clc
 clear all
   
% valor1=43.31
% valor2=47.63
% valor3=14.12

valor1=176.23;
valor2=62.60;
valor3=81.37;


filas=500;columnas=500;

out_c1=ones(filas,columnas)*valor1;
out_c2=ones(filas,columnas)*valor2;
out_c3=ones(filas,columnas)*valor3;

%---- uno las capas -------
imagen_creada(:,:,1)=out_c1;imagen_creada(:,:,2)=out_c2;imagen_creada(:,:,3)=out_c3;

imagen_creada(:,:,3);

imagen_creada=uint8(imagen_creada)


figure;imshow(imagen_creada);

% [out_c1,out_c2,out_c3,imagen_creada]=fcn_crear_imagen(0,47.63,14.12,10,10);






imwrite(imagen_creada,'D:\tesis\Copy\0_matlab\imagenes_prueba\creadas\5.jpg')
