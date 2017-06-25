



function[capa_l,capa_c,capa_h,imagen_lch]=fcn_lab_lch_d65_1931(imagen_lab);

%% ---------conversion de la imagen a double de 0 a 1--------------------
paso=1
imagen=imagen_lab;
imagen=double(imagen);

capa_l=imagen(:,:,1);
a=imagen(:,:,2);
b=imagen(:,:,3);

capa_c=sqrt(a.^2+b.^2);%la capa c es la hipotenusa en polares
capa_h= atand(b./a);%la capa H es el angulo

%---- uno las capas -------
imagen_lch(:,:,1)=capa_l;
imagen_lch(:,:,2)=capa_c;
imagen_lch(:,:,3)=capa_h;




