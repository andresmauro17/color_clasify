function varargout = properties_webcam(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @properties_webcam_OpeningFcn, ...
    'gui_OutputFcn',  @properties_webcam_OutputFcn, ...
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


% --- Executes just before properties_webcam is made visible.
function properties_webcam_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% Choose default command line output for webcam
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


global vid
src = getselectedsource(vid);

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



set(handles.edit_brightness,'string',brightness)
set(handles.edit_contrast,'string',contrast)
set(handles.edit_exposure,'string',exposure)
set(handles.edit_focus,'string',focus)
set(handles.edit_gain,'string',gain)
set(handles.edit_pan,'string',pan)
set(handles.edit_saturation,'string',saturation)
set(handles.edit_sharpness,'string',sharpness)
set(handles.edit_Tilt,'string',Tilt)
set(handles.edit_white_balance,'string',white_balance)
set(handles.edit_zoom,'string',zoom)

set(handles.slider_brightness,'value',brightness)
set(handles.slider_contrast,'value',contrast)
set(handles.slider_exposure,'value',exposure)
set(handles.slider_focus,'value',focus)
set(handles.slider_gain,'value',gain)
set(handles.slider_pan,'value',pan)
set(handles.slider_saturation,'value',saturation)
set(handles.slider_sharpness,'value',sharpness)
set(handles.slider_Tilt,'value',Tilt)
set(handles.slider_white_balance,'value',white_balance)
set(handles.slider_zoom,'value',zoom)



if strcmp(backlight_compensation,'on')
    set(handles.backlight_on,'value',1);
    set(handles.backlight_off,'value',0);
elseif strcmp(backlight_compensation,'off')
    set(handles.backlight_on,'value',0);
    set(handles.backlight_off,'value',1);    
end


if strcmp(exposure_mode,'manual')
    set(handles.exposure_manual,'value',1);
    set(handles.exposure_auto,'value',0);
elseif strcmp(exposure_mode,'auto')
    set(handles.exposure_manual,'value',0);
    set(handles.exposure_auto,'value',1);   
end

if strcmp(focus_mode,'manual')
    set(handles.focus_manual,'value',1);
    set(handles.focus_auto,'value',0);
elseif strcmp(focus_mode,'auto')
    set(handles.focus_manual,'value',0);
    set(handles.focus_auto,'value',1);   
end


if strcmp(horizontal_flip,'on')
    set(handles.horizontal_flip_on,'value',1);
    set(handles.horizontal_flip_off,'value',0);
elseif strcmp(horizontal_flip,'off')
    set(handles.horizontal_flip_on,'value',0);
    set(handles.horizontal_flip_off,'value',1);    
end

if strcmp(vertical_flip,'on')
    set(handles.vertical_flip_on,'value',1);
    set(handles.vertical_flip_off,'value',0);
elseif strcmp(vertical_flip,'off')
    set(handles.vertical_flip_on,'value',0);
    set(handles.vertical_flip_off,'value',1);    
end


if strcmp(white_balance_mode,'manual')
    set(handles.white_balance_manual,'value',1);
    set(handles.white_balance_auto,'value',0);
elseif strcmp(white_balance_mode,'auto')
    set(handles.white_balance_manual,'value',0);
    set(handles.white_balance_auto,'value',1);   
end




% --- Outputs from this function are returned to the command line.
function varargout = properties_webcam_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_brightness_Callback(hObject, eventdata, handles)
global brightness
brightness=str2double(get(handles.edit_brightness,'string'));% valor del edit
% brightness=uint8(brightness);
if brightness>255
    brightness=255;
    set(handles.edit_brightness,'string',brightness)
elseif brightness<0
    brightness=0;
    set(handles.edit_brightness,'string',brightness)
elseif isnan(brightness)%si el valor no es un numero
    brightness=128;
    set(handles.edit_brightness,'string',brightness)
end

set(handles.slider_brightness,'value',brightness)






% --- Executes during object creation, after setting all properties.
function edit_brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background backlight_on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes backlight_on slider movement.
function slider_brightness_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global brightness

brightness=uint8(get(handles.slider_brightness,'value'));% valor del slider
set(handles.edit_brightness,'string',brightness)
src.Brightness = brightness;



% --- Executes during object creation, after setting all properties.
function slider_brightness_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes backlight_on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)

