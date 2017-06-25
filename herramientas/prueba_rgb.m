function varargout = prueba_rgb(varargin)
% este es
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @prueba_rgb_OpeningFcn, ...
    'gui_OutputFcn',  @prueba_rgb_OutputFcn, ...
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



% --- Executes just before prueba_rgb is made visible.
function prueba_rgb_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for prueba_rgb
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

handles.img=0;
handles.nombre='';
handles.umbral_slider=0;%guardo la imagen para ser usada en otros botones

guidata(hObject,handles);%actualizo el handles



% --- Outputs from this function are returned to the command line.
function varargout = prueba_rgb_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- Executes on button press in cargar.
function cargar_Callback(hObject, eventdata, handles)
global imagen_original;
global imagen_rgb

[nombre direccion]=uigetfile('*.*','examinar');%funcion que abre ventana examinar
%si no se a seleccionado una imagen espere
if nombre == 0
    return
end
imagen=imread(fullfile(direccion,nombre));%lectura de imagen
imagen_original=imagen;
imagen_rgb=imagen;
handles.img=imagen;%guardo la imagen para ser usada en otros botones
handles.nombre=nombre%guardo el nombre de ña imagen en el handles
guidata(hObject,handles);%actualizo el handles

axes(handles.axes1);
imshow(imagen);
impixelinfo
set(handles.text5,'Visible','ON');
set(handles.color,'Visible','ON');
set(handles.uipanel3,'Visible','ON');





% --- Executes on button press in RGB.
function RGB_Callback(hObject, eventdata, handles)
% hObject    handle to RGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RGB


% --- Executes on button press in CMY.
function CMY_Callback(hObject, eventdata, handles)
% hObject    handle to CMY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CMY


% --- Executes on button press in YIQ.
function YIQ_Callback(hObject, eventdata, handles)
% hObject    handle to YIQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of YIQ


% --- Executes on button press in HSL.
function HSL_Callback(hObject, eventdata, handles)
% hObject    handle to HSL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HSL



% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
if handles.img == 0
    msgbox('PRIMERO CARGUE UNA IMAGEN','alerta','modal')
    return
end


set(handles.RGB,'value',0);
set(handles.CMY,'value',0);
set(handles.YIQ,'value',0);
set(handles.HSL,'value',0);
set(handles.LAB,'value',0);
set(handles.pushbutton11,'Visible','OFF');
set(handles.pushbutton10,'Visible','OFF');
set(handles.axes10,'Visible','OFF');


guidata(hObject,handles);%actualizo el handles

imagen=handles.img;%llamo la imagen cargada

axes(handles.axes1);
imshow(imagen);




% --- Executes on button press in salir.
function salir_Callback(hObject, eventdata, handles)

boton_salida = questdlg('seguro que desea salir del programa','salir','si','no','no')

if strcmp(boton_salida,'no')%si no sedea salir, continue
    return;
end
close all% si desea salir cierre todo


% --- Executes on slider movement.


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_umbral_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_umbral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)

global imagen_original;
global texto_capa1;
global texto_capa2;
global texto_capa3;
global texto_espacio_color;
set(handles.color,'Visible','OFF');
% si no se a cargado una imagen o no es el cubo no haga nada
if (strcmp('', handles.nombre));
    msgbox('PRIMERO CARGUE LA IMAGEN','alerta','modal')
    %     set(handles.RGB,'value',0);
    %     set(handles.CMY,'value',0);
    %     set(handles.YIQ,'value',0);
    %     set(handles.HSL,'value',0);
    %     set(handles.LAB,'value',0);
    %     set(slider_umbral,'value',0);
    
    return
end
imagen=handles.img;

if hObject ==handles.RGB
    
    %% RGB
    imagen_rgb=imagen;%guardo la imagen para ser usada en otros botones
    imagen_original=imagen_rgb;
    axes(handles.axes10);
    imshow(imagen_original);
    impixelinfo
    set(handles.text19,'string','IMAGEN EN RGB');
    set(handles.pushbutton11,'Visible','ON');
    set(handles.pushbutton10,'Visible','ON');
    set(handles.reset,'Visible','ON');
    
    texto_capa1='R';
    texto_capa2='G';
    texto_capa3='B';
    texto_espacio_color='RBG';
