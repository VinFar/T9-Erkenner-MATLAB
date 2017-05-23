function varargout = gui(varargin)
% GUI MATLAB code for gui.fig obtained from https://github.com/bhaumikmistry/T9-Keyboard
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 25-Apr-2017 14:34:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @gui_OpeningFcn, ...
    'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global cap
cap = 0;

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbuttonCaps.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCaps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '1';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbutton0.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '2';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbuttonHash.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '3';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbuttonCaps.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCaps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '4';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbutton0.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '5';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbuttonHash.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '6';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbuttonHash.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '7';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbuttonHash.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '8';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbuttonHash.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '9';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbuttonHash.
function pushbutton0_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '0';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbuttonHash.
function pushbuttonHash_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global keySequence
global newKey
global symbolTree
global probTree
global nGram

newKey = '#';
keySequence = [keySequence, newKey];

string = get(handles.display, 'String');

if strcmp(string, 'Enter Key Sequence')
    string = [];
end

newstr = strcat(string, newKey);

set(handles.display, 'String', newstr)

symbolTree = appendToTree(newKey, symbolTree, probTree, nGram);


% --- Executes on button press in pushbutton9.
function pushbuttonCaps_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% caps lock 
global cap
if cap == 0
    cap = 1
else
    cap = 0
end
