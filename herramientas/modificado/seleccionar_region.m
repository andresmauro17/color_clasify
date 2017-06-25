function varargout = seleccionar_region(varargin)
% SELECCIONAR_REGION MATLAB code for seleccionar_region.fig
%      SELECCIONAR_REGION, by itself, creates a new SELECCIONAR_REGION or raises the existing
%      singleton*.
%
%      H = SELECCIONAR_REGION returns the handle to a new SELECCIONAR_REGION or the handle to
%      the existing singleton*.
%
%      SELECCIONAR_REGION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECCIONAR_REGION.M with the given input arguments.
%
%      SELECCIONAR_REGION('Property','Value',...) creates a new SELECCIONAR_REGION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before seleccionar_region_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to seleccionar_region_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help seleccionar_region

% Last Modified by GUIDE v2.5 09-Aug-2014 11:10:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @seleccionar_region_OpeningFcn, ...
    'gui_OutputFcn',  @seleccionar_region_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before seleccionar_region is made visible.
function seleccionar_region_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);


%******************************copiar en opening fcn*************

global region_referencia_lab
global region_muestra_lab
global region_referencia_lch
global region_muestra_lch
global region_referencia
global region_muestra
global region1;%%recibo la imagen del otro guide
global region2;%%recibo la imagen del otro guide
global texto_capa1;
global texto_capa2;
global texto_capa3;
global texto_espacio_color;
global diferencias_promedio

region1=region_referencia_lab;
region2=region_muestra_lab
texto_espacio_color=' L*A*B';
texto_capa1='L*';
texto_capa2='A*';
texto_capa3='B*';


set(handles.espacio,'string',texto_espacio_color);
set(handles.capa1,'string',texto_capa1);
set(handles.capa2,'string',texto_capa2);
set(handles.capa3,'string',texto_capa3);



axes(handles.grafica_region1);
imshow(uint8(region1));
axes(handles.grafica_region2);
imshow(uint8(region2));
handles.recorte1=region1;
handles.recorte2=region2;
guidata(hObject,handles);%actualizo el handles

    %     -------primer recorte capa1-------
    recorte1 = handles.recorte1(:,:,1);
        
    axes(handles.grafica_region1_capa1);
    imshow(uint8(recorte1));
    
    vector_promedio=mean(recorte1);
    promedio_region1_capa1=mean(vector_promedio);
    vector_mediana=median(recorte1);
    mediana_region1_capa1=median(vector_mediana);
    vector_moda=mode(recorte1);
    moda_region1_capa1=mode(vector_moda);
    region1_double=double(recorte1);
    varianza_region1_capa1=var(region1_double(:));
    desviacion_region1_capa1=std(region1_double(:));
    maximo_region1_capa1=max(max(recorte1));
    minimo_region1_capa1=min(min(recorte1));
    
    
    set(handles.promedio_region1_capa1,'string', promedio_region1_capa1);
    set(handles.mediana_region1_capa1,'string', mediana_region1_capa1);
    set(handles.moda_region1_capa1,'string', moda_region1_capa1);
    set(handles.varianza_region1_capa1,'string', varianza_region1_capa1);
    set(handles.desviacion_region1_capa1,'string', desviacion_region1_capa1);
    set(handles.maximo_region1_capa1,'string', maximo_region1_capa1);
    set(handles.minimo_region1_capa1,'string', minimo_region1_capa1);
    

    
    %     -------segundo recorte capa1 -------
    recorte2 = handles.recorte2(:,:,1);
    
    axes(handles.grafica_region2_capa1);
    imshow(uint8(recorte2));
    vector_promedio=mean(recorte2);
    promedio_region2_capa1=mean(vector_promedio);
    vector_mediana=median(recorte2);
    mediana_region2_capa1=median(vector_mediana);
    vector_moda=mode(recorte2);
    moda_region2_capa1=mode(vector_moda);
    region2_double=double(recorte2);
    varianza_region2_capa1=var(region2_double(:));
    desviacion_region2_capa1=std(region2_double(:));
    maximo_region2_capa1=max(max(recorte2));
    minimo_region2_capa1=min(min(recorte2));
    
    set(handles.promedio_region2_capa1,'string', promedio_region2_capa1);
    set(handles.mediana_region2_capa1,'string', mediana_region2_capa1);
    set(handles.moda_region2_capa1,'string', moda_region2_capa1);
    set(handles.varianza_region2_capa1,'string', varianza_region2_capa1);
    set(handles.desviacion_region2_capa1,'string', desviacion_region2_capa1);
    set(handles.maximo_region2_capa1,'string', maximo_region2_capa1);
    set(handles.minimo_region2_capa1,'string', minimo_region2_capa1);
    
 
