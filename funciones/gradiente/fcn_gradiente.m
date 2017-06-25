%% [gradiente]=fcn_gradiente(imagen,filtro); 
%% el parametro filtro puede ser 'sobel' o 'Prewitt'

% Andres cuervo (2117746)

% para usarla hay que cargar una imagen, guardar en una variable e ingresar
% el parametro en la funcion, como muestra el siguiente ejemplo

% imagen=imread('moon.tif');
% [gradiente]=fcn_gradiente(imagen,filtro);
% _________________________________________________________________________

%%
function[gradiente]=fcn_gradiente(imagen,filtro);
%% mascara de sobel y convolucion
x=imagen;
if (strcmp('sobel', filtro))
    
  display('*********filtro sobel seleccionado**************')
    
        Gx=[-1 0 1; -2 0 2; -1 0 1];%mascara_gradiente en x
        Gy=[1 2 1; 0 0 0; -1 -2 -1];%mascara_gradiente en y

        bordes_x=conv2(x,Gx);%la imagen pasa por el filtro
        bordes_y=conv2(x,Gy);%la imagen pasa por el filtro

        bordes=bordes_x+bordes_y;
        
elseif (strcmp('Prewitt', filtro))    
     display('************filtro Prewitt seleccionado************')
        
        Gx=[-1 0 1; -1 0 1; -1 0 1];%mascara_gradiente en x
        Gy=[1 1 1; 0 0 0; -1 -1 -1];%mascara_gradiente en y

        bordes_x=conv2(x,Gx);%la imagen pasa por el filtro
        bordes_y=conv2(x,Gy);%la imagen pasa por el filtro

        bordes=bordes_x+bordes_y;        
else    
    display('parametro no valido')
end




%% normalizo histrograma y recorto bordes
bordes=bordes-min(min(bordes));%quitamos negativos pero pone sobrevalores positivos
bordes=bordes./max(max(bordes));%normaizo el rango de 0  a 1
bordes=bordes*255;%de 0 a 255 normaliza

[n,m]=size(Gx);
bordes=bordes(((n-1)/2)+1:end-((n-1)/2),((n-1)/2)+1:end-((n-1)/2));%recorte de bordes




%% ploteo resultados
% figure;
% subplot(1,2,1);imshow(uint8(x));title('original')
% subplot(1,2,2);imshow(uint8(bordes));title(strcat('bordes-resaltados-con-', filtro))


gradiente=bordes;
