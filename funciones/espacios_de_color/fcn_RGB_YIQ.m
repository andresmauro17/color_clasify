%% fcn_RGB_YIQ convierte una imagen de rgb a YIQ
%  [Y,I,Q,imagen_YIQ]=fcn_RGB_YIQ(imagen);
% descripcion: esta funcion devuelve una imagen en YIQ,
% para ejecutarla es nesesario ingresar la imagen y devuelve los canales Y,
% I; Q, como tambn la imagen

% ejemplo:
% imagen=imread('office_5.jpg');
% [Y,I,Q,imagen_YIQ]=fcn_RGB_YIQ(imagen);
% _________________________________________________________________________


function[Y,I,Q,imagen_YIQ]=fcn_RGB_YIQ(imagen);

%% ---------conversion de la imagen a double de 0 a 1--------------------
x = im2double(imagen);% normalizacion de la imagen de 0 a 1
r=x(:,:,1);%separacion de canal r normalizado de 0 a 1
g=x(:,:,2);%separacion de canal g normalizado de 0 a 1
b=x(:,:,3);%separacion de canal b normalizado de 0 a 1


%% separacion de los canales YIQ
Y = 0.3*r+0.59*g+0.11*b;
Y=fcn_escalado_histograma(Y);
I = 0.6*r-0.28*g-0.32*b;
I=fcn_escalado_histograma(I);
Q = 0.21*r-0.52*g+0.31*b;
Q=fcn_escalado_histograma(Q);
imagen_YIQ =cat(3,Y,I,Q);

