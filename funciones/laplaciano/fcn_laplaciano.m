%% [resultado]=fcn_laplaciano(imagen);
%% resultado es la imagen aplicando laplaciano

% Andres cuervo (2117746)

% para usarla hay que cargar una imagen, guardar en una variable e ingresar
% el parametro en la funcion, como muestra el siguiente ejemplo

% imagen=imread('moon.tif');
% [resultado]=fcn_laplaciano(imagen);
% _________________________________________________________________________

%%
function[resultado]=fcn_laplaciano(imagen);
x=imagen;
display('funcion laplaciano ejecutada')
filtro=[0 1 0;1 -4 1;0 1 0];%mascara_gradiente en y

im_laplaciano=conv2(x,filtro);%la imagen pasa por el filtro

       %% normalizo histrograma y recorto bordes
im_laplaciano=im_laplaciano-min(min(im_laplaciano));%quitamos negativos pero pone sobrevalores positivos
im_laplaciano=im_laplaciano./max(max(im_laplaciano));%normaizo el rango de 0  a 1
im_laplaciano=im_laplaciano*255;%de 0 a 255 normaliza

[n,m]=size(filtro);
im_laplaciano=im_laplaciano(((n-1)/2)+1:end-((n-1)/2),((n-1)/2)+1:end-((n-1)/2));%recorte de bordes

%% ploteo resultados
figure;
subplot(1,2,1);imshow(uint8(x));title('original');
subplot(1,2,2);imshow(uint8(im_laplaciano));title('imagen filtrada con laplaciano');

resultado=im_laplaciano;
