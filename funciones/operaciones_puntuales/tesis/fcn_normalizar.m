function [ imagen_normalizada ] = fcn_normalizar( imagen )
capa1=imagen(:,:,1);
matriz=double(capa1);
%  aqui la imagen queda con valores negativos hay que normalizar histograma
matriz=matriz-min(min(matriz));%quitamos negativos pero pone sobrevalores positivos
matriz=matriz./max(max(matriz));%normaizo el rango de 0  a 1
matriz=matriz*255;%de 0 a 255 normaliza
matriz=uint8(matriz);
capa1=matriz;

capa2=imagen(:,:,2);
matriz=double(capa2);
%  aqui la imagen queda con valores negativos hay que normalizar histograma
matriz=matriz-min(min(matriz));%quitamos negativos pero pone sobrevalores positivos
matriz=matriz./max(max(matriz));%normaizo el rango de 0  a 1
matriz=matriz*255;%de 0 a 255 normaliza
matriz=uint8(matriz);
capa2=matriz;

capa3=imagen(:,:,3);
matriz=double(capa3);%aqui la imagen queda con valores negativos hay que normalizar histograma
matriz=matriz-min(min(matriz));%quitamos negativos pero pone sobrevalores positivos
matriz=matriz./max(max(matriz));%normaizo el rango de 0  a 1
matriz=matriz*255;%de 0 a 255 normaliza
matriz=uint8(matriz);
capa3=matriz;

imagen_normalizada(:,:,1)=capa1;
imagen_normalizada(:,:,2)=capa2;
imagen_normalizada(:,:,3)=capa3;

end