elseif hObject ==handles.CMY
    
    
    
    [capa_c,capa_m,capa_y,imagen_cmy]=fcn_RGB_CMY(imagen);%paso la imagen espacio cmy
    imagen_original=imagen_cmy;
    axes(handles.axes10);
    imshow(uint8(imagen_original));
    impixelinfo
    set(handles.text19,'string','IMAGEN EN CMY');
    set(handles.pushbutton11,'Visible','ON');
    set(handles.pushbutton10,'Visible','ON');
    set(handles.reset,'Visible','ON');
    
    texto_capa1='C';
    texto_capa2='M';
    texto_capa3='Y';
    texto_espacio_color='CMY';
    
elseif hObject ==handles.YIQ
    
    
    [capa_Y,capa_I,capa_Q,imagen_YIQ]=fcn_RGB_YIQ(imagen);
    imagen_original=imagen_YIQ;
    axes(handles.axes10);
    imshow(uint8(imagen_original));
    impixelinfo
    set(handles.text19,'string','IMAGEN EN YIQ');
    set(handles.pushbutton11,'Visible','ON');
    set(handles.pushbutton10,'Visible','ON');
    set(handles.reset,'Visible','ON');
    
    texto_capa1='Y';
    texto_capa2='I';
    texto_capa3='Q';
    texto_espacio_color='YIQ';
    
    
elseif hObject ==handles.HSL
    
    
    %     [imagen_normalizada] = fcn_normalizar( imagen )
    %     imagen_hsl=rgb2hsl(imagen_normalizada);+
    imagen_hsl=rgb2hsv(imagen);
    [imagen_hsl] = fcn_normalizar(imagen_hsl);
    imagen_original=imagen_hsl;
    axes(handles.axes10);
    imshow(uint8(imagen_original));
    impixelinfo
    set(handles.text19,'string','IMAGEN EN HSL');
    set(handles.pushbutton11,'Visible','ON');
    set(handles.pushbutton10,'Visible','ON');
    set(handles.reset,'Visible','ON');
    
    texto_capa1='H';
    texto_capa2='S';
    texto_capa3='L';
    texto_espacio_color='HSL';
    
    
elseif hObject ==handles.XYZ
    
    
    
    
    [capa_x,capa_y,capa_z,imagen_xyz]=fcn_rgb_xyz_d65_1931(imagen);
    
    imagen_original=imagen_xyz;
    axes(handles.axes10);
    imshow(uint8(imagen_original));
    impixelinfo
    set(handles.text19,'string','IMAGEN EN XYZ');
    set(handles.pushbutton11,'Visible','ON');
    set(handles.pushbutton10,'Visible','ON');
    set(handles.reset,'Visible','ON');
    
    texto_capa1='X';
    texto_capa2='Y';
    texto_capa3='Z';
    texto_espacio_color='XYZ';
    
    
    
    
    
elseif hObject ==handles.LAB
    
    [capa_x,capa_y,capa_z,imagen_xyz]=fcn_rgb_xyz_d65_1931(imagen);%convierto a xyz    
    [capa_l,capa_a,capa_b,imagen_LAB]=fcn_xyz_lab_d65_1931(imagen_xyz);%de xyz a lab
    
    imagen_original=imagen_LAB;
    axes(handles.axes10);
    imshow(uint8(imagen_original));
    impixelinfo
    set(handles.text19,'string','IMAGEN EN L*A*B');
    set(handles.pushbutton11,'Visible','ON');
    set(handles.pushbutton10,'Visible','ON');
    set(handles.reset,'Visible','ON');
    
    texto_capa1='L*';
    texto_capa2='A*';
    texto_capa3='B*';
    texto_espacio_color='L*A*B';
    
elseif hObject ==handles.LCH
    
    
    
    [capa_x,capa_y,capa_z,imagen_xyz]=fcn_rgb_xyz_d65_1931(imagen);%convierto a xyz    
    [capa_l,capa_a,capa_b,imagen_LAB]=fcn_xyz_lab_d65_1931(imagen_xyz);%de xyz a lab
    [capa_l,capa_c,capa_h,imagen_lch]=fcn_lab_lch_d65_1931(imagen_LAB);

    imagen_original=imagen_lch;
    axes(handles.axes10);
    imshow(uint8(imagen_original));
    impixelinfo
    set(handles.text19,'string','IMAGEN EN LCH');
    set(handles.pushbutton11,'Visible','ON');
    set(handles.pushbutton10,'Visible','ON');
    set(handles.reset,'Visible','ON');
    
    texto_capa1='L';
    texto_capa2='C';
    texto_capa3='H';
    texto_espacio_color='LCH';
    