%     dif_pro_c1=abs(promedio_region1 - promedio_region2);
%     dif_med_c1=abs(mediana_region1 - mediana_region2);
%     dif_mod_c1=abs(moda_region1 - moda_region2);
%     dif_var_c1=abs(varianza_region1 - varianza_region2);
%     dif_std_c1=abs(desviacion_region1 - desviacion_region2);
%     dif_max_c1=abs(maximo_region1 - maximo_region2);
%     dif_min_c1=abs(minimo_region1 - minimo_region2);
%     
%     set(handles.promedio_diferencia_capa1,'string', dif_pro_c1)
%     set(handles.mediana_diferencia_capa1,'string', dif_med_c1)
%     set(handles.moda_diferencia_capa1,'string', dif_mod_c1)
%     set(handles.varianza_diferencia_capa1,'string',  dif_var_c1)
%     set(handles.desviacion_diferencia_capa1,'string', dif_std_c1)
%     set(handles.maximo_diferencia_capa1,'string', dif_max_c1)
%     set(handles.minimo_diferencia_capa1,'string', dif_min_c1)
%     
    
    
    
      %     -------primer recorte capa2-------
    recorte1 = handles.recorte1(:,:,2);
    
    axes(handles.grafica_region1_capa2);
    imshow(uint8(recorte1));
    
    vector_promedio=mean(recorte1);
    promedio_region1_capa2=mean(vector_promedio);
    vector_mediana=median(recorte1);
    mediana_region1_capa2=median(vector_mediana);
    vector_moda=mode(recorte1);
    moda_region1_capa2=mode(vector_moda);
    region1_double=double(recorte1);
    varianza_region1_capa2=var(region1_double(:));
    desviacion_region1_capa2=std(region1_double(:));
    maximo_region1_capa2=max(max(recorte1));
    minimo_region1_capa2=min(min(recorte1));
    
    
    set(handles.promedio_region1_capa2,'string', promedio_region1_capa2);
    set(handles.mediana_region1_capa2,'string', mediana_region1_capa2);
    set(handles.moda_region1_capa2,'string', moda_region1_capa2);
    set(handles.varianza_region1_capa2,'string', varianza_region1_capa2);
    set(handles.desviacion_region1_capa2,'string', desviacion_region1_capa2);
    set(handles.maximo_region1_capa2,'string', maximo_region1_capa2);
    set(handles.minimo_region1_capa2,'string', minimo_region1_capa2);
    
    
    
    %     -------segundo recorte -------
    recorte2 = handles.recorte2(:,:,2);
    
    axes(handles.grafica_region2_capa2);
    imshow(uint8(recorte2));
    
    vector_promedio=mean(recorte2);
    promedio_region2_capa2=mean(vector_promedio);
    vector_mediana=median(recorte2);
    mediana_region2_capa2=median(vector_mediana);
    vector_moda=mode(recorte2);
    moda_region2_capa2=mode(vector_moda);
    region2_double=double(recorte2);
    varianza_region2_capa2=var(region2_double(:));
    desviacion_region2_capa2=std(region2_double(:));
    maximo_region2_capa2=max(max(recorte2));
    minimo_region2_capa2=min(min(recorte2));
    
    set(handles.promedio_region2_capa2,'string', promedio_region2_capa2);
    set(handles.mediana_region2_capa2,'string', mediana_region2_capa2);
    set(handles.moda_region2_capa2,'string', moda_region2_capa2);
    set(handles.varianza_region2_capa2,'string', varianza_region2_capa2);
    set(handles.desviacion_region2_capa2,'string', desviacion_region2_capa2);
    set(handles.maximo_region2_capa2,'string', maximo_region2_capa2);
    set(handles.minimo_region2_capa2,'string', minimo_region2_capa2);
    
    
    
    
        %     -------primer recorte capa 3-------
    recorte1 = handles.recorte1(:,:,3);
    
    axes(handles.grafica_region1_capa3);
    imshow(uint8(recorte1));
    
    vector_promedio=mean(recorte1);
    promedio_region1_capa3=mean(vector_promedio);
    vector_mediana=median(recorte1);
    mediana_region1_capa3=median(vector_mediana);
    vector_moda=mode(recorte1);
    moda_region1_capa3=mode(vector_moda);
    region1_double=double(recorte1);
    varianza_region1_capa3=var(region1_double(:));
    desviacion_region1_capa3=std(region1_double(:));
    maximo_region1_capa3=max(max(recorte1));
    minimo_region1_capa3=min(min(recorte1));
    
    
    set(handles.promedio_region1_capa3,'string', promedio_region1_capa3);
    set(handles.mediana_region1_capa3,'string', mediana_region1_capa3);
    set(handles.moda_region1_capa3,'string', moda_region1_capa3);
    set(handles.varianza_region1_capa3,'string', varianza_region1_capa3);
    set(handles.desviacion_region1_capa3,'string', desviacion_region1_capa3);
    set(handles.maximo_region1_capa3,'string', maximo_region1_capa3);
    set(handles.minimo_region1_capa3,'string', minimo_region1_capa3);
    
    
    
    %     -------segundo recorte capa3 -------
    recorte2 = handles.recorte2(:,:,3);
    
    axes(handles.grafica_region2_capa3);
    imshow(uint8(recorte2));
    
    vector_promedio=mean(recorte2);
    promedio_region2_capa3=mean(vector_promedio);
    vector_mediana=median(recorte2);
    mediana_region2_capa3=median(vector_mediana);
    vector_moda=mode(recorte2);
    moda_region2_capa3=mode(vector_moda);
    region2_double=double(recorte2);
    varianza_region2_capa3=var(region2_double(:));
    desviacion_region2_capa3=std(region2_double(:));
    maximo_region2_capa3=max(max(recorte2));
    minimo_region2_capa3=min(min(recorte2));
    
    set(handles.promedio_region2_capa3,'string', promedio_region2_capa3);
    set(handles.mediana_region2_capa3,'string', mediana_region2_capa3);
    set(handles.moda_region2_capa3,'string', moda_region2_capa3);
    set(handles.varianza_region2_capa3,'string', varianza_region2_capa3);
    set(handles.desviacion_region2_capa3,'string', desviacion_region2_capa3);
    set(handles.maximo_region2_capa3,'string', maximo_region2_capa3);
    set(handles.minimo_region2_capa3,'string', minimo_region2_capa3);
    
    
