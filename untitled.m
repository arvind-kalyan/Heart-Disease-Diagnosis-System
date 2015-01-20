function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 13-Nov-2014 22:57:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inpNum_Callback(hObject, eventdata, handles)
% hObject    handle to inpNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpNum as text
%        str2double(get(hObject,'String')) returns contents of inpNum as a double


% --- Executes during object creation, after setting all properties.
function inpNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inpGo.
function inpGo_Callback(hObject, eventdata, handles)
global tmp;
% hObject    handle to inpGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = untitled;
%inpNum = str2num(get(handles.inpNum,'String'));
%for i = 1:inpNum
    lblDisp = uicontrol('Parent', f, 'Style', 'text', 'Position', [30 225 81 17],'String','Enter filename : ');
    lblFile = uicontrol('Parent', f, 'Style', 'edit', 'Position', [110 225 121 21],'HorizontalAlignment','left','String','');
    okayButton = uicontrol('Style','pushbutton','Parent',f,'String','Add','Position',[238 225 71 22],'Callback',{@pbAddinFile_Callback});
    tmp = lblFile;
%end
%impButton = uicontrol('Style','pushbutton','Parent',f,'String','Okay','Position',[30 323 - ((i)*33) 70 30 ],'Callback',{@pbDone_Callback});


function pbAddinFile_Callback(hObject, eventdata, handles)
%for i = 1:inpNum
global tmp;
global A;
    someTmp = get(tmp,'String'); 
    fname = someTmp;
    fid = fopen(fname,'r');
    if fid ==  -1
        msgbox('File not found. Please enter again');
    else if fid > 0
        
    ct = 0;
    while 1
     ct = ct+1;     
    if ct == 4 % if eof, break
        break
    end    
    tline = fgetl(fid); % get the line contents    
    if ct == 1
        VarName = tline;
        %disp(VarName);
    else if ct == 2
            [st,en] = strread(tline,'%d %d');
           % disp(st); disp(en);
        else if ct == 3
                NoMF = tline;
               % disp(NoMF);
            end
        end
    end
   
    end
    A = addvar(A,'input',VarName,[st en]);   
   % disp('input Var added : '); disp(A); disp(VarName); disp(st); disp(en);
    k = str2double(NoMF);
    %disp('K is ' + k);
    for j = 1:k
        tline = fgetl(fid);
       % disp(tline);
       X = textscan(tline,'%s');
       t0 = X{1}{2}; t1 = X{1}{3}; t2 = str2num(X{1}{4}); t3 = str2num(X{1}{5}); t4 = str2num(X{1}{6});
       t5 = str2num(X{1}{1});
       % disp(t2);
      % disp(t3);
      % disp(t4);
       if strcmp(t1,'trimf') == 1
           A = addmf(A,'input',t5,t0,t1,[t2 t3 t4]);
       else if strcmp(t1,'trapmf') == 1
               t6 = str2num(X{1}{7});
               A = addmf(A,'input',t5,t0,t1,[t2 t3 t4 t6]);
           end
       end
        %disp('input mf added : '); disp(A); disp(i); disp(t0); disp(t1); disp(t2); disp(t3); disp(t4);
        
    end 
          msgbox('File import successful!');
        end
    end
   

        
       


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inpNumGo.
function inpNumGo_Callback(hObject, eventdata, handles)
% hObject    handle to inpNumGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
var = str2num(get(handles.inpNum,'String'));
set(handles.inpNum,'Enable','Off');
set(handles.inpNumGo,'Enable','Off');
msgbox('Okay');


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in outputGo.
function outputGo_Callback(hObject, eventdata, handles)
% hObject    handle to outputGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tmp;
global i;
i=1;
% hObject    handle to inpGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = untitled;
%inpNum = str2num(get(handles.inpNum,'String'));
%for i = 1:inpNum
    lblDisp = uicontrol('Parent', f, 'Style', 'text', 'Position', [360 225 81 17],'String','Enter filename : ');
    lblFile = uicontrol('Parent', f, 'Style', 'edit', 'Position', [440 225 121 21],'HorizontalAlignment','left','String','');
    okayButton = uicontrol('Style','pushbutton','Parent',f,'String','Add','Position',[570 225 71 22],'Callback',{@pbAddoutFile_Callback});
    i=i+1;
    disp(i);
    tmp = lblFile;

