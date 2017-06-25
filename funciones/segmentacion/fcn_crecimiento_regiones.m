%% fcn_crecimiento_regiones segmentcacion por crecimiento de regiones
% [imagen_segmentada]=fcn_crecimiento_regiones(imagen,fila_semilla,columna_semilla);
% descripcion: esta funcion recibe un imagen binaria para devolver solo el 
% objeto segmentado, donde este indicado la semilla

% ejemplo:
%  imagen=imagen_binaria.png
% fila_semilla=150;
% columna_semilla=100
% [imagen_segmentada]=fcn_crecimiento_regiones(imagen,fila_semilla,columna_semilla);
% _________________________________________________________________________



%%
function[imagen_segmentada]=fcn_crecimiento_regiones(imagen,fila_semilla,columna_semilla);



imagen_in=imagen;%cambio de variable la imagen
[filas,columnas]=size(imagen_in);%filas y columnas

perteneciente=imagen_in.*0;% pixeles que pertenecen a la region
visitado=imagen_in.*0;% pixel que ya se examino
lista=imagen_in.*0;%vecinos de pxel a examinar

lista(fila_semilla,columna_semilla)=imagen_in(fila_semilla,columna_semilla);
    
while max(max(lista)) ~= 0%ejecute hasta que no existan pixeles similares a la semilla
  
    for i=1:filas%recorre filas
        for j=1:columnas%recorre columanas
            
            if lista(i,j)==255 && visitado(i,j)== 0;
                
                perteneciente(i,j)=255;%guardo pixel que pertenece
                lista(i,j)=0;%lo borro de la lista
                visitado(i,j)= 255;%etiqueta como visitado
                
                
                %si los pixeles conexos son similares a la semilla
                %y no han sido visitados metalos en lista para ser
                %evaluados
                
                        if imagen_in(i-1,j)==255 && visitado(i-1,j)== 0;
                            lista(i-1,j)=255;
                        else
                            visitado(i,j)== 255;%etiqueta como visitado
                        end

                        if imagen_in(i+1,j)==255 && visitado(i+1,j)== 0;
                            lista(i+1,j)=255;
                        else
                            visitado(i,j)== 255;%etiqueta como visitado
                        end

                        if imagen_in(i,j-1)==255 && visitado(i,j-1)== 0;
                            lista(i,j-1)=255;
                         else
                            visitado(i,j)== 255;%etiqueta como visitado
                        end

                        if imagen_in(i,j+1)==255 && visitado(i,j+1)== 0;
                            lista(i,j+1)=255;
                        else
                            visitado(i,j)== 255;%etiqueta como visitado
                        end

                
            end
        end    
    end
    
       
end

imagen_segmentada=perteneciente;