% %     ********************* diferencias*******************
% 
[delta_promedio_capa1,delta_promedio_capa2,delta_promedio_capa3,diferencias_promedio]=fcn_delta(promedio_region1_capa1, promedio_region1_capa2,promedio_region1_capa3,promedio_region2_capa1,promedio_region2_capa2,promedio_region2_capa3);
[delta_mediana_capa1,delta_mediana_capa2,delta_mediana_capa3,diferencias_mediana]=fcn_delta(mediana_region1_capa1, mediana_region1_capa2,mediana_region1_capa3,mediana_region2_capa1,mediana_region2_capa2,mediana_region2_capa3);
[delta_moda_capa1,delta_moda_capa2,delta_moda_capa3,diferencias_moda]=fcn_delta(moda_region1_capa1, moda_region1_capa2,moda_region1_capa3,moda_region2_capa1,moda_region2_capa2,moda_region2_capa3);
[delta_varianza_capa1,delta_varianza_capa2,delta_varianza_capa3,diferencias_varianza]=fcn_delta(varianza_region1_capa1, varianza_region1_capa2,varianza_region1_capa3,varianza_region2_capa1,varianza_region2_capa2,varianza_region2_capa3);
[delta_desviacion_capa1,delta_desviacion_capa2,delta_desviacion_capa3,diferencias_desviacion]=fcn_delta(desviacion_region1_capa1, desviacion_region1_capa2,desviacion_region1_capa3,desviacion_region2_capa1,desviacion_region2_capa2,desviacion_region2_capa3);
[delta_maximo_capa1,delta_maximo_capa2,delta_maximo_capa3,diferencias_maximo]=fcn_delta(maximo_region1_capa1, maximo_region1_capa2,maximo_region1_capa3,maximo_region2_capa1,maximo_region2_capa2,maximo_region2_capa3);
[delta_minimo_capa1,delta_minimo_capa2,delta_minimo_capa3,diferencias_minimo]=fcn_delta(minimo_region1_capa1, minimo_region1_capa2,minimo_region1_capa3,minimo_region2_capa1,minimo_region2_capa2,minimo_region2_capa3);


