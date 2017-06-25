%% [imagen_f_maximo]=fcn_filtro_maximo(imagen);
% ********************funcion filtro_maximo********************************

% Andres cuervo (2117746)

% *************************************************************************_

%%

function[imagen_f_maximo]=fcn_filtro_maximo(imagen);

x=imagen;
x=double(x);
[fil,col]=size(x);

% ____________________________filtro maximo_____________________________

imagen_f_maximo=zeros(fil,col);
tam=3;%tamano de la ventana del vecindario

for i=(tam+1)/2:1+fil-(tam+1)/2;% 3+1/2=2, empieza en dos que es el punto central
    
 for j=(tam+1)/2:1+col-(tam+1)/2;
     
      temp=x(i-((tam-1)/2):i+((tam-1)/2),j-((tam-1)/2):j+((tam-1)/2));%mascara temporal que hace recorrido
      
      imagen_f_maximo(i,j)=max(max(temp));%asigno el maximo centro de la vecindad
      
        
 end
 
end 


