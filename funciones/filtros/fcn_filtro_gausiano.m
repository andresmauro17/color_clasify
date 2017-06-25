%% [imagen_f_gaus_3x3,imagen_f_gaus_5x5 ]=fcn_filtro_gausiano(imagen);
% ********************funcion filtro gausiano*****************************

% Andres cuervo (2117746)

% *************************************************************************_
%%
function[imagen_f_gaus_3x3,imagen_f_gaus_5x5 ]=fcn_filtro_gausiano(imagen);
x=imagen;
% ____________________________filtros gausiano_____________________________

%-------filtrogausiano 3x3 y 5x5-----------------
f_gaus_3x3=[1 2 1; 2 4 2; 1 2 1]%filtro gausiano 3x3
f_gaus_3x3=f_gaus_3x3*(1/16);%filtro gausiano 5x5

f_gaus_5x5=[3 6 8 6 3; 6 14 19 14 6; 8 19 25 19 8; 6 14 19 14 6; 3 6 8 6 3];
f_gaus_5x5=f_gaus_5x5*(1/249);

% --------------convolucion y recorte-----------
imagen_f_gaus_3x3 =conv2(x,f_gaus_3x3);%la imagen pasa por el filtro
imagen_f_gaus_3x3 =imagen_f_gaus_3x3(2:end-1 , 2:end-1);%recorte de bordes

imagen_f_gaus_5x5 =conv2(x,f_gaus_5x5);%la imagen pasa por el filtro
imagen_f_gaus_5x5 =imagen_f_gaus_5x5(3:end-2 , 3:end-2);%recorte de bordes




