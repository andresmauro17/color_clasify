%% [resultado]=funcion_filtro_promedio(imagen,n);

% ********************funcion filtro promedio*****************************

% Andres cuervo (2117746)

%% *************************************************************************_

function[resultado]=fcn_filtro_promedio(imagen,n);

x=imagen;

% ____________________________filtro promedio_____________________________

%--------------filtro promedio----------------------

filtro_promedio=(1/(n*n))*ones(n,n);%filtro promedio

% ------------------convolucion y recorte-----------
imagen_f_p=conv2(x,filtro_promedio);%la imagen pasa por el filtro
y2=imagen_f_p(((n-1)/2)+1:end-((n-1)/2),((n-1)/2)+1:end-((n-1)/2));%recorte de bordes
resultado=uint8(y2);

