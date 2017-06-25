function varargout = webcam(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @webcam_OpeningFcn, ...
    'gui_OutputFcn',  @webcam_OutputFcn, ...
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


% --- Executes just before webcam is made visible.
function webcam_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
global rango
global paral
global parac

global vid
global brightness
global contrast
global exposure
global focus
global gain
global pan
global saturation
global sharpness
global Tilt
global white_balance
global zoom

global backlight_compensation
global exposure_mode
global focus_mode
global horizontal_flip
global vertical_flip
global white_balance_mode
global pulsacion

pulsacion=0;

set(handles.text_rec,'Visible','on')
set(handles.text_rec_cuadrado,'Visible','on')


% **************%
 vid = videoinput('winvideo', 1, 'RGB24_640x480');
% vid = videoinput('winvideo', 1,'RGB24_2304x1536');%declaracion de dispositivo
src = getselectedsource(vid);
vid.FramesPerTrigger = 1;% solo se captura un frame por disparo, no se capturara video
vid.ReturnedColorspace = 'rgb';% las imagenes estan en RGB
triggerconfig(vid, 'manual');% decirle a matlab usar un disparo a peticion de usuario, no automaticamente
vidRes = get(vid, 'VideoResolution');% saber cla resolucion en pixeles de la imagem
imWidth = vidRes(1);% image width
imHeight = vidRes(2);% image height
nBands = get(vid, 'NumberOfBands');% numero de canales de retorno
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.axes_camara);% create an empty image container and show it on axPreview
preview(vid, hImage);% begin the webcam preview


brightness=128;
contrast=128;
exposure=-7;
focus=0;
gain=0;
pan=0;
saturation=128;
sharpness=128;
Tilt=0;
white_balance=4000;
zoom=100;

backlight_compensation = 'on';
exposure_mode='auto';
focus_mode='auto';
horizontal_flip='off';
vertical_flip='off';
white_balance_mode='auto';

src.Brightness = brightness;
src.Contrast = contrast;
src.Exposure = exposure;
src.Focus = focus;
src.Gain = gain;
src.Pan = pan;
src.Saturation = saturation;
src.Sharpness = sharpness;
src.Tilt = Tilt;
src.WhiteBalance = white_balance;
src.Zoom = zoom;

src.BacklightCompensation = backlight_compensation;
src.ExposureMode = exposure_mode;
src.FocusMode = focus_mode;
src.HorizontalFlip=horizontal_flip;
src.VerticalFlip =vertical_flip;
src.WhiteBalanceMode = white_balance_mode;

rango=1;
paral=2;
parac=1;




% --- Outputs from this function are returned to the command line.
function varargout = webcam_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_capturar.
function pushbutton_capturar_Callback(hObject, eventdata, handles)

set(handles.pushbutton_capturar,'Visible','off')
set(handles.pushbutton_volver_a_video,'Visible','on')

set(handles.text_rec,'Visible','off')
set(handles.text_rec_cuadrado,'Visible','off')


global vid
global foto_capturada
global region_referencia
global region_referencia_lab
global region_referencia_lch
global region_muestra
global region_muestra_lab
global region_muestra_lch
global rango
global paral
global parac

global promedio_l1
global promedio_a1
global promedio_b1
global promedio_c1
global promedio_h1

global promedio_l2
global promedio_a2
global promedio_b2
global promedio_c2
global promedio_h2

global de
global dl
global dc
global dh


foto_capturada=getsnapshot(vid);% captura lo que ve la camara en escala Ycbr
grid on;
axes(handles.axes_camara);
imshow(foto_capturada);
impixelinfo

if get(handles.radiobutton_referencia,'value')%si esta seleccionado radio button referencia
    
    questdlg('SELECCIONE LA REGION DE LA REFERENCIA','CAUTION','OK','OK');
    
    region_rectangulo=0;
    region_rectangulo = getrect;
    region_rectangulo = round(region_rectangulo);
    region_rectangulo = abs(region_rectangulo);
    region_referencia= imcrop(foto_capturada,region_rectangulo);
    
    %     figure;imshow(region_referencia);
    set(handles.pushbutton_ver_referencia,'Visible','on')
    
