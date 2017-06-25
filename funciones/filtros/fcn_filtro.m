% [imagen_filtrada]=fcn_filtro(imagen,filtro);//ANDRES CUERVO

function[imagen_filtrada]=fcn_filtro(imagen,filtro);

x=imagen;
[n m]=size(filtro);

%% ------------------convolucion , recorte y normalizacion de histograma-----------
imagen_f_p=conv2(x,filtro);%la imagen pasa por el filtro

imagen_filtrada=imagen_f_p(((n-1)/2)+1:end-((n-1)/2),((n-1)/2)+1:end-((n-1)/2));%recorte de bordes



