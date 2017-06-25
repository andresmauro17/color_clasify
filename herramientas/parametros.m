function varargout = parametros(varargin)
% PARAMETROS MATLAB code for parametros.fig
%      PARAMETROS, by itself, creates a new PARAMETROS or raises the existing
%      singleton*.
%
%      H = PARAMETROS returns the handle to a new PARAMETROS or the handle to
%      the existing singleton*.
%
%      PARAMETROS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARAMETROS.M with the given input arguments.
%
%      PARAMETROS('Property','Value',...) creates a new PARAMETROS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before parametros_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to parametros_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help parametros

% Last Modified by GUIDE v2.5 13-Aug-2014 22:07:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @parametros_OpeningFcn, ...
                   'gui_OutputFcn',  @parametros_OutputFcn, ...
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


% --- Executes just before parametros is made visible.
function parametros_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to parametros (see VARARGIN)

% Choose default command line output for parametros
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global rango
global paral
global parac

set(handles.edit_para_l,'string',paral)
set(handles.edit_para_c,'string',parac)
set(handles.edit_fc,'string',rango)



% --- Outputs from this function are returned to the command line.
function varargout = parametros_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_fc_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fc as text
%        str2double(get(hObject,'String')) returns contents of edit_fc as a double


% --- Executes during object creation, after setting all properties.
function edit_fc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_guardar_parametros.
function pushbutton_guardar_parametros_Callback(hObject, eventdata, handles)
global rango
global paral
global parac

l=get(handles.edit_para_l,'string');
paral=str2double(l);

c=get(handles.edit_para_c,'string');
parac=str2double(c);

fc=get(handles.edit_fc,'string');
rango=str2double(fc);

set(handles.edit_para_l,'string',paral)
set(handles.edit_para_c,'string',parac)
set(handles.edit_fc,'string',rango)



function edit_para_l_Callback(hObject, eventdata, handles)
% hObject    handle to edit_para_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_para_l as text
%        str2double(get(hObject,'String')) returns contents of edit_para_l as a double


% --- Executes during object creation, after setting all properties.
function edit_para_l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_para_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_para_c_Callback(hObject, eventdata, handles)
% hObject    handle to edit_para_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_para_c as text
%        str2double(get(hObject,'String')) returns contents of edit_para_c as a double


% --- Executes during object creation, after setting all properties.
function edit_para_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_para_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_parametros_default.
function pushbutton_parametros_default_Callback(hObject, eventdata, handles)
global rango
global paral
global parac

rango=1;
paral=2;
parac=1;



set(handles.edit_para_l,'string',paral)
set(handles.edit_para_c,'string',parac)
set(handles.edit_fc,'string',rango)
