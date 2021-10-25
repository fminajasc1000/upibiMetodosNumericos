close all;
clear all;
clc

%El en menu se solicita al usuario elegir una opción y esta se 
%traducira en forma de numero del 1 al 4
opcion = menu('Por Favor Seleccione una Opción: ','1-. Crear Nuevo Archivo de Gases','2-. Obtener Volumen Molar','3-. Obtener Presión','4-. Salir');

r=0.08314; %Constante de los gases

switch opcion %aqui es donde se la opcion se distribuira en 4 casos
    case 1 % caso 1 crear un nuevo archivo
        close all;
        clear all;
        clc
        %limpiar pantala y consola
        Crear_Gases();%funcion que permite crear un gas
        Principal_Gases();%reinicializa la funcion principal, para que aparezca de nuevo.
    case 2 %obtener volumen molar
        close all;
        clear all;
        clc
        %Limpiar pantalla y consola
        disp('Obtener Volumen Molar');
        [existe, datos,donde]=Leer_Gases();%leer gases recibe tres datos de la funcion:
                                           %EXISTE, recibe un 1 o 0, en
                                           %caso de que el cas seleccionado
                                           %exista o no.
                                           %DATOS, recibe los datos del gas
                                           %localizado.
                                           %DONDE. recibe la localizacion
                                           %de la información del gas
                                           %dentro del vector leido con la
                                           %información de los gases.
        if existe==1    %se preguna si el gas existe
            %en este caso si existe por lo que se leen los datos en la
            %posicion donde esta el gas, previamente obtenida.
            info=datos(donde); %aqui es donde obtenemos la informacion del gas
            A = textscan( info, '%s', 'Delimiter',',' );%aqui eliminamos las comas y obtenemos una matriz
                                                        %{Helio;He;200;30;0.12}
            ng=A{1}{1};%nombre del gas
            fg=A{1}{2};%formula del gas
            tt=A{1}{3};%temperatura del gas
            pp=A{1}{4};%presion del gas
            t=str2num(A{1}{3});%temperatura del gas en formato float "CONVERSION STRING -->FLOAT"
            p=str2num(A{1}{4});%presion del gas en formato float
            w=str2num(A{1}{5});%factor acentrico
            clc %Limpieza de consola
            disp('Entrada de Datos Solicitada');
            nombre=input('Ingrese la Temperatura del Gas en °K: ' ,'s');%obtencion de la temperatura en cadena
            formula=input('La Presión en Bar: ', 's');%obtencion de la presion en cadena
            x=str2num(nombre);%conversion de datos a float
            y=str2num(formula);%conversion de datos a float
            Tr=t/x;
            Pr=p/y;
            
            clc;%limpieza de consola
            disp('RESULTADOS');
            fprintf('Tr= T/Tc = %f', Tr);
            fprintf('\nPr= P/Pc =  %f', Pr);
            disp(' ');
            
            clc;
            %generacion del menu para obtener la correlacion.
            opcion2 = menu('Ubicación de Tr y Pr en la Carta Generalizada','Primera Correlación (desv. >2%)','Segunda Correlación (desv. <2%)', 'Regresar al Menu Principal');
            switch opcion2
                case 1 %correlacion >2%
                    clc;
                    disp('Entrada de Datos Solicitada');
                    x2=input('Por favor, Introduzca el Valor del Factor de Compresibilidad Z Ubicada en la Carta Generalizada: ' ,'s');
                    x2=str2num(x2); %conversion del factor de comprsibilidad z a float.
                    r=0.08314;
                    V=(x2*r*Tr)/Pr;
                    V2=num2str(V); %conversion de float a cadena de caracteres para su impresion.
                    
                    clc; %limpieza de la consola e impresion de los resultados
                    % ---> %s impresion de datos en forma de cadena de
                    % caracteres
                    % ---> %d,f impresion de datos de formato numerico,
                    % INT, FLOAT, DOUBLE.
                    disp('RESULTADOS FINALES');
                    fprintf('Nombre del Gas = %s', ng);
                    fprintf('\nFórmula del Gas = %s', fg);
                    fprintf('\nTemperatura = %s', tt);
                    fprintf('\nPresión = %s', pp);
                    fprintf('\nVolumén Molar = %s', V2);
                    disp(' ');
                    % imput que actua como espera y al dar enter continua
                    input('Por favor, par Continuar de un enter' ,'s');
                    Principal_Gases(); %se manda a llamar a la ventana principal
                case 2 %correlacion <2%
                    clc; %limpieza de la terminal
                    %zona de ecuaciones
                    B0=0.083-(0.422/(Tr^1.6));
                    Z0=1+(B0*Pr/(Tr^1.6));
                    B1=0.139-(0.172/(Tr^4.2));
                    Z1=((B1*Pr)/Tr);
                    ZZ=Z0+w*Z1;
                    %impresion de resultados en terminal en formato
                    %floatante
                    disp('RESULTADOS');
                    fprintf('BO=0.083-(0.422/(Tr^1.6)) = %f', B0);
                    fprintf('\nZ0=1+(B0*Pr/(Tr^1.6)) = %f', Z0);
                    fprintf('\nB1=0.139-(0.172/(Tr^4.2)) %f', B1);
                    fprintf('\nZ1=((B1*Pr)/Tr) %f', Z1);
                    fprintf('\nZZ=Z0+w*Z1 = %f', ZZ);
                    disp(' ');
                    input('Por favor, par Continuar de un enter' ,'s');
                    r=0.08314;
                    V3=(ZZ*r*Tr)/Pr;
                    V4=num2str(V3);
                    
                    clc;%limpieza de la pantalla
                    disp('RESULTADOS FINALES');
                    fprintf('Nombre del Gas = %s', ng);
                    fprintf('\nFórmula del Gas = %s', fg);
                    fprintf('\nTemperatura = %s', tt);
                    fprintf('\nPresión = %s', pp);
                    fprintf('\nVolumén Molar = %s', V4);
                    disp(' ');
                    input('Por favor, par Continuar de un enter' ,'s');
                    Principal_Gases();
                case 3%regresar al menu principal
                    clc 
                    Principal_Gases();%se manda a llamar al menu principal
                otherwise
                    disp('other value')
            end
        else %en caso de que no exixta el gas se crea uno nuevo
            %crea gas
            disp('El gas que solicito no existe, porfavor cree uno nuevo');
            Crear_Gases();%se manda a llamar a la funcion crear gases
            Principal_Gases();%y el menu principal una vez finalizada la funcion anterior
        end
    case 3 %calculo del volumen molar
        close all;
        clear all;
        clc
        %limpieza de pantallla
        disp('Obtener Volumen Molar');
        [existe, datos,donde]=Leer_Gases();%leer gases recibe tres datos de la funcion:
                                           %EXISTE, recibe un 1 o 0, en
                                           %caso de que el cas seleccionado
                                           %exista o no.
                                           %DATOS, recibe los datos del gas
                                           %localizado.
                                           %DONDE. recibe la localizacion
                                           %de la información del gas
                                           %dentro del vector leido con la
                                           %información de los gases.
        if existe==1 %se pregunta si existe el gas
            %si si existe
            info=datos(donde); %se obtienen los datos del gas
            A = textscan( info, '%s', 'Delimiter',',' );% se coloca en forma de matriz
            ng=A{1}{1};%nombre del gas
            fg=A{1}{2};%formula del gas
            tt=A{1}{3};%temperatura del gas
            pp=A{1}{4};%presion del gas
            t=str2num(A{1}{3});%temperatura del gas
            p=str2num(A{1}{4});%presion del gas
            w=str2num(A{1}{5});%presion acentrica
            clc;%limpieza de la terminal
            disp('Entrada de Datos Solicitada');
            nombre3=input('Ingrese la Temperatura del Gas en °K: ' ,'s');
            formula3=input('Volumen Molar en m^3/kmol: ', 's');
            kk=str2num(nombre3);%conversion de datos de cadena a float
            vv=str2num(formula3);
            r=0.08314;
            VPr=vv/r*t/p;
            Tr=t/kk;

            Vpr2=num2str(VPr);%conversion de datos de float a cadena
            Tr2=num2str(Tr);

            clc;%limpieza de la terminal
            disp('RESULTADOS');
            fprintf('Nombre del Gas = %s', ng);
            fprintf('\nFórmula del Gas = %s', fg);
            fprintf('\nVolumén Molar Pseudoreducido = %s', Vpr2);
            fprintf('\nTr = %f', Tr2);
            disp(' ');
            input('Por favor, par Continuar de un enter' ,'s');

            clc;
            disp('Entrada de Datos Solicitada');
            x4=input('Por favor, Introduzca el Valor del Factor de Compresibilidad Z Ubicada en la Carta Generalizada: ' ,'s');
            x4=str2num(x4);
            r=0.08314;
            Ppo=x4*r*kk/vv;
            Ppo2=num2str(Ppo);

            clc;
            disp('RESULTADOS FINALES');
            fprintf('Presión = %s', Ppo2);
            disp(' ');
            input('Por favor, par Continuar de un enter' ,'s');
            Principal_Gases();
                    
        else
            %crea gas
            disp('El gas que solicito no existe, porfavor cree uno nuevo');
            Crear_Gases();
            Principal_Gases();
        end
    case 4
        disp('Salir');
        close();
    otherwise
        disp('Valor Invalido')
        close all;
        clear all;
        clc
        Principal_Gases();
end

%funciones