global vid
src = getselectedsource(vid);

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


set(handles.edit_brightness,'string',brightness)
set(handles.edit_contrast,'string',contrast)
set(handles.edit_exposure,'string',exposure)
set(handles.edit_focus,'string',focus)
set(handles.edit_gain,'string',gain)
set(handles.edit_pan,'string',pan)
set(handles.edit_saturation,'string',saturation)
set(handles.edit_sharpness,'string',sharpness)
set(handles.edit_Tilt,'string',Tilt)
set(handles.edit_white_balance,'string',white_balance)
set(handles.edit_zoom,'string',zoom)

set(handles.slider_brightness,'value',brightness)
set(handles.slider_contrast,'value',contrast)
set(handles.slider_exposure,'value',exposure)
set(handles.slider_focus,'value',focus)
set(handles.slider_gain,'value',gain)
set(handles.slider_pan,'value',pan)
set(handles.slider_saturation,'value',saturation)
set(handles.slider_sharpness,'value',sharpness)
set(handles.slider_Tilt,'value',Tilt)
set(handles.slider_white_balance,'value',white_balance)
set(handles.slider_zoom,'value',zoom)



if strcmp(backlight_compensation,'on')
    set(handles.backlight_on,'value',1);
    set(handles.backlight_off,'value',0);
elseif strcmp(backlight_compensation,'off')
    set(handles.backlight_on,'value',0);
    set(handles.backlight_off,'value',1);    
end

if strcmp(exposure_mode,'manual')
    set(handles.exposure_manual,'value',1);
    set(handles.exposure_auto,'value',0);
elseif strcmp(exposure_mode,'auto')
    set(handles.exposure_manual,'value',0);
    set(handles.exposure_auto,'value',1);   
end

if strcmp(focus_mode,'manual')
    set(handles.exposure_manual,'value',1);
    set(handles.focus_auto,'value',0);
elseif strcmp(focus_mode,'auto')
    set(handles.focus_manual,'value',0);
    set(handles.focus_auto,'value',1);   
end


if strcmp(horizontal_flip,'on')
    set(handles.horizontal_flip_on,'value',1);
    set(handles.horizontal_flip_off,'value',0);
elseif strcmp(horizontal_flip,'off')
    set(handles.horizontal_flip_on,'value',0);
    set(handles.horizontal_flip_off,'value',1);    
end

if strcmp(vertical_flip,'on')
    set(handles.vertical_flip_on,'value',1);
    set(handles.vertical_flip_off,'value',0);
elseif strcmp(vertical_flip,'off')
    set(handles.vertical_flip_on,'value',0);
    set(handles.vertical_flip_off,'value',1);    
end


if strcmp(white_balance_mode,'manual')
    set(handles.white_balance_manual,'value',1);
    set(handles.white_balance_auto,'value',0);
elseif strcmp(white_balance_mode,'auto')
    set(handles.white_balance_manual,'value',0);
    set(handles.white_balance_auto,'value',1);   
end






% --- Executes when selected object is changed in Backlight_compensation.
function Backlight_compensation_SelectionChangeFcn(hObject, eventdata, handles)

global backlight_on
global backlight_off

if hObject == handles.backlight_on
    backlight_on= 1;
    backlight_off= 0;
elseif hObject ==handles.backlight_off
    backlight_off= 1;
    backlight_on= 0;
    
end



function edit_contrast_Callback(hObject, eventdata, handles)
global contrast
contrast=str2double(get(handles.edit_contrast,'string'));% valor del edit
%contrast=uint8(contrast);
if contrast>255
    contrast=255;
    set(handles.edit_contrast,'string',contrast)
elseif contrast<0
    contrast=0;
    set(handles.edit_contrast,'string',contrast)
elseif isnan(contrast)%si el valor no es un numero
    contrast=128;
    set(handles.edit_contrast,'string',contrast)
end

set(handles.slider_contrast,'value',contrast)