elseif get(handles.radiobutton_muestra,'value')
    
    questdlg('SELECCIONE LA REGION DEl LOTE','CAUTION','OK','OK');
    region_rectangulo=0;
    region_rectangulo = getrect;
    region_rectangulo = round(region_rectangulo);
    region_rectangulo = abs(region_rectangulo);
    region_muestra= imcrop(foto_capturada,region_rectangulo);
    %     figure;imshow(region_muestra)
    
    set(handles.pushbutton_ver_lote,'Visible','on')
    
    set(handles.text_referencia_fijo,'Visible','on')
    set(handles.text_l1_fijo,'Visible','on')
    set(handles.text_l1,'Visible','on')
    set(handles.text_a1_fijo,'Visible','on')
    set(handles.text_a1,'Visible','on')
    set(handles.text_b1_fijo,'Visible','on')
    set(handles.text_b1,'Visible','on')
    set(handles.text_c1_fijo,'Visible','on')
    set(handles.text_c1,'Visible','on')
    set(handles.text_h1_fijo,'Visible','on')
    set(handles.text_h1,'Visible','on')
    
    set(handles.text_muestra_fijo,'Visible','on')
    set(handles.text_l2_fijo,'Visible','on')
    set(handles.text_l2,'Visible','on')
    set(handles.text_a2_fijo,'Visible','on')
    set(handles.text_a2,'Visible','on')
    set(handles.text_b2_fijo,'Visible','on')
    set(handles.text_b2,'Visible','on')
    set(handles.text_c2_fijo,'Visible','on')
    set(handles.text_c2,'Visible','on')
    set(handles.text_h2_fijo,'Visible','on')
    set(handles.text_h2,'Visible','on')
    
    set(handles.text_delta_cmc_fijo,'Visible','on')
    set(handles.text_delta_cmc,'Visible','on')
    set(handles.text_delta_l_fijo,'Visible','on')
    set(handles.text_delta_l,'Visible','on')
    set(handles.text_delta_c_fijo,'Visible','on')
    set(handles.text_delta_c,'Visible','on')
    set(handles.text_delta_h_fijo,'Visible','on')
    set(handles.text_delta_h,'Visible','on')
    
    set(handles.text_grupo_fijo,'Visible','on')
    set(handles.text_grupo,'Visible','on')
    
    set(handles.text_rec,'Visible','off')
    set(handles.text_rec_cuadrado,'Visible','off')
    
    %     --------------------region referencia ------------------
    
    [capa_x,capa_y,capa_z,imagen_xyz]=fcn_rgb_xyz_d65_1931(region_referencia);%convierto a xyz
    [capa_l,capa_a,capa_b,imagen_LAB]=fcn_xyz_lab_d65_1931(imagen_xyz);%de xyz a lab
    [capa_l,capa_c,capa_h,imagen_lch]=fcn_lab_lch_d65_1931(imagen_LAB);
    
    region_referencia_lab=imagen_LAB;
    region_referencia_lch=imagen_lch;
    
    vector_promedio=mean(capa_l);
    promedio_l1=mean(vector_promedio);
    
    vector_promedio=mean(capa_a);
    promedio_a1=mean(vector_promedio);
    
    vector_promedio=mean(capa_b);
    promedio_b1=mean(vector_promedio);
    
    vector_promedio=mean(capa_c);
    promedio_c1=mean(vector_promedio);
    
    vector_promedio=mean(capa_h);
    promedio_h1=mean(vector_promedio);
    
    
    set(handles.text_l1,'string',promedio_l1)
    set(handles.text_a1,'string',promedio_a1)
    set(handles.text_b1,'string',promedio_b1)
    set(handles.text_c1,'string',promedio_c1)
    set(handles.text_h1,'string',promedio_h1)
    
    %     --------------------region muestra ------------------
    
    [capa_x,capa_y,capa_z,imagen_xyz]=fcn_rgb_xyz_d65_1931(region_muestra);%convierto a xyz
    [capa_l,capa_a,capa_b,imagen_LAB]=fcn_xyz_lab_d65_1931(imagen_xyz);%de xyz a lab
    [capa_l,capa_c,capa_h,imagen_lch]=fcn_lab_lch_d65_1931(imagen_LAB);
    
    region_muestra_lab=imagen_LAB;
    region_muestra_lch=imagen_lch;
    
    vector_promedio=mean(capa_l);
    promedio_l2=mean(vector_promedio);
    
    vector_promedio=mean(capa_a);
    promedio_a2=mean(vector_promedio);
    
    vector_promedio=mean(capa_b);
    promedio_b2=mean(vector_promedio);
    
    vector_promedio=mean(capa_c);
    promedio_c2=mean(vector_promedio);
    
    vector_promedio=mean(capa_h);
    promedio_h2=mean(vector_promedio);
    
    
    set(handles.text_l2,'string',promedio_l2)
    set(handles.text_a2,'string',promedio_a2)
    set(handles.text_b2,'string',promedio_b2)
    set(handles.text_c2,'string',promedio_c2)
    set(handles.text_h2,'string',promedio_h2)
    
    
    
    lab1=[promedio_l1,promedio_a1,promedio_b1];
    lab2=[promedio_l2,promedio_a2,promedio_b2];
    [de,dl,dc,dh] = cmcde(lab1,lab2,paral,parac);
    set(handles.text_delta_cmc,'string',de)
    set(handles.text_delta_l,'string',dl)
    set(handles.text_delta_c,'string',dc)
    set(handles.text_delta_h,'string',dh)
    
    division=de/rango;
    salida=uint8(division);
    set(handles.text_grupo,'string',salida)
    
    
    
    