%     set(handles.diferencia_promedio,'string', diferencias_promedio);
%     set(handles.diferencia_mediana,'string', diferencias_mediana);
%     set(handles.diferencia_moda,'string',diferencias_moda);
%     set(handles.diferencia_varianza,'string', diferencias_varianza);
%     set(handles.diferencia_desviacion,'string', diferencias_desviacion);
%     set(handles.diferencia_maximo,'string', diferencias_maximo);
%     set(handles.diferencia_minimo,'string', diferencias_minimo);
    
    

    set(handles.promedio_diferencia_capa1,'string', delta_promedio_capa1);
    set(handles.mediana_diferencia_capa1,'string', delta_mediana_capa1);
    set(handles.moda_diferencia_capa1,'string',delta_moda_capa1);
    set(handles.varianza_diferencia_capa1,'string', delta_varianza_capa1);
    set(handles.desviacion_diferencia_capa1,'string', delta_desviacion_capa1);
    set(handles.maximo_diferencia_capa1,'string', delta_maximo_capa1);
    set(handles.minimo_diferencia_capa1,'string', delta_minimo_capa1);


    set(handles.promedio_diferencia_capa2,'string', delta_promedio_capa2);
    set(handles.mediana_diferencia_capa2,'string', delta_mediana_capa2);
    set(handles.moda_diferencia_capa2,'string',delta_moda_capa2);
    set(handles.varianza_diferencia_capa2,'string', delta_varianza_capa2);
    set(handles.desviacion_diferencia_capa2,'string', delta_desviacion_capa2);
    set(handles.maximo_diferencia_capa2,'string', delta_maximo_capa2);
    set(handles.minimo_diferencia_capa2,'string', delta_minimo_capa2);


    set(handles.promedio_diferencia_capa3,'string', delta_promedio_capa3);
    set(handles.mediana_diferencia_capa3,'string', delta_mediana_capa3);
    set(handles.moda_diferencia_capa3,'string',delta_moda_capa3);
    set(handles.varianza_diferencia_capa3,'string', delta_varianza_capa3);
    set(handles.desviacion_diferencia_capa3,'string', delta_desviacion_capa3);
    set(handles.maximo_diferencia_capa3,'string', delta_maximo_capa3);
    set(handles.minimo_diferencia_capa3,'string', delta_minimo_capa3);

% handles.diferencias_promedio=diferencias_promedio;%guardo el sonido para ser usada en otros botones
% 

handles.promedio_region1_capa1=promedio_region1_capa1;
handles.promedio_region1_capa2=promedio_region1_capa2;
handles.promedio_region1_capa3=promedio_region1_capa3;
handles.promedio_region2_capa1=promedio_region2_capa1;
handles.promedio_region2_capa2=promedio_region2_capa2;
handles.promedio_region2_capa3=promedio_region2_capa3;