% --- Executes during object creation, after setting all properties.
function edit_contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_contrast_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global contrast

contrast=uint8(get(handles.slider_contrast,'value'));% valor del slider
set(handles.edit_contrast,'string',contrast)
src.Contrast = contrast;


% --- Executes during object creation, after setting all properties.
function slider_contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_exposure_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global exposure
exposure=str2double(get(handles.edit_exposure,'string'));% valor del edit
% exposure=int8(exposure);

if exposure>-1
    exposure=-1;
    set(handles.edit_exposure,'string',exposure)
elseif exposure<-7
    exposure=-7;
    set(handles.edit_exposure,'string',exposure)
elseif isnan(exposure)%si el valor no es un numero
    exposure=-7;
    set(handles.edit_brightness,'string',exposure)
end

set(handles.slider_exposure,'value',exposure)
src.Exposure = exposure

% --- Executes during object creation, after setting all properties.
function edit_exposure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_exposure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_exposure_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global exposure
global exposure_mode

exposure_mode= 'manual';
src.ExposureMode = exposure_mode;
set(handles.exposure_manual,'value',1)

exposure=int8(get(handles.slider_exposure,'value'));% valor del slider
set(handles.edit_exposure,'string',exposure)
src.Exposure = exposure;



% --- Executes during object creation, after setting all properties.
function slider_exposure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_exposure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_focus_Callback(hObject, eventdata, handles)
global focus
focus=str2double(get(handles.edit_focus,'string'));% valor del edit
% brightness=uint8(brightness);
if focus>250
    focus=250;
    set(handles.edit_focus,'string',focus)
elseif focus<0
    focus=0;
    set(handles.edit_focus,'string',focus)
elseif isnan(focus)%si el valor no es un numero
    focus=0;
    set(handles.edit_focus,'string',focus)
end

set(handles.slider_focus,'value',focus)


% --- Executes during object creation, after setting all properties.
function edit_focus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_focus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_focus_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global focus
global focus_mode

focus_mode= 'manual';
src.FocusMode = focus_mode;
set(handles.focus_manual,'value',1)


focus=uint8(get(handles.slider_focus,'value'));% valor del slider
set(handles.edit_focus,'string',focus)
src.Focus = focus;


% --- Executes during object creation, after setting all properties.
function slider_focus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_focus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in listbox_frame_rate.
function listbox_frame_rate_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_frame_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_frame_rate contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_frame_rate


% --- Executes during object creation, after setting all properties.
function listbox_frame_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_frame_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_gain_Callback(hObject, eventdata, handles)
global gain
gain=str2double(get(handles.edit_gain,'string'));% valor del edit
% brightness=uint8(brightness);
if gain>255
    gain=255;
    set(handles.edit_gain,'string',gain)
elseif gain<0
    gain=0;
    set(handles.edit_gain,'string',gain)
elseif isnan(gain)%si el valor no es un numero
    gain=128;
    set(handles.edit_gain,'string',gain)
end

set(handles.slider_gain,'value',gain)


% --- Executes during object creation, after setting all properties.
function edit_gain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_gain_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global gain

gain=uint8(get(handles.slider_gain,'value'));% valor del slider
set(handles.edit_gain,'string',gain)
src.Gain = gain;

% --- Executes during object creation, after setting all properties.
function slider_gain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_pan_Callback(hObject, eventdata, handles)
global pan
pan=str2double(get(handles.edit_pan,'string'));% valor del edit
% brightness=uint8(brightness);
if pan>10
    pan=10;
    set(handles.edit_pan,'string',pan)
elseif pan<-10
    pan=-10;
    set(handles.edit_pan,'string',pan)
elseif isnan(pan)%si el valor no es un numero
    gain=-10;
    set(handles.edit_pan,'string',pan)
end

set(handles.slider_pan,'value',pan)


% --- Executes during object creation, after setting all properties.
function edit_pan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_pan_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global pan

pan=int8(get(handles.slider_pan,'value'));% valor del slider
set(handles.edit_pan,'string',pan)
src.Pan = pan;