end







% formatos = {'*.jpg','JPEG (*.jpg)';'*.tif','TIFF (*.tif)'};
% [nomb,ruta] = uiputfile(formatos,'GUARDAR IMAGEN');
% if nomb==0, return, end
% fName = fullfile(ruta,nomb);
% imwrite(foto_capturada,fName);




% --- Executes on button press in pushbutton_webcam_properties.
function pushbutton_webcam_properties_Callback(hObject, eventdata, handles)
global vid
% stoppreview(vid);
properties_webcam


% --- Executes on button press in pushbutton_volver_a_video.
function pushbutton_volver_a_video_Callback(hObject, eventdata, handles)

set(handles.pushbutton_capturar,'Visible','on')
set(handles.pushbutton_volver_a_video,'Visible','off')

set(handles.text_referencia_fijo,'Visible','off')
set(handles.text_l1_fijo,'Visible','off')
set(handles.text_l1,'Visible','off')
set(handles.text_a1_fijo,'Visible','off')
set(handles.text_a1,'Visible','off')
set(handles.text_b1_fijo,'Visible','off')
set(handles.text_b1,'Visible','off')
set(handles.text_c1_fijo,'Visible','off')
set(handles.text_c1,'Visible','off')
set(handles.text_h1_fijo,'Visible','off')
set(handles.text_h1_fijo,'Visible','off')
set(handles.text_h1,'Visible','off')

set(handles.text_muestra_fijo,'Visible','off')
set(handles.text_l2_fijo,'Visible','off')
set(handles.text_l2,'Visible','off')
set(handles.text_a2_fijo,'Visible','off')
set(handles.text_a2,'Visible','off')
set(handles.text_b2_fijo,'Visible','off')
set(handles.text_b2,'Visible','off')
set(handles.text_c2_fijo,'Visible','off')
set(handles.text_c2,'Visible','off')
set(handles.text_h2_fijo,'Visible','off')
set(handles.text_h2_fijo,'Visible','off')
set(handles.text_h2,'Visible','off')

set(handles.text_delta_cmc_fijo,'Visible','off')
set(handles.text_delta_cmc,'Visible','off')
set(handles.text_delta_l_fijo,'Visible','off')
set(handles.text_delta_l,'Visible','off')
set(handles.text_delta_c_fijo,'Visible','off')
set(handles.text_delta_c,'Visible','off')
set(handles.text_delta_h_fijo,'Visible','off')
set(handles.text_delta_h,'Visible','off')

set(handles.text_grupo_fijo,'Visible','off')
set(handles.text_grupo,'Visible','off')

set(handles.text_rec,'Visible','on')
set(handles.text_rec_cuadrado,'Visible','on')

global vid

vidRes = get(vid, 'VideoResolution');% we need this to know the image height and width
imWidth = vidRes(1);% image width
imHeight = vidRes(2);% image height
nBands = get(vid, 'NumberOfBands');% number of bands of our image (should be 3 because it's RGB)
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.axes_camara);% create an empty image container and show it on axPreview
preview(vid, hImage);% begin the webcam preview


% --- Executes on button press in radiobutton_referencia.
function radiobutton_referencia_Callback(hObject, eventdata, handles)
% --- Executes on button press in radiobutton_muestra.
function radiobutton_muestra_Callback(hObject, eventdata, handles)


% --- Executes on button press in pushbutton_configurar_parametros.
function pushbutton_configurar_parametros_Callback(hObject, eventdata, handles)
set(handles.text_rec,'Visible','off')
set(handles.text_rec_cuadrado,'Visible','off')

