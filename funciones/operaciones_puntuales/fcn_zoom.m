%% fcn_zoom zoom in o zoom out de una imagen
% zoom=fcn_zoom(x,factor);
% descripcion: esta funcion devuelve una imagen realizando un zoom
%
% ejemplo:
% imagen=imread('GRIM.BMP');
%[zoom]=fcn_zoom(x,2);
% _________________________________________________________________________
%%

function[zoom]=fcn_zoom(x,factor);

%************************ zoom  in*****************************************
if factor > 0
            [fil,col]=size(x);

%mapeo cada pixel de la imagen original a la imagen zoom el mapeo lineal p=1/10i
        for i=0:factor:fil-1
            for j=0:factor:col-1   
                zoom((1/factor*i)+1,(1/factor*j)+1)=x(i+1,j+1);

            end
        end

%************************ zoom out*****************************************
else if factor < 0
        
%mapeo cada pixel de la imagen original a la imagen zoom el mapeo lineal p=1/10i        
        [fil_p,col_q]=size(x);
        factor=factor*(-1);
        for p=0:1:fil_p-1
            for q=0:1:col_q-1   
                zoom((factor*p)+1,(factor*q)+1)=x(p+1,q+1);        
            end
        end
       
else
        display('parametro no valido')
    end
   
end
    


