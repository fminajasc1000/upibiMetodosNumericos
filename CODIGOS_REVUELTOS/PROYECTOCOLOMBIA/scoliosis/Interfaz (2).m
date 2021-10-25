function varargout = Interfaz(varargin)
% INTERFAZ MATLAB code for Interfaz.fig
%      INTERFAZ, by itself, creates a new INTERFAZ or raises the existing
%      singleton*.
%
%      H = INTERFAZ returns the handle to a new INTERFAZ or the handle to
%      the existing singleton*.
%
%      INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ.M with the given input arguments.
%
%      INTERFAZ('Property','Value',...) creates a new INTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interfaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interfaz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interfaz

% Last Modified by GUIDE v2.5 11-Nov-2019 15:42:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @Interfaz_OutputFcn, ...
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


% --- Executes just before Interfaz is made visible.
function Interfaz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interfaz (see VARARGIN)

% Choose default command line output for Interfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calibrar.
function calibrar_Callback(hObject, eventdata, handles)
% hObject    handle to calibrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar.
function cargar_Callback(hObject, eventdata, handles)
% hObject    handle to cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.png');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
end

axes(handles.axes1)
matlabImage = imread(fullfile(path,file));
global imgfetal;
global imgposterior;

imgfetal=matlabImage;
imgposterior=matlabImage;
image(matlabImage);
axis off
axis image

% --- Executes on button press in fetal.
function fetal_Callback(hObject, eventdata, handles)
% hObject    handle to fetal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vid = videoinput('winvideo', 1);
set(vid, 'ReturnedColorSpace', 'RGB');
global imgfetal
imgfetal = getsnapshot(vid);
%imgfetal=imcrop(imgfetal,[870,350,320,480]);
axes(handles.axes1);
image(imgfetal);
axis off
axis image


% --- Executes on button press in posterior.
function posterior_Callback(hObject, eventdata, handles)
% hObject    handle to posterior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vid = videoinput('winvideo', 1);
set(vid, 'ReturnedColorSpace', 'RGB');
global imgposterior
imgposterior = getsnapshot(vid);
%imgposterior=imcrop(imgposterior,[870,350,320,480]);
axes(handles.axes1);
image(imgposterior);
axis off
axis image


function paciente_Callback(hObject, eventdata, handles)
% hObject    handle to paciente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paciente as text
%        str2double(get(hObject,'String')) returns contents of paciente as a double


% --- Executes during object creation, after setting all properties.
function paciente_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paciente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in aceptar1.
function aceptar1_Callback(hObject, eventdata, handles)
% hObject    handle to aceptar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%vid = videoinput('winvideo', 1);
%set(vid, 'ReturnedColorSpace', 'RGB');
%img = getsnapshot(vid);
S=get(handles.popupmenu1,'Value');
%disp (S)
global imgfetal
global imgposterior
jeje=zeros;
if S == 1
    %disp('jeje1');
    [x1,y1,z1] = size(imgfetal);
    
    valorx = str2num(get(handles.paciente,'String'));
    valory = str2num(get(handles.ejey,'String'));
    dimensionmediox=round(x1/2)+valorx+50;
    dimensionmedioy=round(y1/2)+valory+50;

    %imgfetal=imcrop(imgfetal,[dimensionmedioy,dimensionmediox,320,480]);
    %descomentar linea de arriba para que funcione con imagenes pasadas
    
    %imgfetal=imcrop(imgfetal,[870,350,320,480]);
    axes(handles.axes2);
    image(imgfetal);
    axis off
    axis image
    
    imagen2=funcioexp1(imgfetal,3); %verificar
    %imagen3=imcrop(imagen2,[870,350,320,480]);
    %imagen3=mat2gray(imagen3);
    axes(handles.axes3);
    image(imagen2);
    axis off
    axis image
    
    imagen2=funcioexp2(imgfetal,3); %verificar
    %imagen3=imcrop(imagen2,[870,350,320,480]);
    imagen4=imbinarize(imagen2,0.8);
    axes(handles.axes4);
    image(imagen4);
    axis off
    axis image
    
    final=funcioexp3(imgfetal,4); %imagenok
    %imagen3=imcrop(imagen2,[870,350,320,480]);
    axes(handles.axes5);
    image(final);
    axis off
    axis image
     
    jeje=funcioexp4(imgfetal,5); %verificar
    set(handles.error,'string',jeje(1));
    set(handles.mistake,'string',jeje(2));
    set(handles.area,'string',jeje(3));
    set(handles.shoulder,'string',jeje(4));
    %resultado=knn([jeje(1);jeje(2);jeje(3);jeje(4)])
    resultado=my_first_ANN([jeje(1);jeje(2);jeje(3);jeje(4)]);
    [val,categoria_red]=max(resultado(1,:));
    n=round(min(val(1,:)));
    switch n
        case 1
            set(handles.text20,'string','A');
        case 2
            set(handles.text20,'string','B');
        case 3
            set(handles.text20,'string','D');
        case 4
            set(handles.text20,'string','E');
        otherwise
            set(handles.text20,'string',round(min(val(1,:))));
    end
    
    
    %imgfetal=imcrop(imgfetal,[dimensionmedioy,dimensionmediox,320,480]);
    [rows,cols]=size(imagen4);
     
    imagen_seg=zeros(rows,cols);
    bandera1=0;
    bandera2=0;
    
    pos1x=0;
    pos2x=0;
    pos1y=0;
    pos2y=0;
    
    for m=1:480
        for n=1:320
            if final(m,n)~=0
                bandera1=bandera1+1;
                if(bandera1==1)
                    pos1x=m;
                    pos1y=n;
                end
            else
                bandera2=bandera2+1;
                pos2x=m;
                pos2y=n;
            end
            
        end
    end
    %angulo=atand((pos2y+pos1y)/(pos2x-pos1x));
    angulo=atand((pos2y+pos1y)/(pos2x-pos1x));
    cadena= strcat('Angulo: ',int2str(angulo));
    if(angulo>85 && angulo<100)
        set(handles.text22,'string',cadena);
        set(handles.text23,'string','Sin Escleriosis');
    else
        set(handles.text22,'string',cadena);
        set(handles.text23,'string','Con Escleriosis');
    end
    %disp(final)
    %fprintf("[%d,%d,%d,%d,Bien];\n",jeje(1),jeje(2),jeje(3),jeje(4));
