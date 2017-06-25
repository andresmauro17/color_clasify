%% FCN_brillo_contraste  calcula el brillo y contraste de una imagen
% imagen_brillo=fcn_brillo(imagen,brillo)
% descripcion: esta funcion devuelve el brillo y contraste de una imagen,
% para ejecutarla es nesesario ingresar la imagen como parametro.
% ejemplo:
% imimagen=imread('GRIM.BMP');
% [brillo,contraste]=fcn_brillo_contraste(imagen)
% _________________________________________________________________________



%%
function[brillo,contraste]=fcn_brillo_contraste(imagen)
x=imagen;
[fila,columna]=size (x);%guarda el numero de filas y columnas

suma=0;

for i=1:fila%recorre filas     
        for j=1:columna%recorre columnas
            temp=0;
            temp=single(x(i,j));%cambio el tipo de dato
            suma=temp+suma;          
        end
end
    
brillo=(suma)/(fila*columna);

suma=0;
for i=1:fila%recorre filas     
        for j=2:columna%recorre columnas
            temp=0;
            temp=((single(x(i,j)))- brillo )^2;%cambio el tipo de dato
            suma=temp+suma;          
        end
end

contraste= sqrt((suma)/(fila*columna));
