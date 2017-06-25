% pasar de rgb to lab http://www.easyrgb.com/index.php?X=MATH&H=02#text2
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

clc
clear all
 
R =176;
G=63;
B=81;

%------escalado del histograma  a 0 a 1------
var_R = ( R / 255 )        % R from 0 to 255
var_G = ( G / 255 )        %G from 0 to 255
var_B = ( B / 255 )        %B from 0 to 255



if var_R > 0.04045 
   var_R = ( ( var_R + 0.055 ) / 1.055 ) ^ 2.4
else
   var_R = var_R / 12.92
   
end
    
    
if  var_G > 0.04045 
    var_G = ( ( var_G + 0.055 ) / 1.055 ) ^ 2.4
else
    var_G = var_G / 12.92
end
    
    
if  var_B > 0.04045 
    var_B = ( ( var_B + 0.055 ) / 1.055 ) ^ 2.4
else
    var_B = var_B / 12.92
end
    

var_R = var_R * 100
var_G = var_G * 100
var_B = var_B * 100

% Observer. = 2°, Illuminant = D65
X = var_R * 0.4124 + var_G * 0.3576 + var_B * 0.1805
Y = var_R * 0.2126 + var_G * 0.7152 + var_B * 0.0722
Z = var_R * 0.0193 + var_G * 0.1192 + var_B * 0.9505

% ///////////////////// pasar a LAB //////////////////////////////


