function varargout = plot(varargin)
% PLOT MATLAB code for plot.fig
%      PLOT, by itself, creates a new PLOT or raises the existing
%      singleton*.
%
%      H = PLOT returns the handle to a new PLOT or the handle to
%      the existing singleton*.
%
%      PLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOT.M with the given input arguments.
%
%      PLOT('Property','Value',...) creates a new PLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plot

% Last Modified by GUIDE v2.5 13-Nov-2014 16:10:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plot_OpeningFcn, ...
                   'gui_OutputFcn',  @plot_OutputFcn, ...
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


% --- Executes just before plot is made visible.
function plot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plot (see VARARGIN)
global A;
% Choose default command line output for plot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


model = getappdata(0,'FuzzyModel');
plotfis(model);


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in closeplot.
function closeplot_Callback(hObject, eventdata, handles)
% hObject    handle to closeplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(plot);
