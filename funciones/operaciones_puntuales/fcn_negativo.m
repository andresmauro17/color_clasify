%% fcn_negativo devuelve el negativo una imagen
% negativo=fcn_negativo(imagen);
% descripcion: esta funcion devuelve una imagen en negativo,
% para ejecutarla es nesesario ingresar la imagen. esta funcion  los coleres brillantes
% los vuelve oscuros y los claros, oscuros.
% ejemplo:
% imagen=imread('GRIM.BMP');
% [negativo]=fcn_negativo(imagen);
% _________________________________________________________________________


function[negativo]=fcn_negativo(imagen);

x=imagen;

[fila,columna]=size (x);%guarda el numero de filas y columnas


for i=1:fila%recorre filas     
        for j=1:columna%recorre columnas
           temp=255-x(i,j);
           y(i,j)=temp;
        end
end

negativo=y;
% figure,imshow(negativo);



