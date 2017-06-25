function varargout = capas(varargin)
% CAPAS MATLAB code for capas.fig
%      CAPAS, by itself, creates a new CAPAS or raises the existing
%      singleton*.
%
%      H = CAPAS returns the handle to a new CAPAS or the handle to
%      the existing singleton*.
%
%      CAPAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAPAS.M with the given input arguments.
%
%      CAPAS('Property','Value',...) creates a new CAPAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before capas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to capas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help capas

% Last Modified by GUIDE v2.5 30-May-2014 19:43:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @capas_OpeningFcn, ...
                   'gui_OutputFcn',  @capas_OutputFcn, ...
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


% --- Executes just before capas is made visible.
function capas_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% handles.recorte1=recorte1;
% handles.recorte2=recorte2;
% guidata(hObject,handles);%actualizo el handles


% UIWAIT makes capas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = capas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in seleccionar_region.
function seleccionar_region_Callback(hObject, eventdata, handles)
% hObject    handle to seleccionar_region (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global region1;
global region2;
% global recorte3;


global imagen_rgb
global texto_capa1;
global texto_capa2;
global texto_capa3;
global texto_espacio_color;
global imagen_original;%%recibo la imagen del otro guide
handles.img=imagen_original;%guardo imagen en el handles
guidata(hObject,handles);%actualizo el handles

imagen=handles.img;

axes(handles.axes2);
imshow(uint8(imagen(:,:,1)));

axes(handles.axes3);
imshow(uint8(imagen(:,:,2)));

axes(handles.axes4);
imshow(uint8(imagen(:,:,3)));

set(handles.text3,'string',texto_espacio_color);
set(handles.text4,'string',texto_capa1);
set(handles.text5,'string',texto_capa2);
set(handles.text6,'string',texto_capa3);


axes(handles.axes1);
imshow(uint8(imagen_rgb));

questdlg('SELECCIONE DOS REGIONES DE LA GRAFICA PRINCIPAL','OPCION DE SELECCION','OK','OK')

region = getrect;
region = round(region);
region = abs(region);
region1= imcrop(imagen_original,region);



region = getrect;
region = round(region);
region=abs(region);
region2=imcrop(imagen_original,region);
set(handles.procesar,'Visible','ON');




% --- Executes on button press in procesar.
function procesar_Callback(hObject, eventdata, handles)
% hObject    handle to procesar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
seleccionar_region
