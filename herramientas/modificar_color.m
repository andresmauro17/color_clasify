function varargout = modificar_color(varargin)
% MODIFICAR_COLOR MATLAB code for modificar_color.fig
%      MODIFICAR_COLOR, by itself, creates a new MODIFICAR_COLOR or raises the existing
%      singleton*.
%
%      H = MODIFICAR_COLOR returns the handle to a new MODIFICAR_COLOR or the handle to
%      the existing singleton*.
%
%      MODIFICAR_COLOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODIFICAR_COLOR.M with the given input arguments.
%
%      MODIFICAR_COLOR('Property','Value',...) creates a new MODIFICAR_COLOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before modificar_color_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to modificar_color_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help modificar_color

% Last Modified by GUIDE v2.5 06-Jun-2014 00:35:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @modificar_color_OpeningFcn, ...
                   'gui_OutputFcn',  @modificar_color_OutputFcn, ...
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


% --- Executes just before modificar_color is made visible.
function modificar_color_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for modificar_color
handles.output = hObject;

% Update handles structure
global imagen_original;%%recibo la imagen del otro guide

handles.imagen=imagen_original;%guardo imagen en el handles
handles.imagen_modificada=imagen_original;%guardo imagen en el handles
guidata(hObject,handles);%actualizo el handles

v=get(handles.slider_saturacion,'value');%obtencion de valor del slider
set(handles.text2,'string',v)% dysplay valor del slider


axes(handles.axes1);
imshow(handles.imagen_modificada);

guidata(hObject, handles);

% UIWAIT makes modificar_color wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = modificar_color_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_saturacion_Callback(hObject, eventdata, handles)

v=get(handles.slider_saturacion,'value');%obtencion de valor del slider
set(handles.text2,'string',v)% dysplay valor del slider

handles.imagen_modificada=saturacion(v,handles.imagen);
guidata(hObject,handles);%actualizo el handles

axes(handles.axes1);
imshow(handles.imagen_modificada);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_saturacion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_saturacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
v=1;
set(handles.slider_saturacion,'value',v)% dysplay valor del slider
set(handles.text2,'string',v)% dysplay valor del slider