parametros


% --- Executes on button press in pushbutton_mostrar_estadistica.
function pushbutton_mostrar_estadistica_Callback(hObject, eventdata, handles)
seleccionar_region



% --- Executes on button press in pushbutton_cargar_imagen.
function pushbutton_cargar_imagen_Callback(hObject, eventdata, handles)

set(handles.text_rec,'Visible','off')
set(handles.text_rec_cuadrado,'Visible','off')

global foto_capturada
global region_referencia
global region_referencia_lab
global region_referencia_lch
global region_muestra
global region_muestra_lab
global region_muestra_lch
global rango
global paral
global parac


set(handles.pushbutton_capturar,'Visible','off')
set(handles.pushbutton_volver_a_video,'Visible','on')

[nombre direccion]=uigetfile('*.*','examinar');%funcion que abre ventana examinar
%si no se a seleccionado una imagen espere
if nombre == 0
    return
end
imagen=imread(fullfile(direccion,nombre));%lectura de imagen
foto_capturada=imagen;

axes(handles.axes_camara);
imshow(foto_capturada);


questdlg('SELECCIONE LA REGION DE LA REFERENCIA','CAUTION','OK','OK');

region_rectangulo=0;
region_rectangulo = getrect;
region_rectangulo = round(region_rectangulo);
region_rectangulo = abs(region_rectangulo);
region_referencia= imcrop(foto_capturada,region_rectangulo);

set(handles.pushbutton_ver_referencia,'Visible','on')


questdlg('SELECCIONE LA REGION DE LA MUESTRA','CAUTION','OK','OK');
region_rectangulo=0;
region_rectangulo = getrect;
region_rectangulo = round(region_rectangulo);
region_rectangulo = abs(region_rectangulo);
region_muestra= imcrop(foto_capturada,region_rectangulo);

%     figure;imshow(region_referencia);
%     figure;imshow(region_muestra)

set(handles.pushbutton_ver_lote,'Visible','on')

%     set(handles.pushbutton_mostrar_estadistica,'Visible','on')
set(handles.text_referencia_fijo,'Visible','on')
set(handles.text_l1_fijo,'Visible','on')
set(handles.text_l1,'Visible','on')
set(handles.text_a1_fijo,'Visible','on')
set(handles.text_a1,'Visible','on')
set(handles.text_b1_fijo,'Visible','on')
set(handles.text_b1,'Visible','on')
set(handles.text_c1_fijo,'Visible','on')
set(handles.text_c1,'Visible','on')
set(handles.text_h1_fijo,'Visible','on')
set(handles.text_h1,'Visible','on')

set(handles.text_muestra_fijo,'Visible','on')
set(handles.text_l2_fijo,'Visible','on')
set(handles.text_l2,'Visible','on')
set(handles.text_a2_fijo,'Visible','on')
set(handles.text_a2,'Visible','on')
set(handles.text_b2_fijo,'Visible','on')
set(handles.text_b2,'Visible','on')
set(handles.text_c2_fijo,'Visible','on')
set(handles.text_c2,'Visible','on')
set(handles.text_h2_fijo,'Visible','on')
set(handles.text_h2,'Visible','on')

set(handles.text_delta_cmc_fijo,'Visible','on')
set(handles.text_delta_cmc,'Visible','on')
set(handles.text_delta_l_fijo,'Visible','on')
set(handles.text_delta_l,'Visible','on')
set(handles.text_delta_c_fijo,'Visible','on')
set(handles.text_delta_c,'Visible','on')
set(handles.text_delta_h_fijo,'Visible','on')
set(handles.text_delta_h,'Visible','on')

set(handles.text_grupo_fijo,'Visible','on')
set(handles.text_grupo,'Visible','on')

%     --------------------region referencia ------------------

[capa_x,capa_y,capa_z,imagen_xyz]=fcn_rgb_xyz_d65_1931(region_referencia);%convierto a xyz
[capa_l,capa_a,capa_b,imagen_LAB]=fcn_xyz_lab_d65_1931(imagen_xyz);%de xyz a lab
[capa_l,capa_c,capa_h,imagen_lch]=fcn_lab_lch_d65_1931(imagen_LAB);

region_referencia_lab=imagen_LAB;
region_referencia_lch=imagen_lch;

vector_promedio=mean(capa_l);
promedio_l1=mean(vector_promedio);

vector_promedio=mean(capa_a);
promedio_a1=mean(vector_promedio);

