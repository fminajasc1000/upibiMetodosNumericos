function varargout = Leer_arch_gases(varargin)
% LEER_ARCH_GASES MATLAB code for Leer_arch_gases.fig
%      LEER_ARCH_GASES, by itself, creates a new LEER_ARCH_GASES or raises the existing
%      singleton*.
%
%      H = LEER_ARCH_GASES returns the handle to a new LEER_ARCH_GASES or the handle to
%      the existing singleton*.
%
%      LEER_ARCH_GASES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEER_ARCH_GASES.M with the given input arguments.
%
%      LEER_ARCH_GASES('Property','Value',...) creates a new LEER_ARCH_GASES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Leer_arch_gases_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Leer_arch_gases_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Leer_arch_gases

% Last Modified by GUIDE v2.5 15-May-2019 18:28:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Leer_arch_gases_OpeningFcn, ...
                   'gui_OutputFcn',  @Leer_arch_gases_OutputFcn, ...
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


% --- Executes just before Leer_arch_gases is made visible.
function Leer_arch_gases_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Leer_arch_gases (see VARARGIN)

% Choose default command line output for Leer_arch_gases
handles.output = hObject;
handles.input1 = varargin{1:1};
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Leer_arch_gases wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Leer_arch_gases_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function archivo_Callback(hObject, eventdata, handles)
% hObject    handle to archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of archivo as text
%        str2double(get(hObject,'String')) returns contents of archivo as a double


