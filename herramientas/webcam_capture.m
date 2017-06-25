function varargout = webcam_capture(varargin)
% WEBCAM_CAPTURE MATLAB code for webcam_capture.fig
%      WEBCAM_CAPTURE, by itself, creates a new WEBCAM_CAPTURE or raises the existing
%      singleton*.
%
%      H = WEBCAM_CAPTURE returns the handle to a new WEBCAM_CAPTURE or the handle to
%      the existing singleton*.
%
%      WEBCAM_CAPTURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WEBCAM_CAPTURE.M with the given input arguments.
%
%      WEBCAM_CAPTURE('Property','Value',...) creates a new WEBCAM_CAPTURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before webcam_capture_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to webcam_capture_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help webcam_capture

% Last Modified by GUIDE v2.5 05-Nov-2012 08:53:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @webcam_capture_OpeningFcn, ...
                   'gui_OutputFcn',  @webcam_capture_OutputFcn, ...
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


% --- Executes just before webcam_capture is made visible.
function webcam_capture_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to webcam_capture (see VARARGIN)

% Choose default command line output for webcam_capture
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes webcam_capture wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = webcam_capture_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbPreview.
function pbPreview_Callback(hObject, eventdata, handles)
% hObject    handle to pbPreview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% choose which webcam (winvideo-1) and which  mode (YUY2_176x144)
vid = videoinput('winvideo', 1, 'RGB24_640x480');
src = getselectedsource(vid);
% only capture one frame per trigger, we are not recording a video
vid.FramesPerTrigger = 1;
% output would image in RGB color space
vid.ReturnedColorspace = 'rgb';
% tell matlab to start the webcam on user request, not automatically
triggerconfig(vid, 'manual');
% we need this to know the image height and width
vidRes = get(vid, 'VideoResolution');
% image width
imWidth = vidRes(1);
% image height
imHeight = vidRes(2);
% number of bands of our image (should be 3 because it's RGB)
nBands = get(vid, 'NumberOfBands');
% create an empty image container and show it on axPreview
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.axPreview);
% begin the webcam preview
preview(vid, hImage);

% --- Executes on button press in pbCapture.
function pbCapture_Callback(hObject, eventdata, handles)
% hObject    handle to pbCapture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vid = videoinput('winvideo', 1, 'RGB24_640x480');
src = getselectedsource(vid);
vid.FramesPerTrigger = 1;
vid.ReturnedColorspace = 'rgb';
triggerconfig(vid, 'manual');
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands');
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.axPreview)
preview(vid, hImage);
 
% prepare for capturing the image preview
start(vid); 
% pause for 3 seconds to give our webcam a "warm-up" time
pause(3); 
% do capture!
trigger(vid);
% stop the preview
stoppreview(vid);
% get the captured image data and save it on capt1 variable
capt1 = getdata(vid);
% now write capt1 into file named captured.png
imwrite(capt1, 'captured.png');
% just dialog that we are done capturing
warndlg('Done!');