% --- Executes during object creation, after setting all properties.
function slider_pan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_saturation_Callback(hObject, eventdata, handles)
global saturation
saturation=str2double(get(handles.edit_saturation,'string'));% valor del edit
% brightness=uint8(brightness);
if saturation>255
    saturation=255;
    set(handles.edit_saturation,'string',saturation)
elseif saturation<0
    saturation=0;
    set(handles.edit_saturation,'string',saturation)
elseif isnan(saturation)%si el valor no es un numero
    saturation=128;
    set(handles.edit_saturation,'string',saturation)
end

set(handles.slider_saturation,'value',saturation)



% --- Executes during object creation, after setting all properties.
function edit_saturation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_saturation_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);

global saturation
saturation=uint8(get(handles.slider_saturation,'value'));% valor del slider
set(handles.edit_saturation,'string',saturation)
src.Saturation = saturation;


% --- Executes during object creation, after setting all properties.
function slider_saturation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_sharpness_Callback(hObject, eventdata, handles)
global sharpness
sharpness=str2double(get(handles.edit_sharpness,'string'));% valor del edit
% brightness=uint8(brightness);
if sharpness>255
    sharpness=255;
    set(handles.edit_sharpness,'string',sharpness)
elseif sharpness<0
    sharpness=0;
    set(handles.edit_sharpness,'string',sharpness)
elseif isnan(sharpness)%si el valor no es un numero
    sharpness=128;
    set(handles.edit_sharpness,'string',sharpness)
end

set(handles.slider_sharpness,'value',sharpness)


% --- Executes during object creation, after setting all properties.
function edit_sharpness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sharpness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_sharpness_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global sharpness

sharpness=uint8(get(handles.slider_sharpness,'value'));% valor del slider
set(handles.edit_sharpness,'string',sharpness)
src.Sharpness = sharpness;


% --- Executes during object creation, after setting all properties.
function slider_sharpness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_sharpness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_Tilt_Callback(hObject, eventdata, handles)
global Tilt
Tilt=str2double(get(handles.edit_Tilt,'string'));% valor del edit
% brightness=uint8(brightness);
if Tilt>10
    Tilt=10;
    set(handles.edit_Tilt,'string',Tilt)
elseif Tilt<-10
    Tilt=-10;
    set(handles.edit_Tilt,'string',Tilt)
elseif isnan(Tilt)%si el valor no es un numero
    Tilt=0;
    set(handles.edit_Tilt,'string',Tilt)
end

set(handles.slider_Tilt,'value',Tilt)



% --- Executes during object creation, after setting all properties.
function edit_Tilt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Tilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_Tilt_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);

global Tilt

Tilt=int8(get(handles.slider_Tilt,'value'));% valor del slider
set(handles.edit_Tilt,'string',Tilt)
src.Tilt = Tilt;

% --- Executes during object creation, after setting all properties.
function slider_Tilt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Tilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_white_balance_Callback(hObject, eventdata, handles)
global white_balance
white_balance=str2double(get(handles.edit_white_balance,'string'));% valor del edit
% brightness=uint8(brightness);
if white_balance>6500
    white_balance=6500;
    set(handles.edit_white_balance,'string',white_balance)
elseif white_balance<2000
    white_balance=2000;
    set(handles.edit_white_balance,'string',white_balance)
elseif isnan(white_balance)%si el valor no es un numero
    white_balance=4000;
    set(handles.edit_white_balance,'string',white_balance)
end

set(handles.slider_white_balance,'value',white_balance)


% --- Executes during object creation, after setting all properties.
function edit_white_balance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_white_balance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_white_balance_Callback(hObject, eventdata, handles)
global vid
src = getselectedsource(vid);
global white_balance

white_balance_mode= 'manual';
src.WhiteBalanceMode = white_balance_mode;
set(handles.white_balance_manual,'value',1)

white_balance=uint16(get(handles.slider_white_balance,'value'));% valor del slider
set(handles.edit_white_balance,'string',white_balance)
src.WhiteBalance = white_balance;


% --- Executes during object creation, after setting all properties.
function slider_white_balance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_white_balance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_zoom_Callback(hObject, eventdata, handles)
global zoom
zoom=str2double(get(handles.edit_zoom,'string'));% valor del edit
% brightness=uint8(brightness);
if zoom>500
    zoom=500;
    set(handles.edit_zoom,'string',zoom)