% --- Executes during object creation, after setting all properties.
function archivo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in abrir.
function abrir_Callback(hObject, eventdata, handles)
% hObject    handle to abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nombre=get(handles.archivo,'string');%strcat(get(handles.archivo,'string'),{'.txt'});
nombre=strcat(nombre,{'.txt'});
nombre=nombre{1:1};
r=0.08314;
if exist(nombre,'file')==2
    %disp('existo')
    fileID = fopen(nombre,'r');
    degrees = char(176);
    A = fscanf(fileID, ['%s' degrees ',']);
    fclose(fileID);
    A = textscan( A, '%s', 'Delimiter',',' );
    
    ng=A{1}{1};
    fg=A{1}{2};
    tt=A{1}{3};
    pp=A{1}{4};
    t=str2num(A{1}{3});
    p=str2num(A{1}{4});
    w=str2num(A{1}{5});
    
    if handles.input1==1
        %disp('Obtener Volumen Molar')
        prompt={'Ingrese la Temperatura del Gas en °K: ','La Presión en Bar: '};
        dig_title='Entrada de Datos Solicitada';
        num_lines=[1 40];
        def={'',''};
        answer=inputdlg(prompt,dig_title,num_lines,def);
        x=str2num(answer{1});
        y=str2num(answer{2});
        Tr=t/x;
        Pr=p/y;
        Tr2=num2str(Tr);
        Pr2=num2str(Pr);
        CreateStruct.Interpreter = 'tex';
        CreateStruct.WindowStyle = 'modal';
        close();
        ecuacion=strcat({'RESULTADOS\newline\newlineTr= T/Tc = '},Tr2, {'\newlinePr= P/Pc = '}, Pr2);
        uiwait(msgbox(ecuacion,'Value',CreateStruct));
        choice = menu('Ubicación de Tr y Pr en la Carta Generalizada','Primera Correlación (desv. >2%)','Segunda Correlación (desv. <2%)', 'Regresar al Menu Principal');
        if choice==1
            close();
            prompt2={'Por favor, Introduzca el Valor del Factor de Compresibilidad Z Ubicada en la Carta Generalizada: '};
            dig_title2='Entrada de Datos Solicitada';
            num_lines2=[1 100];
            def2={''};
            answer2=inputdlg(prompt2,dig_title2,num_lines2,def2);
            x2=str2num(answer2{1});
            V=(x2*r*Tr)/Pr;
            V2=num2str(V);
            close();
            ecuacion2=strcat({'RESULTADOS FINALES\newline\newline'},{'Nombre del Gas = '},ng, {'\newlineFórmula del Gas = '}, fg,{'\newlineTemperatura = '},tt, {'\newlinePresión = '}, pp, {'\newlineVolumén Molar = '}, V2);
            uiwait(msgbox(ecuacion2,'Value',CreateStruct));
            close();
            Principal_Gases();
        elseif choice==2
            prompt3={'Por favor, Introduzca el Valor del Factor de Compresibilidad Z Ubicada en la Carta Generalizada: '};
            dig_title3='Entrada de Datos Solicitada';
            num_lines3=[1 100];
            def3={''};
            answer3=inputdlg(prompt3,dig_title3,num_lines3,def3);
            x3=str2num(answer3{1});
            
            B0=0.083-(0.422/(Tr^1.6));
            Z0=1+(B0*Pr/(Tr^1.6));
            B1=0.139-(0.172/(Tr^4.2));
            Z1=((B1*Pr)/Tr);
            ZZ=Z0+w*Z1;
            
            V3=(ZZ*r*Tr)/Pr;
            V4=num2str(V3);
            close();
            
            close();
            ecuacion3=strcat({'RESULTADOS FINALES\newline\newline'},{'Nombre del Gas = '},ng, {'\newlineFórmula del Gas = '}, fg,{'\newlineTemperatura = '},tt, {'\newlinePresión = '}, pp, {'\newlineVolumén Molar = '}, V4);
            uiwait(msgbox(ecuacion3,'Value',CreateStruct));
            close();
            Principal_Gases();
        elseif choice==3
            Principal_Gases();
        end
    else
        %disp('Obtener Presión')
        prompt={'Ingrese la Temperatura del Gas en °K: ','Volumen Molar en m^3/kmol: '};
        dig_title='Entrada de Datos Solicitada';
        num_lines=[1 40];
        def={'',''};
        answer=inputdlg(prompt,dig_title,num_lines,def);
        kk=str2num(answer{1});
        vv=str2num(answer{2});
        VPr=vv/r*t/p;
        Tr=t/kk;
        
        Vpr2=num2str(VPr);
        Tr2=num2str(Tr);
        
        CreateStruct.Interpreter = 'tex';
        CreateStruct.WindowStyle = 'modal';
        close();
        ecuacion5=strcat({'RESULTADOS FINALES\newline\newline'},{'Nombre del Gas = '},ng, {'\newlineFórmula del Gas = '}, fg,{'\newlineVolumén Molar Pseudoreducido = '},Vpr2, {'\newlineTr = '}, Tr2);
        uiwait(msgbox(ecuacion5,'Value',CreateStruct));
        
        close();
        prompt4={'Por favor, Introduzca el Valor del Factor de Compresibilidad Z Ubicada en la Carta Generalizada: '};
        dig_title4='Entrada de Datos Solicitada';
        num_lines4=[1 100];
        def4={''};
        answer4=inputdlg(prompt4,dig_title4,num_lines4,def4);
        x4=str2num(answer4{1});
        
        Ppo=x4*r*kk/vv;
        Ppo2=num2str(Ppo);
        
        close();
        ecuacion4=strcat({'RESULTADOS FINALES\newline\newline'},{'Presión = '},Ppo2);
        uiwait(msgbox(ecuacion4,'Value',CreateStruct));
        close();
        Principal_Gases();
    end
else
    %disp('noexisto')
    close()
    uiwait(msgbox('GAS NO ENCONTRADO Porfavor crea un archivo de gases', 'Error','error'));
    Crear_arch_gases();
end
   

% --- Executes on button press in regresar.
function regresar_Callback(hObject, eventdata, handles)
% hObject    handle to regresar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
Principal_Gases();

% --- Executes on button press in regresar.
function salir_Callback(hObject, eventdata, handles)
% hObject    handle to regresar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
