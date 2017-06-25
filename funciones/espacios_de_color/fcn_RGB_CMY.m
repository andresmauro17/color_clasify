%% fcn_RGB_CMY convierte una imagen de rgb a cmy
%   [C,M,Y,imagen_cmy]=fcn_RGB_CMY(imagen);
% descripcion: esta funcion devuelve una imagen en cmy,
% para ejecutarla es nesesario ingresar la imagen y devuelve los canales C,
% M; Y, como tambn la imagen

% ejemplo:
% imagen=imread('office_5.jpg');
% [C,M,Y,imagen_cmy]=fcn_RGB_CMY(imagen);
% _________________________________________________________________________


function[C,M,Y,imagen_cmy]=fcn_RGB_CMY(imagen);

%% ---------conversion de la imagen a double de 0 a 1--------------------
x = im2double(imagen);% normalizacion de la imagen de 0 a 1
r=x(:,:,1);%separacion de canal r normalizado de 0 a 1
g=x(:,:,2);%separacion de canal g normalizado de 0 a 1
b=x(:,:,3);%separacion de canal b normalizado de 0 a 1


%% separacion de los canales CMY
%obtencion el espacio cmy y normalizado de 0 a 255
c = 1-r;
C=fcn_escalado_histograma(c);
m = 1-g;
M=fcn_escalado_histograma(m);
y = 1-b;
Y=fcn_escalado_histograma(y);
imagen_cmy= cat(3,C,M,Y);% une los canales para formar la imagen en formato cmy 



