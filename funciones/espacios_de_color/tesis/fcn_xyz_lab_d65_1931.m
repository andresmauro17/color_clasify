


function[capa_l,capa_a,capa_b,imagen_lab]=fcn_xyz_lab_d65_1931(imagen_xyz);


imagen=imagen_xyz;
imagen=double(imagen);
[filas,columnas,capas]=size(imagen);


for i=1:filas % recorre filas
    for j=1:columnas % recorre columnas
        
        X=imagen(i,j,1);
        Y=imagen(i,j,2);
        Z=imagen(i,j,3);
        
        ref_X =  95.047 ;
        ref_Y = 100.000;
        ref_Z = 108.883;
        
        var_X = X / ref_X;
        var_Y = Y / ref_Y;
        var_Z = Z / ref_Z;
        
        if var_X > 0.008856
            var_X = var_X ^ ( 1/3 );
        else
            var_X = ( 7.787 * var_X ) + ( 16 / 116 );
        end
        
        if var_Y > 0.008856
            var_Y = var_Y ^ ( 1/3 );
        else
            var_Y = ( 7.787 * var_Y ) + ( 16 / 116 );
        end
        
        
        if  var_Z > 0.008856
            var_Z = var_Z ^ ( 1/3 );
        else
            var_Z = ( 7.787 * var_Z ) + ( 16 / 116 );
        end
        
        CIE_L = ( 116 * var_Y ) - 16;
        CIE_A = 500 * ( var_X - var_Y );
        CIE_B = 200 * ( var_Y - var_Z );
        
        imagen_lab(i,j,1)=CIE_L;
        imagen_lab(i,j,2)=CIE_A;
        imagen_lab(i,j,3)=CIE_B;
        
        
        
        
    end
end



capa_l=imagen_lab(i,j,1);
capa_a=imagen_lab(i,j,2);
capa_b=imagen_lab(i,j,3);

