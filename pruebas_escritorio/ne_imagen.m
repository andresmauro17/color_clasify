clc
clear all
imagen=imread('10_cherpol.jpg');

capa1=imagen(:,:,1);
capa2=imagen(:,:,2);
capa3=imagen(:,:,3);

[filas,columnas,capas]=size(imagen)

for c=1:capas % recorre capas
    for i=1:filas % recorre filas
        for j=1:columnas % recorre columnas
            
           new_imagen(i,j,c)=imagen(i,j,c) + 1 ;
            
            
            
        end        
    end     
end

capa1_new=new_imagen(:,:,1)
capa2_new=new_imagen(:,:,2)
capa3_new=new_imagen(:,:,3)