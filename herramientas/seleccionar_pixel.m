function varargout = seleccionar_pixel(varargin)
% SELECCIONAR_PIXEL MATLAB code for seleccionar_pixel.fig
%      SELECCIONAR_PIXEL, by itself, creates a new SELECCIONAR_PIXEL or raises the existing
%      singleton*.
%
%      H = SELECCIONAR_PIXEL returns the handle to a new SELECCIONAR_PIXEL or the handle to
%      the existing singleton*.
%
%      SELECCIONAR_PIXEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECCIONAR_PIXEL.M with the given input arguments.
%
%      SELECCIONAR_PIXEL('Property','Value',...) creates a new SELECCIONAR_PIXEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before seleccionar_pixel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to seleccionar_pixel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help seleccionar_pixel

% Last Modified by GUIDE v2.5 18-Mar-2014 00:36:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @seleccionar_pixel_OpeningFcn, ...
                   'gui_OutputFcn',  @seleccionar_pixel_OutputFcn, ...
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


% --- Executes just before seleccionar_pixel is made visible.
function seleccionar_pixel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to seleccionar_pixel (see VARARGIN)

% Choose default command line output for seleccionar_pixel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global imagen_original;%%recibo la imagen del otro guide
handles.img=imagen_original;%guardo imagen en el handles
guidata(hObject,handles);%actualizo el handles

axes(handles.axes1);
imshow(imagen_original);



% UIWAIT makes seleccionar_pixel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = seleccionar_pixel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
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

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
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