guidata(hObject,handles);%actualizo el handles






    
    
    
    
    


    
 

    
    
    







% --- Outputs from this function are returned to the command line.
function varargout = seleccionar_region_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
% function pushbutton1_Callback(hObject, eventdata, handles)
% global imagen_original;
% 
% [nombre direccion]=uigetfile('*.*','examinar');%funcion que abre ventana examinar
% %si no se a seleccionado una imagen espere
% if nombre == 0
%     return
% end
% imagen=imread(fullfile(direccion,nombre));%lectura de imagen
% imagen_original=imagen;
% handles.img=imagen;%guardo la imagen para ser usada en otros botones
% handles.nombre=nombre%guardo el nombre de ña imagen en el handles
% guidata(hObject,handles);%actualizo el handles
% 
% axes(handles.axes1);
% imshow(imagen);
% 
% %******************************copiar en opening fcn*************
% 
% title('seleccione la region 1');
% region = getrect
% region = round(region)
% recorte1=imcrop(imagen,region);
% 
% axes(handles.axes10);
% imshow(recorte1);
% 
% axes(handles.axes1);
% imshow(imagen);
% 
% title('seleccione la region 2');
% region = getrect
% region = round(region)
% recorte2=imcrop(imagen,region);
% 
% 
% 
% axes(handles.axes12);
% imshow(recorte2);
% 
% handles.recorte1=recorte1;
% handles.recorte2=recorte2;
% guidata(hObject,handles);%actualizo el handles


% --- Executes on button press in boton_volver_a_regiones.
function boton_volver_a_regiones_Callback(hObject, eventdata, handles)



% --- Executes on button press in boton_volver_a_inicio.
function boton_volver_a_inicio_Callback(hObject, eventdata, handles)




function entrada_rango_Callback(hObject, eventdata, handles)
% hObject    handle to entrada_rango (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of entrada_rango as text
%        str2double(get(hObject,'String')) returns contents of entrada_rango as a double


% --- Executes during object creation, after setting all properties.
function entrada_rango_CreateFcn(hObject, eventdata, handles)
% hObject    handle to entrada_rango (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clasificar.
function clasificar_Callback(hObject, eventdata, handles)
% diferencias_promedio=handles.diferencias_promedio
% de=handles.de;
% rango=get(handles.entrada_rango,'string'),
% rango=str2double(rango)
% 
% % division=diferencias_promedio/rango;
% division=de/rango;
% 
% salida=uint8(division);
% set(handles.grupo,'Visible','ON');
% set(handles.grupo_clasificado,'string',salida)


% --- Executes on button press in boton_delta_cmc.
function boton_delta_cmc_Callback(hObject, eventdata, handles)

L1=handles.promedio_region1_capa1;
A1=handles.promedio_region1_capa2;
B1=handles.promedio_region1_capa3;
L2=handles.promedio_region2_capa1;
A2=handles.promedio_region2_capa2;
B2=handles.promedio_region2_capa3;


paral=get(handles.paral,'string'),
paral=str2double(paral)

parac=get(handles.parac,'string'),
parac=str2double(parac)

lab1=[L1,A1,B1]
lab2=[L2,A2,B2]

[de,dl,dc,dh] = cmcde(lab1,lab2,paral,parac)

set(handles.diferencia_cmc,'string',de)

handles.de=de;
guidata(hObject,handles);%actualizo el handles



function paral_Callback(hObject, eventdata, handles)
% hObject    handle to paral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paral as text
%        str2double(get(hObject,'String')) returns contents of paral as a double


% --- Executes during object creation, after setting all properties.
function paral_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function parac_Callback(hObject, eventdata, handles)
% hObject    handle to parac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of parac as text
%        str2double(get(hObject,'String')) returns contents of parac as a double


% --- Executes during object creation, after setting all properties.
function parac_CreateFcn(hObject, eventdata, handles)
% hObject    handle to parac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