function pbAddoutFile_Callback(hObject, eventdata, handles)

    global tmp;
    global A;
    someTmp = get(tmp,'String'); 
    fname = someTmp;
    fid = fopen(fname,'r');
    if fid ==  -1
        msgbox('File not found. Please enter again');
    else if fid > 0
        
    ct = 0;
    while 1
     ct = ct+1;     
    if ct == 4 % if eof, break
        break
    end    
    tline = fgetl(fid); % get the line contents    
    if ct == 1
        VarName = tline;
        %disp(VarName);
    else if ct == 2
            [st,en] = strread(tline,'%d %d');
           % disp(st); disp(en);
        else if ct == 3
                NoMF = tline;
               % disp(NoMF);
            end
        end
    end
   
    end
    A = addvar(A,'output',VarName,[st en]);   
   % disp('input Var added : '); disp(A); disp(VarName); disp(st); disp(en);
    k = str2double(NoMF);
    %disp('K is ' + k);
    for j = 1:k
        tline = fgetl(fid);
       % disp(tline);
       X = textscan(tline,'%s');
       t0 = X{1}{2}; t1 = X{1}{3}; t2 = str2num(X{1}{4}); t3 = str2num(X{1}{5}); t4 = str2num(X{1}{6});
       t5 = str2num(X{1}{1});
       if strcmp(t1,'trimf') == 1
           A = addmf(A,'output',t5,t0,t1,[t2 t3 t4]);
       else if strcmp(t1,'trapmf') == 1
               t6 = str2num(X{1}{7});
               A = addmf(A,'output',t5,t0,t1,[t2 t3 t4 t6]);
           end
       end
       
       % disp(t2);
      % disp(t3);
      % disp(t4);
        
        %disp('input mf added : '); disp(A); disp(i); disp(t0); disp(t1); disp(t2); disp(t3); disp(t4);
        
    end 
          msgbox('File import successful!');
        end
    end


% --- Executes on button press in outputNumGo.
function outputNumGo_Callback(hObject, eventdata, handles)
% hObject    handle to outputNumGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.outputNum,'Enable','Off');
set(handles.outputNumGo,'Enable','Off');
msgbox('OK');


function outputNum_Callback(hObject, eventdata, handles)
% hObject    handle to outputNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputNum as text
%        str2double(get(hObject,'String')) returns contents of outputNum as a double


% --- Executes during object creation, after setting all properties.
function outputNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbEvaluate.
function pbEvaluate_Callback(hObject, eventdata, handles)
% hObject    handle to pbEvaluate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%GUIMain();
global A;
setappdata(0,'FuzzyModel',A);
GUIMain();

% U = evalfis([4, 117, 230, 130, 160, 1.4], A);
% outString = ['Heart risk rate is ' num2str(U) ', on a scale from 1 to 4.'];
% msgbox(outString, 'Result','help');
%disp(U);



% --- Executes on button press in pbPlot.
function pbPlot_Callback(hObject, eventdata, handles)
% hObject    handle to pbPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
setappdata(0,'FuzzyModel',A);
plot;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
diary('OUTPUT-RULES.txt');
showrule(A)
diary off;
msgbox('Success! Please check the file named OUTPUT-RULES.txt in the same folder');



% --- Executes on button press in pbPrec.
function pbPrec_Callback(hObject, eventdata, handles)
% hObject    handle to pbPrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resFinal = getappdata(0,'finalResult');
if(resFinal<0.92)
    msgbox('Balanced Diet');
