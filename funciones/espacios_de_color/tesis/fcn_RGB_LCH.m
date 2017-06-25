%% fcn_RGB_LCH convierte una imagen de rgb a lch
% [L,C,H,imagen_lch]=fcn_RGB_LCH(imagen)
% descripcion: esta funcion devuelve una imagen en espacio LCH, se utiliza
% CIELAB para la comvercion
% para ejecutarla es nesesario ingresar la imagen y devuelve los canales L,
% C; H, como tambn la imagen en el espacio LCH

% ejemplo:
% imagen=imread('office_5.jpg');
% [L,C,H,imagen_lch]=fcn_RGB_LCH(imagen);
% _________________________________________________________________________


function[L,C,H,imagen_lch]=fcn_RGB_LCH(imagen);

%% ---------conversion de la imagen a double de 0 a 1--------------------
imagen = im2double(imagen);% normalizacion de la imagen de 0 a 1
cform = makecform('srgb2lab');
imagen_LAB = applycform(imagen,cform);

L=imagen(:,:,1);
a=imagen(:,:,2);
b=imagen(:,:,3);

C=sqrt(a.^2+b.^2);%la capa c es la hipotenusa en polares
H= atand(b./a);%la capa H es el angulo

%---- uno las capas -------
imagen_lch(:,:,1)=L;
imagen_lch(:,:,2)=C;
imagen_lch(:,:,3)=H;
   

