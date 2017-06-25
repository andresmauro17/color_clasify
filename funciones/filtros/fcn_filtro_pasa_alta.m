%% [resultado]=fcn_filtro_pasa_alta(imagen);

% ********************funcion filtro promedio*****************************

% Andres cuervo (2117746)

%% *************************************************************************_

function[resultado]=fcn_filtro_pasa_alta(imagen);

x=imagen;

% ____________________________filtro promedio_____________________________

%--------------filtro promedio----------------------

% filtro_promedio=(1/(n*n))*ones(n,n);%filtro promedio
filtro_pasa_alta=1/8*[-1 -1 -1 ; -1 9 -1; -1 -1 -1]% mascara filtro pasa alto
[n,m]=size(filtro_pasa_alta);

% ------------------convolucion y recorte-----------
imagen_f_p=conv2(x,filtro_pasa_alta);%la imagen pasa por el filtro
y2=imagen_f_p(((n-1)/2)+1:end-((n-1)/2),((n-1)/2)+1:end-((n-1)/2));%recorte de bordes

% normalizo el histograma de la imagen filtrada con pasa altas
y2=y2-min(min(y2));%quitamos negativos pero pone sobrevalores positivos
y2=y2./max(max(y2));%normaizo el rango de 0  a 1
y2=y2*255;%de 0 a 255 normaliza

resultado=y2;