end




% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)

% si no se a cargado una imagen o no es el rostro no haga nada
if (strcmp('', handles.nombre)) || (strcmp('cubo.jpg', handles.nombre)) || (strcmp('balon.jpg', handles.nombre));
    msgbox('PRIMERO CARGUE LA IMAGEN rostro.jpg','alerta','modal')
    set(handles.capa_1,'value',0);
    set(handles.capa_2,'value',0);
    set(handles.capa_3,'value',0);
    
    return
end
imagen=handles.img;

if hObject == handles.capa_1
    
    % --------separacion de los canales HSV------------
    HSV =  rgb2hsv(imagen);%cambio a espacio hsv
    H=HSV(:,:,1); % seleccion canal H
    H=H.*255;% normalizar canal (de 0 a 255)
    
    ojos=fcn_filtro_maximo(H);%suavisado y acentamiento de bordes
    ojos=edge(ojos,'canny'); % deteccion  de bordes y umbralizacion
    ojos=fcn_escalado_histograma(ojos); % normalizo histograma
    
    % -----------------morfologia----------------
    kernel=[0 0 255 255 255 0 0; 0 255 255 255 255 255 0; 255 255 255 255 255 255 255; 255 255 255 255 255 255 255; 255 255 255 255 255 255 255;0 255 255 255 255 255 0; 0 0 255 255 255 0 0 ];
    ojos=fcn_dilatacion(ojos,kernel);
    ojos=fcn_dilatacion(ojos,kernel);
    
    %--------- crecimiento de regiones---------------
    [ojo1_segmentada]=fcn_crecimiento_regiones(ojos, 171, 54);%crecimiento de regiones para ojo izquierdo
    [ojo2_segmentada]=fcn_crecimiento_regiones(ojos,173, 130);%crecimiento de regiones para ojo izquierdo
    ojos_segmentada=ojo1_segmentada+ojo2_segmentada;% union de los ojos en la imagen
    
    % ploteo resultados
    [ojos_colorizada]=fcn_colorear(ojos_segmentada,imagen);
    axes(handles.axes2);
    imshow(ojos_colorizada);
    
elseif hObject == handles.capa_2
    
    % --------separacion de los canales HSV------------
    HSV =  rgb2hsv(imagen);%cambio a espacio hsv
    H=HSV(:,:,1); % seleccion canal H
    H=H.*255;% normalizar canal (de 0 a 255)
    
    boca=edge(H,'canny');% deteccion  de bordes y umbralizacion
    boca=fcn_escalado_histograma(boca); % normalizo histograma
    [boca]=fcn_negativo(boca);% se halla el negativo de la imagen para poder utilizar crecimiento de regiones
    [boca_segmentada]=fcn_crecimiento_regiones(boca,266,82);% se aplica crecimiento de regiones para segmentar la boca en su totalidad
    
    
    % ploteo resultados
    [boca_colorizada]=fcn_colorear(boca_segmentada,imagen);% se colorea la imagen segmentada para que quede igual a la original
    axes(handles.axes2);
    imshow(boca_colorizada);
    
    
