%% [imagen_f_mediana]=fcn_filtro_mediana(imagen,n);
% ********************ejemplo filtro mediana*****************************

% Andres cuervo (2117746)
% x=imread('GRIM.BMP');%cargar imagen
% [imagen_f_mediana]=funcion_filtro_mediana(x,3);

%% *************************************************************************_

function[imagen_f_mediana]=fcn_filtro_mediana(imagen,n);
x=double(imagen);

[fil,col]=size(x);

% ____________________________filtro mediana_____________________________

imagen_f_mediana=zeros(fil,col);
tam=n;%tamano de la ventana del vecindario

for i=(tam+1)/2:1+fil-(tam+1)/2;% 3+1/2=2, empieza en dos que es el punto central
    
 for j=(tam+1)/2:1+col-(tam+1)/2;
     
      temp=x(i-((tam-1)/2):i+((tam-1)/2),j-((tam-1)/2):j+((tam-1)/2));%mascara temporal que hace recorrido
      
      imagen_f_mediana(i,j)=median(median(temp));%asigno la mediana en centro de la vecindad
     
     
 end
 
end 