end
if(resFinal>0.92 && resFinal<2)
    msgbox('Balanced Diet');
end
if(resFinal>2 && resFinal<3)
    msgbox('Use Olive oil');
end
if(resFinal>3 && resFinal<4)
    msgbox('Use Olive oil and do excercise');
end
if(resFinal>4)
    msgbox('Consult a doctor immediately');
end
    
disp(resFinal);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
diary('OUTPUT-PROPERTIES.txt');
getfis(A);
diary off;
msgbox('Success! Please check the file named OUTPUT-PROPERTIES.txt in the same folder');



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ruleNum_Callback(hObject, eventdata, handles)
% hObject    handle to ruleNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ruleNum as text
%        str2double(get(hObject,'String')) returns contents of ruleNum as a double


% --- Executes during object creation, after setting all properties.
function ruleNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ruleNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ruleNumGo.
function ruleNumGo_Callback(hObject, eventdata, handles)
% hObject    handle to ruleNumGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rno;
ruleNo = str2num(get(handles.ruleNum,'String'));
rno = ruleNo;
set(handles.ruleNum,'Enable','Off');
set(handles.ruleNumGo,'Enable','Off');
msgbox('Okay');


% --- Executes on button press in ruleGo.
function ruleGo_Callback(hObject, eventdata, handles)
% hObject    handle to ruleGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tmp;
global i;
i=1;
% hObject    handle to inpGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = untitled;
%inpNum = str2num(get(handles.inpNum,'String'));
%for i = 1:inpNum
    lblDisp = uicontrol('Parent', f, 'Style', 'text', 'Position', [30 32 81 17],'String','Enter filename : ');
    lblFile = uicontrol('Parent', f, 'Style', 'edit', 'Position', [110 32 121 21],'HorizontalAlignment','left','String','');
    okayButton = uicontrol('Style','pushbutton','Parent',f,'String','Add','Position',[238 32 71 22],'Callback',{@pbAddruleFile_Callback});
    i=i+1;
    disp(i);
    tmp = lblFile;
    
function pbAddruleFile_Callback(hObject, eventdata, handles)
%for i = 1:inpNum
global tmp;
global rno
global A;
    ruleNo = rno;
    someTmp = get(tmp,'String');
    ruleName = someTmp;
    ffid = fopen(ruleName,'r');
    if ffid == -1
        msgbox('File Not Found. Please enter correct file name!')
    else if ffid > 0
            ct = -1;
r = 1;
ruleList = zeros(25,9);
ruleNo = ruleNo - 1;
while 1
    
    if ct == ruleNo
        break;
    end
   tline = fgetl(ffid); % get the line contents
   %disp(tline);
   %disp(ZZ{1});
   [px py pz pa pb pc pxx pyy pzz] = strread(tline,'%d %d %d %d %d %d %d %d %d');
   ct = ct+1;
   k = ct+1;
   ruleList(k,1) = px;
    ruleList(k,2) = py;
    ruleList(k,3) = pz;
    ruleList(k,4) = pa;
    ruleList(k,5) = pb;
    ruleList(k,6) = pc;
    ruleList(k,7) = pxx;
    ruleList(k,8) = pyy;
    ruleList(k,9) = pzz;
   r = r+1;
end
disp(ruleList);
A = addrule(A,ruleList);
 msgbox('File loaded successfully!');
        end
    end


% --- Executes on button press in pbLoadSys.
function pbLoadSys_Callback(hObject, eventdata, handles)
% hObject    handle to pbLoadSys (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
A = newfis('fuzzylogic','mamdani','min','max','min','sum','centroid'); % newfis(fisName,fisType,andMethod,orMethod,impMethod,aggMethod,defuzzMethod)

msgbox('Fuzzy system initiated successfully!','Success','');


% --- Executes on button press in pbExit.
function pbExit_Callback(hObject, eventdata, handles)
% hObject    handle to pbExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(untitled);
