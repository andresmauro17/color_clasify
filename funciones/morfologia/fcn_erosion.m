%% FCN_EROSION erosion de una imagen
%imagen_erosionada=fcn_erosion(imagen,kernel);
% descripcion: esta funcion devuelve una imagen erosionada,
% para ejecutarla es nesesario ingresar la imagen y elelemento estructurante

% ejemplo:
% imagen=imread('GRIM.BMP');
% kernel=[0 255 255; 255 255 0; 0 255 0];
% imagen_erosionada=fcn_erosion(imagen,kernel);
% _________________________________________________________________________

%%
function[imagen_erosionada]=fcn_erosion(imagen,kernel);

x=double(imagen);
[fil,col]=size(x);

[tam tam1]=size(kernel);%tamano del kernel
suma_kernel=sum(sum(kernel));
suma_kernel=suma_kernel/255;

%% operacion dlatar 

resultado=zeros(fil,col);

for i=(tam+1)/2:1+fil-(tam+1)/2;% 3+1/2=2, empieza en dos que es el punto central
    
 for j=(tam+1)/2:1+col-(tam+1)/2;% recorre columnas
     
     % guarda la vecindad del pixel central
      vecindad=x(i-((tam-1)/2):i+((tam-1)/2),j-((tam-1)/2):j+((tam-1)/2));%mascara temporal que hace recorrido
      
    % ----------------------------------------------------------------------      
                                        
                  suma=0;
                        for p = 1:tam; % recorre filas del kernel y vecindad
                            for q = 1:tam; % recorre columnas del kernel y vecindad
                                    
                                    %si el pixel del kernel es uno y es igual a pixel vecindad                                   
                                    if kernel (p,q) == 255 && vecindad(p,q) == kernel(p,q);
                                       suma=suma+1;%incremente suma
                                     end
                                    
                            end
                        end
                        
                        if suma == suma_kernel % si el kernel es subconjunto de vecindad
                                resultado(i,j) = 255;
                        end
                                     
     %---------------------------------------------------------------------   


 end
 
end 

imagen_erosionada=resultado;

figure;imshow(uint8(imagen_erosionada)),title('imagen erosion');