elseif zoom<100
    zoom=100;
    set(handles.edit_zoom,'string',zoom)
elseif isnan(zoom)%si el valor no es un numero
    zoom=100;
    set(handles.edit_zoom,'string',zoom)
end

set(handles.slider_zoom,'value',zoom)


% --- Executes during object creation, after setting all properties.
function edit_zoom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_zoom_Callback(hObject, eventdata, handles)

global vid
src = getselectedsource(vid);
global zoom

zoom=uint16(get(handles.slider_zoom,'value'));% valor del slider
set(handles.edit_zoom,'string',zoom)
src.Zoom = zoom;


% --- Executes during object creation, after setting all properties.
function slider_zoom_CreateFcn(hObject, eventdata, handles)


% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when selected object is changed in uipanel_backlight_compensation.
function uipanel_backlight_compensation_SelectionChangeFcn(hObject, eventdata, handles)

global backlight_compensation
global vid;
src = getselectedsource(vid);

if hObject ==handles.backlight_on
    backlight_compensation='on';
    src.BacklightCompensation = backlight_compensation;
elseif hObject ==handles.backlight_off
    backlight_compensation='off';
    src.BacklightCompensation = backlight_compensation;
end


% --- Executes when selected object is changed in uipanel_exposure_mode.
function uipanel_exposure_mode_SelectionChangeFcn(hObject, eventdata, handles)

global exposure_mode


global vid
src = getselectedsource(vid);

if hObject ==handles.exposure_auto
    exposure_mode='auto';
    src.ExposureMode = exposure_mode;
    set(handles.edit_exposure,'string',-7)
    set(handles.slider_exposure,'value',-7)
elseif hObject ==handles.exposure_manual
    exposure_mode='manual';
    src.ExposureMode = exposure_mode;
end


% --- Executes when selected object is changed in uipanel_focus_mode.
function uipanel_focus_mode_SelectionChangeFcn(hObject, eventdata, handles)

global focus_mode
global vid
src = getselectedsource(vid);

if hObject ==handles.focus_auto
    focus_mode='auto';
    src.FocusMode = focus_mode;
    set(handles.edit_focus,'string',0)
    set(handles.slider_focus,'value',0)
elseif hObject ==handles.focus_manual
    focus_mode='manual';
    src.FocusMode = 'manual';
end


% --- Executes when selected object is changed in uipanel_white_balance_mode.
function uipanel_white_balance_mode_SelectionChangeFcn(hObject, eventdata, handles)
% --- Executes when selected object is changed in uipanel_focus_mode.

global white_balance_mode


global vid
src = getselectedsource(vid);

if hObject ==handles.white_balance_auto
    white_balance_mode= 'auto';
    src.WhiteBalanceMode = white_balance_mode;
    set(handles.edit_white_balance,'string',4000)
    set(handles.slider_white_balance,'value',4000)
elseif hObject ==handles.white_balance_manual
    white_balance_mode= 'manual';
    src.WhiteBalanceMode = white_balance_mode;
end


% --- Executes when selected object is changed in uipanel_horizontal_flip.
function uipanel_horizontal_flip_SelectionChangeFcn(hObject, eventdata, handles)
global horizontal_flip


global vid
src = getselectedsource(vid);

if hObject == handles.horizontal_flip_on
    horizontal_flip= 'on';
    src.HorizontalFlip  = horizontal_flip;
elseif hObject ==handles.horizontal_flip_off
    horizontal_flip= 'off';
    src.HorizontalFlip = horizontal_flip;
end


% --- Executes when selected object is changed in uipanel_vertical_flip.
function uipanel_vertical_flip_SelectionChangeFcn(hObject, eventdata, handles)
global vertical_flip
global vid
src = getselectedsource(vid);

if hObject ==handles.vertical_flip_on
    vertical_flip= 'on';
    src.VerticalFlip  = vertical_flip;
elseif hObject ==handles.vertical_flip_off
    vertical_flip= 'off';
    src.VerticalFlip = vertical_flip;
end
