function varargout = Principal_Gases(varargin)
% PRINCIPAL_GASES MATLAB code for Principal_Gases.fig
%      PRINCIPAL_GASES, by itself, creates a new PRINCIPAL_GASES or raises the existing
%      singleton*.
%
%      H = PRINCIPAL_GASES returns the handle to a new PRINCIPAL_GASES or the handle to
%      the existing singleton*.
%
%      PRINCIPAL_GASES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRINCIPAL_GASES.M with the given input arguments.
%
%      PRINCIPAL_GASES('Property','Value',...) creates a new PRINCIPAL_GASES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Principal_Gases_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Principal_Gases_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Principal_Gases

% Last Modified by GUIDE v2.5 15-May-2019 16:39:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Principal_Gases_OpeningFcn, ...
                   'gui_OutputFcn',  @Principal_Gases_OutputFcn, ...
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


% --- Executes just before Principal_Gases is made visible.
function Principal_Gases_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Principal_Gases (see VARARGIN)

% Choose default command line output for Principal_Gases
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Principal_Gases wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Principal_Gases_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in crear.
function crear_Callback(hObject, eventdata, handles)
% hObject    handle to crear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
Crear_arch_gases(0);


% --- Executes on button press in obtenerpres.
function obtenerpres_Callback(hObject, eventdata, handles)
% hObject    handle to obtenerpres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
Leer_arch_gases(2)

% --- Executes on button press in obtenervol.
function obtenervol_Callback(hObject, eventdata, handles)
% hObject    handle to obtenervol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
Leer_arch_gases(1)

% --- Executes on button press in salir.
function salir_Callback(hObject, eventdata, handles)
% hObject    handle to salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