elseif hObject == handles.capa_3
    
    % --------separacion de los canales HSV------------
    HSV =  rgb2hsv(imagen);%cambio a espacio hsv
    H=HSV(:,:,1); % seleccion canal H
    H=H.*255;% normalizar canal (de 0 a 255)
    
    % --------segmentacion_boca------------
    boca=edge(H,'canny');% deteccion  de bordes y umbralizacion
    boca=fcn_escalado_histograma(boca); % normalizo histograma
    [boca]=fcn_negativo(boca);% se halla el negativo de la imagen para poder utilizar crecimiento de regiones
    [boca_segmentada]=fcn_crecimiento_regiones(boca,266,82);% se aplica crecimiento de regiones para segmentar la boca en su totalidad
    
    % --------segmentacion_ojos------------
    ojos=fcn_filtro_maximo(H);%suavisado y acentamiento de bordes
    ojos=edge(ojos,'canny'); % deteccion  de bordes y umbralizacion
    ojos=fcn_escalado_histograma(ojos); % normalizo histograma
    
    kernel=[0 0 255 255 255 0 0; 0 255 255 255 255 255 0; 255 255 255 255 255 255 255; 255 255 255 255 255 255 255; 255 255 255 255 255 255 255;0 255 255 255 255 255 0; 0 0 255 255 255 0 0 ];
    ojos=fcn_dilatacion(ojos,kernel);
    ojos=fcn_dilatacion(ojos,kernel);
    
    [ojo1_segmentada]=fcn_crecimiento_regiones(ojos, 171, 54);%crecimiento de regiones para ojo izquierdo
    [ojo2_segmentada]=fcn_crecimiento_regiones(ojos,173, 130);%crecimiento de regiones para ojo izquierdo
    
    % --------union de capa_1 y capa_2------------
    ojos=uint8(ojo1_segmentada+ojo2_segmentada);% union de los ojos y boca en la imagen
    ojos_y_boca_segmentada=ojos+boca_segmentada;
    % ploteo resultados
    [ojos_y_boca_colorizada]=fcn_colorear(ojos_y_boca_segmentada,imagen);% se colorea la imagen segmentada para que quede igual a la original
    axes(handles.axes2);
    imshow(ojos_y_boca_colorizada);
    
end


% --- Executes on button press in seleccionar_pixel_1.
function seleccionar_pixel_1_Callback(hObject, eventdata, handles)

imagen=handles.img;
axes(handles.axes1);
imshow(imagen);title('de un solo click en el pixel y luego enter');
[b,a]=getpts();
fila=round (a)
columna=round(b)
valor_pixel_1=imagen(fila,columna,1)
valor_pixel_2=imagen(fila,columna,2)
valor_pixel_3=imagen(fila,columna,3)

[filas,columnas,capas]=size(imagen);

capa1= (uint8(ones(filas,columnas)))*valor_pixel_1;
capa2= (uint8(ones(filas,columnas)))*valor_pixel_2;
capa3= (uint8(ones(filas,columnas)))*valor_pixel_3;
capa123=cat(3,capa1,capa2,capa3);



set(handles.valor1,'string',valor_pixel_1);
set(handles.valor2,'string',valor_pixel_2);
set(handles.valor3,'string',valor_pixel_3);
%   --------ploteo capas-------------
axes(handles.axes2);
imshow(capa123);

axes(handles.axes3);
imshow(capa1);
axes(handles.axes4);
imshow(capa2);
axes(handles.axes5);
imshow(capa3);


% --- Executes on button press in selecionar_pixel_2.
function selecionar_pixel_2_Callback(hObject, eventdata, handles)
imagen=handles.img;
axes(handles.axes1);
imshow(imagen);title('de un solo click en el pixel y luego enter');
[b,a]=getpts();
fila=round (a);
columna=round(b);
valor_pixel_1=imagen(fila,columna,1)
valor_pixel_2=imagen(fila,columna,2)
valor_pixel_3=imagen(fila,columna,3)

[filas,columnas,capas]=size(imagen);

capa1= (uint8(ones(filas,columnas)))*valor_pixel_1;
capa2= (uint8(ones(filas,columnas)))*valor_pixel_2;
capa3= (uint8(ones(filas,columnas)))*valor_pixel_3;
capa123=cat(3,capa1,capa2,capa3);



set(handles.valor4,'string',valor_pixel_1);
set(handles.valor5,'string',valor_pixel_2);
set(handles.valor6,'string',valor_pixel_3);
%   --------ploteo capas-------------
axes(handles.axes6);
imshow(capa123);

axes(handles.axes7);
imshow(capa1);
axes(handles.axes8);
imshow(capa2);
axes(handles.axes9);
imshow(capa3);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
seleccionar_pixel;


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% seleccionar_region;
capas


% --- Executes on button press in color.
function color_Callback(hObject, eventdata, handles)
% hObject    handle to color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
modificar_color