elseif S==2
    %disp('jeje2');
    [x1,y1,z1] = size(imgposterior)
    valorx = str2num(get(handles.paciente,'String'));
    valory = str2num(get(handles.ejey,'String'));
    dimensionmediox=round(x1/2)+valorx;
    dimensionmedioy=round(y1/2)-100;
    
    %imgposterior=imcrop(imgposterior,[dimensionmedioy,dimensionmediox,320,480]);
    %descomentar linea de arriba para que funcione con imagenes pasadas
    
    %imgposterior=imcrop(imgposterior,[870,350,320,480]);
    axes(handles.axes2);
    image(imgposterior);
    axis off
    axis image
    
    imagen2=funcioexp1(imgposterior,3); %verificar
    %imagen2=mat2gray(imagen2)
    axes(handles.axes3);
    image(imagen2);
    axis off
    axis image
    
    imagen2=funcioexp2(imgposterior,3); %verificar
    %imagen2=mat2gray(imagen2)
    imagen4=imbinarize(imagen2,0.8);
    
    axes(handles.axes4);
    image(imagen4);
    axis off
    axis image
    
    final=funcioexp3(imgposterior,4);
    axes(handles.axes5);
    image(final);
    axis off
    axis image
    
    jeje=funcioexp4(imgposterior,3);
    set(handles.error,'string',jeje(1));
    set(handles.mistake,'string',jeje(2));
    set(handles.area,'string',jeje(3));
    set(handles.shoulder,'string',jeje(4));
    
    %fprintf("[%d,%d,%d,%d,Bien];\n",jeje(1),jeje(2),jeje(3),jeje(4));
    resultado=my_first_ANN([jeje(1);jeje(2);jeje(3);jeje(4)]);
    [val,categoria_red]=max(resultado(1,:));
    n=round(min(val(1,:)));
    switch n
        case 1
            set(handles.text20,'string','A');
        case 2
            set(handles.text20,'string','B');
        case 3
            set(handles.text20,'string','D');
        case 4
            set(handles.text20,'string','E');
        otherwise
            set(handles.text20,'string',round(min(val(1,:))));
    end
    [rows,cols]=size(imagen4);
    
    pos1x=0;
    pos2x=0;
    pos1y=0;
    pos2y=0;
    
    ybajo=0;
    yalto=0;
    
    for m=1:480
        for n=1:320
            if final(m,n)~=0
                if ybajo==0 && yalto==0
                    ybajo=n;
                    yalto=n;
                    pos1x=m;
                    pos2x=m;
                end
                if n<ybajo
                    ybajo=n;
                else
                    pos1x=m;
                    pos1y=ybajo;
                end
                if n>yalto
                    yalto=n;
                else
                    pos2x=m;
                    pos2y=yalto;
                end
            end  
        end
    end
    angulo=atand((pos2y+pos1y)/(pos2x-pos1x));
    cadena= strcat('Angulo: ',int2str(angulo));
    if(angulo>85 && angulo<100)
        set(handles.text22,'string',cadena);
        set(handles.text23,'string','Sin Escleriosis');
    else
        set(handles.text22,'string',cadena);
        set(handles.text23,'string','Con Escleriosis');
    end
    %%disp('La red clasifico como ',num2str(categoria_red))
    %resultado=my_first_ANN([jeje(1);jeje(2);jeje(3);jeje(4)])
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in aceptar2.
function aceptar2_Callback(hObject, eventdata, handles)
% hObject    handle to aceptar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in aceptar3.
function aceptar3_Callback(hObject, eventdata, handles)
% hObject    handle to aceptar3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error as text
%        str2double(get(hObject,'String')) returns contents of error as a double


% --- Executes during object creation, after setting all properties.
function error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mistake_Callback(hObject, eventdata, handles)
% hObject    handle to mistake (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mistake as text
%        str2double(get(hObject,'String')) returns contents of mistake as a double


% --- Executes during object creation, after setting all properties.
function mistake_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mistake (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function area_Callback(hObject, eventdata, handles)
% hObject    handle to area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of area as text
%        str2double(get(hObject,'String')) returns contents of area as a double


% --- Executes during object creation, after setting all properties.
function area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function shoulder_Callback(hObject, eventdata, handles)
% hObject    handle to shoulder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shoulder as text
%        str2double(get(hObject,'String')) returns contents of shoulder as a double


% --- Executes during object creation, after setting all properties.
function shoulder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shoulder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ejey_Callback(hObject, eventdata, handles)
% hObject    handle to ejey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ejey as text
%        str2double(get(hObject,'String')) returns contents of ejey as a double


% --- Executes during object creation, after setting all properties.
function ejey_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ejey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
