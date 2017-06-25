%% FCN_DILATACION dilatacion de una imagen
%imagen_dilatada=fcn_dilatacion(imagen,kernel);
% descripcion: esta funcion devuelve una imagen dilatada,
% para ejecutarla es nesesario ingresar la imagen y elelemento estructurante

% ejemplo:
% imagen=imread('GRIM.BMP');
% kernel=[0 255 255; 255 255 0; 0 255 0];
% imagen_dilatada=fcn_dilatacion(imagen,kernel);
% _________________________________________________________________________

%%
function[imagen_dilatada]=fcn_dilatacion(imagen,kernel);

x=double(imagen);
[fil,col]=size(x);

[tam tam1]=size(kernel);%tamano del kernel

%% operacion dlatar 

resultado=zeros(fil,col);

for i=(tam+1)/2:1+fil-(tam+1)/2;% 3+1/2=2, empieza en dos que es el punto central
    
 for j=(tam+1)/2:1+col-(tam+1)/2;% recorre columnas
     
     % guarda la vecindad del pixel central
      vecindad=x(i-((tam-1)/2):i+((tam-1)/2),j-((tam-1)/2):j+((tam-1)/2));%mascara temporal que hace recorrido
      
    % compara la vecindad si el kernel es subconjuto setea el pixel resultado
      
    for p=1:tam;% recorro filas del kernel y vecindad          
              for q=1:tam; % recorro columnas del kernel y vecindad    
                  
                       if kernel(p,q)==255 % si el pixel de el EE esta en 1 
                              if vecindad(p,q)==kernel(p,q)% compare el EE con kernel
                                   resultado(i,j)=255; % setee resultado
                              end
                       end   

              end
          end
     %---------------------------------------------------------------------   


 end
 
end 

imagen_dilatada=resultado;

figure;imshow(uint8(resultado)),title('imagen dilatada');