vector_promedio=mean(capa_b);
promedio_b1=mean(vector_promedio);

vector_promedio=mean(capa_c);
promedio_c1=mean(vector_promedio);

vector_promedio=mean(capa_h);
promedio_h1=mean(vector_promedio);


set(handles.text_l1,'string',promedio_l1)
set(handles.text_a1,'string',promedio_a1)
set(handles.text_b1,'string',promedio_b1)
set(handles.text_c1,'string',promedio_c1)
set(handles.text_h1,'string',promedio_h1)

%     --------------------region muestra ------------------

[capa_x,capa_y,capa_z,imagen_xyz]=fcn_rgb_xyz_d65_1931(region_muestra);%convierto a xyz
[capa_l,capa_a,capa_b,imagen_LAB]=fcn_xyz_lab_d65_1931(imagen_xyz);%de xyz a lab
[capa_l,capa_c,capa_h,imagen_lch]=fcn_lab_lch_d65_1931(imagen_LAB);

region_muestra_lab=imagen_LAB;
region_muestra_lch=imagen_lch;

vector_promedio=mean(capa_l);
promedio_l2=mean(vector_promedio);

vector_promedio=mean(capa_a);
promedio_a2=mean(vector_promedio);

vector_promedio=mean(capa_b);
promedio_b2=mean(vector_promedio);

vector_promedio=mean(capa_c);
promedio_c2=mean(vector_promedio);

vector_promedio=mean(capa_h);
promedio_h2=mean(vector_promedio);


set(handles.text_l2,'string',promedio_l2)
set(handles.text_a2,'string',promedio_a2)
set(handles.text_b2,'string',promedio_b2)
set(handles.text_c2,'string',promedio_c2)
set(handles.text_h2,'string',promedio_h2)



lab1=[promedio_l1,promedio_a1,promedio_b1];
lab2=[promedio_l2,promedio_a2,promedio_b2];
[de,dl,dc,dh] = cmcde(lab1,lab2,paral,parac);
set(handles.text_delta_cmc,'string',de)
set(handles.text_delta_l,'string',dl)
set(handles.text_delta_c,'string',dc)
set(handles.text_delta_h,'string',dh)



division=de/rango;
salida=uint8(division);
set(handles.text_grupo,'string',salida)


% --- Executes on button press in pushbutton_guardar_captura.
function pushbutton_guardar_captura_Callback(hObject, eventdata, handles)

global promedio_l1
global promedio_a1
global promedio_b1
global promedio_c1
global promedio_h1

global promedio_l2
global promedio_a2
global promedio_b2
global promedio_c2
global promedio_h2

global de
global dl
global dc
global dh
global pulsacion
global matriz

pulsacion=pulsacion+1;

rango=2:-0.1:0.1;
% de=2.2
for i = 1:length(rango)
  division=de/rango(i);
  temp=uint8(division);
  grupo(i)=double(temp);           
end
% primera_fila=['l1','a1','b1','c1','h1','l2','a2','b2','c2','h2','dl','dc','dh','de',grupo]
fila_captura=[pulsacion,promedio_l1,promedio_a1,promedio_b1,promedio_c1,promedio_h1,promedio_l2,promedio_a2,promedio_b2,promedio_c2,promedio_h2,dl,dc,dh,de,grupo];
assignin('base','fila_captura',fila_captura)%guarda valores en workspace

matriz(pulsacion,:)=fila_captura;
assignin('base','matriz',matriz)%guarda valores en workspace


global foto_capturada
formatos = {'*.jpg','JPEG (*.jpg)';'*.tif','TIFF (*.tif)'};
[nomb,ruta] = uiputfile(formatos,'GUARDAR IMAGEN');
if nomb==0, return, end
fName = fullfile(ruta,nomb);
imwrite(foto_capturada,fName);


% --- Executes on button press in pushbutton_ver_referencia.
function pushbutton_ver_referencia_Callback(hObject, eventdata, handles)
global region_referencia
figure;imshow(region_referencia);



% --- Executes on button press in pushbutton_ver_lote.
function pushbutton_ver_lote_Callback(hObject, eventdata, handles)
global region_muestra
figure;imshow(region_muestra)


% --- Executes on button press in pushbutton_exportar_a_excel.
function pushbutton_exportar_a_excel_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exportar_a_excel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matriz

%% write numerical data to csv
filename1 = 'datos_2.xlsx';
xlswrite(filename1,matriz,1);




