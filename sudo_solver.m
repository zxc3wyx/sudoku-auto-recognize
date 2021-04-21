function varargout = sudo_solver(varargin)
% SUDO_SOLVER MATLAB code for sudo_solver.fig
%      SUDO_SOLVER, by itself, creates a new SUDO_SOLVER or raises the existing
%      singleton*.
%
%      H = SUDO_SOLVER returns the handle to a new SUDO_SOLVER or the handle to
%      the existing singleton*.
%
%      SUDO_SOLVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUDO_SOLVER.M with the given input arguments.
%
%      SUDO_SOLVER('Property','Value',...) creates a new SUDO_SOLVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sudo_solver_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sudo_solver_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sudo_solver

% Last Modified by GUIDE v2.5 14-Dec-2020 01:54:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sudo_solver_OpeningFcn, ...
                   'gui_OutputFcn',  @sudo_solver_OutputFcn, ...
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


% --- Executes just before sudo_solver is made visible.
function sudo_solver_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sudo_solver (see VARARGIN)

% Choose default command line output for sudo_solver
handles.output = hObject;
handles.imgfilename = [];
handles.imgdata = [];
handles.output = [];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sudo_solver wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sudo_solver_OutputFcn(hObject, eventdata, handles) 
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
[imgfilename imgpathname] = uigetfile({'*.jpg;*.png'},'Select an image');
if imgfilename
    imgdata = imread([imgpathname '\' imgfilename]);
    image(handles.axes1,imgdata);
    handles.imgfilename = [imgpathname '\' imgfilename];
    handles.imgdata = imgdata;
end
guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isempty(handles.imgfilename)%可以运行完主函数直接展示result.jpg
    src = handles.imgfilename;
    disposeEdge(src);
    matrix = recognition();
    disp(matrix);
    for i = 1 : 9
        for j = 1 : 9
            name = sprintf('%d-%d.jpg', i, j);
            delete(name);
        end
    end
    solveMatrix(matrix);
    imgoutput = imread('result.jpg');%改，handles.imgdata存imread的数据
    image(handles.axes2,imgoutput);%保留，求解后展示图片，imgoutput存输出的图片
    colormap(handles.axes2,gray(256));%改
    handles.imgoutput = imgoutput;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
clear;
clc;
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'bottom');
ii=imread('background.jpg');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','on');
