function varargout = GUIMain(varargin)
% GUIMAIN MATLAB code for GUIMain.fig
%      GUIMAIN, by itself, creates a new GUIMAIN or raises the existing
%      singleton*.
%
%      H = GUIMAIN returns the handle to a new GUIMAIN or the handle to
%      the existing singleton*.
%
%      GUIMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMAIN.M with the given input arguments.
%
%      GUIMAIN('Property','Value',...) creates a new GUIMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIMain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIMain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIMain

% Last Modified by GUIDE v2.5 12-Nov-2014 13:37:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIMain_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIMain_OutputFcn, ...
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


% --- Executes just before GUIMain is made visible.
function GUIMain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIMain (see VARARGIN)

% Choose default command line output for GUIMain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIMain wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIMain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editCP_Callback(hObject, eventdata, handles)
% hObject    handle to editCP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCP as text
%        str2double(get(hObject,'String')) returns contents of editCP as a double


% --- Executes during object creation, after setting all properties.
function editCP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBP_Callback(hObject, eventdata, handles)
% hObject    handle to editBP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBP as text
%        str2double(get(hObject,'String')) returns contents of editBP as a double


% --- Executes during object creation, after setting all properties.
function editBP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCh_Callback(hObject, eventdata, handles)
% hObject    handle to editCh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCh as text
%        str2double(get(hObject,'String')) returns contents of editCh as a double


% --- Executes during object creation, after setting all properties.
function editCh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBS_Callback(hObject, eventdata, handles)
% hObject    handle to editBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBS as text
%        str2double(get(hObject,'String')) returns contents of editBS as a double


% --- Executes during object creation, after setting all properties.
function editBS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editHR_Callback(hObject, eventdata, handles)
% hObject    handle to editHR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editHR as text
%        str2double(get(hObject,'String')) returns contents of editHR as a double


% --- Executes during object creation, after setting all properties.
function editHR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editHR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editOP_Callback(hObject, eventdata, handles)
% hObject    handle to editOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOP as text
%        str2double(get(hObject,'String')) returns contents of editOP as a double


% --- Executes during object creation, after setting all properties.
function editOP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbClear.
function pbClear_Callback(hObject, eventdata, handles)
% hObject    handle to pbClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.editCP,'String',''); 
set(handles.editBP,'String',''); 
set(handles.editCh,'String',''); 
set(handles.editBS,'String',''); 
set(handles.editHR,'String',''); 
set(handles.editOP,'String','');
set(handles.labelOne,'String', 'Please enter the following details.');

% --- Executes on button press in pdOkay.
function pdOkay_Callback(hObject, eventdata, handles)
global fModel;
% hObject    handle to pdOkay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fModel = getappdata(0,'FuzzyModel');
inpChestPain = str2num(get(handles.editCP,'String'));
inpBP = str2num(get(handles.editBP,'String'));
inpCholesterol = str2num(get(handles.editCh,'String'));
inpSugar = str2num(get(handles.editBS,'String'));
inpMaxRate = str2num(get(handles.editHR,'String'));
inpOldPeak = str2num(get(handles.editOP,'String'));

res = evalfis([inpChestPain, inpBP, inpCholesterol, inpSugar, inpMaxRate, inpOldPeak],fModel);
outString = ['Heart risk rate is ' num2str(res) ', on a scale from 1 to 4.'];
setappdata(0,'finalResult',res);
msgbox(outString, 'Result','help');
% disp(['Heart risk rate is ', num2str(res) , ', on a scale from 1 to 4.']);

% --- Executes on button press in pbExit.
function pbExit_Callback(hObject, eventdata, handles)
% hObject    handle to pbExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%GUITemp();
delete(GUIMain);

% --------------------------------------------------------------------
function menuOptions_Callback(hObject, eventdata, handles)
% hObject    handle to menuOptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuHelp_Callback(hObject, eventdata, handles)
% hObject    handle to menuHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuAbout_Callback(hObject, eventdata, handles)
% hObject    handle to menuAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Heart Disease Diagnosis System','About');


% --------------------------------------------------------------------
function menuImport_Callback(hObject, eventdata, handles)
% hObject    handle to menuImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.txt','File Selector'});
fullpathname = strcat(pathname, filename);
textContent = fileread(fullpathname);
strMsg = ['Loaded file ' filename];
set(handles.labelOne,'String', strMsg);
C = strread(textContent,'%s','delimiter',' ');

set(handles.editCP,'String',C{1});
set(handles.editBP,'String',C{2});
set(handles.editCh,'String',C{3});
set(handles.editBS,'String',C{4});
set(handles.editHR,'String',C{5});
set(handles.editOP,'String',C{6});
